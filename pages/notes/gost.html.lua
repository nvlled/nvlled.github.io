PAGE_TITLE = "Gost static site generator";
PAGE_DATE = "2023-03-02 11:02:14";

return LAYOUT {
    H1 "The case",
    P [[
      So I started reorganizing my repo for the new site. I still wanted to keep
      the old site files around though, so I just moved them to a sub-directory.
      The old site uses my old static site generator, ]] / A { href = "", "gost" } / ".",
    P [[
      I wanted to make some changes, so I needed to build the old site from
      source.
      ]],
    H1 "The problems",
    PP [[
      On the plus side, it still compiles and runs perfectly fine, even if I
      haven't touched it for almost a decade now. Yay for backwards
      compatibility.

      The downside is that it's badly documented, and it's a pain in the ass to
      use. There's documentation to be clear, just that it's bad. The
      documentation is written like it's there for appearance sake, but fell
      short of documenting the essential details. I wonder who was the idiot who
      wrote that.

      Documentation aside, the actual code is not too terrible, but still shitty
      nonetheless. More precisely, it's badly organized and I used some fancy
      functional programmings stuffs that, in hindsight, is dumb and
      unnecessary. I mean, functional programming is useful and definitely not
      dumb. Just that my implementation in particular is dumb. All in all, if I
      were to reimplement everything with the same go version and same libraries
      used, I will definitely write it differently. The whole project is clearly
      was just an poorly thought-out exercise.

      Terrible code and documentation, but surely it still gets the job done,
      right? Barely. I'd rather just ]] /  EM "cat" / [[ html files together using bash
      scripts. The root of the problem is the standard package text/template. I
      hate it with a burning passion.
    ]],
    H1 "Conclusion",
    P [[
      Nope, forget about making changes. It doesn't even work when I place the
      output HTML on a sub-directory. Instead, I'll just port it to .tsx files.
      The developer affordance between gost and cita.tsx is too big. I probably
      said this before, but typechecked jsx is pretty neat.
      ]],
}
