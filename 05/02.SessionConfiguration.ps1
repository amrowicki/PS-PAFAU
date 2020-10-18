# Tworzymy plik z konfiguracją endpointa, pamiętamy o SessionType, RunAsVirtualAccount i RoleDefinitions
# Plik z konfiguracją sesji nie musi być przechowywany na serwerze po jego zastosowaniu
$NewPSSessionConfigurationFile = @{
    Path                = 'C:\Program Files\WindowsPowerShell\spooler_conf.pssc' # To może być dowolny katalog
    SessionType         = 'RestrictedRemoteServer'
    RunAsVirtualAccount = $true
    RoleDefinitions     = @{'ps\spooler_admin' = @{ RoleCapabilities = 'spooler_admin' } }
}

New-PSSessionConfigurationFile @NewPSSessionConfigurationFile

notepad 'C:\Program Files\WindowsPowerShell\spooler_conf.pssc'

# SessionType
# Specifies the type of session that is created by using the session configuration. The default value is Default. The acceptable values for this parameter are:
# Empty - No modules are added to session by default. Use the parameters of this cmdlet to add modules, functions, scripts, and other features to the session. This option is designed for you to create custom sessions by adding selected commands. If you do not add commands to an empty session, the session is limited to expressions and might not be usable.
# Default - Adds the Microsoft.PowerShell.Core module to the session. This module includes the Import-Module cmdlet that users can use to import other modules unless you explicitly prohibit this cmdlet.
# RestrictedRemoteServer. Includes only the following proxy functions: Exit-PSSession, Get-Command, Get-FormatData, Get-Help, Measure-Object, Out-Default, and Select-Object. Use the parameters of this cmdlet to add modules, functions, scripts, and other features to the session.