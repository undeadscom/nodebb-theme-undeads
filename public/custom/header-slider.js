"use strict";

function initHeaderSwiper() {
  var container = document.querySelector(".header-swiper");
  if (!container) return;
  if (container.getAttribute("data-bound") === "1") return;
  container.setAttribute("data-bound", "1");

  var SwiperCtor =
    typeof window !== "undefined" && window["Swiper"] ? window["Swiper"] : null;
  if (!SwiperCtor) return;
  var swiper = new SwiperCtor(".header-swiper", {
    loop: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },
  });

  // auto-trigger wheel spin when first slide becomes active
  function trySpinWheelInActiveSlide() {
    if (!container) return;
    var active = container.querySelector(".swiper-slide-active");
    if (!active) return;
    var spinBtn = active.querySelector(".viral-wheel .viral-wheel__btn");
    if (spinBtn && spinBtn instanceof HTMLElement) {
      spinBtn.click();
    }
  }

  // initial attempt after init
  setTimeout(trySpinWheelInActiveSlide, 50);

  swiper.on("slideChangeTransitionEnd", function () {
    trySpinWheelInActiveSlide();
  });
}

document.addEventListener("DOMContentLoaded", initHeaderSwiper);
