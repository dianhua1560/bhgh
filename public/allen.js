var BulletinBoard = {
	setup: function() {
		$('#addpost').hover(BulletinBoard.showBlackPostIcon, BulletinBoard.showWhitePostIcon);
		$('#addbrag').hover(BulletinBoard.showBlackBragIcon, BulletinBoard.showWhiteBragIcon);
		$('#addevent').hover(BulletinBoard.showBlackEventIcon, BulletinBoard.showWhiteEventIcon);
		// $(window).scroll(BulletinBoard.lockColumnHeaders);
		$('#proceed-btn').click(BulletinBoard.scrollToBoard);
		$('#searchicon').hover(BulletinBoard.showBlackSearchIcon, BulletinBoard.showWhiteSearchIcon);
		// var elementPosition = $('#column-header').offset();
		// $(window).scroll(BulletinBoard.lockColumnHeaders);
	},
	showBlackPostIcon: function() {
		$('#post_img').attr('src', "/add_post.png");
	},
	showWhitePostIcon: function() {
		$('#post_img').attr('src', "/add_post_white.png");
	},
	showBlackBragIcon: function() {
		$('#brag_img').attr('src', "/add_brag.png");
	},
	showWhiteBragIcon: function() {
		$('#brag_img').attr('src', "/add_brag_white.png");
	},
	showBlackEventIcon: function() {
		$('#event_img').attr('src', "/add_event.png");
	},
	showWhiteEventIcon: function() {
		$('#event_img').attr('src', "/add_event_white.png");
	},
	showBlackSearchIcon: function() {
		$('#search_img').attr('src', "/search.png");
	},
	showWhiteSearchIcon: function() {
		$('#search_img').attr('src', "/search_white.png");
	},
	// lockColumnHeaders: function() {
	// 	var elementPosition = $('#column-header').position();
	// 	var elementOffset = $('#column-header').offset();
	// 	// if (elementPosition.top < 0) {
	// 	// 	$('#column-header').css({
	// 	// 		'position':'relative',
	// 	// 		'top':'0px'
	// 	// 	});
	// 	// }
	// 	// else 
	// 	if ($(window).scrollTop() >= elementOffset.top) {
	// 		$('#column-header').css({
	// 			'position':'fixed',
	// 			'top':'80px'
	// 		});
	// 	}
	// 	else {
	// 		$('#column-header').css({
	// 			'position':'relative',
	// 			'top':'0px'
	// 		});	
	// 	}
	// },
	scrollToBoard: function() {
		$('html, body').animate({
			scrollTop: $('.board').offset().top - 80
		}, 1500);
	}

};
$(BulletinBoard.setup);
