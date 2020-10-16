function Get-ComputersWithHotFix
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.String[]]
        $Hotfixes
    )
    $Computers = Get-AdComputer -filter *
    $InvokeCommandSplat = @{
        Computername  = $Computers.DNSHostName
        ScriptBlock   = { Get-HotFix -Id $using:Hotfixes -ErrorAction SilentlyContinue }
        ThrottleLimit = 2

    }
    $ComputersWithHotFix = Invoke-Command @InvokeCommandSplat
    $ComputersWithHotFix | Select-object PSComputerName, InstalledOn
}

Get-ComputersWithHotFix -Hotfixes KB4514366, KB4512578