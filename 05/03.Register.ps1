# Rejestrujemy sesję i restartujemy winrm
Register-PSSessionConfiguration -Name Spooler_Admins -Path 'C:\Program Files\WindowsPowerShell\spooler_conf.pssc'
Restart-Service WinRM