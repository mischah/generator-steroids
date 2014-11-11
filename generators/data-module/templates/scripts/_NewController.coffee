angular
  .module('<%= moduleName %>')
  .controller("NewController", ($scope, <%= _.capitalize(resourceName) %>) ->
    $scope.<%= resourceName %> = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      new<%= resourceName %> = new <%= _.capitalize(resourceName) %>($scope.<%= resourceName %>)
      new<%= resourceName %>.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
