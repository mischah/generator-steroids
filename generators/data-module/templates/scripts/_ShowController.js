angular
  .module('<%= moduleName %>')
  .controller("ShowController", function ($scope, <%= _.capitalize(resourceName) %>, supersonic) {
    $scope.<%= resourceName %> = null;
    $scope.showSpinner = true;

    supersonic.ui.views.current.whenVisible( function () {
      <%= _.capitalize(resourceName) %>.find(steroids.view.params.id).then( function (<%= resourceName %>) {
        $scope.$apply( function () {
          $scope.<%= resourceName %> = <%= resourceName %>;
          $scope.showSpinner = false;
        });
      });
    });

    $scope.remove = function (id) {
      $scope.showSpinner = true;
      $scope.<%= resourceName %>.delete().then( function () {
        supersonic.ui.layers.pop();
      });
    }
  });
