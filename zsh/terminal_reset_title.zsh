# Mac terminal reset title

autoload -Uz add-zsh-hook

function _reset_title() {
  echo -ne "\033]0;\007"
}
add-zsh-hook precmd _reset_title

