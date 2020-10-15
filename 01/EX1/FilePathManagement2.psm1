Import-Module $PSScriptRoot\FileContent.psm1

$NewFilePath = 'c:\temp\NewFileContent.txt'
function Set-FilePath
{
    $script:FilePath = $NewFilePath
}

function Write-FileContent
{
    Write-Host (Get-FileContent)
}

function Set-FileContent
{
    Set-Content -Path $FilePath -Value (Get-Date).DayOfYear
}

Set-Alias -Name GFP -Value Get-FilePath
Set-Alias -Name SFP -Value Set-FilePath
Export-ModuleMember -Function Set-FileContent, Write-FileContent, Get-FilePath, Set-FilePath -Alias *