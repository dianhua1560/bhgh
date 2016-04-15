myApp.controller("BoardCtrl", function ($scope) {
	$scope.events = events;
	$scope.brags = brags;
	$scope.posts = posts;
	$scope.newEvent = {};
	$scope.newBrag = {};
	$scope.newPost = {};
	$scope.showAddEvent = function(){
		$('#add-event-modal').modal('show');
	}
	$scope.showAddBrag = function(){
		$('#add-brag-modal').modal('show');
	}
	$scope.showAddPost = function(){
		$('#add-post-modal').modal('show');	
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
				body: $scope.newBrag.body
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
			url:'/forum/create_response',
			type:'post',
			data:{
				id: post.id,
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
		$('#event-modal').modal('show');
	}
	$scope.showBragModal = function(brag){
		$scope.selectedBrag = brag;
		$('#brag-modal').modal('show');
	}
	$scope.showPostModal = function(post){
		$scope.selectedPost = post;
		$('#post-modal').modal('show');
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

