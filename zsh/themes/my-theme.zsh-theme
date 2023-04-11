# vim:ft=zsh
# https://github.com/blinks zsh theme custom

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX="%{%B%F{green}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%b%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function _git_repo_path() {
  local repo_path
  if repo_path="$(git rev-parse --show-toplevel 2>/dev/null)" && [[ -n "$repo_path" ]]; then
    echo ${repo_path/$HOME/'~'}
  fi
}

function _git_relative_path() {
  local rel_path
  if rel_path="$(git rev-parse --show-prefix 2>/dev/null)"; then
    if [[ -n "${rel_path}" ]]; then
      echo ${rel_path}
    else
      echo "."
    fi
  fi
}

function elipsis() {
  local len=$1
  local elipchar=$2
  local text=$3
  echo "%$len<$elipchar<$text%<<"
}

function escape() {
  local text
  text=$1
  echo "%{$text%}"
}

function create_prompt() {
  local bg_color="%K{${bkg}}"
  local unbg='%k'
  local fg_red='%F{red}'
  local fg_yellow='%F{yellow}'
  local unfg='%{%f%}'
  local bold='%B'
  local unbold='%b'
  local reset='%{%f%k%b%}'
  local eol='%E'

  local repo_path
  local rel_path
  local line

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    repo_path=$(elipsis 32 '..' $(_git_repo_path) )
    rel_path=$(elipsis 32 '..' $(_git_relative_path) )
    line="[$(escape "${fg_yellow}" )${repo_path}${unfg}@$(git_prompt_info)][$(escape "${fg_yellow}" )${rel_path}${unfg}]"
  else
    line="[$(escape "${fg_yellow}" )$(elipsis 32 '..' '%~')$unfg]"
  fi

echo "$reset
$(escape "${bg_color}${fg_red}" )>>$unfg ${line}%E${reset}
$(escape "${fg_red}" )>>$unfg %# ${reset}"
}

# zsh vi keymap mode
function zsh_vim_keymap_mode {
  if $(bindkey -lL main | grep vi >/dev/null 2>&1); then
    case $KEYMAP in
    vicmd)
      RPROMPT="%K{208}%F{black}%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}%k%f"
      ;;
    main|viins)
      RPROMPT="%K{075}%F{black}%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}%k%f"
      ;;
    esac
  else
    RPROMPT=''
  fi
  RPROMPT2=$RPROMPT

  zle reset-prompt
}
zle -N zle-line-init zsh_vim_keymap_mode
zle -N zle-keymap-select zsh_vim_keymap_mode

PROMPT='$(create_prompt)'
RPROMPT=''

