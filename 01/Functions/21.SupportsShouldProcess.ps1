function Get-Function
{
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        $First
    )

    if ($PSCmdlet.ShouldProcess($First))
    {
        Write-Output "This is function with one parameter: $First"
    }
}

Get-Function -First 'One'
Get-Function -First 'One' -Confirm
Get-Function -First 'One' -Whatif
Get-Function -First 'One' -Confirm:$true
Get-Function -First 'One' -Confirm:$false
Get-Function -First 'One' -Whatif:$true
Get-Function -First 'One' -Whatif:$false

function Get-Function
{
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        $First
    )
    if ($PSCmdlet.ShouldProcess($First, 'Display item'))
    {
        Write-Output "This is function with one parameter: $First"
    }
}

Get-Function -First 'One'
Get-Function -First 'One' -Confirm
Get-Function -First 'One' -WhatIf