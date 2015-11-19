$(document).ready( function() {
	loadFunctions()

});

function loadFunctions()
{
	$('#addButton').on('click', function () {
		$('#recipient-form').slideDown(350);
	});

	$('#addRecipient').on('click', function () {
		$('#recipient-form').slideUp(350);
	});

}