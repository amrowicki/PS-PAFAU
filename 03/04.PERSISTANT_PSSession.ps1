$PSSession = New-PSSession -ComputerName iis1
$PSSessions = New-PSSession -ComputerName iis1, srv1
$PSSession
$PSSessions
Get-PSSession

New-PSSession -ComputerName iis1
#W takim przypadku nie mamy przypisanego obiektu sesji do żadnej zmiennej ale nadal możemy się do niej dostać poprzez Get-PSSession

#Poniższe pokazuje, że invoke command bez trwałej sesji nie zachowuje obiektów pomiędzy wykonaniami
Invoke-Command -computername iis1, srv1 { $h = Get-HotFix }
Invoke-Command -computername iis1, srv1 { $h }

# Poniższe pokazuje, że sesja jest zachowana i zmienna jest widoczna po ponownym skorzystaniu z sesji
$PSSession = New-PSSession -ComputerName iis1, srv1
Invoke-Command -Session $PSSession { $h = Get-HotFix }
Invoke-Command -Session $PSSession { $h }

#Usuwanie sesji
Remove-PSSession $PSSession

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#Poniższe pokazuje jak podłączyć się do tej samej sesji z innego komputera
#NA DC1:
$PSSession = New-PSSession -ComputerName srv1
Invoke-Command -Session $PSSession { $h = Get-HotFix }
Get-PSSession
#Przełączyć na iis1
Get-PSSession -ComputerName srv1
#Nie zadziała
Enter-PSSession -Name XXX
Connect-PSSession -Name XXX
#Przełączyć na dc1
Disconnect-PSSession -Name XXX
#Przełączyć na iis1
  XXX
Get-PSSession
Enter-PSSession
$h

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#W Enter-PSSession z parametrem computername nie można łączyć się jednocześnie do wielu sesji. Czy wraz z persistent session jest taka możliwość?
$PSSessions = new-pssession -ComputerName dc1, iis1
Enter-PSSession -Session $PSSession #nie powiedzie się



#InDisconnectedSession
$DisconnectedSessions = Invoke-Command -ComputerName dc1, srv1, iis1 -ScriptBlock { Get-Process } -InDisconnectedSession
$DisconnectedSessions | Receive-PSSession