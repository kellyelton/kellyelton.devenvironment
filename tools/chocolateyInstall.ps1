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
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Clover\clover.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:SystemRoot}\system32\WindowsPowerShell\v1.0\powershell.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:windir}\system32\mstsc.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\LINQPad4\LINQPad.exe"
	Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Notepad++\notepad++.exe"
	#Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\vim\vim74\gvim.exe"
	#Install-ChocolateyPinnedTaskBarItem "C:\Chocolatey\lib\winscp.5.1.7\tools\WinSCP.exe"
    choco windowsfeatures IIS-WebServer
    choco windowsfeatures IIS-WebServerRole
    choco windowsfeatures IIS-CommonHttpFeatures
    choco windowsfeatures IIS-HttpErrors
    choco windowsfeatures IIS-HttpRedirect
    choco windowsfeatures IIS-ApplicationDeployment
    choco windowsfeatures IIS-NetFxExtensibility
    choco windowsfeatures IIS-NetFxExtensibility45
    choco windowsfeatures IIS-HealthAndDiagnostics
    choco windowsfeatures IIS-Security
    choco windowsfeatures IIS-RequestFiltering
    choco windowsfeatures IIS-Performance
    choco windowsfeatures IIS-WebServerManagementTools
    choco windowsfeatures IIS-ManagementScriptingTools
    choco windowsfeatures IIS-WindowsAuthentication
    choco windowsfeatures IIS-StaticContent
    choco windowsfeatures IIS-DefaultDocument
    choco windowsfeatures IIS-ApplicationInit
    choco windowsfeatures IIS-WebSockets
    choco windowsfeatures IIS-ASPNET
    choco windowsfeatures IIS-ASPNET45
    choco windowsfeatures IIS-ASP
    choco windowsfeatures IIS-CGI
    choco windowsfeatures IIS-ISAPIExtensions
    choco windowsfeatures IIS-ISAPIFilter
    choco windowsfeatures IIS-ManagementConsole
    choco windowsfeatures IIS-ManagementService
    Write-ChocolateySuccess $packageName
} catch {
  #Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw
}
