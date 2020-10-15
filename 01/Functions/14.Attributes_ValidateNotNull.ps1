function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        $First
    )

    Write-Output "This is function with parameter: $First"
}

Get-Function -First One
Get-Function -First $null
Get-Function -First ''

function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [System.String]
        $First
    )

    Write-Output "This is function with parameter: $First"
}
Get-Function -First $null
Get-Function -First ''