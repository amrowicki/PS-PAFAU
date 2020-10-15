function ParentFunction{
    Write-Verbose 'This is parent function' -verbose
}

Import-Module $PSScriptroot\ChildModule.psm1