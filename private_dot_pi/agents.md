# Agent Guidelines

## Environment & Tooling

- **Shell:** fish shell. All shell scripts and commands must be compatible with fish syntax.
- **Editor:** Neovim, using the kickstart.nvim / lazy.nvim configuration.
- **HTTP Client:** `xh` (a friendly cURL alternative). Prefer `xh` for HTTP examples.
- **Search:** `rg` (ripgrep) for code/text search.
- **File Finding:** `fd` (a friendly `find` alternative).
- **Containerization:** Docker via compose. Use the `compose.yaml` filename standard.
- **Networking:** Home network on Tailscale with MagicDNS for service resolution.
- **File Listings:** Use `eza -lhg --icons` for directory listings.
- **Compression:** Use zstd for tar (e.g., `tar -c --zstd -f archive.tar.zst`).

## Tool Installation

- **Always check mise first** before installing anything with brew
- **NEVER install with brew** what can be installed via mise
- Use `mise install` for: languages, tools, CLIs

## Config Management

### Chezmoi (User/Dotfiles)

- User desktop tools and dotfiles
- `~/.pi/` - agent configs, MCP settings
- `~/.config/` - app configurations

### OpenTofu (Infrastructure)

- Cluster and container tools
- Systemd user units (in `~/.config/systemd/user/`)
- Backup scripts in `/opt/scripts/`
- Docker compose configurations

## Scheduling (No Sudo Required)

When an agent needs to schedule tasks, avoid giving sudo. Use these alternatives:

### 1. Systemd User Units (Preferred)

- No sudo needed - lives in `~/.config/systemd/user/`
- Run `loginctl enable-linger cparrish` once (as root) to keep user services running
- Agent creates `.service` and `.timer` files

### 2. MCP Cron Server (Agent-Native)

- Use `mcp-cron` MCP server for scheduling
- Configured in `~/.pi/mcp-config.json`
- Agent can schedule tasks via MCP tools
- Example: `mcp-cron schedule` tool to create cron jobs

### 3. Kopia Native Scheduling

- Use Kopia's built-in scheduler instead of cron
- Example: `kopia policy set --snapshot-interval 4h /path/to/data`

### 3. MCP Task Servers

- Use an MCP server like `mcp-server-cron` for scheduling
- Agent talks to MCP instead of editing system files

## Technical Stack

- **Language Priority:\*\***
  1. **Go:** Default for new projects
  2. **Rust:** Prefer over C/Python
  3. **TypeScript:** Always over plain JavaScript
  4. **Python 3.12+**
- **Stack:** Next.js, Convex, Tailwind CSS
- **Backend:** FastAPI (Python), Convex (TypeScript)
- **Databases:** PostgreSQL 16, MySQL, SQLite (Turso), Redis
- **Cloud:** AWS, occasionally GCP
- **Docker:** Never use `:latest` - use specific version tags (e.g., `redis:7.2-alpine`)

## Coding Philosophy

- **Core Principles:** Twelve-Factor App methodology (takes precedence over SOLID if conflict)
- **Paradigm:** Functional programming where supported
- **Testing:** Testify (Go), vitest (TS/React), cypress (E2E). Prefer TDD.
- **Linting:** ruff (Python), prettier (TypeScript)
- **API:** RESTful by default
- **Commit Messages:** Follow Conventional Commits specification:
  - `feat:` new feature
  - `fix:` bug fix
  - `docs:` documentation only
  - `style:` formatting (no code change)
  - `refactor:` code change that neither fixes nor adds
  - `test:` adding/updating tests
  - `chore:` maintenance
  - Format: `<type>(<scope>): <description>`
  - Example: `feat(nvim): enable LSPs for Go, Python, Rust, TypeScript`
- **Output:** Provide brief explanation _before_ code blocks, complete self-contained examples
- **No Fluff:** Avoid "Of course!", "Certainly!", "I apologize..." - be direct

## SurrealDB First

When answering questions about data from notes or research:

1. **Always check SurrealDB first** before grepping local files
2. Use WebSocket query via surreal CLI with infisical injection:

```bash
infisical run --env dev --silent -- sh -c 'echo "SELECT <fields> FROM <table>" | surreal sql -e "wss://surrealdb.cuttlefish-gorgon.ts.net:443" -u "$SURREALDB_USER" -p "$SURREALDB_PASSWORD" --ns default --db homestead --pretty --hide-welcome'
```

### SurrealDB Connection

- **Endpoint**: `wss://surrealdb.cuttlefish-gorgon.ts.net:443` (WebSocket)
- **HTTP**: `https://surrealdb.cuttlefish-gorgon.ts.net/sql` (has empty results bug in 3.0.5)
- **User/Pass**: From infisical `SURREALDB_USER`, `SURREALDB_PASSWORD`
- **Namespace**: `default`
- **Database**: `homestead`

### Known Issues

- HTTP `/sql` endpoint returns `{"status":"OK"}` with empty results - use WebSocket instead
- xh adds Accept header that causes 400 error - use `Accept:` (empty) or curl

## Fish Aliases (from ~/.config/fish/aliases/common.fish)

Key aliases to recognize when user copies/pastes:

### Navigation & Tools

- `ll` / `la` - ls variants
- `nv` - neovim
- `h` - atuin search
- `dl` - lsd
- `ez` / `el` / `ea` / `et` - eza shortcuts

### Chezmoi

- `ccd` - chezmoi cd
- `cu` - chezmoi update
- `ca` / `cga` / `cgp` / `cgl` - chezmoi variants

### Mise

- `mcheck` - check mise status and missing tools
- `mug` / `mlg` - mise use global / ls global

### Git

- `ga` / `gcm` / `gco` / `gf` / `gl` / `gp` / `gst` - standard git
- `grb` / `grbc` / `grbi` / `grbm` - git rebase

### Kubernetes

- `k` / `kg` / `kgp` / `kgn` / `kd` / `klogs` - kubectl shortcuts
- `kx` - kubectx, `kn` - kubens

### Infisical

- `ir` - infisical run --env dev --
- `irp` - infisical run --env prod --
- `is` / `iss` - infisical secrets

### Notes

- `cdn` - cd ~/notes
- `gn` - grep notes recursively

## mise Tools

Key tools available via mise (run `mcheck` to see full list):

### Core Tools

- `age` (1.3.1) - encryption
- `atuin` (18.10.0) - shell history
- `eza` (0.23.4) - modern ls
- `jj` (0.39.0) - git alternative
- `nu` (0.111.0) - dataframes
- `ripgrep` (15.1.0) - search

### GitHub-installed

- `bat` (0.26.1), `fd` (10.4.2), `fzf` (0.71.0)
- `xh` (0.25.3) - HTTP client (preferred)
- `starship` (1.25.0) - prompt
- `zellij` (0.44.1) - terminal multiplexer
- `kopia` (0.22.3), `rclone` (1.73.1) - backup/sync

### Dev Tools

- `go` (1.25.4), `node` (20.19.6), `python` (3.12.12)
- `rust` (1.92.0), `typescript` (5.9.3), `pnpm` (10.26.0)
- `ruff` (0.15.11) - Python linter
- `kubectl` (1.31.0), `minikube` (1.33.1)
- `opentofu` (1.7.0) / `terraform-ls` (0.38.6)
- `infisical` (0.43.78) - secrets

### Special

- `spec-kit-mcp` (0.1.0) - spec kit MCP
- `pi-opencode` (1.0.0) - pi opencode
- `gemini-cli` (0.24.0) - Google Gemini CLI

## Preferences

- **Privacy:** Disable all telemetry/anonymous data collection
- **Shell Output:** Use `printf` over `echo` for special characters
- **Methodology:** Speckit for breaking down complex tasks

## Node Backup Strategy

### mint-mini

- Runs `/opt/scripts/backup-node.fish` via systemd user timer (every 8 hours)
- Dumps PostgreSQL, MariaDB, copies system configs
- Snapshots to Kopia repo (S3: `kopia-backups`)

### Pi

- Runs `/opt/scripts/backup-node.fish` via systemd user timer (every 8 hours)
- Backs up Docker volumes to local staging, then Kopia snapshot
