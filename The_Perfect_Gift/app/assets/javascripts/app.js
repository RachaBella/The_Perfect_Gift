var background = ["#aa00ff", "#d81b60","#ff1744","#1e88e5","#3949ab","#00bcd4","#00e676","#ffff00","#f57c00"]

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
		var id = $(".recipient-show").attr('id')
		var select = document.getElementById("user_recipient_id");
		console.log("the id of the user is :", id)
		$.get('/users/'+ id +'/recipients', function (response) {
			console.log('the response is', response.recipients)
			//select.options[select.options.length] = new Option(response.recipients[response.recipients.length -1].name, response.recipients[response.recipients.length -1].id);

		});
		
	});

	$('#cancelButton').on('click', function () {
		$('#recipient-form').slideUp(350);
		/*$.post('/users/:id/recipients', $('.recipientForm').serialize(), function (response) {

		});*/
	});

	$('#addGift').on('click', function () {
		if ($('#user_recipient_id').val() != "") {
			var data = {
				 user_id: $('.user_id').attr('id'),
				 imageUrl: $('.Wallop-item--current p#img').text(),
				 url: $('.Wallop-item--current p#url').text(),
				 keyword: $('.Wallop-item--current p#keyword').text(),
				 price: $('.Wallop-item--current p#price').text(),
				 description: $('.Wallop-item--current p#description').text(),
				 recipient_id: $('#user_recipient_id').val(),
				 occasion: $("#occasion").val()
			}
		} else {
			var data = {
				 user_id: $('.user_id').attr('id'),
				 imageUrl: $('.Wallop-item--current p#img').text(),
				 url: $('.Wallop-item--current p#url').text(),
				 keyword: $('.Wallop-item--current p#keyword').text(),
				 price: $('.Wallop-item--current p#price').text(),
				 description: $('.Wallop-item--current p#description').text(),
				 recipient_id: $('.recipient_id').attr('id'),
				 occasion: $("#occasion").val()
		}

		}
		console.log('data is', data)
		$.ajax( {
			type: 'POST',
			url : '/users/'+ data.user_id+ '/recipients/'+ data.recipient_id + '/gifts',
			datatype: 'json',
			data: data
		});	
	});

	var slider = document.querySelector('.Wallop');
    new Wallop(slider);

    $('.Wallop-buttonPrevious').on("click", function () {
    	var i = Math.floor(Math.random() * (background.length -2))
    	var j = Math.floor(Math.random() * (background.length -2))
    	$('.Demo').css('background-color',background[i])
    	$('#drop1 select').css('background-color',background[j])
    	$('#drop2 select').css('background-color',background[j])

    });

    $('.Wallop-buttonNext').on("click", function () {
    	var i = Math.floor(Math.random() * (background.length -2))
    	var j = Math.floor(Math.random() * (background.length -2))
    	$('.Demo').css('background-color', background[i])
    	$('#drop1 select').css('background-color',background[j])
    	$('#drop2 select').css('background-color',background[j])
    	$("#addGift").css('background-color',background[j])

    	
    })




}