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
