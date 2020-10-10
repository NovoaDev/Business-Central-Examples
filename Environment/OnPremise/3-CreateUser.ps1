Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

$Instance = "Test"

New-NAVServerUser $Instance -username testUser -password (ConvertTo-SecureString "testUser" -AsPlainText -Force)
New-NAVServerUserPermissionSet $Instance -username testUser -permissionsetid SUPER