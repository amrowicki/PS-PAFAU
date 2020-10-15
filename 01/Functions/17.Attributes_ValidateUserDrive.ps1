function Get-Function
{
    param(
        [ValidateUserDrive()]
        [String]$Path
    )

    Write-Output "Path: $Path"
}
New-PSDrive -Name 'User' -PSProvider FileSystem -Root $env:HOMEPATH
Get-Function -Path user:\file.txt
Get-Function -Path d:\file.txt