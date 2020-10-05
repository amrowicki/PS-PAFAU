function handler_SelectBaseDiskPathButton_Click
{
    $openFileDialog1.ShowDialog()
    $BaseDiskPathTextBox.Text = $openFileDialog1.FileName
}