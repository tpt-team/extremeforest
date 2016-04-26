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
//= require bootstrap-sprockets
//= require_tree .

$(document).on('ready page:load', function(){
  $('.new').addClass( "alert alert-danger" )
  $('.done').addClass( "alert alert-success" )
  $('.process').addClass( "alert alert-warning" )
})

$(document).on('keyup', '#_search', function(){
  $(this.form).trigger('submit.rails');
})

$(document).on('click keyup', "[type='number']", function(){
  $('#total_price').text('Order total: ' + totalPrice(0));
})

$(document).on('shown.bs.modal', function(){
  $('#total_price').text('Order total: ' + totalPrice(0));
})

function totalPrice(total) {
  $(".price" ).each(function(index) {
    var price = $(this).text();
    var quantity = $("[type='number']").eq(index).val();
    total += price * quantity;
  });
  return total.toFixed(2);
}
