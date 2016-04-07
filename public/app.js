console.log('this is app.js');
var myApp = angular.module('boardApp', ['ngRoute']);

myApp.config(function($routeProvider) {
	$routeProvider
		.when('/', {
			templateUrl: 'views/board.html',
			controller: 'BoardCtrl',
		})
		.otherwise({
			'redirect_to': '/'
		});
});