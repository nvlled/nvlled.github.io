
window.onload = function() {
    let currentImgNum = -1;
    const popup = document.querySelector("#popup");
    const imageFilename = popup.querySelector("#image-filename");
    const popupBody = popup.querySelector("#popup-body");
    const images = Array.from(document.querySelectorAll("ul.main img"));
    popup.style.visibility = "hidden";

    function closeImage(x) {
        popupBody.innerHTML = "";
        popup.style.visibility = "hidden";
        document.body.style.overflowY = "auto";
        currentImgNum = -1;

        if (!x) {
            //history.back();
        }
    }

    function showImage(i) {
        const img = images[i];
        if (!img) return;
        currentImgNum = i;
        popupBody.innerHTML = "";
        document.body.style.overflowY = "hidden";
        popup.style.visibility = "visible";
        popupBody.appendChild(img.cloneNode(true));
        imageFilename.textContent = new URL(img.src).pathname;

        // TODO: fix
        // what I want:
        // - if popup is open while the back button is pressed, close popup
        // - if I press back button when no popup, then go back to previous page
        // - history state should not be pushed to everytime I open a popup
        // why or what is this for
        // - because every time I press back while popup is open, 
        // I intuitively expect the popup to close for some reason.
        // I get surprised when it takes me to the previous page.
        // Maybe it's just me. I don't like touching the browser history
        // anyway. Meh, probably not worth adding this.

        if (!history.state?.popup) {
            //history.pushState({ popup: true }, "", location);
            //history.forward();
        }
    }

    window.onpopstate = (event) => {
        console.log("onpop", event, history.length);
        closeImage(true);
    };

    window.onkeydown = function(e) {
        if (e.key == "Escape") {
            closeImage();
        }
    }

    popup.querySelector("button#close").onclick = closeImage;

    popup.querySelector("button#prev").onclick = function(e) {
        e.stopPropagation();
        e.preventDefault();
        if (currentImgNum > 0) {
            showImage(currentImgNum - 1);
        }
    };
    popup.querySelector("button#next").onclick = function(e) {
        e.stopPropagation();
        e.preventDefault();
        if (currentImgNum < images.length) {
            showImage(currentImgNum + 1);
        }
    };

    let i = 0;
    for (const img of images) {
        let node = img;
        if (img.parentNode && img.parentNode.tagName == "A") node = img.parentNode;

        const imgNum = i;
        node.onclick = function(e) {
            e.stopPropagation();
            e.preventDefault();
            showImage(imgNum);
        }

        i++;
    }
}
