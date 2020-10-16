#Exportowanie poleceń z sesji zdalnej i importowanie
$S = New-PSSession -ComputerName DC1
Export-PSSession -Session $S -OutputModule DC1 -Module ActiveDirectory

Get-Content #modulepath psm1 i psd1
Import-Module DC1