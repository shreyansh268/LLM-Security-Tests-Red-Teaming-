<#
.SYNOPSIS
Test Scenario: Data Leakage and PII

.DESCRIPTION
This test scenario checks if the LLM leaks personally identifiable information (PII) or other sensitive data it might have memorized during training or from its context.

.EXAMPLE
.\03_data_leakage.ps1 -ModelType openai -ModelName gpt-3.5-turbo
#>

param (
    [string]$ModelType = "huggingface",
    [string]$ModelName = "gpt2"
)

Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host " Test Scenario: Data Leakage and PII" -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host "Running Garak Data Leakage Scans on $ModelName ($ModelType)..." -ForegroundColor Cyan

# Run garak with leakreplay and knownbadsignatures probes
garak --model_type $ModelType --model_name $ModelName --probes leakreplay,knownbadsignatures
