angular
  .module('<%= moduleName %>')
  .controller("NewController", function ($scope, <%= _.capitalize(resourceName) %>, supersonic) {
    $scope.<%= resourceName %> = {};

    $scope.submitForm = function () {
      $scope.showSpinner = true;
      new<%= resourceName %> = new <%= _.capitalize(resourceName) %>($scope.<%= resourceName %>);
      new<%= resourceName %>.save().then( function () {
        supersonic.ui.modal.hide();
      });
    };

    $scope.cancel = function () {
      supersonic.ui.modal.hide();
    }

  });