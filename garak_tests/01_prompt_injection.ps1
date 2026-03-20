<#
.SYNOPSIS
Test Scenario: Prompt Injection

.DESCRIPTION
Prompt injection attacks attempt to override the original instructions given to the LLM by the system prompt, forcing it to follow the user's malicious instructions instead.
This test uses garak's promptinject probe to simulate these attacks, assessing whether the model can be hijacked to perform unintended actions.

.EXAMPLE
.\01_prompt_injection.ps1 -ModelType openai -ModelName gpt-3.5-turbo
#>

param (
    [string]$ModelType = "huggingface",
    [string]$ModelName = "gpt2"
)

Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host " Test Scenario: Prompt Injection" -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Yellow
Write-Host "Running Garak Prompt Injection Scans on $ModelName ($ModelType)..." -ForegroundColor Cyan

# Run garak with promptinject probes
garak --model_type $ModelType --model_name $ModelName --probes promptinject
