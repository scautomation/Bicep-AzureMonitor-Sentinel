param workspaceName string = 'la-blog-eastus2-cloudsma'
param location string = resourceGroup().location


resource workspaceName_resource 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: workspaceName
  location: location
}

resource workspaceName_Usage 'Microsoft.OperationalInsights/workspaces/savedSearches@2015-03-20' = {
  name: '${workspaceName_resource.name}/Usage'
  properties: {
    displayName: 'Usage by Table'
    category: 'Usage'
    query: 'let daystoSearch = 31d; \r\nlet tables = search * \r\n| where TimeGenerated >= ago(daystoSearch) \r\n| summarize  RecordCount=count() by $table \r\n| project leftName=$table, RecordCount, Clause=1;\r\nUsage \r\n| where TimeGenerated >= ago(daystoSearch) \r\n| where IsBillable == true \r\n| where DataType !="" \r\n| summarize TotalSize=sum(Quantity) by DataType \r\n| project rightName=DataType, TotalSize, Clause=1 \r\n| join kind=leftouter (tables) on Clause \r\n| where leftName == rightName \r\n| project TableName=leftName , MBperRecord=round(TotalSize / RecordCount,6), RecordCount, TotalGB = round(TotalSize/1024, 6) \r\n| sort by MBperRecord desc'
    version: 1
  }
}
