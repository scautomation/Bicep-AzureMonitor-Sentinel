param workspaceName string = 'la-blog-eastus2-cloudsma'
param location string = resourceGroup().location
param syslogName string = 'kern'
param severityLevel array = [
  'emerg'
  'alert'
  'crit'
  'err'
  'warning'
  'notice'
  'info'
  'debug'
]


resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: workspaceName
  location: location
}

resource workspaceName_Syslog 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: '${workspaceName_resource.name}/${syslogName}'
  kind: 'LinuxSyslog'
  properties: {
    syslogName: syslogName
    syslogSeverities: [for Level in severityLevel: {
        severity: Level
      }]
  }
}

resource workspaceName_SyslogCollection 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: '${workspaceName_resource.name}/Enable'
  kind: 'LinuxSyslogCollection'
  properties: {
    state: 'Enabled'
  }
}
