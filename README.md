# Sovereign Operator Environment

This repository defines my portable operator environment.

It is built around a simple idea: instead of limiting myself to whatever tools happen to be installed on a machine, I make it easy to project **my** working environment onto any machine I control. If a system has internet access and I have about 15 minutes, I can usually make it operational.

This repo is independent from, but complementary to, my [homelab](https://github.com/carl-parrish/homelab) repository. Where the homelab repo defines infrastructure and services, this repo defines the user environment I use to operate them.

Managed with [chezmoi](https://www.chezmoi.io/).

## Design Principles

### Environment Replication Over Tool Deprivation

I do not optimize for the lowest common denominator of tools that might already exist on a random machine. I optimize for making a machine become mine quickly.

### Reproducible Operator Environment

This repo is the source of truth for my shell, editor, CLI tooling, and day-to-day workflows. It is intended to produce a consistent environment across laptops, servers, Raspberry Pis, and ephemeral systems.

### Intentional, Versioned Tooling

I use `mise` to manage tool versions and installation so that my dependencies are explicit, reproducible, and easy to provision on new systems.

### Identity and Trust Initialization

Secrets are not hardcoded into the repo. Configuration is templated through `chezmoi`, with encrypted material unlocked through a separate identity and trust initialization path.

## Relationship to the Homelab Repo

This repo and [homelab](https://github.com/carl-parrish/homelab) are designed to work together, but they solve different problems:

- **dotFiles**: my operator workstation, shell, editor, CLI tools, and local workflow
- **homelab**: infrastructure, services, deployment patterns, and self-hosted platform components

In short:

- `dotFiles` helps me become productive on a machine quickly
- `homelab` defines the systems I operate once I am there

## What This Repo Manages

This repository manages things like:

- Fish shell configuration
- aliases, abbreviations, and shell functions
- Neovim configuration
- `mise` tool installation and version management
- system provisioning patterns
- identity and trust initialization patterns
- templated config files
- operator-quality defaults that I want available everywhere

## Setup Phases

Setting up a new machine follows three distinct phases:

1. **System Provisioning** — install the base tools required to operate the environment
2. **Identity & Trust Initialization** — establish the local cryptographic identity used to decrypt managed secrets
3. **Chezmoi Bootstrap** — apply the managed configuration and let the environment take over

This `README` covers normal provisioning and day-to-day workflow. For first-device provisioning, recovery, trust establishment, and repository metadata, see `bootstrap.md`.

## System Provisioning

### Install Fish Shell

#### Fedora / Bluefin

```bash
sudo dnf install fish
```

#### Arch / CachyOS

```bash
sudo pacman -Syu --noconfirm fish
```

### Ensure fish is in `/etc/shells` and change default shell

```bash
if ! grep -q "$(which fish)" /etc/shells; then
  echo "$(which fish)" | sudo tee -a /etc/shells
fi
chsh -s "$(which fish)"
```

### Install Basics

Note: package managers are still the right tool for a few system-level dependencies during initial provisioning.

#### Arch / CachyOS example

```bash
sudo pacman -Syu --noconfirm git curl fish neovim gcc base-devel
```

### Install and Authenticate Tailscale

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```

### Install Chezmoi and Apply Dotfiles
> ⚠️ **CRITICAL FOR SECURE NODES:** If you are setting up a machine that requires decrypting repository secrets via YubiKey, **DO NOT run the one-liners below**. They will fail immediately on template compilation. Instead, follow the step-by-step pipeline in [bootstrap.md](./bootstrap.md).

#### Option A: Public Repo

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply https://github.com/carl-parrish/dotFiles
```

#### Option B: Tailnet Repo

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply https://git.deeplydigital.net/cparrish/dotFiles
```

### Finalize Setup

Reload the shell so paths and configs are active:

```bash
exec fish
```

### Authenticate Tools

```bash
atuin login
infisical login
```

## Workflow

These Fish abbreviations and commands are included to make dotfile maintenance fast and consistent:

- `ce [file]` — edit a config file and apply changes immediately
- `ca` — apply pending changes from source to home directory
- `cdiff` — preview changes before applying them
- `cu` — update from the remote repository
- `ccd` — jump into the chezmoi source directory
- `cgst` / `cgcmsg` / `cgp` — status, commit, and push for this repo
- `mcheck` — inspect installed and missing `mise` tools
- `mdoctor` — inspect overall `mise` health

## Why This Exists

This repo exists because context switching is expensive.

A machine becomes more useful when it can quickly provide:

- the same shell behavior
- the same editor behavior
- the same tooling
- the same authentication patterns
- the same operational shortcuts

That consistency reduces friction, mistakes, and setup time.

## Notes

- This repository is opinionated.
- It is optimized for my workflow first.
- It is expected to evolve as the surrounding infrastructure evolves.
- Practicality wins over purity.

## Related Repositories

- [dotFiles](https://github.com/carl-parrish/dotFiles) — portable operator environment
- [homelab](https://github.com/carl-parrish/homelab) — infrastructure and self-hosted platform patterns

## Provisioning and Recovery

For normal machine setup, use the provisioning steps in this README.

For first-device setup, trust initialization, recovery procedures, and repository metadata, see `bootstrap.md`.

> I do not need every machine to already be mine. I need every machine to become mine quickly.
