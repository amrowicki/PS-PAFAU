function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [System.String[]]
        $First,

        [Parameter(Mandatory)]
        [ValidateCount(1, 5)]
        [System.String[]]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First @('One', 1) -Second @('Two', 2)
Get-Function -First @('One', 1) -Second @(1,2,3,4,5)
Get-Function -First @('One', 1) -Second @(1,2,3,4,5,6,7)
Get-Function -First @('One', 1) -Second @()