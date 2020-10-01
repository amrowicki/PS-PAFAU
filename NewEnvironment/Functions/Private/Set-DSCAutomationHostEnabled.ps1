function Set-DSCAutomationHostEnabled
{
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateRange(0, 2)]
        [Int]
        $Value = 1,

        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $MountPoint
    )

    $RegistryMountName = (New-Guid).guid
    $SoftwareHivePath = Join-Path -Path $MountPoint.FullName -ChildPath 'Windows\System32\config\SOFTWARE'
    reg load HKLM\$RegistryMountName $SoftwareHivePath | Out-Null
    Set-ItemProperty -Path "HKLM:\$RegistryMountName\Microsoft\Windows\CurrentVersion\Policies\System" -Name DSCAutomationHostEnabled -Value $Value
    reg unload HKLM\$RegistryMountName | Out-Null
}