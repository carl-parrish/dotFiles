function install-antigravity --description "Install Google Antigravity CLI if not present"
    if not type -q agy; and not test -x "$HOME/.local/bin/agy"
        echo "🚀 Installing Antigravity CLI..."

        # AGY_NO_MODIFY_PATH / CI=1 bypasses shell profile edits
        set -lx AGY_NO_MODIFY_PATH 1
        set -lx CI 1


        switch (uname)
            case Darwin
                if type -q brew
                    brew install --cask antigravity-cli
                else
                    curl -fsSL https://antigravity.google/cli/install.sh | bash
                end
            case Linux
                curl -fsSL https://antigravity.google/cli/install.sh | bash
            case '*'
                echo "Unsupported OS for Antigravity install."
        end
    else
        echo " Antigravity CLI (agy) is already installed."
    end
end
