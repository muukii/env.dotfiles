function ch() {
  git ch `git ba | fzf | sed 's|remotes/origin/||'`
}

# gi
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function git_status() {
  local local_status=$(git status -s 2> /dev/null)
  echo $local_status
}
