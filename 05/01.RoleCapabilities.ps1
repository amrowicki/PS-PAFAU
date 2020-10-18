# Tworzymy folder RoleCapabilities w którym znajdzie się plik z definicją roli (PSRC)
$modulePath = Join-Path $env:ProgramFiles "WindowsPowerShell\Modules\spooler_conf"
$rcFolder = Join-Path $modulePath "RoleCapabilities"
New-Item -ItemType Directory $rcFolder

# Definiujemy co może być wykonywane w ramch tej roli i tworzymy plik
New-PSRoleCapabilityFile -Path $rcFolder\spooler_admin.psrc -VisibleCmdlets @{
    Name       = 'Restart-Service'
    Parameters = @{
        Name        = 'Name'
        ValidateSet = 'Spooler'
    }
}
