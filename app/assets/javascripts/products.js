$(document).on('ready page:load',function() {

  $('.product_new_form').hide()
  $('.header_button').click(function(e) {
    e.preventDefault();
    $(this).fadeOut(100, function() {
      $('.product_new_form').fadeIn(200);
    });
    $('.watch_button').click(function(e) {
      if ($('.project_url').val() === "" || $('.project_budget').val() === "" ) {
        e.preventDefault();
      };
    });
  });

  $('.table tr').each(function() {

    var current_price = $(this).find('.current_price').data('number');
    var budget = $(this).find('.budget').data('number');

    if (current_price <= budget ) {
      // $(this).addClass('success')
      $(this).css({'background-color': '#18BC9C', 'color' : 'white'});
      $(this).find('.url').css('color', 'white')
    }
  });
});
