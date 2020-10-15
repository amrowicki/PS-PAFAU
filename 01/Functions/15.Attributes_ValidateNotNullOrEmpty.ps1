function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
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
        [ValidateNotNullOrEmpty()]
        [System.String]
        $First
    )

    Write-Output "This is function with parameter: $First"
}
Get-Function -First $null
Get-Function -First ''