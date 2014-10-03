angular
  .module('<%= moduleName %>')
  .constant('<%= _.capitalize(resourceName) %>Resource', supersonic.data.resource '<%= resourceName %>')
