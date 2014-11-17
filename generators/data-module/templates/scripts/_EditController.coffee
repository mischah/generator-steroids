angular
  .module('<%= moduleName %>')
  .controller("EditController", ($scope, <%= _.capitalize(resourceName) %>) ->
    $scope.<%= resourceName %> = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      <%= _.capitalize(resourceName) %>.find(values.id).then (<%= resourceName %>) ->
        $scope.$apply ->
          $scope.<%= resourceName %> = <%= resourceName %>
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.<%= resourceName %>.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
