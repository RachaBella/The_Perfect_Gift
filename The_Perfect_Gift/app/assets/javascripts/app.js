$(document).ready( function() {
	loadFunctions()

});

function loadFunctions()
{
	$('#addButton').on('click', function () {
		$('#recipient-form').slideDown(350);
		$('html, body').animate({
        scrollTop: $("#recipient-form").offset().top
    }, 500);
	});

	$('#addRecipient').on('click', function () {
		$('#recipient-form').slideUp(350);
		/*$.post('/users/:id/recipients', $('.recipientForm').serialize(), function (response) {

		});*/
	});

	$('#cancelButton').on('click', function () {
		$('#recipient-form').slideUp(350);
		/*$.post('/users/:id/recipients', $('.recipientForm').serialize(), function (response) {

		});*/
	});

	$('#addGift').on('click', function () {
		var data = {
			 user_id: $('.user_id').attr('id'),
			 imageUrl: $('li.active p#img').text(),
			 url: $('li.active p#url').text(),
			 keyword: $('li.active p#keyword').text(),
			 price: $('li.active p#price').text(),
			 description: $('li.active p#description').text(),
			 recipient_id: $('#user_recipient_id').val()

		}
		console.log('data is', data)
		$.ajax( {
			type: 'POST',
			url : '/senddata',
			datatype: 'json',
			data: data
		})

		
	})


}