function Set-Unattend
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $MountPoint,

        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $SourcePath,

        [Parameter(Mandatory)]
        [System.String]
        $VMName
    )
    
    $PantherPath = Join-Path -Path $MountPoint.FullName -ChildPath 'Windows\Panther'
    New-Item -Path $PantherPath -ItemType Directory -ErrorAction SilentlyContinue | Out-Null

    $UnattendSourcePath = Join-Path -Path $SourcePath -ChildPath unattend.xml
    $UnattendPath = Join-Path -Path $PantherPath -ChildPath unattend.xml
    Copy-Item $UnattendSourcePath -Destination $UnattendPath -Force

    [xml]$XML = Get-Content -Path $UnattendPath
    $XML.unattend.settings[2].component[2].Computername = "$VMName"
    $XML.Save($UnattendPath)
}