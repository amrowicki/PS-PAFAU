#Copy-item do zdalnego komputera
"Sample file $(get-date)" | Out-File c:\sample.txt
$PSSession = New-PSSession -ComputerName DC1
Copy-Item -Path c:\sample.txt -Destination C:\File.txt -ToSession $PSSession
#katalog docelowy musi być już utworzony


#Copy-item ze zdalnego komputera
$PSSession = New-PSSession -ComputerName DC1
Copy-Item -Path C:\File.txt -Destination C:\NewFile.txt -FromSession $PSSession