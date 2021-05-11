param workspaceName string 
param location string = resourceGroup().location

resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: workspaceName
  location: location
}

resource workspaceName_IISLog 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: '${workspaceName_resource.name}/IISLog'
  kind: 'IISLogs'
  properties: {
    state: 'OnPremiseEnabled'
  }
}
