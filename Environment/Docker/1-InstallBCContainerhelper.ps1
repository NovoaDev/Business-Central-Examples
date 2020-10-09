# If we have installed the old navcontainerhelper modudlo we will have to uninstall it
Uninstall-Module -Name navcontainerhelper -AllVersions

# Install the bccontainerhelper module
Install-Module -Name bccontainerhelper -force