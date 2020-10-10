Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

$Instance = "Test"
$appName = "productTest"
$version = "1.0.0.0"

Uninstall-NAVApp -Name $appName -ServerInstance $Instance
Unpublish-NAVApp -ServerInstance $Instance -Name $appName -Version $version