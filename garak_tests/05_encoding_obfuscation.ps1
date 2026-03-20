<#
.SYNOPSIS
Test Scenario: Encoding and Obfuscation Attacks

.DESCRIPTION
Attackers often use encoding (e.g., Base64, ROT13) or obfuscation to bypass typical keyword-based safety filters.
This test evaluates the model's susceptibility to encoded malicious payloads.

.EXAMPLE
.\05_encoding_obfuscation.ps1 -ModelType openai -ModelName gpt-3.5-turbo
#>

param (
    [string]$ModelType = "huggingface",
    [string]$ModelName = "gpt2"
)

Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host " Test Scenario: Encoding and Obfuscation" -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host "Running Garak Encoding/Obfuscation Scans on $ModelName ($ModelType)..." -ForegroundColor Cyan

# Run garak with encoding probes
garak --model_type $ModelType --model_name $ModelName --probes encoding
