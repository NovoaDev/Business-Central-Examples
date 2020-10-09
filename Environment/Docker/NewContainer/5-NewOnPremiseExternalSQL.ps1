# container
$ContainerName = 'ContainerName'
$licenseFile = 'C:\License\License.flf'

# Image
$artifactUrl = Get-BCArtifactUrl -type onPrem -country "es" -version 17  
$imageName = 'onprem17'

# User
$UserName = 'User'
$Password = ConvertTo-SecureString "Pass123" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)

# External SQL
$DatabaseServer = "DatabaseServer" 
$DatabaseInstance = "DatabaseInstance" 
$DatabaseName = "DatabaseName" 
$DatabaseUserName = "DatabaseUserName" 
$DatabasePassword = "DatabasePassword" 
$DatabaseSecurePassword = ConvertTo-SecureString -String $DatabasePassword -AsPlainText -Force 
$DatabaseCredentials = New-Object PSCredential -ArgumentList $DatabaseUserName, $DatabaseSecurePassword 
			
New-BCContainer -accept_eula `
                -accept_outdated `
                -updateHosts `
                -doNotExportObjectsToText `
                -containername $containername `
                -licenseFile $licenseFile `
   		        -artifactUrl $artifactUrl `
                -imageName $imageName `
                -auth NavUserPassword `
                -Credential $credential `
                -databaseServer  $DatabaseServer `
                -databaseName $DatabaseName `
                -databaseinstance $databaseInstance `
                -databaseCredential $databaseCredentials  