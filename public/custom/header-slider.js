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
    // autoplay: {
    //   delay: 5000,
    //   disableOnInteraction: false,
    // },
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

  var modalEl = document.getElementById("uds-modal");
  if (modalEl) {
    /** @type {HTMLElement} */
    var modal = modalEl;
    var closeSelectors = "[data-uds-modal-close]";
    var closeTargets = modal.querySelectorAll(closeSelectors);

    function openModal() {
      modal.classList.add("is-open");
      document.body.style.overflow = "hidden";
    }

    function closeModal() {
      modal.classList.remove("is-open");
      document.body.style.overflow = "";
    }

    // Delegate open click to container to handle Swiper clones
    container.addEventListener("click", function (ev) {
      var t = ev.target;
      var trigger = null;
      if (t && t instanceof Element && t.closest) {
        trigger = t.closest("#modal-btn");
      }
      if (trigger) {
        openModal();
      }
    });

    closeTargets.forEach(function (el) {
      el.addEventListener("click", closeModal);
    });

    document.addEventListener("keydown", function (ev) {
      if (ev.key === "Escape" && modal.classList.contains("is-open")) {
        closeModal();
      }
    });
  }
}

document.addEventListener("DOMContentLoaded", initHeaderSwiper);
