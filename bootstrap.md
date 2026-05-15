## Repository Metadata

If you need to update this bootstrap document for a new hardware key or a repository fork, use these discovery commands:

- **Identity Discovery:** `age-plugin-yubikey --list` (to find the `age1yubikey...` recipient string)
- **Source Repo:** `https://github.com/carl-parrish/dotFiles`
- **Identity Path:** `~/.config/chezmoi/yubikey-identity.txt`

### Bare-System Encryption Bootstrap (The "Chicken-and-Egg" Path)

Because `.chezmoi.toml.tmpl` depends on encrypted bootstrap material, a fresh machine will initially fail to initialize the full repository because it cannot yet decrypt the secrets required to render its own configuration.

Use this procedure to "prime" the encryption engine manually so the repository can take over.

#### 1. Ensure Prerequisites are Active
Make sure `age` and `age-plugin-yubikey` are available in your path. If using `mise`, ensure they are installed and the shell is reloaded.

#### 2. Generate the YubiKey Identity Stub
Insert the YubiKey and generate the local identity reference file:

```fish
age-plugin-yubikey --generate --slot 1 > ~/.config/chezmoi/yubikey-identity.txt
```

#### 3. Clone the Raw Repository
Use the `--no-tty` flag to fetch the source repository. This pulls the raw, uncompiled templates and encrypted assets to your local disk without attempting to render them (which would trigger a decryption failure).

```fish
chezmoi init --no-tty https://github.com/carl-parrish/dotFiles
```

#### 4. Inject a Manual Bootstrap Configuration
Manually create a temporary `chezmoi.toml`. This explicitly registers the `age` backend and points it to your YubiKey identity so `chezmoi` can successfully decrypt files on the next step:

```fish
cat > ~/.config/chezmoi/chezmoi.toml <<'EOF'
encryption = "age"

[age]
    identity = "~/.config/chezmoi/yubikey-identity.txt"
    recipient = "age1yubikey1q2mm9uxwlf03r37500kz3rtak6g5d8wuuqnkquspslqg6n20x7zsukw42wa"
EOF
```

#### 5. Apply and Finalize
Now that the encryption engine is "primed" with your hardware key, trigger the application. 

```fish
chezmoi apply
```

**What happens here:**
1. `chezmoi` reads the bootstrap stub.
2. It uses the YubiKey to decrypt `bootstrap_secrets.json.age`.
3. It successfully compiles `.chezmoi.toml.tmpl`.
4. The temporary bootstrap stub is overwritten by your true, complete configuration.
