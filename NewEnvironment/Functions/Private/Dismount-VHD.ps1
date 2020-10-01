function Dismount-VHD {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $MountPath
    )

    Dismount-WindowsImage -Save -Path $MountPath | Out-Null
    Remove-Item -Path $MountPath -Force | Out-Null
}