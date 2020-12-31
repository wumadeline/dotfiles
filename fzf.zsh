# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/madelinewu/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/madelinewu/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/madelinewu/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/madelinewu/.fzf/shell/key-bindings.zsh"
