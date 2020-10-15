function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [System.String]
        $First,

        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [System.String]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First One -Second Two
Get-Function -First '' -Second ''
Get-Function -First One -Second ''