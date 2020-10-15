function Get-Function
{
    [CmdletBinding(SupportsPaging)]
    param()
    $FirstNumber = [Math]::Min($PSCmdlet.PagingParameters.Skip, 100)
    $LastNumber = [Math]::Min($PSCmdlet.PagingParameters.First + $FirstNumber - 1, 100)

    if ($PSCmdlet.PagingParameters.IncludeTotalCount)
    {
        $TotalCountAccuracy = 1.0
        $TotalCount = $PSCmdlet.PagingParameters.NewTotalCount(100, $TotalCountAccuracy)
        Write-Output $TotalCount
    }
    $FirstNumber .. $LastNumber | Write-Output
}

Get-Function
Get-Function -Skip 90
Get-Function -First 5
Get-Function -IncludeTotalCount
Get-Function -Skip 90 -First 5 -IncludeTotalCount