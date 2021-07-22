param workspaceName string = 'la-blog-eastus-cloudsma'
param location string = resourceGroup().location
param eventLogName string = 'System'
param eventLevel array = [
  'Error'
  'Warning'
  'Information'
]

var deploymentName = '${workspace.name}/${uniqueString(subscription().subscriptionId, deployment().name)}'

resource workspace 'Microsoft.OperationalInsights/workspaces@2020-08-01' existing = {
  name: workspaceName
}

resource workspaceName_deploymentName 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: deploymentName
  kind: 'WindowsEvent'
  properties: {
    workspaceId: workspace.id
    eventLogName: eventLogName
    eventTypes: [for Level in eventLevel: {
        eventType: Level
      }]
  }
}
