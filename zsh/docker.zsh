# docker

function setup_docker() {
  local machine=$1
  docker-machine start $machine >&2
  docker-machine env $machine
}

alias doc-up='eval $(setup_docker)'
alias doc-run='docker run --rm -it'
alias doc-comp='docker-compose'

