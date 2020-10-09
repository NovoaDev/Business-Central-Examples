# container
$ContainerName = 'ContainerName'
$licenseFile = 'C:\License\License.flf'

# Image
$artifactUrl = Get-BCArtifactUrl -country "es" -version 17  
$imageName = 'Saas17'

# User
$UserName = 'User'
$Password = ConvertTo-SecureString "Pass123" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)
			
New-BCContainer -accept_eula `
                -accept_outdated `
                -updateHosts `
                -containername $containername `
                -licenseFile $licenseFile `
   		        -artifactUrl $artifactUrl `
                -imageName $imageName `
                -auth NavUserPassword `
                -Credential $credential