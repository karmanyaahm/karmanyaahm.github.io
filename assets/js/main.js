function goatCounterBlocked() {
    div = document.getElementById("counterBlocked");
    div.style.display = "block";
}
window.goatcounter = {
    no_onload: true,
}
var t = setInterval(function () {
    if (window.goatcounter && window.goatcounter.count) {
        clearInterval(t);
        window.goatcounter.count({
            img_attr: {
                onerror: "goatCounterBlocked()",
            },
        });
    }
}, 100)
