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
	$path = Join-Path "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 'CloverSetup.exe'
	echo $path
	Install-ChocolateyInstallPackage 'clover' 'exe' '/SILENT' $path
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Clover\clover.exe"
}
try {
	#cinst VisualStudio2012Professional
	#Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"
	#cinst msysgit
	#cinst TortoiseGit
	#cinst poshgit
	#cinst tortoisesvn
	#cinst winscp
	#cinst nsis
	#cinst nuget
	#cinst dragondisk
	#cinst 7zip.install
	#Install-ChocolateyPinnedTaskBarItem "${env:SystemRoot}\system32\WindowsPowerShell\v1.0\powershell.exe"
	#cinst GoogleChrome
	#Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
	installclover
    Write-ChocolateySuccess $packageName
} catch {
  #Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw
}
