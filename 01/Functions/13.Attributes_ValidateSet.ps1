function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [ValidateSet('One', 'Two', 'Three')]
        [System.String]
        $First
    )

    Write-Output "This is function with parameter: $First"
}

Get-Function -First One
Get-Function -First Four

function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [ValidateSet('One', 'Two', 'Three')]
        [System.String]
        $First
    )
    $First = 'Four'
    Write-Output "This is function with parameter: $First"
}
Get-Function -First One