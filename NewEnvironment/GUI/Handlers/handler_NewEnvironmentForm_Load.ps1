function handler_NewEnvironmentForm_Load
{
    if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
    {
        $statusBar.Text = 'Insufficient permissions to run this script. Open the PowerShell console as an administrator and run this script again.'
        $CreateButton.Enabled = $false
    }
}