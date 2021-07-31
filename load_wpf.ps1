Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

function LoadWPF
{
  param (
    $XamlPath
  )

  [xml]$XAML = Get-Content $XamlPath
  $XAML.Window.RemoveAttribute('x:Class')
  $XAML.Window.RemoveAttribute('mc:Ignorable')
  $XAMLReader = New-Object System.Xml.XmlNodeReader $XAML
  $global:Window = [Windows.Markup.XamlReader]::Load($XAMLReader)

  # Connect to UI Controls 
  $XAML.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")  | ForEach {
    New-Variable  -Name $_.Name -Value $Window.FindName($_.Name) -Force -Scope Global 
  }
}