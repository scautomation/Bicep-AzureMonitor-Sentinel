param workspaceName string = toLower(concat('la', '-', resourceTags.Environment, '-', resourceGroup().location, '-', resourceTags.Project))
param appInsights string = toLower(concat('ai', '-', resourceTags.Environment, '-', resourceGroup().location, '-', resourceTags.Project))
param sku string = 'PerGB2018'
param location string = resourceGroup().location
param retentionInDays int = 31
param resourcePermissions bool = false
param linkedAutomation bool = false
param azureSentinelBool bool = false
param azureSecurityCenterFreeBool bool = false
param azureSecurityCenterBool bool = false
param vmInsightsBool bool = false
param updateManagementBool bool = false
param changeTrackingBool bool = false
param containerInsightsBool bool = false
param appInsightsBool bool = false
param resourceTags object = {
  Environment: 'sparktest'
  Project: 'Orchestrator'
}

var AAlocation = {
  eastus2: ((location == 'eastus') ? 'eastus2' : location)
  eastus: ((location == 'eastus2') ? 'eastus' : location)
}
var automationLocation = ((location == 'eastus') ? AAlocation.eastus2 : AAlocation.eastus)
var automationAccountName = toLower(concat('aa', '-', resourceTags.Environment, '-', automationLocation, '-', resourceTags.Project))

var azureSentinel = {
  name: 'SecurityInsights(${workspaceName})'
  galleryName: 'SecurityInsights'
}
var vmInsights = {
  name: 'VMInsights(${workspaceName})'
  galleryName: 'VMInsights'
}
var containerInsights = {
  name: 'ContainerInsights(${workspaceName})'
  galleryName: 'ContainerInsights'
}
var securityCenterFree = {
  name: 'SecurityCenterFree(${workspaceName})'
  galleryName: 'SecurityCenterFree'
}
var securityCenter = {
  name: 'Security(${workspaceName})'
  galleryName: 'Security'
}
var changeTracking = {
  name: 'ChangeTracking(${workspaceName})'
  galleryName: 'ChangeTracking'
}
var updates = {
  name: 'Updates(${workspaceName})'
  galleryName: 'Updates'
}

resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: workspaceName
  location: location
  tags: resourceTags
  properties: {
    sku: {
      name: sku
    }
    retentionInDays: retentionInDays
    features: {
      searchVersion: 1
      legacy: 0
      enableLogAccessUsingOnlyResourcePermissions: resourcePermissions
    }
  }
}

resource automationAccountName_resource 'Microsoft.Automation/automationAccounts@2020-01-13-preview' = if (linkedAutomation) {
  name: automationAccountName
  location: automationLocation
  tags: resourceTags
  properties: {
    sku: {
      name: 'Basic'
    }
  }
  dependsOn: [
    workspaceName_resource
  ]
}

resource workspaceName_Automation 'Microsoft.OperationalInsights/workspaces/linkedServices@2020-03-01-preview' = if (linkedAutomation) {
  name: '${workspaceName_resource.name}/Automation'
  dependsOn:[ 
    workspaceName_resource
    automationAccountName_resource
  ]
  properties: {
    resourceId: automationAccountName_resource.id
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02-preview' = if(appInsightsBool) {
  name: appInsights
  location: location
  tags: resourceTags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspaceName_resource.id
  }
}

resource solutionsVMInsights 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = if(vmInsightsBool) {
  name: vmInsights.name
  location: location
  dependsOn: [
    workspaceName_resource
  ]
  properties: {
    workspaceResourceId: workspaceName_resource.id
  }
  plan: {
    name: vmInsights.name
    publisher: 'Microsoft'
    product: 'OMSGallery/${vmInsights.galleryName}'
    promotionCode: ''
  }
}

resource solutionsContainerInsights 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = if(containerInsightsBool) {
  name: containerInsights.name
  location: location
  dependsOn: [
    workspaceName_resource
  ]
  properties: {
    workspaceResourceId: workspaceName_resource.id
  }
  plan: {
    name: containerInsights.name
    publisher: 'Microsoft'
    product: 'OMSGallery/${containerInsights.galleryName}'
    promotionCode: ''
  }
}

resource solutionsAzureSentinel 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = if(azureSentinelBool) {
  name: azureSentinel.name
  location: location
  dependsOn: [
    workspaceName_resource
  ]
  properties: {
    workspaceResourceId: workspaceName_resource.id
  }
  plan: {
    name: azureSentinel.name
    publisher: 'Microsoft'
    product: 'OMSGallery/${azureSentinel.galleryName}'
    promotionCode: ''
  }
}

resource solutionsSecurityCenterFree 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = if(azureSecurityCenterFreeBool) {
  name: securityCenterFree.name
  location: location
  dependsOn: [
    workspaceName_resource
  ]
  properties: {
    workspaceResourceId: workspaceName_resource.id
  }
  plan: {
    name: securityCenterFree.name
    publisher: 'Microsoft'
    product: 'OMSGallery/${securityCenterFree.galleryName}'
    promotionCode: ''
  }
}

resource solutionsSecurityCenter 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = if(azureSecurityCenterBool) {
  name: securityCenter.name
  location: location
  dependsOn: [
    workspaceName_resource
  ]
  properties: {
    workspaceResourceId: workspaceName_resource.id
  }
  plan: {
    name: securityCenter.name
    publisher: 'Microsoft'
    product: 'OMSGallery/${securityCenter.galleryName}'
    promotionCode: ''
  }
}

resource solutionsChangeTracking 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = if(changeTrackingBool) {
  name: changeTracking.name
  location: location
  dependsOn: [
    workspaceName_resource
  ]
  properties: {
    workspaceResourceId: workspaceName_resource.id
  }
  plan: {
    name: changeTracking.name
    publisher: 'Microsoft'
    product: 'OMSGallery/${changeTracking.galleryName}'
    promotionCode: ''
  }
}

resource solutionsUpdates 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = if(updateManagementBool) {
  name: updates.name
  location: location
  dependsOn: [
    workspaceName_resource
  ]
  properties: {
    workspaceResourceId: workspaceName_resource.id
  }
  plan: {
    name: updates.name
    publisher: 'Microsoft'
    product: 'OMSGallery/${updates.galleryName}'
    promotionCode: ''
  }
}
