// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.en-GB.js
//= require bootstrap-sprockets
//= require Chart.bundle
//= require chartkick
//= require_tree .


$(document).on('turbolinks:load', function() {
  $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    weekStart: 1,
    autoclose: true,
    todayHighlight: true
  });
});

$( document ).ready(function() {
  $('.modal').on('show.bs.modal', function (e) {
    $("div.errors").html("");
  });
});

function check(input) {
  if (input.value != document.getElementById('password').value) {
    input.setCustomValidity('Password Must be Matching.');
  } else {
    input.setCustomValidity('');
  }
}

$(function() {
  $(".sort_paginate_ajax th a, .sort_paginate_ajax .pagination a").on("click", function(){
    $.getScript(this.href);
    return false;
  });
});
