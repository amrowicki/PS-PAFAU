function Mount-VHD {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.IO.FileInfo]
        $DiskPath
    )

    $TempMountDirectory = New-Item -Name ([System.IO.Path]::GetRandomFileName()) -Path ([System.IO.Path]::GetTempPath()) -ItemType Directory
    Mount-WindowsImage -ImagePath $DiskPath.FullName -Path $TempMountDirectory.FullName -Index 1
}