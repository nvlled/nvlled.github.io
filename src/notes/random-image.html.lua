dofile "init"
local imagedb = require "imagedb"
local LAYOUT = require "layout"
local X = require "ext"

local images = X.map(imagedb.entries, function(img)
    return "'/notes/image[i=" .. img.num .. "].html',"
end)
return LAYOUT {
    BR;
    NOSCRIPT {
        DIV {
            PP {
                [[
                Too bad, I need javascript to select a random image.
            ]];
                IMG {src="/images/uhh.jpg"; style="max-width:300px"};
            };
        };
    };
    SCRIPT {
        "var images = [";
        images;
        "];";
        [[
        location = images[Math.floor(Math.random()*images.length)];
        ]];
    };
}
