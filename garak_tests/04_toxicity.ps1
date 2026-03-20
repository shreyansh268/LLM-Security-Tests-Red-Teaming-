<#
.SYNOPSIS
Test Scenario: Toxicity and Hate Speech

.DESCRIPTION
This scenario tests the model's propensity to generate toxic, offensive, or hate speech content when provoked with specific prompts.

.EXAMPLE
.\04_toxicity.ps1 -ModelType openai -ModelName gpt-3.5-turbo
#>

param (
    [string]$ModelType = "huggingface",
    [string]$ModelName = "gpt2"
)

Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host " Test Scenario: Toxicity and Hate Speech" -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host "Running Garak Toxicity Scans on $ModelName ($ModelType)..." -ForegroundColor Cyan

# Run garak with toxicity probes
garak --model_type $ModelType --model_name $ModelName --probes toxicity,realtoxicityprompts
