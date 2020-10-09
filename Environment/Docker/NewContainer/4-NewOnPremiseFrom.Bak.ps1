# container
$ContainerName = 'ContainerName'
$BakFile = 'C:\Temp\database.bak'
$licenseFile = 'C:\License\License.flf'

# Image
$artifactUrl = Get-BCArtifactUrl -type onPrem -country "es" -version 17  
$imageName = 'onprem17'

# User
$UserName = 'User'
$Password = ConvertTo-SecureString "Pass123" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)
			
New-BCContainer -accept_eula `
                -accept_outdated `
                -updateHosts `
                -doNotExportObjectsToText `
                -containername $containername `
                -bakFile $BakFile `
   		        -artifactUrl $artifactUrl `
                -imageName $imageName `
                -auth NavUserPassword `
                -Credential $credential

Import-BCContainerLicense -containerName $containerName -licenseFile $licenseFile