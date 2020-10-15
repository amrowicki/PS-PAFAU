function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [System.String[]]
        $First,

        [Parameter(Mandatory)]
        [ValidateLength(1, 5)]
        [System.String[]]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First 12345 -Second 12345
Get-Function -First 123456 -Second 12345
Get-Function -First 123456 -Second 123456
Get-Function -First 12345 -Second @(123456,2,3,4,5,6,7)