setopt prompt_subst

# Human-friendly workspace label (display only)
WORKSPACE_LABEL="exercise-files"

workspace_root() {
  git rev-parse --show-toplevel 2>/dev/null
}

PROMPT='$( \
  ws=$(workspace_root); \
  if [[ -n "$ws" && "$PWD" == "$ws" ]]; then \
    echo "~/${WORKSPACE_LABEL}/"; \
  elif [[ -n "$ws" ]]; then \
    echo "~/…/${PWD##*/}/"; \
  else \
    echo "${PWD/#$HOME/~}/"; \
  fi \
) $( [[ $EUID -eq 0 ]] && echo "#" || echo "$" ) '