angular
  .module('<%= moduleName %>')
  .controller("NewCtrl", ($scope, <%= _.capitalize(resourceName) %>Resource)->

    $scope.<%= resourceName %> = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      <%= _.capitalize(resourceName) %>Resource.create($scope.<%= resourceName %>).then ->
        steroids.modal.hide()

    $scope.cancel = ->
      steroids.modal.hide()

    # Native navigation
    steroids.view.navigationBar.show "New <%= _.capitalize(resourceName) %>"
    steroids.view.setBackgroundColor "#FFFFFF"
  )
