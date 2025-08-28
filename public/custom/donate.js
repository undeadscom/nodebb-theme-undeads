"use strict";

$(document).ready(function () {
  $("#donate").on("click", function () {
    const uid = $(this).data("uid");
    const username = $(this).data("username");
    window.location.href=`/auth/transfer/${uid}?username=${username}`
  });
});
