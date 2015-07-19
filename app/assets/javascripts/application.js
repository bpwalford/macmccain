//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

if ($('.admin').length) {
  $('body').css({'background':'gray'});
}

if ($('.contact-form').length || $('.donation-form').length) {
  $('body').css({'background':'gray'});
  $('.navbar-default .navbar-toggle').css({'background-color':'white'})
}
