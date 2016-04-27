myApp.controller("BoardCtrl", function ($scope) {
	$scope.events = events;
	$scope.brags = brags;
	$scope.posts = posts;
	$scope.newEvent = {};
	$scope.newBrag = {};
	$scope.newPost = {};
	$scope.isEditingEvent = false;
	$scope.isEditingBrag = false;
	$scope.isEditingPost = false;
	$scope.editingResponseId = -1;
	$scope.has_errors = has_errors;
	$scope.error_type = error_type;
	
	function init(){
		$scope.errors = errors; 

		$scope.params = params;
		if(has_errors && error_type == 'event'){
			showAddEvent();
			$('#add-event-title').val(params['title']);
			$('#add-event-description').val(params['title']);
			$('#add-event-time').val(params['title']);
			$('#add-event-organizer').val(params['organizer']);
			$('#add-event-location').val(params['location']);
		}
		if(has_errors && error_type == 'brag'){
			showAddBrag();
			$('#add-brag-title').val(params['title']);
			$('#add-brag-body').val(params['body']);
			$('#add-brag-subject').val(params['subject']);
		}
		if(has_errors && error_type == 'post'){
			showAddPost();
			$('#add-post-title').val(params['title']);
			$('#add-post-body').val(params['body']);
		}
	}
	init();
	$scope.editResponse = function(response){
		$scope.editingResponseId = response.id;
	}
	$scope.doneEditingResponse = function(response){
		$scope.editingResponseId = -1;
	}
	$scope.showAddEvent = showAddEvent;
	function showAddEvent(){
		$('#add-event-modal').modal('show');
	}
	$scope.showAddBrag = showAddBrag;
	 function showAddBrag(){
		$('#add-brag-modal').modal('show');
	}
	$scope.showAddPost = showAddPost;
	function showAddPost(){
		$('#add-post-modal').modal('show');	
	}
	function updateEvent(){
		$.ajax({
			url: '/events/update/'+ $scope.selectedEvent.id,
			type:'post',
			data: $scope.selectedEvent
		})
	}
	function updateBrag(){
		$.ajax({
			url: '/brags/update/'+$scope.selectedBrag.id,
			type:'post',
			data: $scope.selectedBrag
		})
	}
	function updatePost(){
		$.ajax({
			url:'/forum/update/'+$scope.selectedPost.id,
			type:'post',
			data: $scope.selectedPost
		})
	}
	$('.event-input').focusout(function(){
		updateEvent();
	});
	$('.brag-input').focusout(function(){
		updateBrag();
	});
	$('.post-input').focusout(function(){
		updatePost();
	})
	$scope.updateResponse = function(response){
		$.ajax({
			url:'/forum/response/update/'+response.id,
			type:'post',
			data: response,
			success:function(data){
				$scope.editingResponseId = -1;
				$scope.$digest();
			}
		})
	}
	$scope.respondToEvent = function(event, response){
		$.ajax({
			url:'/events/respond/'+event.id,
			type:'post',
			dataType:'text',
			data:{
				response: response
			},
			success:function(data){
				console.log('successful response');
				event.response = data;
				$scope.$digest();
			},
			error:function(data){
				console.log('error responding');
				event.response = data;
			}
		})
	};
	$scope.saveEvent = function(){
		$.ajax({
			url:'/events/create',
			type:'post',
			data:{
				title: $scope.newEvent.title,
				time: $scope.newEvent.time,
				organizer: $scope.newEvent.organizer,
				location: $scope.newEvent.location
			},
			success:function(data){
				console.log('saved events');
				$scope.events = [];
			},
			error:function(data){
				alert('error saving event');
				console.log(data);
			}
		})
	}

	$scope.saveBrag = function(){
		$.ajax({
			url:'/brags/create',
			type:'post',
			data:{
				title: $scope.newBrag.title,
				subject: $scope.newBrag.subject,
				body: $scope.newBrag.body,
				file: $('#brag-add-image-input')[0].files[0]
			},
			success:function(data){
				$scope.brags = data.brags;
				$('#add-brag-modal').modal('hide');
				$scope.$digest();
			},
			error:function(data){
				alert(data.responseText);
				console.log(data);
			}
		})
	}
	$scope.savePost = function(newPost){
		$.ajax({
			url:'/forum/create',
			type:'post',
			data:{
				title: newPost.title,
				body: newPost.body,
			},
			success:function(data){
				$scope.posts = data.posts;
				$scope.$digest();
				$('#add-post-modal').modal('hide');
			},
			error:function(data){
				console.log('error');
				console.log(data);
			}
		})
	}
	$scope.saveResponse = function(post, body){
		console.log(post);
		console.log('saving response');
		$.ajax({
			url:'/forum/response/create/'+post.id,
			type:'post',
			data:{
				body: body
			},
			success:function(data){
				$scope.selectedPost = data.post;
				$scope.posts = data.posts;
				$scope.commentInput = '';
				$scope.$digest();
			},
			error:function(data){
				alert('error');
			}
		})
	}
	$scope.showEventModal = function(event){
		$scope.selectedEvent = event;
		$scope.isEditingEvent = false;
		$('#event-modal').modal('show');
		$.ajax({
			url: '/events/click/'+event.id,
			type:'post',
			success:function(data){
				console.log('logged event click');
			}
		});
	}
	$scope.showBragModal = function(brag){
		$scope.selectedBrag = brag;
		$scope.isEditingBrag = false;
		$('#brag-modal').modal('show');
		$.ajax({
			url: '/brags/click/'+brag.id,
			type:'post',
			success:function(data){
				console.log('logged brag click');
			}
		});
	}
	$scope.showPostModal = function(post){
		$scope.selectedPost = post;
		$scope.isEditingPost = false;
		$scope.editingResponseId = -1;
		$('#post-modal').modal('show');
		$.ajax({
			url: '/forum/click/'+post.id,
			type:'post',
			success:function(data){
				console.log('logged forum click');
			}
		});
	}
	$scope.updateBrag = function(brag){
		$.ajax({
			url:'/brags/update/'+brag.id,
			type:'post',
			data:{
				title: $('#edit-brag-title').text(),
				subject:$('#edit-brag-subject').text(),
				body:$('#edit-brag-body').text()
			},
			success:function(data){
				$('#edit-brag-title').fadeOut(100).fadeIn(100);
				$scope.brags = data;
				$scope.$digest();
			},
			error:function(data){
				console.log('errors');
				console.log(data);
			}
		})
	};
	$scope.likeBrag = function(brag, like){
		if(like){
			liked = true;
			url = '/brags/like/'+brag.id;
		}
		else{
			liked = false;
			url = '/brags/unlike/'+brag.id;
		}
		$.ajax({
			url:url,
			type:'post',
			success:function(data){
				brag.liked = liked;
				$scope.$digest();
			},
			error:function(data){
				alert('error');
			}
		});
	}

	$scope.deletePost = function(post){
		$.ajax({
			url:'/forum/delete_post/'+post.id,
			type:'post',
			success:function(data){
				$('#post-modal').modal('hide');
				$scope.posts = _.filter($scope.posts, function(x){
					return x.id != post.id;
				});
				$scope.$digest();
			},
			error:function(data){
				console.log('error');
			}
		})
	}
	$scope.deleteBrag = function(brag){
		$.ajax({
			url:'/brags/delete/'+brag.id,
			type:'post',
			success:function(data){
				$scope.brags = data;
				$scope.$digest();
				$('#brag-modal').modal('hide');
			},
			error:function(data){
				console.log('error deleting brag');
			}
		})
	}
	$scope.deleteBragPhoto = function(brag){
		console.log('deleting brag photo');
		$.ajax({
			url:'/brags/delete_photo/'+brag.id,
			type:'post',
			success:function(data){
				$scope.brags = data.brags;
				$scope.selectedBrag = data.brag;
				$scope.$digest();
			}
		})
	}
	$scope.deleteEvent = function(event){
		$.ajax({
			url:'/events/delete/'+event.id,
			type:'post',
			success:function(data){
				$scope.events = data;
				$scope.$digest();
				$('#event-modal').modal('hide');
			},
			error:function(data){
				console.log('errror deleting event');
			}
		})
	}
	$scope.deleteResponse = function(response){
		$.ajax({
			url:'/forum/response/delete/'+response.id,
			type:'post',
			success:function(data){
				
				$scope.selectedPost.comments = _.filter($scope.selectedPost.comments, function(x){
					return x.id != response.id;
				});
				$scope.$digest();
			}
		})
	}

	$scope.modalTitle = 'Add new event';
	$('.editable').attr('contenteditable','true');
});

