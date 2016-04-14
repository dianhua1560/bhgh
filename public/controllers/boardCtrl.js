myApp.controller("BoardCtrl", function ($scope) {
	$scope.events = events;
	$scope.brags = brags;
	$scope.items = items;
	$scope.showAddEvent = function(){
		$('#add-event-modal').modal('show');
	}
	$scope.showAddBrag = function(){
		$('#add-brag-modal').modal('show');
	}
	$scope.saveEvent = function(){
		$.ajax({
			url:'/add_event',
			type:'post',
			data:{
				title: $scope.eventTitleInput,
				time: $scope.eventTimeInput,
				organizer: $scope.eventOrganizerInput,
				location: $scope.eventLocationInput
			},
			success:function(data){
				$scope.items = data;
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
	$scope.modalTitle = 'Add new event';
});