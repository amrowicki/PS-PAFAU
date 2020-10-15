function Get-Function
{
    param(
        [ValidateDrive('C', 'D', 'Variable', 'Function')]
        [String]$Path
    )

    Write-Output "Path: $Path"
}

Get-Function -Path c:\file.txt
Get-Function -Path d:\file.txt
Get-Function -Path e:\file.txt
Get-Function -Path Env:\APPDATA