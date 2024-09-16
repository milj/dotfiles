activate_python_venv() {
  local DIR="$(pwd)";
  while true; do
    local VENV_DIR="$DIR""/.venv"
    local VENV_ACTIVATE_FILE="$VENV_DIR""/bin/activate"
    if [ -d "$VENV_DIR" ] && [ -f "$VENV_ACTIVATE_FILE" ]; then
      source "$VENV_ACTIVATE_FILE"
      break;
    elif [ "$DIR" = "/" ]; then
      if typeset -f "deactivate" > /dev/null; then
        deactivate
      fi
      break;
    else
      DIR="$(dirname "$DIR")";
    fi
  done
}

cd() {
  builtin cd "$@" && activate_python_venv
}

function cd {
  builtin cd "$@" && activate_python_venv
}

