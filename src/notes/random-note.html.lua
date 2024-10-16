dofile "init"
local notedb = require "notedb"
local LAYOUT = require "layout"
local X = require "ext"

local notes = X.map(notedb.entries, function(note)
    return "'/notes/index[date=" ..  note.date .. "].html#nt-"..note.num.."',"
end)
return LAYOUT {
    BR;
    NOSCRIPT {
        DIV {
            PP {
                [[
                Looks like javascript is disabled, you'll have
                to manually roll a dice to get a random one.
            ]];
                IMG {src="/images/uhh.jpg"; style="max-width:300px"};
            };
        };
    };
    SCRIPT {
        "var notes = [";
        notes;
        "];";
        [[
        location = notes[Math.floor(Math.random()*notes.length)];
        ]];
    };
}
