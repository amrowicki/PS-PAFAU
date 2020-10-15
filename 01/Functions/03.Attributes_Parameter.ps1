#Mandatory
function Get-Function
{
    param(
        [Parameter(Mandatory)]
        $First,

        $Second = 2,

        $Third = $true  
    )
    Write-Output "This is function with parameters: $First, $Second and $Third"
}
Get-Function
Get-Function -First One -Second Two -Third Three
Get-Function -First One
Get-Function -Second Two -Third Three

#Position
function Get-Function
{
    param(
        [Parameter(Position = 2)]
        $First,

        [Parameter(Position = 3)]
        $Second,

        [Parameter(Position = 1)]
        $Third 
    )
    Write-Output "This is function with parameters: $First, $Second and $Third"
}

Get-Function One Two Three

#ParameterSetName
function Get-Function
{
    param(
        [Parameter(Mandatory,
            ParameterSetName = 'Computer')]
        [String[]]
        $ComputerName,

        [Parameter(Mandatory,
            ParameterSetName = 'User')]
        [System.String[]]
        $UserName,

        [Parameter(Mandatory)]
        [System.String]
        $DomainName
    )
    
    switch ($PsCmdlet.ParameterSetName)
    {
        Computer { Write-Output "Computer name from domain $DomainName is: $ComputerName" }
        User { Write-Output "User name from domain $DomainName is: $UserName" }
    }
}

Get-Function -UserName TestUser -DomainName TestDomain
Get-Function -ComputerName TestComputer -DomainName TestDomain
Get-Function -DomainName TestDomain
Get-Function

function Get-Function
{
    param(
        [Parameter(Mandatory,
            ParameterSetName = 'ShowOU')]
        [Parameter(Mandatory,
            ParameterSetName = 'Computer')]
        [String[]]
        $ComputerName,

        [Parameter(Mandatory,
            ParameterSetName = 'User')]
        [System.String[]]
        $UserName,

        [Parameter(Mandatory)]
        [System.String]
        $DomainName,

        [Parameter(Mandatory,
            ParameterSetName = 'ShowOU')]
        [Parameter()]
        [Switch]
        $ShowOU
    )
    
    switch ($PsCmdlet.ParameterSetName)
    {
        Computer { Write-Output "Computer name from domain $DomainName is: $ComputerName" }
        User { Write-Output "User name from domain $DomainName is: $UserName" }
        ShowOU { Write-Output "Computer name from domain $DomainName is: $ComputerName (OUNAME)" }
    }
}
Get-Function -UserName TestUser -DomainName TestDomain
Get-Function -ComputerName TestComputer -DomainName TestDomain
Get-Function -ComputerName TestComputer -DomainName TestDomain -ShowOU
Get-Function -UserName TestUser -DomainName TestDomain -ShowOU #Should throw

#ValueFromPipeline
function Get-Function
{
    param(
        [Parameter(ValueFromPipeline)]
        $First
    )
    Write-Output "This is function with parameters: $First"
}

'One' | Get-Function

#ValueFromPipelineByPropertyName
function Get-Function
{
    param(
        [Parameter(ValueFromPipelineByPropertyName)]
        $First,

        [Parameter()]
        $Second
    )
    Write-Output "This is function with parameters: $First, $Second"
}

[PSCustomObject]@{First = 'One' } | Get-Function
[PSCustomObject]@{First = 'One'; Second = 'Two' } | Get-Function

#ValueFromRemainingArguments
function Get-Function
{
    param(
        [Parameter()]
        $First,

        [Parameter(ValueFromRemainingArguments)]
        $Second
    )
    Write-Output "This is function with one parameter: $First and with all remaining parameters: $Second"
}

Get-Function One Two Three Four Five

#HelpMessage
function Get-Function
{
    param(
        [Parameter(Mandatory, HelpMessage='Please enter first element')]
        $First
    )
    Write-Output "This is function with one parameter: $First"
}
Get-Function