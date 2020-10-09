$ContainerName = "ContainerName"
$AppFile = "C:\Temp\File.app"
$AppName = "AppName"
$LastAppVersion = "1.0.0.0"
$NewAppVersion = "1.0.0.1"

UnInstall-BCContainerApp -containerName $ContainerName -appName $AppName -appVersion $LastAppVersion

Publish-BCContainerApp -containerName $ContainerName -appFile $AppFile -SkipVerification

Sync-BCContainerApp -containerName $ContainerName -appName $AppName -appVersion $NewAppVersion
#Sync-BCContainerApp -containerName $ContainerName -appName $appName -Mode ForceSync
#Sync-BCContainerApp -containerName $ContainerName -appName $appName -Mode Clean

Start-BCContainerAppDataUpgrade -containerName $ContainerName -appName $AppName -appVersion $NewAppVersion

UnPublish-BCContainerApp -containerName $ContainerName -appName $AppName -version $LastAppVersion