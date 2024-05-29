local style = STYLE {
    CSS "body" {
        margin = 0,
        padding = 0,
        outline = 0,
        max_width = 640
    },
    CSS "#layout" {
        border = "1px solid black"
    },
    CSS "label" {
        font_weight = "900",
        margin_right=10
    },
}
local SPC = SPAN " "

return DIV {
    id = "layout",
    style,

    TABLE {
        TR {
            TD ^ LABEL ^ "Name",
            TD "Ronald T. Casili",
        },
        TR {
            TD ^ LABEL ^ "Email",
            TD "nvlled@gmail.com",
        },
        TR {
            TD ^ LABEL ^ "Github",
            TD "https://github.com/nvlled",
        },
        TR {
            TD ^ LABEL ^ "Location",
            TD "Philippines",
        },
    },

    COMMAND_ARG == "serve" and SCRIPT(AUTORELOAD_SCRIPT),
}

--[[

Document : resume
Name
: Ronald Casili
Email
: nvlled@gmail.com
Github
: https://github.com/nvlled
Education : Bachelor of Science in Information Technology
Self-designated titles or role:
- generalist programmer
Possible alternative roles:
- technical/documentation writer
- tool/utilities developer
- general software maintainer
Recent career trajectory:
- (2023) Small freelancing works, Job applications
- (early to mid 2023) Soul-searching, more failed side-projects
- (2022) Long break due to illness, side-projects
- (2018-2021) Worked as a remote fullstack developer
Keyword/buzzword dump (for the busy HR):
Golang | Typescript | C# | Java | Python | Bash | Git |
Lua | ReactJS | Linux | PHP | SQL | Python | HTML | CSS |
$RANDOM_LANG | $RANDOM_FRAMEWORK | $RANDOM_TECH
--]]

