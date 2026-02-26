### custom alias' and functions 
alias ls='ls -1'
alias lsa='ls -1 -a'
alias v='nvim'
alias vim='nvim'
alias c='clear'
alias gs='git status -sb'


# Search git history for commits where the number of occurrences of a string changed
# (added or removed). Uses:
# --all to include all branches/tags, --date=iso for stable timestamps,
# and a compact format: "<hash> <date> <author> <subject>".
# Example:
#   git_pickaxe "export const weddingPhotos" drizzle/schema.ts
git_pickaxe() {
  local needle="$1"
  shift
  git log --all --date=iso --pretty=format:"%H %ad %an %s" -S"$needle" -- "$@"
}

# gsc: show short git status, pause briefly for manual review, then open commit editor
gsc() {
  git status -sb
  sleep 5
  git commit
}


### external

# Neovim
export PATH="$HOME/.local/share/nvim/lazy-rocks/bin:$PATH"

# Load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
