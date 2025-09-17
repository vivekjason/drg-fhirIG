param()

$ErrorActionPreference = "Stop"
$jar = Join-Path $PSScriptRoot "input-cache\publisher.jar"

if (!(Test-Path $jar)) {
  Write-Host "publisher.jar not found. Running _updatePublisher.ps1 ..."
  & "$PSScriptRoot\_updatePublisher.ps1"
}

java -version
java -jar $jar -ig ig.ini