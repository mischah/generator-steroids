angular
  .module('example')
  .controller('SettingsController', function($scope, supersonic) {
    $scope.navbarTitle = "Learn More";
    supersonic.bind $scope, "navbarTitle";
  });
