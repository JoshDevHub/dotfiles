# PATH settings

# asdf
. $HOME/.asdf/asdf.sh

# fly
export FLYCTL_INSTALL="/home/josh/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# go
export PATH=$PATH:/usr/local/go/bin

# overmind
export PATH="/home/josh/go/bin:$PATH"

# pnpm
export PNPM_HOME="/home/josh/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# export PATH
export PATH="$HOME/.local/bin:$PATH"
