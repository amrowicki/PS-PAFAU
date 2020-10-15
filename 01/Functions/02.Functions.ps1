function Get-Function { Write-Output 'This is function' }
Get-Function
#------------------------------------------------------------
function Get-Function
{
    Write-Output "This is function with parameters: $($args[0]), $($args[1]) and $($args[3])"
}
Get-Function
Get-Function One Two Three
Get-Function Two One Three

function Get-Function
{
    Write-Output "There are $($args.count) parameters"
    $args | ForEach-Object { "Parameter value: $PSItem" }
}
Get-Function One Two Three Four Five Six Seven Eight Nine Ten
#------------------------------------------------------------
function Get-Function($First, $Second, $Third)
{
    Write-Output "This is function with parameters: $First, $Second and $Third"
}
Get-Function
Get-Function One Two Three
Get-Function Two One Three
Get-Function -First One -Second Two -Third Three
Get-Function -Second Two -Third Three -First One

function Get-Function($First, $Second, $Third)
{
    Write-Output "This is function with parameters: $First, $Second and $Third"
    Write-Output "These are all unassigned parameters: $args"
}
Get-Function One Two Three
Get-Function -First One -Second Two -Third Three
Get-Function One Two Three Four Five Six Seven Eight Nine Ten
Get-Function -First One -Second Two -Third Three Four Five Six Seven Eight Nine Ten
#------------------------------------------------------------
function Get-Function([string]$First, [int]$Second, [bool]$Third)
{
    Write-Output "This is function with parameters: $First, $Second and $Third"
}
Get-Function -First One -Second Two -Third Three # Should throw
Get-Function -First One -Second 2 -Third $true
#------------------------------------------------------------
function Get-Function([string]$First, [int]$Second, [bool]$Third, $Fourth, $Fifth = 45645, $Sixth, $Seventh, $Eighth, $Ninth, $Tenth, $Eleventh, $Twelveth, $Thirteenth, [Switch]$Fourteenth, $Fifteenth, $Sixteenth, $Seventeenth, $Eighteenth, $Nineteenth, $Twenty)
{
    Write-Output "This is function with parameters: $First, $Second and $Third"
}
Get-Function -First One -Second 2 -Third $true
#------------------------------------------------------------
function Get-Function
{
    param(
        [string]$First,
        [int]$Second,
        [bool]$Third,
        $Fourth,
        $Fifth,
        $Sixth,
        $Seventh,
        $Eighth,
        $Ninth,
        $Tenth,
        $Eleventh,
        $Twelveth,
        $Thirteenth,
        [Switch]$Fourteenth,
        $Fifteenth,
        $Sixteenth,
        $Seventeenth,
        $Eighteenth,
        $Nineteenth,
        $Twenty
    )
    Write-Output "This is function with parameters: $First, $Second and $Third"
}
Get-Function -First One -Second 2 -Third $true
#------------------------------------------------------------
function Get-Function($First = 'One', $Second = 2, $Third = $true)
{
    Write-Output "This is function with parameters: $First, $Second and $Third"
}
Get-Function
Get-Function 1 Two False
Get-Function 1 Two

function Get-Function
{
    param(
        $First = 'One',
        $Second = 2,
        $Third = $true  
    )
    Write-Output "This is function with parameters: $First, $Second and $Third"
}
Get-Function
Get-Function 1 Two False
Get-Function 1 Two