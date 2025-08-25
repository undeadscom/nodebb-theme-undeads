"use strict";

document.addEventListener("DOMContentLoaded", function () {
  initViralWheel();
});

if (typeof window !== "undefined" && window["jQuery"]) {
  window["jQuery"](window).on("action:ajaxify.end", function () {
    initViralWheel();
  });
}

function initViralWheel() {
  var roots = document.querySelectorAll(".viral-wheel");
  if (!roots.length) return;

  roots.forEach(function (root) {
    if (root.getAttribute("data-bound") === "1") return;
    root.setAttribute("data-bound", "1");

    var sourceEl = root.querySelector(".viral-wheel__source");
    var btnEl = root.querySelector(".viral-wheel__btn");
    if (!sourceEl || !btnEl) return;
    /** @type {HTMLElement} */
    var source = /** @type {any} */ (sourceEl);
    /** @type {HTMLElement} */
    var btn = /** @type {any} */ (btnEl);

    var durationMs = 5000;
    var timingFun = "cubic-bezier(0.36, 0.95, 0.64, 1)";
    var currentRotation = 0;
    var spinning = false;

    function normalizeRotation(angle) {
      var a = angle % 360;
      return a < 0 ? a + 360 : a;
    }

    function setImmediateRotation(angle) {
      source.style.transition = "transform 0ms linear";
      source.style.transform = "rotate(" + angle + "deg)";
    }

    function spinOnce() {
      if (spinning) return;
      spinning = true;
      root.classList.add("viral-wheel--spinning");

      var extraSpins = 6;
      var randomOffset = Math.floor(Math.random() * 360);
      var target = currentRotation + extraSpins * 360 + randomOffset;

      requestAnimationFrame(function () {
        source.style.transition = "transform " + durationMs + "ms " + timingFun;
        source.style.transform = "rotate(" + target + "deg)";
      });

      function onEnd(ev) {
        if (ev.propertyName && ev.propertyName !== "transform") return;
        source.removeEventListener("transitionend", onEnd);
        source.removeEventListener("webkitTransitionEnd", onEnd);

        currentRotation = normalizeRotation(target);
        setTimeout(function () {
          setImmediateRotation(currentRotation);
          runningEnd();
        }, 0);
      }

      function runningEnd() {
        spinning = false;
        root.classList.remove("viral-wheel--spinning");
      }

      source.addEventListener("transitionend", onEnd);
      source.addEventListener("webkitTransitionEnd", onEnd);
    }

    btn.addEventListener("click", function (e) {
      e.preventDefault();
      spinOnce();
    });
  });
}
