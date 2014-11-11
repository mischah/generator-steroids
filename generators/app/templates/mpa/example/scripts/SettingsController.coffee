angular
  .module('example')
  .controller 'SettingsController', ($scope, supersonic) ->
    $scope.navbarTitle = "Learn More"
    supersonic.bind $scope, "navbarTitle"
