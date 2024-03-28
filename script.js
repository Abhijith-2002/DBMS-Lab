var coll = document.getElementsByClassName("collapsible");
var i;
for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    var collapsibles = document.getElementsByClassName("collapsible");
    for (var j = 0; j < collapsibles.length; j++) {
      var content = collapsibles[j].nextElementSibling;
      content.style.display = "none";
      collapsibles[j].classList.remove("active");
    }
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
