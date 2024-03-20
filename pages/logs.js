
window.onload = function() {
    let currentImgNum = -1;
    const popup = document.querySelector("#popup");
    const popupBody = popup.querySelector("#popup-body");
    const images = Array.from(document.querySelectorAll("ul.main img"));
    popup.style.visibility = "hidden";

    function closeImage() {
        popupBody.innerHTML = "";
        popup.style.visibility = "hidden";
        document.body.style.overflowY = "auto";
        currentImgNum = -1;
    }
    function showImage(i) {
        const img = images[i];
        if (!img) return;
        currentImgNum = i;
        popupBody.innerHTML = "";
        document.body.style.overflowY = "hidden";
        popup.style.visibility = "visible";
        popupBody.appendChild(img.cloneNode(true));
    }

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
