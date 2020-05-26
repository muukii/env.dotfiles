# m version
local version="0.1.0"

m_help() {
  echo "
  Hi, I'm m.sh
  
  ${version}

  ch               git checkout with fzf
  w                git worktree with fzf
  swift            Launch Swift Development for Ubuntu on Docker
  urlencode        URL encode <input>
  urldecode        URL decode <input>
  set_tracking     Set current branch as tracking branch
  install_simapp   Install simulator application
  delete_branch    Delete branch intereactive with fzf
  create_worktree  Create worktree

  edit         Edit m
  "
}

m_git_branch_delete_with_fzf() {
  git branch -D $(git branch | fzf -m)
}

m_w() {
  branch=$(git worktree list | perl -pe 's/ +/ /g' | cut -d " " -f 3 | fzf)
  if [ -z "$branch" ]; then 
    return 1
  fi
  to_grep=$(echo $branch | perl -pe 's/\[/\\[/' | perl -pe 's/\]/\\]/')
  dir=$(git worktree list | grep $to_grep | perl -pe 's/ +/ /g' | cut -d " " -f 1)
  cd $dir
}

m_check_required_commands() {
  if [ -nz $(which fzf) ]; then
    echo "fzf not found."
  fi
}

m_ch() {
  git checkout `git branch -a | fzf | sed 's#remotes/origin/##'`
}

m_patch() {
  git ch -b "muukii/patch-$(date '+%s')" && git add . && git commit -m 'Patch' && gh pr create -B master -w
}

m_edit() {
  vim ${HOME}/.zsh/m.zsh
}

m_docker_swift_on_curren_directory() {
  docker run --rm -it --name swift -v $PWD:/local/dev --workdir "/local/dev" swiftdocker/swift:4.0.2 /bin/bash
}

m_url_decode() {
  echo $1 | nkf -w --url-input
}

m_url_encode() {
  echo $1 | nkf -WwMQ | tr = %
}

m_set_remote_upstream_current_branch() {
  git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref HEAD) $(git rev-parse --abbrev-ref HEAD)
}

m_create_worktree() {
  for i in `seq 1 $1`; do
    name=space$i
    git branch $name
    git worktree add ./worktree/$name $name
  done
}

m_install_simapp() {

  device_id=$1
  file_path=$2

  if [[ -z "$device_id" ]]; then
    echo 'Required device id in arg1'
    break
  fi

  if [[ -z "$file_path" ]]; then
    echo 'Required file path in arg2'
    break
  fi

  echo "Installing..."

  result=$(xcrun simctl list devices | grep ${device_id} | grep Booted | wc -l | awk '{print $1}')
  if [ $result = 0 ];then
    xcrun simctl boot ${device_id}
  fi

  xcrun simctl install ${device_id} ${file_path}

  plutil -p "${file_path}/Info.plist"

  open $(xcode-select -p)/Applications/Simulator.app

  echo ""

  echo "Installed app to device(${device_id})"
}

m() {
  local command="$1"
  case "${command}" in
    "" | "-h" | "--help" )
      m_help
      ;;
    "ch" )
      m_ch
      ;;
    "w" )
      m_w
      ;;
    "patch" )
      m_patch
      ;;
    "edit" )
      m_edit
      ;;
    "swift" )
      m_docker_swift_on_curren_directory
      ;;
    "urlencode" )
      m_url_encode $2
      ;;
    "urldecode" )
      m_url_decode $2
      ;;
    "set_tracking" )
      m_set_remote_upstream_current_branch
      ;;
    "install_simapp" )
      m_install_simapp $2 $3
      ;;
    "create_worktree" )
      m_create_worktree $2
      ;;
    "delete_branch" )
      m_git_branch_delete_with_fzf
      ;;
    * )
      echo "Command not found '$@'"
    ;;
  esac
}
