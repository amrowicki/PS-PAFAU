function Copy-RemoteFile
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.IO.FileInfo]
        $FilePath,

        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Destination
    )
    $Computers = Invoke-Command -ComputerName DC1 -ScriptBlock { Get-AdComputer -filter * }
    $PSSessions = New-PSSession -ComputerName $Computers.DNSHostName
    Invoke-Command -Session $PSSessions -ScriptBlock {
        if (-not (Test-Path $using:Destination)) { New-Item -Path $using:Destination -ItemType Directory }
    }
    foreach ($PSSession in $PSSessions)
    {
        Copy-Item -Path $FilePath -Destination $Destination -ToSession $PSSession
    }
    Disconnect-PSSession $PSSessions | Out-Null
}

Copy-RemoteFile -FilePath C:\File.txt -Destination c:\Folder\