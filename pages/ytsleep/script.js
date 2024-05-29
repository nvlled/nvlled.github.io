
let player;
let timerID = null;
let modifying = false;

const tag = document.createElement('script');
const inputURL = document.querySelector('#inputURL');
const timerRange = document.querySelector('#timerRange');
const timerText = document.querySelector('#timerText');
const pasteButton = document.querySelector('button#paste');
const loadButton = document.querySelector('button#load');
const inputForm = document.querySelector('form#input');
const loop = document.querySelector('#loop');

function getElapsedText(excludeSeconds) {
    return Math.floor(timerRange.value/60) + "m" + (excludeSeconds ? "" : timerRange.value%60 + "s");
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
    }, 1000)
}

function stop() {
    if (player) player.stopVideo();
    clearInterval(timerID);
    timerID = null;
}

function onPlayerReady(event) {
    if (inputURL.value) {
        const url = new URL(inputURL.value);
        const id = url.searchParams.get("v");
        if (id) {
            player.loadVideoById(id);
        }
    }
}

function onPlayerStateChange(event) {
    const pt = YT.PlayerState;
    if (event.data == pt.PLAYING ) {
        if( timerRange.value <= 0) {
            timerRange.value = 15*60;
        }
        start();
    }
    if (event.data == pt.PAUSED || event.data == pt.ENDED || event.data == -1) {
        clearInterval(timerID);
    }
    if (event.data == pt.ENDED && loop.checked) {
        setTimeout(function() { player.playVideo()});
    }
}

// This function will automatically be called by the youtube script
function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
        playerVars: {
            'playsinline': 1
        },
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}



timerRange.addEventListener("touchstart", function() {
    modifying = true;
});
timerRange.addEventListener("touchend", function() {
    modifying = false;
});
timerRange.addEventListener("mousedown", function() {
    modifying = true;
});
timerRange.addEventListener("mouseup", function() {
    modifying = false;
});
timerRange.addEventListener("input", function() {
    timerText.textContent = getElapsedText(true);
});

inputForm.onsubmit = function(e) {
    e.preventDefault();
    if (inputURL.value.trim()) {
        const url = new URL(inputURL.value);
        const id = url.searchParams.get("v");
        if (id) {
            localStorage.setItem("yturl", url);
            player.loadVideoById(id);
            start()
        }
    }
}

loop.onchange = function() {
    player.setLoop(loop.checked);
}

if (!inputURL.value) {
    inputURL.value = localStorage.getItem("yturl");
}
if (!inputURL.value) {
    inputURL.value = "https://www.youtube.com/watch?v=gdssxLx7ofs"
}

timerRange.min = 0
timerRange.max = 60 * 60
timerRange.value = parseInt(localStorage.getItem("duration"), 10) || 20 * 60;
timerText.textContent = getElapsedText();

timerRange.onchange = function() {
    timerRange.value = Math.floor(timerRange.value/60)*60
    timerText.textContent = getElapsedText();
    localStorage.setItem("duration", timerRange.value);
}

