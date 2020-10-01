function Save-ModuleToVHD
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.String]
        $ModuleName,

        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $MountPoint
    )
    
    $ModulesDirectory = Join-Path -Path $MountPoint -ChildPath 'Program Files\WindowsPowerShell\Modules'
    Save-Module -Name $ModuleName -Path $ModulesDirectory
}