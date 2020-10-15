function Get-Function
{
    param(
        [Parameter(Mandatory)]
        [ValidateScript({$_ -ge (Get-Date)})]
        [DateTime]
        $EventDate
    )

    Write-Output "The $EventDate occurs after the current date"
}

Get-Function -EventDate (Get-Date).AddDays(1)
Get-Function -EventDate (Get-Date).AddDays(-10)