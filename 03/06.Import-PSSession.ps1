#Importowanie wszystkiego, wyrzuci błąd bo nic nie nadpisze
$S = New-PSSession -ComputerName Server01
Import-PSSession -Session $S

#Importowanie wszystkiego ale po zaimportowaniu modułu activedirectory
Enter-PSSession $s
Import-module activedirectory
Exit
Import-PSSession $s

#Importowanie wszystkiego z aliasem
Enter-PSSession $s
New-Alias -Name qwe -Value Get-ADUser
Exit
Import-PSSession $s

#Importowanie konkretnej komendy
Import-PSSession $s -CommandName Get-Process
Import-PSSession $s -CommandName Get-Process -AllowClobber

#używanie funkcji, która została przykryta po zaimportowaniu.
get-command get-process
get-command get-process -All
Microsoft.PowerShell.Management\Get-Process

#Importowanie sesji z prefixem żeby nie przykrywać funkcji:
Import-PSSession $s -Prefix DC1
get-module tmp_1kn3qs5i.mv2

#Jak wygląda zaimportowana funkcja:
Get-Command get-DC1command | select *