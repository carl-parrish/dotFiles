# Bootstrap Runbook

This runbook separates new-machine setup into three distinct phases:

1. **System Provisioning** — make the machine capable of running the toolchain
2. **Identity & Trust Initialization** — establish the local cryptographic identity
3. **Chezmoi Bootstrap** — let the managed configuration take over

Using these phases avoids overloading the term "bootstrap" and makes the trust chain easier to understand and maintain.

## Repository Metadata

Use these values and discovery commands when maintaining or recovering this repo's bootstrap path.

- **Source Repo:** `https://github.com/carl-parrish/dotFiles`
- **Chezmoi Source State:** `~/.local/share/chezmoi/`
- **Chezmoi Config Path:** `~/.config/chezmoi/chezmoi.toml`
- **YubiKey Identity Path:** `~/.config/chezmoi/yubikey-identity.txt`
- **Bootstrap Secret Artifact:** `bootstrap_secrets.json.age`

### Discovery Commands

Use these commands to recover or update bootstrap metadata:

```fish
# Show YubiKey-backed age recipients for the inserted key
age-plugin-yubikey --list
```

```fish
# Generate the local YubiKey identity stub
age-plugin-yubikey --generate --slot 1 > ~/.config/chezmoi/yubikey-identity.txt
```

> If the YubiKey is rotated or replaced, update the bootstrap recipient value in this document and anywhere else it is hardcoded.

## Phase 0 — System Provisioning

This phase makes the machine capable of running the rest of the workflow.

At minimum, ensure these tools are available in `PATH`:

- `git`
- `chezmoi`
- `age`
- `age-plugin-yubikey`

Optional but commonly needed in this environment:

- `fish`
- `mise`
- `curl`
- `tailscale`

If you maintain distro-specific install steps elsewhere, keep those there and treat this section as the minimum dependency boundary.

### Verification

```fish
command -v git
command -v chezmoi
command -v age
command -v age-plugin-yubikey
```

If any of these commands fail, stop here and install the missing dependency before continuing.

## Phase 1 — Identity & Trust Initialization

This phase establishes the local identity needed to decrypt managed secrets.

### 1. Insert the correct YubiKey

Make sure the intended hardware key is present before generating or listing identities.

### 2. Discover the current recipient

```fish
age-plugin-yubikey --list
```

Record the correct `age1yubikey...` recipient if you are rotating keys, rebuilding this workflow, or updating this document.

### 3. Generate the local identity stub

```fish
age-plugin-yubikey --generate --slot 1 > ~/.config/chezmoi/yubikey-identity.txt
```

This creates the local identity reference file that Chezmoi will use when decrypting age-encrypted material.

## Phase 2 — Chezmoi Bootstrap

This phase is the actual Chezmoi bootstrap path.

Because `.chezmoi.toml.tmpl` depends on encrypted bootstrap material, a fresh machine cannot render the full managed configuration until Chezmoi knows how to decrypt `bootstrap_secrets.json.age`.

The solution is:

1. pull the raw repo locally without trying to fully render it
2. manually seed a minimal Chezmoi config
3. let `chezmoi apply` take over

### 1. Initialize the raw repository

```fish
chezmoi init --no-tty https://github.com/carl-parrish/dotFiles
```

At this point, the raw repository contents are now local under:

```text
~/.local/share/chezmoi/
```

That includes the uncompiled `.chezmoi.toml.tmpl` and encrypted bootstrap artifacts.

### 2. Create the temporary Chezmoi bootstrap stub

```fish
cat > ~/.config/chezmoi/chezmoi.toml <<'EOF'
encryption = "age"

[age]
    identity = "~/.config/chezmoi/yubikey-identity.txt"
    recipient = "age1yubikey1q2mm9uxwlf03r37500kz3rtak6g5d8wuuqnkquspslqg6n20x7zsukw42wa"
EOF
```

> `encryption = "age"` must be a top-level key. Do not place it under a separate `[encryption]` table.

This file is a temporary bootstrap stub. Its only purpose is to give Chezmoi enough information to decrypt the bootstrap secrets and render the true managed configuration.

### 3. Apply the managed configuration

```fish
chezmoi apply
```

### What happens during apply

1. Chezmoi reads the temporary bootstrap stub
2. It uses the YubiKey-backed identity to decrypt `bootstrap_secrets.json.age`
3. It successfully renders `.chezmoi.toml.tmpl`
4. The temporary bootstrap state is replaced by the full managed configuration

## Expected Result

A successful run should leave the system in this state:

- encrypted files decrypt correctly
- templates render without failure
- the managed Chezmoi configuration replaces the temporary stub
- the rest of the environment can now be applied normally

## Troubleshooting

### `age-plugin-yubikey` not found

Make sure the binary is installed and available in `PATH`.

```fish
command -v age-plugin-yubikey
```

### Wrong or missing YubiKey

If decryption fails, verify that the correct hardware key is inserted and visible:

```fish
age-plugin-yubikey --list
```

### Identity path is wrong

Confirm the identity file exists:

```fish
ls -l ~/.config/chezmoi/yubikey-identity.txt
```

### Recipient mismatch

If the bootstrap stub contains the wrong `recipient`, Chezmoi will not be able to decrypt bootstrap secrets. Re-discover the recipient with:

```fish
age-plugin-yubikey --list
```

## Notes

- This document is intentionally focused on trust establishment and config activation.
- Distro-specific package installation is better maintained in `README.md` or a separate provisioning document.
- The temporary bootstrap stub is not the final state. It exists only to break the encryption chicken-and-egg problem.
