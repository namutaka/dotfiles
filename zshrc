#
# .zshrc
#

export XDG_CONFIG_HOME="$HOME/.config"

ZSH_CUSTOM=~/dotfiles/zsh
for file in $ZSH_CUSTOM/*.zsh; do
  source $file
done

eval "$(starship init zsh)"

