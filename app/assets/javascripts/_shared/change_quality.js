function changeQuality(quality) {
  $(this).siblings(".quality-label").text(_.template("quality: " + quality));
}
