angular
  .module('<%= moduleName %>')
  .controller("ShowController", function ($scope, <%= _.capitalize(resourceName) %>, supersonic) {
    $scope.<%= resourceName %> = null;
    $scope.showSpinner = true;
    $scope.dataId = undefined;

    var _refreshViewData = function () {
      <%= _.capitalize(resourceName) %>.find($scope.dataId).then( function (<%= resourceName %>) {
        $scope.$apply( function () {
          $scope.<%= resourceName %> = <%= resourceName %>;
          $scope.showSpinner = false;
        });
      });
    }

    supersonic.ui.views.current.whenVisible( function () {
      if ( $scope.dataId ) {
        _refreshViewData();
      }
    });

    supersonic.ui.views.current.params.onValue( function (values) {
      $scope.dataId = values.id;
      _refreshViewData();
    });

    $scope.remove = function (id) {
      $scope.showSpinner = true;
      $scope.<%= resourceName %>.delete().then( function () {
        supersonic.ui.layers.pop();
      });
    }
  });