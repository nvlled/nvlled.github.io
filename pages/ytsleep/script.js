
let player;
let timerID = null;
let modifying = false;

const tag = document.createElement('script');
const inputURL = document.querySelector('#inputURL');
const timerRange = document.querySelector('#timerRange');
const timerText = document.querySelector('#timerText');
const pasteButton = document.querySelector('button#paste');
const loop = document.querySelector('#loop');

timerRange.min = 0
timerRange.max = 60 * 60
timerRange.value = 20 * 60

function getElapsedText(excludeSeconds) {
    return Math.floor(timerRange.value/60) + "min" + (excludeSeconds ? "" : timerRange.value%60 + "sec");
}

function start() {
    clearInterval(timerID);
    timerID = setInterval(function() {
        if (modifying) return;
        timerText.textContent = getElapsedText();

        if (timerRange.value <= 0) {
            stop();
        }
        timerRange.value--
        console.log(timerRange.value)
    }, 1000)
}

function stop() {
    if (player) player.stopVideo();
    clearInterval(timerID);
    timerID = null;
}

timerRange.addEventListener("touchstart", function() {
    modifying = true;
    console.log("touch down")
});
timerRange.addEventListener("touchend", function() {
    modifying = false;
    console.log("touch up")
});
timerRange.addEventListener("mousedown", function() {
    modifying = true;
    console.log("mouse down")
});
timerRange.addEventListener("mouseup", function() {
    modifying = false;
    console.log("mouse up")
});
timerRange.addEventListener("input", function() {
    timerText.textContent = getElapsedText(true);
    console.log("input")
});

// bummer, doesn't work on my shitty phone
//pasteButton.addEventListener("click", function() {
//     navigator.clipboard.readText().then(function(text) {
//         inputURL.value = text;
//     });
//});

timerRange.onchange = function() {
    timerRange.value = Math.ceil(timerRange.value/60)*60
    timerText.textContent = getElapsedText();
}

inputURL.onchange = function() {
    const url = new URL(inputURL.value);
    const id = url.searchParams.get("v");
    if (id) {
        localStorage.setItem("yturl", url);
        player.loadVideoById(id);
        start()
    }
}

loop.onchange = function() {
    console.log("loop", loop.checked);
    player.setLoop(loop.checked);
}

if (!inputURL.value) {
    inputURL.value = localStorage.getItem("yturl");
}

if (inputURL.value) {
    const url = new URL(inputURL.value);
    const id = url.searchParams.get("v");
}

timerText.textContent = getElapsedText();


tag.src = "https://www.youtube.com/iframe_api";
const firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function onYouTubeIframeAPIReady() {
    const url = new URL(inputURL.value);
    const id = url.searchParams.get("v");
    player = new YT.Player('player', {
        height: '390',
        width: '640',
        videoId: id ?? undefined,
        playerVars: {
            'playsinline': 1
        },
        events: {
            //'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}

function onPlayerStateChange(event) {
    const pt = YT.PlayerState;
    console.log("player state change", event.data, timerRange.value, pt.PLAYING)
    if (event.data == pt.PLAYING ) {
        if( timerRange.value <= 0) {
            timerRange.value = 15*60;
        }
        start();
    }
    if (event.data == pt.PAUSED || event.data == pt.ENDED ) {
        clearInterval(timerID);
    }
    if (event.data == pt.ENDED && loop.checked) {
        setTimeout(function() { player.playVideo()});
    }
}


