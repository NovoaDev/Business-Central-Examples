Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

$Instance = "Test"
$AppFile = "C:\app\test_productoTest_1.0.0.0.app"
$appName = "productoTest"
$LastAppVersion = "1.0.0.0"
$NewAppVersion = "1.0.0.1"

Uninstall-NAVApp -Name $appName -ServerInstance $Instance -Version $LastAppVersion
Publish-NAVApp -ServerInstance $Instance -Path $AppFile -SkipVerification
Sync-NavApp -ServerInstance $Instance -Name $appName -Version $NewAppVersion
Start-NAVAppDataUpgrade -ServerInstance $Instance -Name $appName -Version $version
Unpublish-NAVApp -ServerInstance $Instance -Name $appName -Version -Version $LastAppVersion