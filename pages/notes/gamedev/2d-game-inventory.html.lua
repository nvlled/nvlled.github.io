PAGE_TITLE = "2D game inventory";
PAGE_DATE = "2023-03-20 19:03:54";

return LAYOUT {
    VIDEO { src = "/notes/demos/dgen-5.mp4", autoplay = true, controls = true, loop = true },
    P [[
      Tada, the shitty game has now a shitty basic inventory. I can now pickup
      shit and use them as bullets. It took me about two days to do it, one day
      on figuring out how to do the UI for the inventory, and another day for
      the coding stuffs. As usual, a good portion of those two days is spent on
      wondering and exploring how to use the godot API to do what I want.
  ]],
    H1 "Inventory UI",
    P [[
      Normally, for the UI, I would write a code that draws transparent
      rectangles and manually align that at the bottom of the screen. But I
      consciously avoided doing that in Godot, and tried a different approach
      that utilizes Godot's editor.
  ]],
    H1 "Inventory code",
    P [[
      I had a bit of problem getting this to work. Since the inventory logic is
      all mixed up with non-relevant UI game code, it was all messy and it
      wasn't obvious what was causing the buggy behaviour. Creating an
      abstracted datastructure (well, just a class really) for the inventory
      made it easier to reason about, so I fixed and simplified code in one go.
    ]],
    P [[
      This is recurring problem I have with prototype code or with experimental
      projects. I just cut corners and hack away with shitty code to keep things
      simple, until the project collapses on it's own weight of accumulated tech
      debt, and everything has to be scrapped all over because the development
      is moving at glacial pace due to constant bugs. But instead of starting
      over, I just abandon it and move on to something else.
    ]],

    H1 "Coroutines",
    P [[
      I managed to reimplement player attack state in a
      coroutine-like state machine. Initially, I did something like
    ]],

    PRE { class = "code" } / CODE [[await ToSignal(player, Sprite2D.SignalName.Draw);]],

    P [[but it didn't work (I forgot specifically what didn't work). I kept reading this ]]
    / A { href = "https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/c_sharp_signals.html",
        "section of the documentation" }
    / ", but didn't find the answer before.",

    P "But now rereading it again, what I'm looking for is in there:",

    PRE { class = "code" } / CODE [[await ToSignal(GetTree(), SceneTree.SignalName.ProcessFrame);]],

    P [[
      I don't know how I missed that, it's either I'm blind or they recently
      updated the documentation. Anyways, I managed to simplify the attack state
      and fixed the bugs while I was it.
      ]],
    P "This is the initial version:",

    PRE { class = "code" } / CODE [[
class AttackState2 : PlayerState
{
  public player player { get; set; }
  bool running = false;
  Vector2 dir = Vector2.Zero;
  uint savedCollisionLayer;

  public AttackState2(player player)
  {
    this.player = player;
    var sprite = player.sprite;
    sprite.AnimationFinished += OnAnimationFinished;
    sprite.FrameChanged += OnFrameChanged;
  }

  public async void Start()
  {
    savedCollisionLayer = player.CollisionLayer;
    player.CollisionLayer = 0;

    updateAnimation();
    var sprite = player.sprite;
    dir = player.activeDir;
    sprite.SpriteFrames.SetAnimationLoop(sprite.Animation, false);
    player.sprite.Play();
    GD.Print("start attack state");
    running = true;
  }

  public async void Stop()
  {
    running = false;
    player.CollisionLayer = savedCollisionLayer;
  }

  public void OnFrameChanged()
  {
    if (!running) return;
    if (player.attackTimer.TimeLeft > 0)
    {
      return;
    }
    if (player.sprite.Frame >= 6)
    {
      player.fire(dir);
      player.attackTimer.Start();
    }
  }

  public void OnAnimationFinished()
  {
    if (!running) return;

    if (Input.IsActionJustPressed("attack"))
    {
      player.sprite.Play();
    }
    else
    {
      player.setState(player.moveState);
    }
  }

  public void updateAnimation()
  {
    var sprite = player.sprite;
    var dir = player.activeDir;
    if (dir.Length() > 0)
    {
      this.dir = dir;
    }

    if (dir.Y < 0)
    {
      sprite.Animation = "attack-up";
    }
    else if (dir.Y > 0)
    {
      sprite.Animation = "attack-down";
    }
    if (dir.X < 0)
    {
      sprite.Animation = "attack-left";
    }
    else if (dir.X > 0)
    {
      sprite.Animation = "attack-right";
    }
  }


  public void _Process(double delta) { }
}
    ]],

    P [[And this is the rewritten one:]],

    PRE { class = "code" } / CODE [[
  class AttackState : PlayerState
  {
    public player player { get; set; }
    Vector2 dir = Vector2.Zero;

    public AttackState(player player)
    {
      this.player = player;
    }

    public async void Start()
    {
      var savedCollisionLayer = player.CollisionLayer;
      player.CollisionLayer = 0;

      updateAnimation();
      var sprite = player.sprite;

      dir = player.activeDir;
      sprite.SpriteFrames.SetAnimationLoop(sprite.Animation, false);
      player.sprite.Play();

      var sceneTree = player.GetTree();
      while (true)
      {
        var x = await player.ToSignal(sceneTree, SceneTree.SignalName.ProcessFrame);

        if (!sprite.IsPlaying())
        {
          if (Input.IsActionPressed("attack"))
          {
            player.sprite.Play();
          }
          else
          {
            player.setState(player.moveState);
            break;
          }

        }

        if (player.attackTimer.TimeLeft <= 0 && player.sprite.Frame >= 6)
        {
          player.fire(dir);
        }
      }

      player.CollisionLayer = savedCollisionLayer;
    }

    public void _Process(double delta) { }

    public void updateAnimation()
    {
      var sprite = player.sprite;
      var dir = player.activeDir;
      if (dir.Length() > 0)
      {
        this.dir = dir;
      }

      if (dir.Y < 0)
      {
        sprite.Animation = "attack-up";
      }
      else if (dir.Y > 0)
      {
        sprite.Animation = "attack-down";
      }
      if (dir.X < 0)
      {
        sprite.Animation = "attack-left";
      }
      else if (dir.X > 0)
      {
        sprite.Animation = "attack-right";
      }

    }
  }
  ]],
    P [[
      They are still about the same number lines of code, but in the previous
      one, I needed about two additional event listeners, and an additional
      running flag and a stop method. It was harder to trace what the code was
      doing as it was all over the place. In the rewritten version, it was more
      straightforward and procedural, and only need two methods, and state is
      localized within the method call.
  ]],
    H1 "Weekend",
    P [[
      Not really relevant, but I spent the weekends mostly playing Xanadu Next,
      which in brief description, is an old top-down action RPG. It's pretty
      entertaining to play, it has the right amount of grind for turning off my
      brain and relax. I've already played this before from a different PC, but
      if I think I stopped rght before I got to the final boss. Xanadu Next has
      been sitting on my steam library unplayed for a while now, but recent
      updates in Proton made it playable now on my linux laptop.
  ]],
    P [[
      Xanadu is made by Nihon Falcom, and I'm generally a fan of Falcom games,
      particularly the Ys games, and the Trails series. I dream of making a game
      like Ys 3 or Ys 6.
  ]]
}
