param workspaceName string = 'la-blog-eastus2-cloudsma'
param location string = resourceGroup().location

resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: workspaceName
  location: location
}

resource workspaceName_FunctionDeployment 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  name: '${workspaceName_resource.name}/FunctionName'
  properties: {
    displayName: 'FunctionDisplayName'
    category: 'Test'
    functionAlias: 'FunctionAlias'
    query: 'your function query here'
    version: 1
  }
}
