# gi
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function git_status() {
  local local_status=$(git status -s 2> /dev/null)
  if [[ -z $local_status ]]; then
    echo ""
  else
    echo " *"
  fi

}

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
