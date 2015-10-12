export LC_ALL=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=UTF-8


set_prompt() {
    Yellow='\[\e[0;33m\]'
    IYellow='\[\e[0;93m\]'
    Purple='\[\e[0;35m\]'
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Cyan='\[\e[0;36m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Lambda='\316\273' 
    PS1='\n'
    # If root, print name in red
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\u$Purple@\h "
    else
        PS1+="$Blue\u$Purple@\h "
    fi
    
    branch_color=$White
    touch ~/.bash_history
    git branch>>~/.bash_history 2>>~/.bash_history
    if  [[ $? -eq "0" ]]; then
        git status | grep "nothing to commit">>~/.bash_history 2>>~/.bash_history
        grep_status=$?

        if [[ $grep_status -eq "0" ]]; then
            branch_color=$Green
        else
            branch_color=$Red
	fi
    fi

    branch="$branch_color"$(__git_ps1 " {%s}")

    PS1+="$Yellow\\w$Green\n\t$branch\n$Yellow$Lambda $Reset"
}

PROMPT_COMMAND='set_prompt'
eval $( dircolors -b $HOME/.dir_colors )

alias dir='dir --color'
alias ls='ls --color'
alias exit='printf "bye\n";touch ~/.bash_history;exit >> ~/.bash_history 2>>~/.bash_history'
