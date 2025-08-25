"use strict";

function initExternalRatePopover() {
  var button = document.querySelector("#popover-btn");
  var tooltip = document.querySelector("#popover-content");
  if (!button || !tooltip) return;

  if (button.dataset.bound === "1") return;
  button.dataset.bound = "1";

  // eslint-disable-next-line no-undef
  var popoverInstance = Popper.createPopper(button, tooltip, {
    placement: "bottom",
  });

  function toggleArrow(isVisible) {
    var arrow = document.querySelector("#arrow");
    if (!arrow) return;
    arrow.style.transform = isVisible ? "rotate(0deg)" : "rotate(+90deg)";
  }

  function togglePopover() {
    var isVisible = getComputedStyle(tooltip).display !== "none";
    tooltip.style.display = isVisible ? "none" : "block";
    toggleArrow(isVisible);
    popoverInstance.update();
  }

  function closePopover() {
    tooltip.style.display = "none";
    popoverInstance.update();
  }

  button.addEventListener("click", function (e) {
    e.stopPropagation();
    togglePopover();
  });

  tooltip.addEventListener("click", function (e) {
    e.stopPropagation();
  });

  document.addEventListener("click", function (e) {
    var isVisible = getComputedStyle(tooltip).display !== "none";
    if (
      isVisible &&
      !tooltip.contains(e.target) &&
      !button.contains(e.target)
    ) {
      toggleArrow(isVisible);
      closePopover();
    }
  });
}

document.addEventListener("DOMContentLoaded", initExternalRatePopover);
