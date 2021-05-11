param workspaceName string = 'la-blog-eastus-cloudsma'
param location string = resourceGroup().location
param eventLogName string = 'System'
param eventLevel array = [
  'Error'
  'Warning'
  'Information'
]

var deploymentName = '${workspaceName_resource.name}/${uniqueString(subscription().subscriptionId, deployment().name)}'

resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: workspaceName
  location: location
}

resource workspaceName_deploymentName 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: deploymentName
  kind: 'WindowsEvent'
  properties: {
    eventLogName: eventLogName
    eventTypes: [for Level in eventLevel: {
        eventType: Level
      }]
  }
}
