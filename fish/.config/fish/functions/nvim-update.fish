# File: ~/.config/fish/functions/nvim-update.fish

function nvim-update --description "Updates Neovim to the latest nightly AppImage"
    echo "Downloading latest Neovim nightly..."

   # Use xh to download, but with a common User-Agent header to avoid being blocked by GitHub.
    # The '--follow' flag is also added as a best practice to handle any redirects.
    xh download --follow "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage" User-Agent:'Mozilla/5.0' -o ~/.local/bin/nvim.tmp

    # Check if the download was successful
    if test $status -eq 0
        echo "Download complete. Replacing old version."
        # Make the new file executable
        chmod +x ~/.local/bin/nvim.tmp
        # Replace the old binary with the new one
        mv ~/.local/bin/nvim.tmp ~/.local/bin/nvim
        echo "Neovim has been updated to the latest nightly build."
        ~/.local/bin/nvim --version
    else
        echo "Error: Download failed. Your Neovim has not been changed."
        # Clean up the temporary file
        rm -f ~/.local/bin/nvim.tmp
    end
end
