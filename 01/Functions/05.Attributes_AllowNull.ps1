function Get-Function
{
    param(
        [Parameter(Mandatory)]
        $First,

        [Parameter(Mandatory)]
        [AllowNull()]
        $Second
    )

    Write-Output "This is function with parameters: $First, $Second"
}

Get-Function -First One -Second Two
Get-Function -First $null -Second $null
Get-Function -First One -Second $null