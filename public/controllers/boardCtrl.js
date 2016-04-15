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
	$scope.showAddQuestion = function(){
		$('#add-question-modal').modal('show');	
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
				$scope.brags = data;
				console.log('success')
			},
			error:function(data){
				alert('error saving brag');
				console.log(data);
			}
		})
	}
	$scope.saveQuestion = function(){
		$.ajax({
			url:'/forum/create',
			type:'post',
			data:{
				title: $scope.newPost.title,
				body: $scope.newPost.body,
			},
			success:function(data){
				console.log('success');
				console.log(data);
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

	$scope.modalTitle = 'Add new event';
	$('.editable').attr('contenteditable','true');
});