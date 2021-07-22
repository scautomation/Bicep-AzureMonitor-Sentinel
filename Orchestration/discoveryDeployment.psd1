Import-Module ImportExcel
Import-Module Az.OperationalInsights
Import-Module Az.AlertsManagement

$infraCreation = Import-Excel -path C:\temp\spreadsheet.xlsx -WorksheetName "Infrastructure Creation" -HeaderName 'WorkspaceName', 'DataRetention', 'Location','Tags','AppInsights','AzureSentinel','AzureSecurityCenter','AzureSecurityCenterFree','ChangeTracking','UpdateManagement','ContainerInsights','VMInsights' -StartRow 5


#$infraParameters = @{
    $workspaceName = $infraCreation.WorkspaceName
    $location = $infraCreation.Location
    $retentionInDays = $infraCreation.DataRetention
    $azureSentinelBool = $infraCreation.AzureSentinel
    $azureSecurityCenterFreeBool = $infraCreation.AzureSecurityCenterFree
    $azureSecurityCenterBool = $infraCreation.AzureSecurityCenter
    $changeTrackingBool = $infraCreation.ChangeTracking
    $containerInsightsBool = $infraCreation.ContainerInsights
    $appInsightsBool = $infraCreation.AppInsights
    $vmInsightsBool = $infraCreation.VMInsights
    $resourceTags = $infraCreation.tags
#}

az deployment group create --name iactest --resource-group azmoneastus2 --template-file .\templates\loganalytics\loganalytics\deployLogAnalytics.bicep --parameters `
vmInsightsBool=$vmInsightsBool `
changeTrackingBool=$changeTrackingBool `
location=$location retentionInDays=$retentionInDays `
azureSentinelBool=$azureSentinelBool `
azureSecurityCenterFreeBool=$azureSecurityCenterFree `
azureSecurityCenterBool=$azureSecurityCenter `
changeTrackingBool=$ChangeTracking `
containerInsightsBool=$containerInsights `
appInsightsBool=$appInsights

az deployment group create --name SavedQuery --resource-group azmoneastus2 --template-file .\templates\LogAnalytics\QueriesFunctions\deploySavedLogQuery.bicep  --parameters `
workspaceName=la-sparktest-eastus2-orchestrator


az deployment group create --name hypervAdmin --resource-group azmoneastus2 --template-file .\templates\loganalytics\WorkspaceDataCollection\deployEventLog.bicep --parameters `
workspaceName=la-sparktest-eastus2-orchestrator `
eventLogName='microsoft-windows-hyper-v-compute/admin' `
eventLevel="['Error','Warning']"

az deployment group create --name LogicalDiskAvgWrite --resource-group azmoneastus2 --template-file .\templates\loganalytics\workspacedatacollection\deployMetrics.bicep --parameters `
workspaceName=la-sparktest-eastus2-orchestrator `
metricObjectName='LogicalDisk' `
metricCounterName='Avg. Disk Bytes/Write' `
metricInstanceName='*'

az deployment group create --name syslogDeamon --resource-group azmoneastus2 --template-file .\templates\loganalytics\WorkspaceDataCollection\deploySyslog.bicep --parameters `
workspaceName=la-sparktest-eastus2-orchestrator `
syslogName='daemon' `
severityLevel="['emerg','alert']"








$actionGroups = Import-Excel -Path $path -WorksheetName "Step1-Action Groups" -HeaderName 'Team', 'Escalation Tier', 'Preferred Contact Method', 'Contact Info', 'Azure Action Group Name', 'Action Group Short Name' -StartRow 5

$Alerts = Import-Excel -Path $path -WorksheetName "Step2 - Alerting Requirements" -HeaderName 'Alert Type', 'Metric', 'Operator', 'Threshold' , 'Aggregation', 'IaaS Collection Interval', 'Window', 'Evaluation', 'Azure Action Group Name' -StartRow 5

$actionGroups = $actionGroups | where {$_.Team -ne $null}