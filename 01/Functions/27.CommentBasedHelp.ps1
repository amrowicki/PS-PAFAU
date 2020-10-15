function Get-Function
{
    <#
    .SYNOPSIS
        Zwraca trzy parametry.
    .DESCRIPTION
        Zwraca wartość parametrów przekazanych do funkcji.
    .EXAMPLE
        PS C:\> Get-Function -First 'One'
        Zwróci jeden przekazany parametr
    .EXAMPLE
        PS C:\> Get-Function -First 'One' -Second 'Two' -Third 'Three'
        Zwróci trzy przekazane parametry
    .INPUTS
        [Object]
    .OUTPUTS
        [System.String]
    .NOTES
        General notes
    #>

    [CmdletBinding(PositionalBinding)]
    param(
        [Parameter()]
        $First,

        [Parameter()]
        $Second,

        [Parameter()]
        $Third 
    )
    Write-Output "This is function with parameters: $First, $Second and $Third"
}

Get-Help Get-Function
Get-Help Get-Function -Examples
Get-Help Get-Function -Full