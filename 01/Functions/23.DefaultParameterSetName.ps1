function Get-Function
{
    [CmdletBinding(DefaultParameterSetName = 'Second')]
    param(
        [Parameter(ParameterSetName = 'First')]
        $First,

        [Parameter(ParameterSetName = 'Second')]
        $Second
    )
    $PsCmdlet.ParameterSetName
}

Get-Function
Get-Function -First 'One'
Get-Function -Second 'Two'