import "phoenix_html"
import "bootstrap/js/collapse"

$(function () {
  $("#nav-sign-in").click(evnt => {
    var clientKey = $("meta[name='auth0_client_key']").attr("content");
    var endpoint = $("meta[name='auth0_endpoint']").attr("content");

    new Auth0Lock(
      clientKey,
      endpoint,
      {
        auth: {
          redirectUrl: 'http://localhost:4000/auth/auth0/callback',
          responseType: 'code',
          params: {
            scope: 'openid email'
          }
        }
      }
    ).show();
  });
});

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
