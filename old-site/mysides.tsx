import { PageData, PageRender } from "cita";
import { Layout, MainNav } from "./layout.tsx";

export const data: PageData = {
  title: "My side projects",
  created: "2016-12-16 00:00:00",
};

export const render: PageRender = () => {
  return (
    <Layout title={data.title}>
      <div id="mysides">
        <h2>My Sides</h2>

        <p>
          I'll list here the (side) projects I've done on my own time. They are
          nothing to brag about. Some of them are in fact reminders how awful I
          am when it comes to getting something done.
        </p>
        <p>
          Still, regardless of how I appraise my own work, I'll list them here
          because (1) they serve as reference for avoiding future disasters and
          (2) they are the value of the function that takes my time.
        </p>

        <h3>Web projects</h3>
        <ul>
          <li>
            <a href="https://nvlled.github.io/chisel">Chisel</a>
            <a class="source" href="https://github.com/nvlled/chisel">
              [source]
            </a>
          </li>
          <li>
            <a href="https://nvlled.github.io/tentro">Tentro</a>
            <a class="source" href="https://github.com/nvlled/tentro">
              [source]
            </a>
          </li>
          <li>
            <a href="https://nvlled.github.io/spritecells">Spritecells</a>
            <a class="source" href="https://github.com/nvlled/spritecells">
              [source]
            </a>
          </li>
          <li>
            <a href="http://coeval.herokuapp.com/">Coeval</a>
            <a class="source" href="https://github.com/nvlled/coeval">
              [source]
            </a>
          </li>
          <li>
            <a href="http://storemi.herokuapp.com/">Storemi</a>
            <a class="source" href="https://github.com/nvlled/storemi">
              [source]
            </a>
          </li>
          <li>
            <a href="http://mepsage.herokuapp.com/">Mepsage</a>
            <a class="source" href="https://github.com/nvlled/mepsage">
              [source]
            </a>
          </li>
        </ul>
        <style>
          {` a.source {
                color: gray;
                font-size: 11px;
                text-decoration: none;
            }
            a.source:after {
                content: "";
            } `}
        </style>

        <p>
          I'm just listing here the ones that can be viewed on web browsers. The
          others are hosted on <a href="https://github.com/nvlled">github</a>
          I'll add some more as time goes on, and improve on the existing ones
          if ever I feel like it.
        </p>
      </div>
    </Layout>
  );
};
