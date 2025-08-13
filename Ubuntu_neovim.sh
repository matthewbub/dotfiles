#!/usr/bin/env bash
set -euo pipefail

# Ubuntu_neovim.sh
# Installs system dependencies required by this Neovim setup on Ubuntu.
# - Neovim (via official PPA)
# - Build tools for native plugins (e.g. telescope-fzf-native) and Treesitter
# - ripgrep for Telescope search
# - Node.js for node-based LSP servers (tsserver, pyright, tailwindcss, etc.)
# - Python provider (pynvim) for remote plugins
# - Go toolchain (used by gofumpt/goimports/golangci-lint/delve)
# - Clipboard tools for X11/Wayland

export DEBIAN_FRONTEND=noninteractive

if ! command -v sudo >/dev/null 2>&1; then
  echo "This script requires sudo privileges. Please install sudo or run as root." >&2
  exit 1
fi

echo "[1/7] Updating apt and installing base prerequisites..."
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends \
  software-properties-common \
  ca-certificates gnupg lsb-release \
  curl wget git unzip \
  build-essential make cmake pkg-config \
  gcc g++ \
  ripgrep fd-find \
  python3 python3-pip python3-venv \
  xclip wl-clipboard

echo "[2/7] Installing Neovim from official PPA..."
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y neovim

echo "[3/7] Installing Node.js (20.x) for Node-based language servers..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "[4/7] Installing Go toolchain (for Go formatters/linters/debugger)..."
sudo apt-get install -y golang-go

echo "[5/7] Installing Python provider for Neovim..."
python3 -m pip install --user --upgrade pip
python3 -m pip install --user --upgrade pynvim

# Ensure ~/.local/bin is available (where pip --user installs executables)
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi
if [ -f "$HOME/.zshrc" ] && ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.zshrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
fi

echo "[6/7] Headless bootstrap: install plugins, Mason tools, and Treesitter parsers..."
if command -v nvim >/dev/null 2>&1; then
  # Sync plugins first so dependent commands exist
  nvim --headless \
    "+Lazy! sync" \
    "+qall"

  # Install tools declared by mason-tool-installer (LSPs, formatters, linters, debuggers)
  nvim --headless \
    "+MasonToolsInstall" \
    "+qall" || true

  # Ensure Treesitter parsers are installed/updated
  nvim --headless \
    "+TSUpdateSync" \
    "+qall" || true
else
  echo "Neovim not found on PATH after install; skipping headless bootstrap." >&2
fi

echo "[7/7] Done!"
echo "- Neovim version: $(nvim --version | head -n1 2>/dev/null || echo 'nvim not found')"
echo "- You can now launch Neovim and run :checkhealth if desired."


