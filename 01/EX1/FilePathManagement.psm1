Import-Module $PSScriptRoot\FileContent.psm1

$NewFilePath = 'c:\temp\NewFileContent.txt'
function Set-FilePath
{
    $script:FilePath = $NewFilePath
}