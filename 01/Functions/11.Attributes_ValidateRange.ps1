function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [Int]
        $First,

        [Parameter(Mandatory)]
        [ValidateRange(0,10)]
        [Int]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First 1 -Second 2
Get-Function -First 1 -Second 11
Get-Function -First 1 -Second -1