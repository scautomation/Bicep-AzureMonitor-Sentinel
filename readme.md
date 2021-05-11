# Bicep repo for Azure Monitor, Log Analytics and Sentinel Resources

## Related blog post
https://www.cloudsma.com/2021/04/iac-bicep-azure-monitor-security/

## Deployment Examples for Log Analytics
Azure CLI Example for security and change tracking all on one workspace:

```azurecli
az deployment group create --name iactest --resource-group azmon --template-file .\deployLogAnalytics.bicep --parameters 'linkedAutomation=true' 'azureSentinelBool=true' 'azureSecurityCenterBool=true' 'changeTrackingBool=true'
```

Azure CLI Example for Operational monitoring:
```azurecli
az deployment group create --name iactest --resource-group azmoneastus2 --template-file .\deployLogAnalytics.bicep --parameters 'linkedAutomation=true' 'vmInsightsBool=true' 'updateManagementBool=true' 'changeTrackingBool=true' 'containerInsightsBool=true' 'appInsightsBool=true'
```

## Deployment Examples for Saved Queries and Functions

Azure CLI Example for deploying saved query
```azurecli
az deployment group create --name SavedQuery --resource-group azmoneastus2 --template-file .\deploySavedLogQuery.bicep  
```
Azure CLI Example for deploying saved function
```azurecli
az deployment group create --name SavedFunction --resource-group azmoneastus2 --template-file .\deploySavedFunction.bicep
```

## Deployment Examples for Perf Counters

Deploy windows counter Avg. Disk Bytes/Write
```azurecli
az deployment group create --name LogicalDiskAvgWrite --resource-group azmoneastus2 --template-file .\templates\loganalytics\workspacedatacollection\deployMetrics.bicep --parameters metricObjectName='LogicalDisk' metricCounterName='Avg. Disk Bytes/Write' metricInstanceName='*'
```

Deploy Windows % Free Space for C:
```azurecli
az deployment group create --name PercentFreeSpaceC --resource-group azmoneastus2 --template-file .\deployMetrics.bicep --parameters metricObjectName='LogicalDisk' metricCounterName='% Free Space' metricInstanceName='C:'
```

Deploy % Processor Time at 60 seconds
```azurecli
az deployment group create --name PercentProcessorTime --resource-group azmoneastus2 --template-file .\deployMetrics.bicep --parameters metricObjectName='Processor' metricCounterName='% Processor Time' metricIntervalSeconds='60'
```

## Deployment Examples for Event Logs

Deploy Windows Event Log HyperV Admin Error and Warning
```azurecli
az deployment group create --name hypervAdmin --resource-group azmon --template-file .\deployEventLog.bicep --parameters eventLogName='microsoft-windows-hyper-v-compute/admin' eventLevel="['Error','Warning']"
```

Deploy Windows Event Log Application Error and Warning
```azurecli
az deployment group create --name applogtest --resource-group azmon --template-file .\templates\loganalytics\workspacedatacollection\deployEventLog.bicep --parameters eventLogName='Application' eventLevel="['Error','Warning']"
```

Deploy Windows Event Log FSLogix Admin Error, Warning and Information
```azurecli
az deployment group create --name fslogixtest --resource-group azmon --template-file .\templates\loganalytics\workspacedatacollection\deployEventLog.bicep --parameters eventLogName='FSLogix-Apps/Operational' eventLevel="['Error','Warning','Information']"
```

## Deployment Example for WVD Event Log and Counters template

```azurecli
az deployment group create --name WVDSetup --resource-group azmoneastus2 --template-file .\deployWVDEventsCounters.bicep
```

## Deployment Examples for Syslog

Deploy Syslog Collection for daemon Emerg and Alert
```azurecli
az deployment group create --name syslogDeamon --resource-group azmoneastus2 --template-file .\deploySyslog.bicep --parameters syslogName='daemon' severityLevel="['emerg','alert']"
```

Deploy Syslog Collection for cron emery, alert, crit, and err
```azurecli
az deployment group create --name syslogCron --resource-group azmoneastus2 --template-file .\templates\loganalytics\workspacedatacollection\deploySyslog.bicep --parameters syslogName='cron' severityLevel="['emerg','alert','crit','err']"
```