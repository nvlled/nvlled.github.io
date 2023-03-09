import { PageData, PageRender } from "cita";
import { Layout, Markdown, Post } from "components";

export const data: PageData = {
  title: "Getting started with Godot",
  created: "2023-03-06 19:53:57",
};

export const render: PageRender = () => {
  return (
    <Layout>
      <Post data={data}>
        <Markdown
          text={`
          I just finished reading most of the *Getting started* chapter of
          Godot documentation, from *Introduction* to the *Your first 2D Game*.
          Before proceeding to the 3D tutorial, I thought I should try to at least
          make a simple 2D game based on what I just learned, to help reinforce
          how to work wth the Godot engine.


          I'm a little torn which main scripting language I should use for Godot,
          GDScript or C#. I definitely prefer non-whitespace sensitive statically
          typed languages, but GDscript has better integration with the Godot editor,
          and some code are more concise with GDScript.

          While doing the tutorial, I started with GDscript, then converted each script to C#.
          It was a pretty straightforward translation. The parts that stumped me a bit was
          getting the nodes and the signals.
          
          ## Node retrieval

          In GDscript, getting nodes is short and easy: $NodeName.DoSomething()

          But with C#, I would do something like: GetNode<NodeType>("NodeName").DoSomething().
          On the plus side, it's more type-safe, but admit it's a but verbose. It's not a deal
          breaker though, just a tiny minor inconvenience.

          ## Signals

          In Godot, events are called signals, and the act of listening to these signals
          is called connecting. That's how I understand it anyways, maybe there's a reason
          they opted to use a different terminology for it. Admittedly, **connecting a signal**
          is quite a deviation from the usual programming nomenclature that it does
          throw me off a bit, I have to do a double take to confirm I understood what it means.
          
          There are two ways to connect a signal, one by using the editor, and the other by code.
          
          ![](/assets/notes/note-2.png)
          
          In the image above, to connect a function to a signal, I just click any of the lines
          that has a red icon in it. For instance, I double-click **timeout** and a new window
          pops up.

          ![](/assets/notes/note-1.png)
          
          With GDscript, after clicking the connect button, it shows the script file, and
          creates the function *on_message_timer_timeout* for me:

          ![](/assets/notes/note-3.png)
          
          With C#, after clicking the connect button, nothing happens. Even if I manually
          create the method *on_message_timer_timeout*, it still failed to connect. Not sure
          if this is a bug, or I failed to read a footnote and did something wrong. It doesn't
          matter though, because I don't prefer this way of connecting to signals.
          
          The code way of connecting to signals works just fine.
          ![](/assets/notes/note-4.png)

          ![](/assets/notes/note-5.png)

          Here, the signals are BodyEntered, Timeout, and Pressed. The **+=**
          are the what connects the signals to the corresponding methods/functions.
          For me, the code way of connecting signals is better, even if it's more
          verbose. When I converted GDScript to C#, one pain point was the runtime
          errors related to missing connected signal functions.
          
          After all that writing, I actually convinced myself that I would just
          use C# for the main scripting language. That all said, I'm going
          to think or decide what simple game to make while I lie down on the floor,
          and maybe take a nap while I'm at it.
          
          *Side note: I'm using screenshots of code because I haven't setup a 
          syntax highlighter yet.*
        `}
        />
      </Post>
    </Layout>
  );
};
