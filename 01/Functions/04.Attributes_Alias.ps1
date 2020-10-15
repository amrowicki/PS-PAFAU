function Get-Function
{
    param(
        [Parameter()]
        [Alias('One')]
        $First,

        [Alias('Two', 'Another')]
        [Parameter()]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -One One -Two Two
Get-Function -First One -Another Two