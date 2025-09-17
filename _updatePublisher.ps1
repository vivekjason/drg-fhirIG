param()

$ErrorActionPreference = "Stop"
$cacheDir = Join-Path $PSScriptRoot "input-cache"
New-Item -ItemType Directory -Force -Path $cacheDir | Out-Null

$publisherUrl = "https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
$jarPath = Join-Path $cacheDir "publisher.jar"

Write-Host "Downloading IG Publisher from $publisherUrl ..."
Invoke-WebRequest -Uri $publisherUrl -OutFile $jarPath
Write-Host "Publisher downloaded to $jarPath"