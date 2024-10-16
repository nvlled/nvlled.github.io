require("web")

return STYLE {
    CSS ".link-button" {font_size="105%"};
    CSS ".note-nav" {
        display="flex";
        align_items="center";
        justify_content="space-between";

    };
    CSS "pre" {
        margin=0;
        overflow_x="inherit";
        line_height="1";
        font_family="sans";
        overflow_wrap="break-word";
        white_space="pre-wrap";
        color="#aff";
    };

    CSS "ul" {padding=0; margin=0};

    CSS "li.log" {
        list_style_type="none";
        margin_top="20px";
        margin_bottom="5px";
        border_left="2px solid #077";
        padding_left=6;

        CSS "img" {width="100%"};

        CSS "li" {margin_left=30};

        CSS ".log-head a" {text_decoration="none"};
    };

    CSS "li.images" {
        list_style_type="none";
        border_left="2px solid #444";
        padding_left=10;
        font_size="90%";
        CSS "div" {display="flex"; flex_wrap="wrap"; align_items="center"};
        CSS "img" {width=170; height=100; margin=5; object_fit="cover"};
    };

    CSS "li.date" {
        border_left="none";
        list_style_type="none";
        text_align="center";
        display="flex";
        align_items="center";
        justify_content="center";
        color="gray";

        CSS ".line" {border_bottom="1px solid #444"; width="40%"};
    };
    CSS ".page-nav" {
        display="flex";
        position="relative";
        align_items="center";
        justify_content="space-between";
        CSS "a" {display="block"};
        CSS "#top, #bottom" {position="absolute"; left="45%"};
    };
    CSS "#popup" {
        position="fixed";
        top=0;
        left=0;
        width="100vw";
        height="100vh";
        background="#222b";
        display="flex";
        align_items="center";
        justify_content="center";

        CSS ".popup-header" {
            position="absolute";
            left=0;
            top=0;
            width="100%";
            display="flex";
            justify_content="center";
            column_gap=30;
            margin=20;

            CSS "button" {background="red"; font_size="1.0em"};
        };

        CSS ".popup-header" {
            ["@media"]="(max-width: 900px)";
            CSS "button" {
                ["@media"]="(max-width: 900px)";
                text_size_adjust="none";
                font_size="1.5em";
            };
        };

        CSS "#image-filename" {position="absolute"; bottom=0; left=0};

        CSS "img" {object_fit="contain"; width="80vw"; height="80vh"};
    };

    CSS "a.clear" {text_decoration="none"; font_size="0.7em"};

    CSS "a.tag" {text_decoration="none"; [":hover"]={color="red"}};

    CSS ".thumbnail-container" {
        position="relative";
        CSS ".img-tags" {
            position="absolute";
            bottom=-2;
            left=0;
            background="#222c";
            CSS "a" {
                color="white";
                text_decoration="none";
                font_size="0.7em";
                margin_right=5;
                [":hover"]={color="red"};
            };
        };
    };

    CSS ".hidden .note-contents" {display="none"};
};
