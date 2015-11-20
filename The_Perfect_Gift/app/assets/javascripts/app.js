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

}