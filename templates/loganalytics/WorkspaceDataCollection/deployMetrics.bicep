param workspaceName string = 'la-blog-eastus2-cloudsma'
@allowed([
  'WindowsPerformanceCounter'
  'LinuxPerformanceObject'
])
param metricKind string = 'WindowsPerformanceCounter'
param metricObjectName string
param metricInstanceName string = '_Total'
param metricIntervalSeconds string = '120'
param metricCounterName string = '% Processor Time'

var metricDeploymentName = '${workspaceName_resource.name}/${uniqueString(subscription().subscriptionId, deployment().name)}'

resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' existing = {
  name: workspaceName
}


resource workspaceName_metricDeploymentName 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: metricDeploymentName
  kind: metricKind
  properties: {
    objectName: metricObjectName
    instanceName: metricInstanceName
    intervalSeconds: metricIntervalSeconds
    counterName: metricCounterName
  }
}
