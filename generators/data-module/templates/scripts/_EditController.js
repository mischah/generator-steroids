angular
  .module('<%= moduleName %>')
  .controller("EditController", function ($scope, <%= _.capitalize(resourceName) %>, supersonic) {
    $scope.<%= resourceName %> = null;
    $scope.showSpinner = true;

    // Fetch an object based on id from the database
    <%= _.capitalize(resourceName) %>.find(steroids.view.params.id).then( function (<%= resourceName %>) {
      $scope.$apply(function() {
        $scope.<%= resourceName %> = <%= resourceName %>;
        $scope.showSpinner = false;
      });
    });

    $scope.submitForm = function() {
      $scope.showSpinner = true;
      $scope.<%= resourceName %>.save().then( function () {
        supersonic.ui.modal.hide();
      });
    }

    $scope.cancel = function () {
      supersonic.ui.modal.hide();
    }

  });
