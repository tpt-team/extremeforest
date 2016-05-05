$('#commentsform').html("<%= j(render 'comments/form')%>")
$('#comments').html("<%= j(render product.comments.order(:created_at).reverse_order)%>")
