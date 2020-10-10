Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

$Instance = "Test"
$licenseFileUri = 'C:\Licencia\licencia.flf'

Import-NAVServerLicense -LicenseFile $licenseFileUri -ServerInstance $Instance
Restart-NAVServerInstance -ServerInstance $Instance 