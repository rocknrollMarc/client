angular.module('shareupApp')
.controller('LoginCtrl', function($location, $scope, $http) {
  $scope.signup = function() {
    $http({
      url: '/api/users',
      method: 'POST',
      data: {
        user: $scope.user
      }
    }).success(function(data) {
      $scope.$broadcast('event:authenticated');
      $location.path('/');
    }).error(function(reason) {
      $scope.user.errors = reason;
    });
  };
});
