$(document).ready(function () {
  $(".notificationicon").click(function () {
    $(this).toggleClass("open");
    $("#notificationMenu").toggleClass("open");
  });
});
