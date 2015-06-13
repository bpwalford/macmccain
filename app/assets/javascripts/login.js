
var login = {
  show: function () {
    $('.login-form').show();
  },
  hide: function () {
    $('.login-form').hide();
  }
}

$(function () {
  setTimeout(function () {
      $('.notice').fadeOut(3000);
  }, 2000);

  $('.login-toggle').click(function () {
    login.show();
  })

  $('.login-form .exit').click(function () {
    login.hide();
  })
});


// if ( !$('.login-form').hasClass('display-none') ) {
//   $('body').click(function () {
//     login.hide();
//   })
// }
