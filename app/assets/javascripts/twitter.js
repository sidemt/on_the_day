function twitterWidget( jQuery ) {
  // load the widgets.js file
  window.twttr = (function (d, s, id) {
    var t, js, fjs = $("body");
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src= "https://platform.twitter.com/widgets.js";
    $(fjs).append(js, fjs);
    return window.twttr || (t = { _e: [], ready: function (f) { t._e.push(f)  }  });
  }(document, "script", "twitter-wjs"));
  
  // Define our custom event handlers
  function increaseDay () {
    window.location = '/count_up_day';
  }
  
  // Wait for the asynchronous resources to load
  window.twttr.ready(function (twttr) {
    // Now bind our custom intent events
    twttr.events.bind('tweet', increaseDay);
  });
}

$(document).on('turbolinks:load', twitterWidget);
