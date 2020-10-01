function New-TrainingVM
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.String]
        $VMName,

        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path,

        [Parameter(Mandatory)]
        [System.IO.FileInfo]
        $DifferencingDiskPath,

        [Parameter(Mandatory)]
        [System.String]
        $SwitchName
    )

    $VHDPath = Join-Path -Path $Path.FullName -ChildPath "$VMName.vhd"
    $VMDisk = New-VHD -Path $VHDPath -ParentPath $DifferencingDiskPath -Differencing
    New-VM -Name $VMName -VHDPath $VMDisk.Path -SwitchName $SwitchName -Generation 1 -Path $Path
}