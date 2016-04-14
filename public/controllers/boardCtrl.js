myApp.controller("BoardCtrl", function ($scope) {
	$scope.events = events;
	$scope.brags = brags;
	$scope.newEvent = {};
	$scope.newBrag = {};
	$scope.showAddEvent = function(){
		$('#add-event-modal').modal('show');
	}
	$scope.showAddBrag = function(){
		$('#add-brag-modal').modal('show');
	}
	$scope.respondToEvent = function(event, response){
		console.log('responding to event');
		console.log(event);
		console.log(response);
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
	$scope.showEventModal = function(event){
		$scope.selectedEvent = event;
		$('#event-modal').modal('show');
	}
	$scope.showBragModal = function(brag){
		$scope.selectedBrag = brag;
		$('#brag-modal').modal('show');
	}
	$scope.likeBrag = function(brag){
		console.log('liking brag');
		console.log(brag);
		$.ajax({
			url:'/brags/like/'+brag.id,
			type:'post',
			success:function(data){
				alert('you liked the brag');
			},
			error:function(data){
				alert('error liking brag');
			}
		});
	}
	$scope.modalTitle = 'Add new event';
});