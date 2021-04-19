# Bicep repo for Azure Monitor, Log Analytics and Sentinel Resources

## Related blog post
https://www.cloudsma.com/2021/04/iac-bicep-azure-monitor-security/

## deployment examples
Azure CLI Example for security and change tracking all on one workspace:

```azurecli
az deployment group create --name iactest --resource-group azmon --template-file .\loganalytics.bicep --parameters 'linkedAutomation=true' 'azureSentinelBool=true' 'azureSecurityCenterBool=true' 'changeTrackingBool=true'
```

Azure CLI Example for Operational monitoring:
```azurecli
az deployment group create --name iactest --resource-group azmoneastus2 --template-file .\loganalytics.bicep --parameters 'linkedAutomation=true' 'vmInsightsBool=true' 'updateManagementBool=true' 'changeTrackingBool=true' 'containerInsightsBool=true' 'appInsightsBool=true'
```