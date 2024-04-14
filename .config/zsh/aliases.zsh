# config edits
alias zsrc="source $HOME/.zshrc"

# basic commands
alias c="clear"
alias x="exit"

# rails CLI
alias br="bin/rails"
alias bex="bundle exec"
alias cov="firefox coverage/index.html"
alias odev="overmind start -f Procfile.dev"
alias oweb="overmind connect web"

# Dotfile mgmt
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# NeoVim
alias vim="~/nvim.appimage"
alias fvim='nvim "$(fzf)"'
