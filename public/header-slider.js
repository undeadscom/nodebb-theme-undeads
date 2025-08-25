"use strict";

function initHeaderSwiper() {
  var container = document.querySelector(".header-swiper");
  if (!container || container.dataset.bound === "1") return;
  container.dataset.bound = "1";

  // eslint-disable-next-line no-undef
  new Swiper(".header-swiper", {
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
// NodeBB page changes
$(window).on("action:ajaxify.end", initHeaderSwiper);
