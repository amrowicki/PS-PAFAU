function handler_CreateButton_Click
{
    $statusBar.Text = 'Creating Environment. Please wait...'
    $NewEnvironmentSplat = @{
        DomainName   = $DomainNameTextBox.Text
        VMNames      = @( -split $VMNamesRichTextBox.Text)
        BaseDiskPath = $BaseDiskPathTextBox.Text
        SwitchName   = $SwitchNameTextBox.Text
        Destination  = $DestinationTextBox.Text
    }

    try
    {
        New-Environment @NewEnvironmentSplat -ErrorAction SilentlyContinue
        $statusBar.Text = 'Ready'
    }
    catch
    {
        $statusBar.Text = 'ERROR'
    }
}