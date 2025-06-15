echo "Setting up new MacOS Machine..."

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 22
# Verify the Node.js version:
node -v # Should print "v22.16.0".
nvm current # Should print "v22.16.0".
# Download and install pnpm:
corepack enable pnpm
# Verify pnpm version:
pnpm -v

# neovim
brew install neovim

# lua
brew install lua

# Glow (Read markdown)
brew install glow

# git
brew install git
