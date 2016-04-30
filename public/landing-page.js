var BulletinBoard = {
	setup: function() {
		$('#addpost').hover(BulletinBoard.showBlackPostIcon, BulletinBoard.showWhitePostIcon);
		$('#addbrag').hover(BulletinBoard.showBlackBragIcon, BulletinBoard.showWhiteBragIcon);
		$('#addevent').hover(BulletinBoard.showBlackEventIcon, BulletinBoard.showWhiteEventIcon);
		$('#proceed-btn').click(BulletinBoard.scrollToBoard);
		$('#searchicon').hover(BulletinBoard.showBlackSearchIcon, BulletinBoard.showWhiteSearchIcon);
		$('#searchicon').click(BulletinBoard.search);
		$('.more-info-dropdown').hover(BulletinBoard.showBlackMoreInfoIcon, BulletinBoard.showWhiteMoreInfoIcon);
		// $('#moreinfoicon').hover(BulletinBoard.showBlackMoreInfoIcon, BulletinBoard.showWhiteMoreInfoIcon);
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
	showBlackMoreInfoIcon: function() {
		$('#more_info_img').attr('src', "/more_info.png");
	},
	showWhiteMoreInfoIcon: function() {
		$('#more_info_img').attr('src', "/more_info_white.png");
	},
	search: function() {
		if ($('#search-input').is(':visible')) {
			$('#search-input').hide();
			// $(this).css({
			// 	'background-color': '#F68D36',
			// 	'color':'white'
			// });
		}
		else {
			$('#search-input').show();
			$(this).css({
			// 	// 'background-color': '#FFF',
			// 	// 'color':'black',
				'display':'inline !important'
			});
		}

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
			scrollTop: $('.board').offset().top - 60
		}, 1500);
	}

};
$(BulletinBoard.setup);
