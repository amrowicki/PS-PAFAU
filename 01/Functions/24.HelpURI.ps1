function Get-Function
{
    [CmdletBinding(HelpURI = 'https://github.com/amrowicki/PS-PAFAU')]
    param(
        [Parameter()]
        $First
    )
    Write-Output "This is function with one parameter: $First"
}

Get-Help Get-Function -Online