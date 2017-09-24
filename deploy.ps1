# Variables that need to be set

# The subscriptionId
$subscriptionId = ''
# Root path to script, template and parameters.  All have to be in the same folder.
$rootPath = '' # Replace with $PSScriptRoot if you want to run it as a script; EXAMPLE: $rootPath = 'C:\Users\makolo\Documents\GitHub\azure-vmss-templates\vm-simple-rhel'
# Name of the resource group
$resourceGroupName = ''
# Resource Group Location 
$resourceGroupLocation = 'South Central US' # Run <Get-AzureLocation> to find out azure locations; EXAMPLE: 'East US 2'
# Name of the deployment
$deploymentName = 'SuperMario'

# Login to Azure
Login-AzureRmAccount

# Select the right subscription to work on
Select-AzureRmSubscription -SubscriptionId $subscriptionId

# Create the new Azure Resource Group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

# Run the below to test the ARM template
Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json" -TemplateParameterFile "$rootPath\azuredeploy.parameters.json"

# Use parameter file
New-AzureRmResourceGroupDeployment -Mode Incremental -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json" -TemplateParameterFile "$rootPath\azuredeploy.parameters.json" -Verbose

# Input parameters manually via CLI
New-AzureRmResourceGroupDeployment -Mode Incremental -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateFile "$rootPath\azuredeploy.json" -Verbose

# Delete the deployment
Remove-AzureRmResourceGroup $resourceGroupName

# Other Useful Stuff
Get-AzureRmVMImageOffer -Location $resourceGroupLocation -PublisherName MicrosoftVisualStudio
Get-AzureRmVMImageSku -Location $resourceGroupLocation -PublisherName MicrosoftVisualStudio -Offer VisualStudio
Get-AzureRmVMImage -Location $resourceGroupLocation -PublisherName MicrosoftVisualStudio -Offer VisualStudio -Skus VS-2017-Comm-v152-WS2016