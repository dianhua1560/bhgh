console.log('this is app.js');
var myApp = angular.module('boardApp', ['ngRoute']);
myApp.directive('ngFocusOut', function( $timeout ) {
    return function( $scope, elem, attrs ) {
        $scope.$watch(attrs.ngFocusOut, function( newval ) {
            if ( newval ) {
                $timeout(function() {
                    elem[0].focusout();
                }, 0, false);
            }
        });
    };
});

function readURL(input, target) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $(target)
                .attr('src', e.target.result);
            $(target).show();
        };

        reader.readAsDataURL(input.files[0]);
    }
}
