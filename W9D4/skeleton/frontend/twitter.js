const FollowToggle = require("./follow_toggle.js");

$(document).ready(function() {
    const $buttons = $("button.follow-toggle");
    $buttons.each(function(index, btn) {
        new FollowToggle(btn);
    });

})

