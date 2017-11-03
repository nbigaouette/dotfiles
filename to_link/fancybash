#!/bin/bash

# https://wiki.archlinux.org/index.php/Color_Bash_Prompt#List_of_colors_for_prompt_and_Bash
txtblk='[0;30m' # Black - Regular
txtred='[0;31m' # Red
txtgrn='[0;32m' # Green
txtylw='[0;33m' # Yellow
txtblu='[0;34m' # Blue
txtpur='[0;35m' # Purple
txtcyn='[0;36m' # Cyan
txtwht='[0;37m' # White
bldblk='[1;30m' # Black - Bold
bldred='[1;31m' # Red
bldgrn='[1;32m' # Green
bldylw='[1;33m' # Yellow
bldblu='[1;34m' # Blue
bldpur='[1;35m' # Purple
bldcyn='[1;36m' # Cyan
bldwht='[1;37m' # White
unkblk='[4;30m' # Black - Underline
undred='[4;31m' # Red
undgrn='[4;32m' # Green
undylw='[4;33m' # Yellow
undblu='[4;34m' # Blue
undpur='[4;35m' # Purple
undcyn='[4;36m' # Cyan
undwht='[4;37m' # White
bakblk='[40m'   # Black - Background
bakred='[41m'   # Red
bakgrn='[42m'   # Green
bakylw='[43m'   # Yellow
bakblu='[44m'   # Blue
bakpur='[45m'   # Purple
bakcyn='[46m'   # Cyan
bakwht='[47m'   # White
txtrst='[0m'    # Text Reset
# txtblk='\e[0;30m' # Black - Regular
# txtred='\e[0;31m' # Red
# txtgrn='\e[0;32m' # Green
# txtylw='\e[0;33m' # Yellow
# txtblu='\e[0;34m' # Blue
# txtpur='\e[0;35m' # Purple
# txtcyn='\e[0;36m' # Cyan
# txtwht='\e[0;37m' # White
# bldblk='\e[1;30m' # Black - Bold
# bldred='\e[1;31m' # Red
# bldgrn='\e[1;32m' # Green
# bldylw='\e[1;33m' # Yellow
# bldblu='\e[1;34m' # Blue
# bldpur='\e[1;35m' # Purple
# bldcyn='\e[1;36m' # Cyan
# bldwht='\e[1;37m' # White
# unkblk='\e[4;30m' # Black - Underline
# undred='\e[4;31m' # Red
# undgrn='\e[4;32m' # Green
# undylw='\e[4;33m' # Yellow
# undblu='\e[4;34m' # Blue
# undpur='\e[4;35m' # Purple
# undcyn='\e[4;36m' # Cyan
# undwht='\e[4;37m' # White
# bakblk='\e[40m'   # Black - Background
# bakred='\e[41m'   # Red
# bakgrn='\e[42m'   # Green
# bakylw='\e[43m'   # Yellow
# bakblu='\e[44m'   # Blue
# bakpur='\e[45m'   # Purple
# bakcyn='\e[46m'   # Cyan
# bakwht='\e[47m'   # White
# txtrst='\e[0m'    # Text Reset


if [ `id -u` -gt 0 ]; then
    # normal user
    Cuser="${bldblu}"   # Username
    Chost="${bldred}"   # Host
    Cpath="${bldblu}"   # Path
    Ctime="${bldblu}"   # Time
else
    # root
    Cuser="${bldred}"   # Username
    Chost="${bldblu}"   # Host
    Cpath="${bldred}"   # Path
    Ctime="${bldred}"   # Time
fi
Cdelim="${bldblu}"  # Delimiters
Cgit="${txtpur}"    # Git information


# Add git branch name but skip if on unicron's compute nodes
function gitinfo() {

    # Return if git is not present
    git --version &> /dev/null
    if [ $? != 0 ]; then
        echo ""
        return
    fi

    # If not inside a repo, just return empty
    git rev-parse --git-dir &> /dev/null
    if [ $? != 0 ]; then
        echo ""
        return
    fi

    # Extract repo information
    git_branch=`git symbolic-ref --short HEAD 2> /dev/null`
    git_tag=`git describe --tags --always 2> /dev/null`
    git_commit=`git rev-parse HEAD 2> /dev/null`

    # Build string to echo
    to_echo=""
    if [[ "${git_branch}" != "" ]]; then
        to_echo="${to_echo}${bldpur}${git_branch}${txtrst},"
    fi
    if [[ "${git_tag}" != "" ]]; then
        to_echo="${to_echo}${txtpur}${git_tag}${txtrst},"
    fi
    if [[ "${git_commit}" != "" ]]; then
        to_echo="${to_echo}${bldpur}${git_commit}${txtrst}"
    fi
    if [[ "${to_echo}" != "" ]]; then
        to_echo="${Cdelim}-(${txtrst}${to_echo}${Cdelim})${txtrst}"
    fi
    echo ${to_echo}
}


PS1='\[${Cdelim}\](\[${txtrst}\]${Cuser}\u${txtrst}${bldylw}@${txtrst}${Chost}\h${txtrst}\[${Cdelim}\])-(\[${txtrst}\]\[${Cpath}\]$(/bin/ls -1|wc -l|tr -d "[:blank:]") files\[${txtrst}\]\[${Cdelim}\])-(\[${txtrst}\]${Ctime}$(date +%H:%M)${txtrst}\[${Cdelim}\])$(gitinfo)\n\[${Cdelim}\](\[${txtrst}\]${Cpath}\w${txtrst}\[${Cdelim}\])\n\[${Cdelim}\] ->\[${txtrst}\] '

export PS1
