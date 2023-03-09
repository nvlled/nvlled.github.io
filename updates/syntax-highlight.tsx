import { PageData, PageRender } from "cita";
import { Layout, Post } from "components";
import { codeBlock } from "../syntax_highlighter.tsx";

export const data: PageData = {
  title: "Syntax highlight",
  created: "2023-03-08 19:53:15",
};

export const render: PageRender = async () => {
  return (
    <Layout>
      <Post data={data}>
        I added syntax highlighting, so now I can embed code block with all the
        nice colors and stuffs. I initially tried{" "}
        <a href="https://github.com/shikijs/shiki">shikijs</a>, but I couldn't
        get it to work, deno couldn't resolve the .wasm file or something. I
        instead went with{" "}
        <a href="https://github.com/speed-highlight/core">this</a>, which worked
        after a few fumbling around.
        <Post.BR />
        To test that it's working, here's a snippets of shitty code that I wrote
        years.
        <Post.BR />
        Here's a{" "}
        <a href="https://github.com/nvlled/control/blob/master/flow.go#L26">
          go code
        </a>
        , can you guess what it does? Don't ask me because I have no idea myself
        ahaha.
        {await codeBlock(
          "go",
          `
type Efn func(*Flow)
type Tfn func(*Flow, interface{})

type Keymap map[term.Key]func(*Flow)

type Source func() (interface{}, bool)

type Irctrl interface {
  Stop()
  StopNext()
}

type irctrl struct {
  flow        *Flow
  nextStopped bool
}
        `
        )}
        <Post.BR />
        Here's a shitty{" "}
        <a href="https://github.com/nvlled/control/blob/master/flow.go#L26">
          java
        </a>{" "}
        code. It took me a while to remember why the class is called
        Abstraction. I shortened AbstractionAction into Abstraction. What's
        AbstractAction action? I looked up the documentation, and see some terms
        like <em>JFC Action</em>, which I can only guess stands for{" "}
        <em>Jebus Fu**ing Chri** Action</em>. The horrors of CORBA and checked
        exceptions is coming back to me, so I'll try not to ponder what this
        code even does.
        {await codeBlock(
          "java",
          `
  class Abstraction extends AbstractAction {
    ActionProps properties;
    ActionListener handler;

    public Abstraction(ActionProps props, ActionListener al) {
        properties = props;
        handler = al;
    }

    @Override
    public Object getValue(String key) {
        Object val = properties.get(key);
        if (val != null)
            return val;
        return super.getValue(key);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        handler.actionPerformed(e);
    }
}
        `
        )}
        <Post.BR />
        Then here's a lua, which isn't exceptionally terrible, I can actually
        tell at a glance what it does, but then it does a weird thing where it
        iterates the length of t three times until it finds a value != x.
        {await codeBlock(
          "lua",
          `
-- randomly select an element from t
-- that is not equal to x
function random_select(t, x)
    if #t <= 1 then
        return t[1] ~= x and t[1] or nil
    end

    if #t == 2 then
        if t[1] == x then return t[2] end
        if t[2] == x then return t[1] end
    end

    -- if n is large enough, then it is very unlikely
    -- to have n iterations
    local n = #t*3
    while n > 0 do
        local i = randomInt(#t)
        if t[i] ~= x then
            return t[i]
        end
        n = n - 1 -- prevent possible infinite loop
                  -- e.g. t = {x,x,x, ...}
    end
    return nil
end
`
        )}
        <Post.BR />
        Lastly, here's a{" "}
        <a href="https://github.com/nvlled/cpusched/blob/master/cpusched/Scheduler.cs#LL35-L47C10">
          C# code
        </a>
        , but I set the syntax to java because the highlighter I used strangely
        doesn't support C#.
        {await codeBlock(
          "java",
          `
public static Sched ShortestJobFirst(List<Process> ps)
{
    Comparison<Process> cmp;
    ps = ps.OrderBy(p => Tuple.Create(p.Arrival, p.Burst)).ToList();
    var sched = new Sched();
    var t = 0;
    foreach (var p in ps)
    {
        sched.Add(Tuple.Create(p.Burst, p));
        t += p.Burst;
    }
    return sched;
}
        `
        )}
      </Post>
    </Layout>
  );
};
