$('header').html("<%= j(render 'layouts/header') %>")
$('.products-in-cart').html("<%= j(render 'products') %>")
$('#total_price').text('Сумма: ' + totalPrice(0))
