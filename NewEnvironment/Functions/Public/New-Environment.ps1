function New-Environment
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.String]
        $DomainName,

        [Parameter(Mandatory)]
        [System.String[]]
        $VMNames,

        [Parameter(Mandatory)]
        [System.IO.FileInfo]
        $BaseDiskPath,

        [Parameter(Mandatory)]
        [System.String]
        $SwitchName,

        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Destination
    )

    $FullDestinationPath = Join-Path -Path $Destination -ChildPath $DomainName
    if (-not (Test-Path -Path $FullDestinationPath)) { New-Item -Path $FullDestinationPath -ItemType Directory | Out-Null }
    $FunctionsPath = Split-Path -Path $PSScriptRoot -Parent
    $ModulePath = Split-Path -Path $FunctionsPath -Parent
    $DataPath = Join-Path -Path $ModulePath -ChildPath 'Data'

    foreach ($VMName in $VMNames)
    {
        $VMDirectoryPath = Join-Path -Path $FullDestinationPath -ChildPath $VMName
        if (-not (Test-Path -Path $VMDirectoryPath)) { New-Item -Path $VMDirectoryPath -ItemType Directory | Out-Null }
        $VM = New-TrainingVM -VMName "$VMName.$DomainName" -Path $VMDirectoryPath -DifferencingDiskPath $BaseDiskPath -SwitchName $SwitchName
        $MountPoint = Mount-VHD -DiskPath $VM.HardDrives.Path
        Set-Unattend -MountPoint $MountPoint.Path -SourcePath $DataPath -VMName $VMName
        Set-DSCAutomationHostEnabled -MountPoint $MountPoint.Path
        foreach ($Module in @('ActiveDirectoryDSC', 'ComputerManagementDsc', 'NetworkingDsc', 'xDhcpServer'))
        {
            Save-ModuleToVHD -ModuleName $Module -MountPoint $MountPoint.Path
        }
        Copy-MOFFiles -MountPoint $MountPoint.Path -MOFName $VMName -Path $DataPath
        Dismount-VHD -MountPoint $MountPoint.Path
    }
}