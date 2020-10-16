#Najprostrzy przykład:
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-Hotfix }
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-Hotfix } -Credential ps\administrator

#Możemy także wskazać zamiast scriptblocka sciezke do skryptu
"get-hotfix | Select HotfixId,Description" | Out-File c:\test.ps1
Invoke-Command -ComputerName dc1 -FilePath c:\test.ps1

#Możemy także wykonać polecenie przechowywane w zmiennej
$command = { Get-HotFix -Id KB4514366 }
Invoke-Command -ComputerName dc1 -ScriptBlock $command

#--------------------------------------------------------------------------------------------------------------------
#Pokazać na czym polega using
#To nie działa
$HotFixId = 'KB4514366'
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-HotFix -Id $HotFixId }

#a to działa
$HotFixId = 'KB4514366'
Invoke-Command -ComputerName dc1 -ScriptBlock { Get-HotFix -Id $using:HotFixId }
#--------------------------------------------------------------------------------------------------------------------

#Wykonywanie polecenia na wielu komputerach + splatting
$parameters = @{
    ComputerName = 'dc1', 'iis1'
    ScriptBlock  = { Get-EventLog "Windows PowerShell" -Newest 10 }
}
Invoke-Command @parameters

#usuwanie pscomputername
$parameters = @{
    ComputerName = 'dc1', 'iis1'
    ScriptBlock  = { Get-EventLog "Windows PowerShell" -Newest 10 }
}
Invoke-Command @parameters -HideComputerName

#Podwójne zdefiniowanie parametru zakońcy się bledem
$parameters = @{
    ComputerName     = 'dc1', 'iis1'
    ScriptBlock      = { Get-EventLog "Windows PowerShell" -Newest 10 }
    HideComputerName = $false
}
Invoke-Command @parameters -HideComputerName

#Przekazywanie parametrów
$EventLog = "Windows PowerShell"
$Newest = 10
Invoke-Command -ComputerName DC1 -ScriptBlock { param($x, $y) Get-EventLog -LogName $x -Newest $y } -ArgumentList $EventLog, $Newest

#i to samo z args
$EventLog = "Windows PowerShell"
$Newest = 10
Invoke-Command -ComputerName DC1 -ScriptBlock {Get-EventLog -LogName $args[0] -Newest $args[1] } -ArgumentList $EventLog, $Newest

#AsJob
Invoke-Command -ComputerName DC1, IIS1 -ScriptBlock { Test-Connection -Count 3 wp.pl } -AsJob
Get-Job XX
Get-Job XX | receive-job

#vm
Import-module Hyper-V
Invoke-Command -ScriptBlock {get-hotfix} -VMName DC1.ps.local -Credential ps\administrator

#ThrottleLimit
Invoke-Command -ComputerName DC1,srv1, IIS1 -ScriptBlock { $env:COMPUTERNAME;start-sleep -Seconds 5 } -ThrottleLimit 1
Invoke-Command -ComputerName DC1,srv1, IIS1 -ScriptBlock { $env:COMPUTERNAME;start-sleep -Seconds 5 }

Measure-Command {Invoke-Command -ComputerName DC1,srv1, IIS1 -ScriptBlock { $env:COMPUTERNAME;start-sleep -Seconds 5 } -ThrottleLimit 1}
Measure-Command {Invoke-Command -ComputerName DC1,srv1, IIS1 -ScriptBlock { $env:COMPUTERNAME;start-sleep -Seconds 5 }}