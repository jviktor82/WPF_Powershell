$XamlPath = "GUI\WindowMessage.xaml"

. (".\load_wpf.ps1")

# Events

$BtnSend.Add_Click({
  if (-not ([string]::IsNullOrEmpty($TextBody.Text)))
  {
    $Window.Close()
  }
  else
  {
    [System.Windows.MessageBox]::Show("Please supply a message!", "Error", "Ok", "Error" )
  }
})


# Show MainWindow
$Window.ShowDialog() | Out-Null
