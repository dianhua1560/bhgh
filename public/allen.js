var BulletinBoard = {
	setup: function() {
		$('#addpost').hover(BulletinBoard.showBlackPostIcon, BulletinBoard.showWhitePostIcon);
		$('#addbrag').hover(BulletinBoard.showBlackBragIcon, BulletinBoard.showWhiteBragIcon);
		$('#addevent').hover(BulletinBoard.showBlackEventIcon, BulletinBoard.showWhiteEventIcon);
		// $(window).scroll(BulletinBoard.lockColumnHeaders);
		$('#proceed-btn').click(BulletinBoard.scrollToBoard);
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
	// lockColumnHeaders: function() {
	// 	if ($(this).scrollTop() > 600) {
	// 		$('#column-header').css({
	// 			'position':'fixed',
	// 			'margin-top': '80px'
	// 		});
	// 	}
	// 	else {
	// 		$('#column-header').css({
	// 			'position':''
	// 		});	
	// 	}
	// }
	scrollToBoard: function() {
		$('html, body').animate({
			scrollTop: $('.board').offset().top - 80
		}, 1500);
	}

};
$(BulletinBoard.setup);
