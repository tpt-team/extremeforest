$('.products-in-cart').html('<h3>Заказ успешно оформлен</h3>').addClass('alert alert-success')
$('#total_price').text('Сумма: ' + totalPrice(0))
$('header').html("<%= j(render 'layouts/header') %>")
