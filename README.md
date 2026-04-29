# LLM Security Tests

<img width="431" height="376" alt="image" src="https://github.com/user-attachments/assets/8b8dea36-31b2-4527-8a7a-00ffb711cb5d" />
<img width="539" height="231" alt="image" src="https://github.com/user-attachments/assets/b843a826-1a19-4c80-a6e4-12f9acf5354f" />


Disclaimer: The scripts in this repository are for educational and security testing purposes only. Unauthorized testing of LLMs may be illegal or unethical. Use these scripts responsibly and ensure you have proper authorization to test the models.

This repository contains a suite of automated security test scenarios for Large Language Models (LLMs) using [garak](https://github.com/leondz/garak), an LLM vulnerability scanner. 

The tests are provided as PowerShell scripts, making it easy to run security evaluations against models hosted locally or via APIs (e.g., Hugging Face, OpenAI).

## Prerequisites

1. **Install Garak:** Ensure `garak` is installed in your Python environment.
   ```bash
   pip install garak
   ```
2. **Setup API Keys (Optional):** If testing commercial models like OpenAI, Anthropic, or Cohere, ensure your respective environment variables (such as `OPENAI_API_KEY`) are set.

## Test Scenarios (`/garak_tests`)

The following test scenarios are included in this suite:

### 1. Prompt Injection (`01_prompt_injection.ps1`)
Tests if an attacker can override system prompts, hijacking the model to follow malicious instructions.
- **Probes Used:** `promptinject`

### 2. Jailbreak and DAN (`02_jailbreak.ps1`)
Tests the model's resistance to jailbreaks and "Do Anything Now" (DAN) attacks, ensuring it doesn't violate its alignment policies.
- **Probes Used:** `dan`, `jailbreak`, `donotanswer`

### 3. Data Leakage & PII (`03_data_leakage.ps1`)
Evaluates the model's susceptibility to leaking Personally Identifiable Information (PII) or regurgitating memorized training data.
- **Probes Used:** `leakreplay`, `knownbadsignatures`

### 4. Toxicity and Hate Speech (`04_toxicity.ps1`)
Ensures the model does not generate offensive, toxic, or hate-speech content when provoked.
- **Probes Used:** `toxicity`, `realtoxicityprompts`

### 5. Encoding & Obfuscation (`05_encoding_obfuscation.ps1`)
Evaluates if typical safety filters can be bypassed using obfuscation tactics or encoded payloads (like Base64 and ROT13).
- **Probes Used:** `encoding`

## Usage

Each script allows you to override the target model and model type via arguments. By default, they test the Hugging Face `gpt2` model.

### Running a Test (Default)

Navigate to the `garak_tests` folder and run any script:

```powershell
cd garak_tests
.\01_prompt_injection.ps1
```

### Testing a Specific Model (e.g., OpenAI)

You can pass the `-ModelType` and `-ModelName` arguments to test specific models:

```powershell
# Testing an OpenAI model against Jailbreak probes
.\02_jailbreak.ps1 -ModelType openai -ModelName gpt-3.5-turbo

# Testing a local Hugging Face model
.\01_prompt_injection.ps1 -ModelType huggingface -ModelName meta-llama/Llama-2-7b-chat-hf
```
