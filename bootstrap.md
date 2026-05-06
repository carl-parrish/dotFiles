Sovereign Bootstrap (New Device)
Install Prerequisites: Ensure chezmoi, age-plugin-yubikey, and infisical are in $PATH.

Provision Identity:
age-plugin-yubikey --generate --slot 1 > ~/.config/chezmoi/yubikey-identity.txt

Manual Seed: Create ~/.config/chezmoi/chezmoi.toml with:

Ini, TOML
encryption = "age"
[age]
    identity = "~/.config/chezmoi/yubikey-identity.txt"
    recipient = "age1yubikey1q2mm9uxwlf03r37500kz3rtak6g5d8wuuqnkquspslqg6n20x7zsukw42wa"
Initialize: chezmoi init https://github.com/carl-parrish/dotFiles

Clean Up: The init process will overwrite the seed with the full cluster config.
