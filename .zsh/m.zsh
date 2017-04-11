
m() {
  # m version
  local version="0.1.0"

  m_help() {
    echo "
    Hi! I'm m!
    
    ${version}
    ch  git checkout with fzf
    w   git worktree with fzf
    "
  }

  m_w() {
    cd `git worktree list | cut -d " " -f 1 | fzf`
  }

  m_check_required_commands() {
    if [ -nz $(which fzf) ]; then
      echo "fzf not found."
    fi
  }

  m_ch() {
    git checkout `git branch -a | fzf | sed 's#remotes/origin/##'`
  }

  run() {
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
      * )
        echo "Command not found '$@'"
      ;;
    esac
  }

  run $1
}
