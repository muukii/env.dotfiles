function xcode() {
  xcworkspace=$(ls | grep --color=never .xcworkspace | head -1)
  xcodeproj=$(ls | grep --color=never .xcodeproj | head -1)
  xcode=${$(xcode-select -p)%/*/*}
  if [[ -n ${xcworkspace} ]]; then
    echo "Open ${xcworkspace}"
    open -a ${xcode} ${xcworkspace}
  elif [[ -n ${xcodeproj} ]]; then
    echo "Open ${xcodeproj}"
    open -a ${xcode} ${xcodeproj}
  else
    echo "Not found Xcode files"
  fi
}
