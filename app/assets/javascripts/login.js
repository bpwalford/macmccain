
var login = {
  show: function () {
    $('.login-form').slideDown();
  },
  hide: function () {
    $('.login-form').slideUp();
  }
}

$('.login-toggle').click(function () {
  login.show();
})

$('.login-form .exit').click(function () {
  login.hide();
})

// if ( !$('.login-form').hasClass('display-none') ) {
//   $('body').click(function () {
//     login.hide();
//   })
// }
