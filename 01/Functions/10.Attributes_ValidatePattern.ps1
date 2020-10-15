function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [System.String[]]
        $First,

        [Parameter(Mandatory)]
        [ValidatePattern('[0-9][0-9][0-9][0-9]')]
        [System.String[]]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First 12345 -Second 12345
Get-Function -First 12345 -Second Two

function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [System.String[]]
        $First,

        [Parameter(Mandatory)]
        [ValidatePattern('^[0-9][0-9][0-9][0-9]$')]
        [System.String[]]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First 12345 -Second 1234
Get-Function -First 12345 -Second 12345