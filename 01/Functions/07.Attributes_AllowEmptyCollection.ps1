function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [System.String[]]
        $First,

        [Parameter(Mandatory)]
        [AllowEmptyCollection()]
        [System.String[]]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First @('One', 1) -Second @('Two', 2)
Get-Function -First @() -Second @()
Get-Function -First @('One', 1) -Second @()