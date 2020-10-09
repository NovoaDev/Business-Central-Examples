$ContainerName = "ContainerName"
$AppFile = "C:\Temp\File.app"

Publish-BCContainerApp -containerName $ContainerName -appFile $AppFile -SkipVerification -sync -install