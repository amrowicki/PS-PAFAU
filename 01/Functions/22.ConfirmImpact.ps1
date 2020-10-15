function Get-Function
{
    [CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess)]
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