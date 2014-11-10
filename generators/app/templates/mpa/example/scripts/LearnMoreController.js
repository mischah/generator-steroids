angular
  .module('example')
  .controller('LearnMoreController', function($scope, supersonic) {

    $scope.navbarTitle = "Learn More";
    $scope.userLatitude = "Undefined";
    $scope.userLongitude = "Undefined";

    $scope.getLocation = function() {
      supersonic.device.geolocation.getPosition().then( function(position) {
        $scope.userLatitude = position.coords.latitude
        $scope.userLongitude = position.coords.longitude
      });
    }

  });
