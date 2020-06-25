#!/usr/bin/env zsh
#===============================================================================
# icl - interactive command library
#===============================================================================
ICL_CMD="$HOME/.local/bin/icl.py"

alias icl="${ICL_CMD}"

bindkey -s '^h' "${ICL_CMD}^M"

#===============================================================================
# END  icl - interactive command library END
#===============================================================================