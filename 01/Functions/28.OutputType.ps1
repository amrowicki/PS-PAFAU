function Get-Function
{
    [CmdletBinding()]
    [OutputType([String])]
    param()
    
    return "This is string"
}
Get-Function
(Get-Command Get-Function).OutputType
(Get-Function).GetType().FullName


function Get-Function
{
    [CmdletBinding()]
    [OutputType([Int])]
    param()
    
    return "This is string"
}
Get-Function
(Get-Command Get-Function).OutputType
(Get-Function).GetType().FullName