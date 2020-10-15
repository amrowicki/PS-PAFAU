function Get-Function
{
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

Get-Function One Two Three

function Get-Function
{
    [CmdletBinding(PositionalBinding = $false)]
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

Get-Function One Two Three