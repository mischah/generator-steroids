angular
  .module('example')
  .controller 'LearnMoreController', ($scope, supersonic) ->

    $scope.navbarTitle = "Learn More"
    $scope.userLatitude = "Undefined"
    $scope.userLongitude = "Undefined"

    $scope.getLocation = ->
      supersonic.device.geolocation.getPosition().then (position)->
        $scope.userLatitude = position.coords.latitude
        $scope.userLongitude = position.coords.longitude
