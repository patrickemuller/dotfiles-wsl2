rebase() {
  if [ $# -eq 0 ]
  then
    echo "You must tell which branch to rebase from (ex: master)"
  else
    git checkout "$1" && git pull origin "$1" && git checkout - && git rebase "$1"
  fi
}

delete_merged() {
  if [ $# -eq 0 ]
  then
    echo "You must tell which branch is the main branch (ex: master)"
  else
    git branch --merged "$1" | grep -v "^[ *]*$1$" | xargs git branch -d
  fi
}

cleanup_docker() {
  docker system prune
  docker rmi $(docker ps -aq) -f
  docker rmi $(docker images -q) -f
}
