$(document).ready(function() {
  // load the widgets.js file
  window.twttr = (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0],
      t = window.twttr || {};
    if (d.getElementById(id)) return t;
    js = d.createElement(s);
    js.id = id;
    js.src = "https://platform.twitter.com/widgets.js";
    fjs.parentNode.insertBefore(js, fjs);
  
    t._e = [];
    t.ready = function(f) {
      t._e.push(f);
    };
  
    return t;
  }(document, "script", "twitter-wjs"));
  
  // Define our custom event handlers
  function increaseDay () {
    window.location = '/count_up_day';
  }
  
  // Wait for the asynchronous resources to load
  twttr.ready(function (twttr) {
    // Now bind our custom intent events
    twttr.events.bind('tweet', increaseDay);
  });
});
