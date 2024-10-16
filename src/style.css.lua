require("web")

local headerLink = {normal="#fff"; visited="#bbb"}

return CSS {
    CSS "body" {
        color="#dff";
        background_color="#222";
        max_width=800;
        margin="auto";
        font_size=22;
    };

    CSS "p" {text_align="left"};

    CSS "a" {
        color="#7ff";
        text_decoration="underline";
        margin_right="2px";
        [":visited"]={color="#9ff"};
    };

    CSS "pre" {overflow_x="auto"};

    CSS "code" {color="#0f9"};
    CSS "pre > code" {color="#0f9"; overflow_x="auto"};

    CSS "h1 a, h2 a, h3 a, h5 a, h6 a" {
        color=headerLink.normal;
        [":visited"]={color=headerLink.visited};
    };

    CSS "#page-header" {margin=0};
    CSS "#page-date" {color="gray"};

    CSS "#page-navigation" {
        CSS "ul" {margin=0; padding=0; text_align=""};
        CSS "li" {
            display="inline-block";
            padding_right=10;
            padding_left=10;
            border_right="1px dotted gray";
            [":first-child"]={padding_left=0};
            [":last-child"]={border_right="0"};
        };
        CSS "a" {color=headerLink.normal; text_decoration="none"};
    };
    CSS "#random-navigation" {
        font_size="15px";
        CSS "ul" {display="inline"; margin=0; padding=0; text_align="center"};
        CSS "li" {display="inline-block"; padding_right=2};
    };

    CSS "ul.navigation" {
        CSS "a" {
            text_decoration="none";
            color="#fff";
            [":hover"]={text_decoration="underline"};
        };
        CSS "small a" {
            color="#077";
            [":visited"]={color="#066"};
            text_decoration="underline";
        };
    };

    CSS "h1" {font_size="1.4em"};
    CSS "h2" {font_size="1.35em"};
    CSS "h3" {font_size="1.3em"};
    CSS "h4" {font_size="1.25em"};
    CSS "h5" {font_size="1.2em"};
    CSS "h6" {font_size="1.em"};
}
