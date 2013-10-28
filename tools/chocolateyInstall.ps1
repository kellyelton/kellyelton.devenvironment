$packageName = 'kellyelton.devenvironment'

function installsilentlyexe($url, $name) {
  echo "Installing $name"
  Install-ChocolateyPackage $name 'exe' '/SILENT' $url
}
function installsilentlymsi($url, $name) {
  echo "Installing $name"
  Install-ChocolateyPackage $name 'exe' '/quite' $url
}
function installclover(){
	
}
try {
	##Install Clover - Cannot be called within a function I guess
	$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
	$path = Join-Path $scriptDir "CloverSetup.exe"
	Install-ChocolateyInstallPackage 'clover' 'exe' '/S' $path
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Clover\clover.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:SystemRoot}\system32\WindowsPowerShell\v1.0\powershell.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:windir}\system32\mstsc.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\LINQPad4\LINQPad.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Notepad++\notepad++.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\vim\vim73\gvim.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\ChocolateyGUI\ChocolateyGUI.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\WinSCP\WinSCP.exe"
	ChocolateyPinnedTaskBarItem "%comspec% /k ""${env:ProgramFiles(x86)}\Microsoft Visual Studio 12.0\Common7\Tools\VsDevCmd.bat"""
    Write-ChocolateySuccess $packageName
} catch {
  #Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw
}
