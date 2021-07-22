param workspaceName string 

resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' existing = {
  name: workspaceName
}

resource workspaceName_IISLog 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: '${workspaceName_resource.name}/IISLog'
  kind: 'IISLogs'
  properties: {
    state: 'OnPremiseEnabled'
  }
}
