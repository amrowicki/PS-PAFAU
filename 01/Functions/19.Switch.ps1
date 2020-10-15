function Get-Function
{
    param(
        [Parameter()]
        [Switch]
        $Toggle
    )

    Write-Output "Toggle is $Toggle"
}

Get-Function -Toggle
Get-Function
Get-Function -Toggle:$true
Get-Function -Toggle:$false