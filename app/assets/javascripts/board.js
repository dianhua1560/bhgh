console.log('board.js');
function activateAddBtns(){
	$('#add-event-modal-btn').click(function(){
		$('#add-event-modal').modal('show');
	});
	$('#add-brag-modal-btn').click(function(){
		$('#add-brag-modal').modal('show');
	});
}
$(document).ready(function(){
	// init Masonry
	var $grid = $('.grid').masonry({
	});
	// layout Masonry after each image loads
	$grid.imagesLoaded().progress( function() {
	  $grid.masonry('layout');
	});

	$('.brag-card').click(function(){
		console.log('brag clicked');
		$.ajax({
			url:'/brags/modal_show/'+$(this).attr('data-id'),
			type:'get',
			success:function(data){
				console.log(data);
				$('#brag-modal-body').html(data);
			}
		})
		$('#brag-modal').modal('show');
	})

	$('.event-card').click(function(){
		console.log('event-clicked');
		$.ajax({
			url:'/events/modal_show/'+$(this).attr('data-id'),
			type:'get',
			success:function(data){
				console.log(data);
				$('#brag-modal-body').html(data);
			}
		})
		$('#brag-modal').modal('show');
		$('#events-modal').modal('show');
	});
	activateAddBtns();

})
