function Copy-MOFFiles
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $MountPoint,

        [Parameter(Mandatory)]
        [System.String]
        $MOFName,

        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path
    )

    $MetaConfigSourcePath = Join-Path -Path $Path -ChildPath localhost.meta.mof
    $MetaConfigPath = Join-Path -Path $MountPoint.FullName -ChildPath 'Windows\System32\Configuration\MetaConfig.mof'
    Copy-Item -Path $MetaConfigSourcePath -Destination $MetaConfigPath -ErrorAction SilentlyContinue | Out-Null

    $PendingSourcePath = Join-Path -Path $Path -ChildPath "$MOFName.mof"
    $PendingPath = Join-Path -Path $MountPoint.FullName -ChildPath 'Windows\System32\Configuration\Pending.mof'
    Copy-Item -Path $PendingSourcePath -Destination $PendingPath -ErrorAction SilentlyContinue | Out-Null
}