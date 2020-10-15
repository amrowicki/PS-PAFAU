function Get-Drink
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('Coffee', 'Tea', 'Water', 'Beer')]
        [System.String]
        $Drink
    )
    DynamicParam
    {
        if ($Drink -eq 'Beer')
        {
            #Create a new ParameterAttribute Object
            $AgeAttribute = New-Object System.ManAgement.Automation.ParameterAttribute
            $AgeAttribute.Mandatory = $true
 
            #Create an attributecollection object for the attribute we just created
            $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
 
            #Add our custom attribute
            $AttributeCollection.Add($AgeAttribute)
 
            #Add our paramater specifying the attribute collection
            $AgeParam = New-Object System.ManAgement.Automation.RuntimeDefinedParameter('Age', [Int16], $AttributeCollection)
 
            #Expose the name of our parameter
            $ParamDictionary = New-Object System.ManAgement.Automation.RuntimeDefinedParameterDictionary
            $ParamDictionary.Add('Age', $AgeParam)
            return $ParamDictionary
        }
    }

    process
    {
        Write-Output "Your drink: $Drink"
        if ($null -ne $PSBoundParameters.Age) { Write-Output "Your age: $($PSBoundParameters.Age)" }
    }
}

Get-Drink -Drink Coffee
Get-Drink -Drink Coffee -Age 21
Get-Drink -Drink Beer -Age 21
Get-Drink -Drink Beer