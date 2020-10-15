function Get-Drink
{
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Cosmopolitan', 'Margarita', 'Acapulco', 'Iguana', 'Matador', 'Hawaiian')]
        [System.String]
        $DrinkName
    )

    $DrinkData = (Get-DrinkData -DrinkName $DrinkName)

    [PSCustomObject]@{
        Name        = $DrinkData.DrinkName
        PLN         = $DrinkData.Price
        Ingredients = $DrinkData.Ingredients
        USD         = Get-DrinkPrice -DrinkName $DrinkName -Currency Eur
        GBP         = Get-DrinkPrice -DrinkName $DrinkName -Currency GBP
        EUR         = Get-DrinkPrice -DrinkName $DrinkName -Currency EUR
    }
}

function Get-DrinkData
{
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Cosmopolitan', 'Margarita', 'Acapulco', 'Iguana', 'Matador', 'Hawaiian')]
        [System.String]
        $DrinkName
    )

    try
    {
        return Import-Clixml -Path (Split-Path -Path $PSScriptRoot -ChildPath "$DrinkName.xml")
    }
    catch
    {
        throw "No data for $DrinkName"
    }
}

function Get-DrinkIngredients
{
    [CmdletBinding()]
    [OutputType([System.String[]])]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Cosmopolitan', 'Margarita', 'Acapulco', 'Iguana', 'Matador', 'Hawaiian')]
        [System.String]
        $DrinkName
    )

    return (Get-DrinkData -DrinkName $DrinkName).Ingredients
}

function Get-DrinkPrice
{
    [CmdletBinding()]
    [OutputType([System.Double])]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Cosmopolitan', 'Margarita', 'Acapulco', 'Iguana', 'Matador', 'Hawaiian')]
        [System.String]
        $DrinkName,

        [Parameter()]
        [ValidateSet('PLN', 'USD', 'GBP', 'EUR')]
        [System.String]
        $Currency = 'PLN'
    )

    $DrinkData = (Get-DrinkData -DrinkName $DrinkName)

    $Price = if ($Currency -eq 'PLN') { $DrinkData.Price }
    else { Convert-Currency -Currency $Currency -Value $DrinkData.Price }

    return $Price
}

function Set-DrinkPrice
{
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Cosmopolitan', 'Margarita', 'Acapulco', 'Iguana', 'Matador', 'Hawaiian')]
        [System.String]
        $DrinkName,

        [Parameter()]
        [System.Double]
        $Price
    )

    $CurrentValue = try
    {
        Get-DrinkData -DrinkName $DrinkName
    }
    catch
    {
        [PSCustomObject]@{
            DrinkName   = [System.String]
            Ingredients = [System.String[]]
            Price       = $Price
        }
    }

    if ($PSCmdlet.ShouldProcess($DrinkName, 'Set ingredients?'))
    {
        $CurrentValue.Price = $Price
        $CurrentValue | Export-Clixml -Path (Join-Path -Path $PSScriptRoot -ChildPath "$DrinkName.xml")
    }
}

function Set-DrinkIngredients
{
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Cosmopolitan', 'Margarita', 'Acapulco', 'Iguana', 'Matador', 'Hawaiian')]
        [System.String]
        $DrinkName,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String[]]
        $Ingredients
    )

    $CurrentValue = try
    {
        Get-DrinkData -DrinkName $DrinkName
    }
    catch
    {
        [PSCustomObject]@{
            DrinkName   = $DrinkName
            Ingredients = [System.String[]]
            Price       = [System.Double]
        }
    }

    if ($PSCmdlet.ShouldProcess($DrinkName, 'Set ingredients?'))
    {
        $CurrentValue.Ingredients = $Ingredients
        $CurrentValue | Export-Clixml -Path (Join-Path -Path $PSScriptRoot -ChildPath "$DrinkName.xml")
    }
}

function Get-CurrencyPrice
{
    [CmdletBinding()]
    [OutputType([System.Double])]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('USD', 'GBP', 'EUR')]
        [System.String]
        $Currency
    )
    
    try
    {
        return (Import-Clixml -Path (Join-Path -Path $PSScriptRoot -ChildPath "$Currency.xml")).Value
    }
    catch
    {
        throw "No currency file for $Currency"
    }
}

function Set-CurrencyPrice
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('USD', 'GBP', 'EUR')]
        [System.String]
        $Currency,

        [Parameter(Mandatory)]
        [ValidateScript( { $_ -ge 0 })]
        [System.Double]
        $Value
    )
    [PSCustomObject]@{
        CurrencyName = $Currency
        Value        = $Value
    } | Export-Clixml -Path (Join-Path -Path $PSScriptRoot -ChildPath "$Currency.xml")
}

function Convert-Currency
{
    [CmdletBinding()]
    [OutputType([System.Double])]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('USD', 'GBP', 'EUR')]
        [System.String]
        $Currency,

        [Parameter(Mandatory)]
        [ValidateScript( { $_ -ge 0 })]
        [System.Double]
        $Value
    )

    return $Value / (Get-CurrencyPrice -Currency $Currency)
}

Get-DrinkIngredients -DrinkName Cosmopolitan

# Set-DrinkIngredients -DrinkName Cosmopolitan -Ingredients Water
# Set-DrinkPrice -DrinkName Cosmopolitan -Price 10