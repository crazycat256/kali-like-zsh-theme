#!/bin/zsh

#############################################################################
#                                                                           #
#                    KALI-LIKE THEME for Oh-My-Zsh                          #
#                                                                           #
#############################################################################
#                                                                           #
#  For better "kali-like" experience, use FiraCode font for your terminal   #
#  and install zsh-syntax-highlighting and zsh-autosuggestions packages     #
#                                                                           #
#############################################################################
#                                                                           #
# CREDITS :                                                                 #
# Some parts of this code was directly ripped from Kali Linux .zshrc        #
#                                                                           #
#############################################################################
# (C) 2023 Cyril LAMY under the MIT License                                 #
#############################################################################

PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

configure_prompt() {
    prompt_symbol=@
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[067]%}["
    ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"

    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]$(git_prompt_info)\n%b%F{%(#.blue.green)}└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
            ;;
        oneline)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{%(#.red.blue)}%n@%m%b%F{reset}:%B%F{%(#.blue.green)}%~%b$(git_prompt_info)%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
        backtrack)
            PROMPT=$'${debian_chroot:+($debian_chroot)}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))}%B%F{red}%n@%m%b%F{reset}:%B%F{blue}%~%b$(git_prompt_info)%F{reset}%(#.#.$) '
            RPROMPT=
            ;;
    esac
    unset prompt_symbol
}

configure_prompt
VIRTUAL_ENV_DISABLE_PROMPT=1

if [ "$USE_SYNTAX_HIGHLIGHTING" = yes ]; then

    syntax_highlighting=no

    # enable syntax-highlighting if avalaible

    if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
        syntax_highlighting=yes
    fi

    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        syntax_highlighting=yes
    fi

    if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        syntax_highlighting=yes

    fi

    if [ "$syntax_highlighting" = no ]; then
        if [ "$AUTO_DOWNLOAD_SYNTAX_HIGHLIGHTING_PLUGIN" = yes ]; then
            if whence -cp git &> /dev/null; then
                mkdir ~/.zsh >/dev/null 2>&1
                git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting >/dev/null 2>&1
                if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
                    . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
                    syntax_highlighting=yes
                else
                    echo "git not found, plugin zsh_syntax_highlighting not installed"
                fi
            fi
        fi
    fi    


    if [ "$syntax_highlighting" = yes ]; then
    CL_CYAN="073"
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=$CL_CYAN,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=$CL_CYAN,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=$CL_CYAN,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=$CL_CYAN,underline
        ZSH_HIGHLIGHT_STYLES[path]=fg=white,bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=$CL_CYAN
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=$CL_CYAN
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=$CL_CYAN,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi

    unset syntax_highlighting

fi

toggle_oneline_prompt(){
    if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
        PROMPT_ALTERNATIVE=twoline
    else
        PROMPT_ALTERNATIVE=oneline
    fi
    configure_prompt
    zle reset-prompt
}
zle -N toggle_oneline_prompt
bindkey ^P toggle_oneline_prompt



# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

if [ "$USE_ZSH_AUTOSUGGESTIONS" = yes ]; then

    zsh_autosuggestions=no

    # enable auto-suggestions based on completion and  history
    if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
        # change suggestion color
        ZSH_AUTOSUGGEST_STRATEGY=(completion history)
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
        zsh_autosuggestions=yes
    fi

    if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        # change suggestion color
        ZSH_AUTOSUGGEST_STRATEGY=(completion history)
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
        zsh_autosuggestions=yes
    fi

    if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
        # change suggestion color
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
        ZSH_AUTOSUGGEST_STRATEGY=(completion history)
        zsh_autosuggestions=yes
    fi

    if [ "$zsh_autosuggestions" = no ]; then
        if [ "$AUTO_DOWNLOAD_ZSH_AUTOSUGGESTIONS_PLUGIN" = yes ]; then
            if whence -cp git &> /dev/null; then
                mkdir ~/.zsh >/dev/null 2>&1
                git clone --quiet https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions >/dev/null 2>&1
                if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
                    . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 
                    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
                    ZSH_AUTOSUGGEST_STRATEGY=(completion)
                    zsh_autosuggestions=yes
                fi
            else
                echo "git not found, plugin zsh_autosuggestions not installed"
            fi
        fi
    fi    
fi
