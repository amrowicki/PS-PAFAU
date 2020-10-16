#Najprostrzy przykład
Enter-PSSession -ComputerName DC1

#nie możemy natomiast wejść w sesję do kilku komputerów
Enter-PSSession -ComputerName DC1, IIS1

#vm
Import-module Hyper-V
Enter-PSSession -VMName dc1.ps.local -Credential ps\administrator

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#PSSessionOption
$PSSessionOption
New-PSSessionOption

$pso = New-PSSessionOption -SkipCNCheck
Enter-PSSession dc1 -UseSSL -SessionOption $pso

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Double-hop problem
#z iis1:
Enter-PSSession srv1
Invoke-Command iis1 -ScriptBlock { Get-HotFix }
#wyszerować katalog na iis1
Get-ChildItem \\iis1\XXX

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#EnableNetworkAccess
#EnableNetworkAccess działa tylko z loopbacowymi połączeniami. Oznacza to, że przy tworzeniu sesji trzeba się połączyć do komputera z któego jest tworzona. Jeśli poda się inny komputer,
#to sesja zostanie utworzona ale parametr zostanie zupełnie pominięty.
#Użycie parametru pozwala na dostęp do zasobów sieciowych i ogólnie innych komputerów z loopbackowej sesji.

#Poniższe nie zadziała:
Enter-PSSession -ComputerName .
invoke-command srv1 {hostname}

#A to już tak:
Enter-PSSession -ComputerName . -EnableNetworkAccess
invoke-command srv1 {hostname}