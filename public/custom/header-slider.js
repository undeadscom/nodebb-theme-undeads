"use strict";

function initHeaderSwiper() {
  var container = document.querySelector(".header-swiper");
  if (!container) return;
  if (container.getAttribute("data-bound") === "1") return;
  container.setAttribute("data-bound", "1");

  var SwiperCtor =
    typeof window !== "undefined" && window.Swiper ? window.Swiper : null;
  if (!SwiperCtor) return;
  new SwiperCtor(".header-swiper", {
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
}

document.addEventListener("DOMContentLoaded", initHeaderSwiper);
if (typeof window !== "undefined" && window.jQuery) {
  window.jQuery(window).on("action:ajaxify.end", initHeaderSwiper);
}
