# config edits
alias zedit="nv ~/.zshrc"
alias tedit="nv ~/.tmux.conf"
alias nedit="nv ~/.config/nvim"
alias zsrc="source $HOME/.zshrc"

# basic commands
alias c="clear"
alias x="exit"

# rails CLI
alias br="bin/rails"
alias bex="bundle exec"
alias cov="google-chrome coverage/index.html"
alias odev="overmind start -f Procfile.dev"
alias oweb="overmind connect web"

# Dotfile mgmt
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# NeoVim
alias nv="~/nvim.appimage"
alias fnv='nvim "$(fzf)"'

alias t="task"
