export DYLD_FORCE_FLAT_NAMESPACE=1 
# Set up prompt

# Let's get fancy and make a different special prompt for git directories  
RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
DKYELLOW="\[\033[38;5;3m\]"
WHITE="\[\033[37;1m\]"
LTGREEN="\[\033[38;5;10m\]"
CYAN="\[\033[38;5;4m\]"
BOLD="\[$(tput bold)\]"
SMILEY="${NORMAL}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"
GITMODIFIEDCOUNT=$(git status 2>&1 | grep modified | wc -l)
GITPROMPT="${WHITE}| GIT | "
SHOWGIT="if [[ -z \$(git branch 2>&1 | grep fatal) ]]; then echo \"${GITPROMPT}\"; else echo -n ''; fi"

export PS1="\`${SELECT}\` ${BOLD}${CYAN}\w \`${SHOWGIT}\`${NORMAL}${BOLD}>${NORMAL} "

# Show colors on ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
