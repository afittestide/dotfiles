### Environment variables ###
export EDITOR='nvim'
export VISUAL=$EDITOR
export KEYTIMEOUT=1
export HISTSIZE=5000
export SAVEHIST=5000
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME/go/bin:/usr/games:/snap/bin:$PATH"

# pyenv - Python version manager
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# rbenv - Ruby version manager
export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv >/dev/null && eval "$(rbenv init - zsh)"
# antidote - zsh plugin manager (antibody successor)
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load ~/.zsh_plugins
# direnv - loading a local .envrc on cd
eval "$(direnv hook zsh)"
# fzf - fuzzy finder keybindings and completion
if [[ $(fzf --version | cut -d. -f1-2 | tr -d '.') -ge 48 ]]; then
    eval "$(fzf --zsh)"
else
    # Older fzf versions use sourced scripts
    [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
    [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
fi
# *** A Fittest IDE ***
bindkey -v
bindkey -M vicmd '?' history-incremental-search-backward
# History
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_save_no_dups

unsetopt PROMPT_CR
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search
alias vi=nvim
alias hi="history -5000 | grep $1"
alias ad="antidote"
alias ll="lsd -l -I '**/__pycache__'"
alias zshc='nvim "$HOME/.zshrc"'
alias vic='nvim "$HOME/.config/nvim/init.vim"'
alias tmuxc='nvim "$HOME/.tmux.conf"'
alias lg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gts="git status"
alias gtc="git checkout"
alias asm="asimi-cli -p"
# alias cld="claude --dangerously-skip-permissions"
eval "$(starship init zsh)"
# Set the color palette
function set_color {
  eval "$1=$2"
}

set_color fuchsia "#F952F9"
set_color turquoise "#00FAFA"
set_color purple "#271D30"
set_color yellow "#F4DB53"

# Set the prompt colors
set_color prompt_symbol_color $fuchsia
set_color hostname_color $turquoise
set_color dir_color $purple
set_color username_color $yellow
# Welcome message - fortune piped into a random cow
if [ $(uname -s) = "Darwin" ]; then
    fortune | cowsay -f $(find "$(brew --prefix)/share/cows" -name "*.cow" 2>/dev/null | sort -R | head -1) -n
else
    fortune | cowsay -f $(find "/usr/share/cowsay/cows/" -name "*.cow" | shuf | head -1) -n
fi
