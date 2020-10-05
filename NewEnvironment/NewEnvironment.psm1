$Public = @( Get-ChildItem -Path $PSScriptRoot\Functions\Public\*.ps1 -ErrorAction SilentlyContinue -Recurse )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Functions\Private\*.ps1 -ErrorAction SilentlyContinue -Recurse )
$GUI = @( Get-ChildItem -Path $PSScriptRoot\GUI\*.ps1 -ErrorAction SilentlyContinue -Recurse )

foreach ($Import in @($Public + $Private + $GUI))
{
    try { . $Import.FullName }
    catch { Write-Error -Message "Failed to Import function $($Import.fullname): $_" }
}