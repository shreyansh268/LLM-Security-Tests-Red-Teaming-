<#
.SYNOPSIS
Test Scenario: Jailbreak and DAN (Do Anything Now) Attacks

.DESCRIPTION
Jailbreak attacks aim to bypass the safety filters and alignment mechanisms of the LLM. 
The DAN (Do Anything Now) probes explicitly try to instruct the model to ignore prior rules.
This test runs garak's DAN and known jailbreak probes.

.EXAMPLE
.\02_jailbreak.ps1 -ModelType openai -ModelName gpt-3.5-turbo
#>

param (
    [string]$ModelType = "huggingface",
    [string]$ModelName = "gpt2"
)

Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host " Test Scenario: Jailbreak Attacks" -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host "Running Garak Jailbreak Scans on $ModelName ($ModelType)..." -ForegroundColor Cyan

# Run garak with DAN and jailbreak probes
garak --model_type $ModelType --model_name $ModelName --probes dan,jailbreak,donotanswer
