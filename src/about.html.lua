dofile("init")
local LAYOUT = require("layout")

return LAYOUT {
    H2 "About";

    PP {
        [[
        Hello. 

        This is my personal website. Well, (supposed) to be.
        In actuality, I spent way more time coding and fiddling
        with the site engine or tech stack. What I put here 
        is an afterthought. Which is to say, don't expect
        any actual content here. For now at least.

        I do sometimes write inconsequential half-formed thoughts
        here, but I'm not sure why you would want to read that.
        
        If it matter (probably it doesn't), I'm using my own ]];
        A {href="https://github.com/nvlled/moontpl"; "static site generator"};
        [[. 

        ]];
    };
}
