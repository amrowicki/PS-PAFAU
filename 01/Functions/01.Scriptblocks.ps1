{
    Write-Output 'This is first ScriptBlock'
}
#------------------------------------------------------------
&{
    Write-Output 'This is first ScriptBlock'
}
#------------------------------------------------------------
{
    Write-Output 'This is second ScriptBlock'
}.invoke()
#------------------------------------------------------------
$ScriptBlock = {
    Write-Output 'This is third ScriptBlock'
}
$ScriptBlock.invoke()
#------------------------------------------------------------
Invoke-Command -ScriptBlock $ScriptBlock
#------------------------------------------------------------
$ParametrizedScriptBlock = {
    param($Name,$Surname)

    Write-Output "Hello $Name $Surname"
}
$ParametrizedScriptBlock.Invoke('Adam')
$ParametrizedScriptBlock.Invoke('Adam','Mrowicki')
Invoke-Command -ScriptBlock $ParametrizedScriptBlock -ArgumentList 'Adam'
Invoke-Command -ScriptBlock $ParametrizedScriptBlock -ArgumentList 'Adam','Mrowicki'
& $ParametrizedScriptBlock 'Adam'
& $ParametrizedScriptBlock 'Adam','Mrowicki'
& $ParametrizedScriptBlock -Name 'Adam'
& $ParametrizedScriptBlock -Surname 'Mrowicki' -Name 'Adam'
#------------------------------------------------------------