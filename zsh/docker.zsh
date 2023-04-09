# docker

function setup_docker() {
  local machine=$1
  docker-machine start $machine >&2
  docker-machine env $machine
}

alias doc-up='eval $(setup_docker)'
alias doc-run='docker run --rm -it'
alias doc-exec='docker exec -it'
alias doc-comp='docker-compose'

alias docc='docker-compose'
alias docc-run='docker-compose run'
alias docc-exec='docker-compose exec'

