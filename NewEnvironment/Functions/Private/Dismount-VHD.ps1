function Dismount-VHD {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $MountPoint
    )

    Dismount-WindowsImage -Save -Path $MountPoint | Out-Null
    Remove-Item -Path $MountPoint -Force | Out-Null
}