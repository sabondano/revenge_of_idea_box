function createDivElementFromIdea(idea) {
  return $("<div>", { "data-idea-id": idea.id })
    .append(createTitle(idea))
    .append(createBody(idea))
    .append(createQuality(idea))
    .append(createThumbsUp())
    .append(createThumbsDown());
}

function createTitle(idea) {
  return $("<h4>", { text: idea.title });
}

function createBody(idea) {
  return $("<p>", { text: _.trunc(idea.body,
        { "length": 100, "separator": " "}) });
}

function createQuality(idea) {
  return $("<p>", { text: "quality: " + idea.quality });
}

function createThumbsUp() {
  return $("<span>", { class: "glyphicon glyphicon-thumbs-up",
    "aria-hidden": "true" });                               
}

function createThumbsDown() {
  return $("<span>", { class: "glyphicon glyphicon-thumbs-down",
    "aria-hidden": "true" });                               
}
