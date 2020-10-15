$FilePath = 'c:\temp\FileContent.txt'

function Get-FileContent
{
    Get-Content -Path $FilePath
}

function Set-FileContent
{
    Set-Content -Path $FilePath -Value (Get-Date)
}

function Get-FilePath
{
    $FilePath
}

Export-ModuleMember -Variable * -Function *