const MouseButton = {
  left: 0,
  middle: 1,
  right: 2,
};

class Grid {
  pos = { x: 0, y: 0 };
  scale = 1;
  display = {
    margin: 0,
    rectSize: 10,
  };
  rows = 0;
  cols = 0;
  selected = {};
  data = [];

  constructor(rows, cols, init) {
    this.rows = rows;
    this.cols = cols;

    if (init) {
      init.forEach(([pos, val]) => {
        this.setValue(pos[0], pos[1], val);
      });
    }
  }

  /**
   * @param {number}  i - row
   * @param {number}  j - column
   */
  posToInt(i, j) {
    const size = Math.ceil(Math.log10(this.rows * this.cols));
    return i * 10 ** size + j;
  }

  intToPos(index) {
    const size = Math.ceil(Math.log10(this.rows * this.cols));
    return [Math.floor(index / 10 ** size), index % 10 ** size];
  }

  select(i, j) {
    const index = this.posToInt(i, j);
    if (this.getValue(i, j)) {
      this.selected[index] = true;
    }
  }

  deselect(i, j) {
    const index = this.posToInt(i, j);
    delete this.selected[index];
  }

  isSelected(i, j) {
    return this.selected[this.posToInt(i, j)] != null;
  }

  clearSelected() {
    for (const index of Object.keys(this.selected)) {
      delete this.selected[index];
    }
  }

  *getAllSelected() {
    for (const index of Object.keys(this.selected)) {
      yield this.intToPos(index);
    }
  }

  getValue(i, j) {
    const index = i * this.cols + j;
    return this.data[index];
  }

  setValue(i, j, val) {
    const index = i * this.cols + j;
    if (val == null) delete this.data[index];
    else this.data[index] = val;
  }

  *getCellsAt(x1, y1, x2, y2) {
    let [i1, j1] = this.getCellAt(x1, y1);
    let [i2, j2] = this.getCellAt(x2, y2);

    if (i1 > i2) {
      [i1, i2] = [i2, i1];
    }
    if (j1 > j2) {
      [j1, j2] = [j2, j1];
    }

    for (let i = i1; i <= i2; i++) {
      for (let j = j1; j <= j2; j++) {
        yield [i, j];
      }
    }
  }

  getCellAt(x, y) {
    const disp = this.display;
    const margin = disp.margin / this.scale;
    const n = margin + disp.rectSize;
    const j = Math.floor((x - this.pos.x) / n);
    const i = Math.floor((y - this.pos.y) / n);
    return [i, j];
  }

  getBoundingRect(i, j) {
    const disp = this.display;
    const margin = disp.margin / this.scale;
    const x = this.pos.x + (margin + disp.rectSize) * j;
    const y = this.pos.y + (margin + disp.rectSize) * i;
    return [x, y, disp.rectSize, disp.rectSize];
  }

  *iterateCells() {
    for (let i = 0; i < this.rows; i++) {
      for (let j = 0; j < this.cols; j++) {
        yield [i, j];
      }
    }
  }
}

// aha, I knew it, the fengari luavm is the
// slow AF, with a 100x100 grid the js code still performs smoothly,
// while the lua one already lags at 20x20 grid
// On the downside, I had to manually convert the lua code to
// js by hand, and now I have some weird bugs to fix,
// probably related to 1-based indexing of lua.
function main() {
  const bufferCanvas = document.createElement("canvas");
  const canvas = document.querySelector("canvas");
  const debug = document.querySelector("#debug");

  canvas.width = 1200;
  canvas.height = 600;

  bufferCanvas.width = canvas.width;
  bufferCanvas.height = canvas.height;

  const ctx = bufferCanvas.getContext("2d", { alpha: false });
  const mainCtx = canvas.getContext("2d", { alpha: false });

  //let scale = 1.5;
  const origin = { x: 0, y: 0 };
  const grid = new Grid(100, 100, [
    [[0, 0], 1],
    [[1, 1], 1],
    [[2, 2], 1],
    [[3, 3], 1],
    [[5, 10], 1],
    [[1, 10], 1],
    [[5, 1], 1],
  ]);

  function getMousePos(e) {
    const canvasRect = canvas.getBoundingClientRect();
    const r = canvasRect;
    let [x, y] = [
      (e.clientX - r.left) / grid.scale,
      (e.clientY - r.top) / grid.scale,
    ];
    x = Math.floor(x + origin.x);
    y = Math.floor(y + origin.y);
    return [x, y];
  }

  const mouse = {
    start: null,
    current: null,
    button: -1,
  };

  canvas.onwheel = function (e) {
    e.preventDefault();
    const n = Math.abs(e.deltaY) / e.deltaY;
    //n = Math.abs(n) / n
    grid.scale -= n * 0.1;
    console.log("wheel", e, n, grid.scale);
  };

  canvas.onmousedown = function (e) {
    e.preventDefault();

    const [x, y] = getMousePos(e);
    mouse.start = [x, y];
    mouse.current = [x, y];
    mouse.button = e.button;

    if (e.button != MouseButton.middle) {
      const [i, j] = grid.getCellAt(x, y);

      if (e.shiftKey && grid.getValue(i, j)) {
        //grid.clearSelected()
        //grid.select(i, j)
        //mouse.drag = true
      } else {
        let hasNonEmptySelected = false;
        for (const [i2, j2] of grid.getAllSelected()) {
          if (grid.getValue(i2, j2)) {
            hasNonEmptySelected = true;
            break;
          }
        }
        mouse.drag =
          grid.isSelected(i, j) && hasNonEmptySelected && !e.shiftKey;

        if (!mouse.drag) {
          grid.clearSelected();
        }
      }
    }
  };

  canvas.onmousemove = function (e) {
    if (!mouse.start || !mouse.current) {
      return;
    }

    const [x, y] = getMousePos(e);
    mouse.current = [x, y];

    if (mouse.button == MouseButton.middle) {
      origin.x -= e.movementX;
      origin.y -= e.movementY;
    }
  };

  document.addEventListener("mouseup", function (ev) {
    if (!mouse.start || !mouse.current) {
      return;
    }

    if (ev.button == MouseButton.middle) {
      mouse.start = null;
      mouse.current = null;
      return;
    }

    const [sx, sy] = mouse.start;
    const [x, y] = mouse.current;

    if (mouse.drag) {
      let [i1, j1] = grid.getCellAt(...mouse.start);
      let [i2, j2] = grid.getCellAt(...mouse.current);
      let [di, dj] = [i2 - i1, j2 - j1];

      if (di != 0 || dj != 0) {
        const selected = [];
        let abort = false;
        for (let [i, j] of grid.getAllSelected()) {
          [i2, j2] = [i + di, j + dj];
          if (i2 < 0 || j2 < 0 || i2 >= grid.rows || j2 >= grid.cols) {
            abort = true;
            break;
          }
          selected.push([i, j, grid.getValue(i, j)]);
          grid.deselect(i, j);
          grid.setValue(i, j, null);
        }

        if (!abort) {
          for (const [i, j, val] of selected) {
            console.log(
              { i, j },
              i + di,
              j + dj,
              grid.posToInt(i, j),
              grid.posToInt(i + di, j + dj)
            );
            if (val) {
              grid.setValue(i + di, j + dj, val);
              grid.select(i + di, j + dj);
            }
          }
        }
      }
    } else {
      if (x == sx && y == sy) {
        const [i, j] = grid.getCellAt(x, y);
        grid.select(i, j);
      } else {
        for (const elem of grid.getCellsAt(sx, sy, x, y)) {
          grid.select(elem[0], elem[1]);
        }
      }
    }

    mouse.start = null;
    mouse.current = null;
  });

  function loop() {
    mainCtx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.save();
    ctx.scale(grid.scale, grid.scale);
    ctx.translate(-origin.x, -origin.y);

    ctx.fillStyle = "blue";
    ctx.fillRect(0, 0, 2, 2);

    for (const [i, j] of grid.iterateCells()) {
      const [a, b, c, d] = grid.getBoundingRect(i, j);
      const selected = grid.isSelected(i, j);

      const val = grid.getValue(i, j);
      if (val) {
        ctx.fillStyle = "#0f0";
        ctx.fillRect(a, b, c, d);
      }
      ctx.strokeStyle = selected ? "#0ff" : "#333";
      ctx.strokeRect(a, b, c, d);
    }

    if (mouse.button != MouseButton.middle && mouse.start && mouse.current) {
      if (mouse.drag) {
        const [i1, j1] = grid.getCellAt(...mouse.start);
        const [i2, j2] = grid.getCellAt(...mouse.current);
        const [di, dj] = [i2 - i1, j2 - j1];

        for (const [i, j] of grid.getAllSelected()) {
          const [a, b, c, d] = grid.getBoundingRect(i + di, j + dj);

          const val = grid.getValue(i, j);
          if (val) {
            ctx.fillStyle = "#0ff9";
            ctx.fillRect(a, b, c, d);
          }
        }
      } else {
        const [sx, sy] = mouse.start;
        const [x, y] = mouse.current;
        const w = x - sx;
        const h = y - sy;
        ctx.fillStyle = "#0ff7";
        ctx.fillRect(sx, sy, w, h);
      }
    }

    ctx.restore();

    mainCtx.drawImage(bufferCanvas, 0, 0);

    requestAnimationFrame(loop);
  }

  requestAnimationFrame(loop);
}

main();
