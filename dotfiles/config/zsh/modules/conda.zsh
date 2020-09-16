export ANACONDA_HOME="$HOME/miniconda3"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${ANACONDA_HOME}/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${ANACONDA_HOME}/etc/profile.d/conda.sh" ]; then
        . "${ANACONDA_HOME}/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:${ANACONDA_HOME}/bin"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Temporary Conda Env
function temp_env () {
	ROOT='skeleton'
	if [[ -z "$1" ]]; then
		ROOT="$1"
	fi

	case "$1" in
		('create')
			TARGET="TMP_$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)"
			conda create -n "$TARGET" --clone "$ROOT"
			conda activate "$TARGET";;
		('delete')
			LST=($(conda env list | awk '{print $1}'))
			for e in $LST; do
				if [[ $e =~ ^TMP_* ]]; then
					conda env remove -n "$e"
				fi
			done;;
		(*)
			echo "TEMP CONDA ENV : "
			echo "Options : create, delete";;
	esac
}

# Export current conda env without prefix
function conda_export(){
	conda env export | sed 's/^prefix.*//g'
}
