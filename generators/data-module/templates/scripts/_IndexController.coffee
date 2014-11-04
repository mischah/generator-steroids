angular
  .module('<%= moduleName %>')
  .controller("IndexController", ($scope, <%= _.capitalize(resourceName) %>) ->

    $scope.<%= resourceName %>s = []
    $scope.showSpinner = true

    fetchResources = ->
      $scope.showSpinner = true
      <%= _.capitalize(resourceName) %>.findAll().then (<%= resourceName %>s)->
        $scope.$apply ->
          $scope.<%= resourceName %>s = <%= resourceName %>s
          $scope.showSpinner = false

    # Trigger data refresh when this view becomes visible
    supersonic.ui.views.current.whenVisible ->
      fetchResources()
  )