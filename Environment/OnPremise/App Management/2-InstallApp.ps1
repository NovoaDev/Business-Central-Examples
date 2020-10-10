Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

$Instance = "Test"
$AppFile = "C:\app\test_productoTest_1.0.0.0.app"
$appName = "productoTest"

Publish-NAVApp -ServerInstance $Instance -Path $AppFile -SkipVerification
Sync-NavApp -ServerInstance $Instance -Name $appName
Install-NAVApp -ServerInstance $Instance -Name $appName