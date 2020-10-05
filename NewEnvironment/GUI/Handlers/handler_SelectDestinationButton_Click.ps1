function handler_SelectDestinationButton_Click
{
    $saveFileDialog1.ShowDialog()
    $DestinationTextBox.Text = $saveFileDialog1.SelectedPath
}