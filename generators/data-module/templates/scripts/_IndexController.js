angular
  .module('<%= moduleName %>')
  .controller("IndexController", function ($scope, <%= _.capitalize(resourceName) %>, supersonic) {
    $scope.<%= resourceName %>s = null;
    $scope.showSpinner = true;

    supersonic.ui.views.current.whenVisible( function () {
      <%= _.capitalize(resourceName) %>.all().whenChanged( function (<%= resourceName %>s) {
          $scope.$apply( function () {
            $scope.<%= resourceName %>s = <%= resourceName %>s;
            $scope.showSpinner = false;
          });
      });
    });

  });