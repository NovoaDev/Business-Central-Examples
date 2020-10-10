Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\140\Service\NavAdminTool.ps1'

$FinsqlPath = "FinsqlPath"
$Database = "Database"
$SQLServer = "SQLServer"
$SQLInstance = "SQLInstance" 
$BCInstance = "BCInstance"

#Ejecutar findsql como administrador.
cd $FinsqlPath 
finsql.exe Command=generatesymbolreference, Database=$Database, ServerName=$SQLServer\$SQLInstance
#Esperar 20-30 min hasta que se cree un archivo en esta ruta llamado navresult.

#Por ultimo reiniciar el servicio.
Restart-NAVServerInstance -ServerInstance $BCInstance