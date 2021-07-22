param workspaceName string 

resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' existing = {
  name: workspaceName
}

resource workspaceName_perfcounter1 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter1'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'LogicalDisk'
    instanceName: 'C:'
    intervalSeconds: 60
    counterName: '% Free Space'
  }
}

resource workspaceName_perfcounter2 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter2'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'LogicalDisk'
    instanceName: 'C:'
    intervalSeconds: 30
    counterName: 'Avg. Disk Queue Length'
  }
}

resource workspaceName_perfcounter3 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter3'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'LogicalDisk'
    instanceName: 'C:'
    intervalSeconds: 60
    counterName: 'Avg. Disk sec/Transfer'
  }
}

resource workspaceName_perfcounter4 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter4'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'LogicalDisk'
    instanceName: 'C:'
    intervalSeconds: 30
    counterName: 'Current Disk Queue Length'
  }
}

resource workspaceName_perfcounter5 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter5'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Memory'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Available Mbytes'
  }
}

resource workspaceName_perfcounter6 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter6'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Memory'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Page Faults/sec'
  }
}

resource workspaceName_perfcounter7 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter7'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Memory'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Pages/sec'
  }
}

resource workspaceName_perfcounter8 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter8'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Memory'
    instanceName: '*'
    intervalSeconds: 30
    counterName: '% Committed Bytes In Use'
  }
}

resource workspaceName_perfcounter9 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter9'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'PhysicalDisk'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Avg. Disk Queue Length'
  }
}

resource workspaceName_perfcounter10 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter10'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'PhysicalDisk'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Avg. Disk sec/Read'
  }
}

resource workspaceName_perfcounter11 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter11'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'PhysicalDisk'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Avg. Disk sec/Transfer'
  }
}

resource workspaceName_perfcounter12 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter12'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'PhysicalDisk'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Avg. Disk sec/Write'
  }
}

resource workspaceName_perfcounter18 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter18'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Processor Information'
    instanceName: '_Total'
    intervalSeconds: 30
    counterName: '% Processor Time'
  }
}

resource workspaceName_perfcounter19 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter19'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Terminal Services'
    instanceName: '*'
    intervalSeconds: 60
    counterName: 'Active Sessions'
  }
}

resource workspaceName_perfcounter20 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter20'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Terminal Services'
    instanceName: '*'
    intervalSeconds: 60
    counterName: 'Inactive Sessions'
  }
}

resource workspaceName_perfcounter21 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter21'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'Terminal Services'
    instanceName: '*'
    intervalSeconds: 60
    counterName: 'Total Sessions'
  }
}

resource workspaceName_perfcounter22 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter22'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'User Input Delay per Process'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Max Input Delay'
  }
}

resource workspaceName_perfcounter23 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter23'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'User Input Delay per Session'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Max Input Delay'
  }
}

resource workspaceName_perfcounter24 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter24'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'RemoteFX Network'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Current TCP RTT'
  }
}

resource workspaceName_perfcounter25 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/perfcounter25'
  kind: 'WindowsPerformanceCounter'
  properties: {
    objectName: 'RemoteFX Network'
    instanceName: '*'
    intervalSeconds: 30
    counterName: 'Current UDP Bandwidth'
  }
}

resource workspaceName_WindowsEventsSystem 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: '${workspaceName_resource.name}/WindowsEventsSystem'
  kind: 'WindowsEvent'
  properties: {
    eventLogName: 'System'
    eventTypes: [
      {
        eventType: 'Error'
      }
      {
        eventType: 'Warning'
      }
    ]
  }
}

resource workspaceName_WindowsEventsApplication 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: '${workspaceName_resource.name}/WindowsEventsApplication'
  kind: 'WindowsEvent'
  properties: {
    eventLogName: 'Application'
    eventTypes: [
      {
        eventType: 'Error'
      }
      {
        eventType: 'Warning'
      }
    ]
  }
}

resource workspaceName_WindowsEventsFSLogix 'Microsoft.OperationalInsights/workspaces/datasources@2020-08-01' = {
  name: '${workspaceName_resource.name}/WindowsEventsFSLogix'
  kind: 'WindowsEvent'
  properties: {
    eventLogName: 'Microsoft-FSLogix-Apps/Operational'
    eventTypes: [
      {
        eventType: 'Error'
      }
      {
        eventType: 'Warning'
      }
      {
        eventType: 'Information'
      }
    ]
  }
}

resource workspaceName_WindowsEventTerminalServicesOperational 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/WindowsEventTerminalServicesOperational'
  kind: 'WindowsEvent'
  properties: {
    eventLogName: 'Microsoft-Windows-TerminalServices-LocalSessionManager/Operational'
    eventTypes: [
      {
        eventType: 'Error'
      }
      {
        eventType: 'Warning'
      }
      {
        eventType: 'Information'
      }
    ]
  }
}

resource workspaceName_WindowsEventTerminalServicesAdmin 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/WindowsEventTerminalServicesAdmin'
  kind: 'WindowsEvent'
  properties: {
    eventLogName: 'Microsoft-Windows-TerminalServices-RemoteConnectionManager/Admin'
    eventTypes: [
      {
        eventType: 'Error'
      }
      {
        eventType: 'Warning'
      }
      {
        eventType: 'Information'
      }
    ]
  }
}

resource workspaceName_WindowsEventFSLogixAdmin 'Microsoft.OperationalInsights/workspaces/datasources@2015-11-01-preview' = {
  name: '${workspaceName_resource.name}/WindowsEventFSLogixAdmin'
  kind: 'WindowsEvent'
  properties: {
    eventLogName: 'Microsoft-FSLogix-Apps/Admin'
    eventTypes: [
      {
        eventType: 'Error'
      }
      {
        eventType: 'Warning'
      }
      {
        eventType: 'Information'
      }
    ]
  }
}

output workspaceName_output string = workspaceName
output provisioningState string = reference(workspaceName_resource.id, '2015-11-01-preview').provisioningState
output source string = reference(workspaceName_resource.id, '2015-11-01-preview').source
output customerId string = reference(workspaceName_resource.id, '2015-11-01-preview').customerId
output sku string = reference(workspaceName_resource.id, '2015-11-01-preview').sku.name
