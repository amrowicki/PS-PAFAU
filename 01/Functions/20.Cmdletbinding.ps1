function Get-Function
{
    [CmdletBinding()]
    param(
        [Parameter()]
        $First
    )
    Write-Output "This is function with one parameter: $First"
}