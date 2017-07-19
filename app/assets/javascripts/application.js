// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require compatibility
//= require_tree .
//= require leaflet
//= require leaflet_edge
//= require movingmarker
//= require channels/locations

document.addEventListener("turbolinks:load", function() {
  setInterval(function () {
    if($('#notice') != undefined) {
      $('#notice').hide();
    }
  }, 12000);

  setInterval(function () {
    if($('#use-app-notice') != undefined) {
      $('#use-app-notice').show();
    }
  }, 1000);
});
