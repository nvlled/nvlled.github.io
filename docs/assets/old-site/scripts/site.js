window.addEventListener("load", function() {
    window.onhashchange = function(e) {
        if (location.hash.substr(1) == "404") {
            alert("resource was not found during content generation");
            location.hash = "";
        }
    }
});
