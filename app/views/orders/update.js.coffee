$('.products-in-cart').html('<h3>Order successfully sent</h3>').addClass('alert alert-success')
$('#total_price').text('Order total: ' + totalPrice(0))
$('header').html("<%= j(render 'layouts/header') %>")
