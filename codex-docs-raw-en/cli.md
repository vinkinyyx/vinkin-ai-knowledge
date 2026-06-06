# CLI – Codex | OpenAI Developers

URL: https://developers.openai.com/codex/cli

---

Codex CLI is OpenAI’s coding agent that you can run locally from your terminal. It can read, change, and run code on your machine in the selected directory.
It’s [open source](https://github.com/openai/codex) and built in Rust for speed and efficiency.


ChatGPT Plus, Pro, Business, Edu, and Enterprise plans include Codex. Learn more about [what’s included](/codex/pricing).
    


## CLI setup


Choose your install optionmacOS/LinuxWindowsnpmHomebrew
- 1

## Install


Install the Codex CLI with the standalone installer for macOS and Linux.macOS/Linux install commandcurl -fsSL https://chatgpt.com/codex/install.sh | sh

Copy

For unattended installs, set `CODEX_NON_INTERACTIVE=1` on the shell that runs the downloaded installer. See [Environment variables](/codex/environment-variables#installer-variables) for details.macOS/Linux unattended install commandcurl -fsSL https://chatgpt.com/codex/install.sh | CODEX_NON_INTERACTIVE=1 sh

Copy
- 2

## Run


Run Codex in a terminal. It can inspect your repository, edit files, and run commands.Run Codex commandcodex

Copy

The first time you run Codex, you'll be prompted to sign in. Authenticate with your ChatGPT account or an API key.

See the [pricing page](/codex/pricing) if you're not sure which plans include Codex access.
- 3

## Upgrade


New versions of the Codex CLI are released regularly. See the [changelog](/codex/changelog) for release notes. To upgrade a standalone install, rerun the installer:macOS/Linux upgrade commandcurl -fsSL https://chatgpt.com/codex/install.sh | sh

Copy


The Codex CLI is available on macOS, Windows, and Linux. On Windows, run Codex
natively in PowerShell with the Windows sandbox, or use WSL2 when you need a
Linux-native environment. For setup details, see the 
[Windows setup guide](/codex/windows).


If you’re new to Codex, read the [best practices guide](/codex/learn/best-practices).


## Work with the Codex CLI


 

## Run Codex interactively


Run `codex` to start an interactive terminal UI (TUI) session.
