# set colors
COLOR='blue'
CONTRASTCOLOR='white'
GITCOLOR='red'

# set some easier to read variable names
USERNAME='%n'
HOSTNAME='%m'
WORKDIR='%d'
USER_RIGHTS_INDICATOR='%#'

# format git infos
function set_git_prompt {
    REF=$(parse_git_ref)
    DIRTINESS=$(parse_git_dirtiness)
    GIT_PROMPT=$(format_git_prompt $REF $DIRTINESS)
}

function parse_git_ref {
    REF=$(git symbolic-ref --quiet HEAD || git rev-parse --quiet --short HEAD) 2> /dev/null
    # returns branch/tag, or commit id if on detached head
    echo ${REF/#'refs\/heads\/'}
}

function parse_git_dirtiness {
    DIRTY=$(command git status --porcelain 2> /dev/null | tail -n1)
    if [[ -n $DIRTY ]]; then
        echo "%F{yellow}\xE2\x9C\x97%f"
    else
        echo ""
    fi
}

function format_git_prompt {
    REF=$1
    DIRTINESS=$2
    if [[ -n $REF ]]; then
        echo "%B%F{$COLOR}(%F{$GITCOLOR}${REF}%F{$COLOR})%f%b ${DIRTINESS}"
    else
        echo ""
    fi
}

# set prompt
autoload -Uz promptinit && promptinit
setopt prompt_subst

precmd_functions+=(
    set_git_prompt
)

PROMPT_FIRST_LINE='%K{$COLOR}%F{$CONTRASTCOLOR}${USERNAME}@${HOSTNAME}%f%k %B%F{$COLOR}${WORKDIR}%f%b ${GIT_PROMPT}'
PROMPT_SECOND_LINE='%F{$COLOR} ${USER_RIGHTS_INDICATOR} %f'
PROMPT="${PROMPT_FIRST_LINE}${prompt_newline}${PROMPT_SECOND_LINE}"
