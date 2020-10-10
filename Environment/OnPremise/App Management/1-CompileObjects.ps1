Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'

$BCSERVER = "BCSERVER"
$BCINSTANCE = "BCINSTANCE"
$SQLSERVER = "SQLSERVER"
$SQLINSTANCE = "SQLINSTANCE"
$DB = "DBNAME"
$SYNC = "force"
$USER = "USER"
$PASS = "PASS"

Compile-NAVApplicationObject -navservername $BCSERVER -navserverinstance $BCINSTANCE -databaseserver $SQLSERVER\$SQLINSTANCE -databasename $DB -synchronizeschemachanges $SYNC -username $USER -password $PASS -filter "Type=Table; id=17" –recompile