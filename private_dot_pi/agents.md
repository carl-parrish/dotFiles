# Agent Guidelines

## Core Environment & Tooling
- **Shell:** Fish shell. All commands must be compatible with Fish syntax.
- **Editor:** Neovim (kickstart.nvim / lazy.nvim).
- **Stack:** Go (default), Rust, TypeScript, Python 3.12+.
- **Secrets:** Always use `ir` (`infisical run --env dev --`) to wrap database and infrastructure commands.
- **Privacy:** Strict telemetry denial.

## Communication & Guardrails
1. **Ask before changing:** Reading/searching code is free. Always ask for confirmation before editing configuration files, dotfiles, or infrastructure.
2. **Infisical Sessions:** If session expires, explicitly ask the user to run `infisical login`. Do not attempt keybox workarounds.

## SurrealDB First (Memory & Context Layer)
You have a unified memory layer accessible via WebSocket at `wss://surrealdb.cuttlefish-gorgon.ts.net:443` (Namespace: `default`, DB: `homestead` or `homelab`).

**CRITICAL WORKFLOW:** Before writing complex code, script executions, or tool invocations, you MUST query SurrealDB to check the Approach Cache:
1. Search for past **failed** executions matching your current task to identify constraints and syntax pitfalls to avoid.
2. Search for past **successful** execution templates to reuse existing working implementations.

*Note: For syntax rules regarding SurrealDB v3.x, execute: `SELECT * FROM topic:surrealdb_v3;` rather than guessing.*

## Development Workflow
1. **Use `jj` Workspaces:** All code modifications MUST be made in a `jj` workspace (which functions like a git worktree). Do not commit changes directly to the `main` or `master` branch. Ask the user for the appropriate branch or workspace name if unclear.

## Tooling & Diagnostics
1. **Verify Before Assuming:** If a command-line tool fails with an "unrecognized command" or similar error, do not assume the tool is old. First, verify its version (`--version`) and then consult its built-in help (`--help`) to see the list of available commands and their correct syntax.
2. **Explain Full Impact:** Before executing commands that can revert or alter repository state (e.g., `jj op restore`, `git reset`), explicitly state the full scope of the command, including potential side effects like losing workspace metadata, uncommitted changes, or other non-obvious consequences.
3. **Assume Dotfiles are Managed:** When asked to change configuration files in a user's home directory (`~/.config`, `~/.local`, etc.), always assume they are managed by a dotfile manager like `chezmoi`. Ask for the location of the source template file before proposing any edits. Do not edit configuration files directly.
