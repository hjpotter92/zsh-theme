ZSH_THEME_TERM_TITLE_IDLE="%~ - Terminal"

ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[yellow]%}%{◬%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[red]%}%{☢%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[cyan]%}%{♽%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[blue]%}%{⇂%G%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[green]%}%{↿%G%}%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} %{$reset_color%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"

rev_search () {
    local target="$1"
    local current_wd="${2:-$(pwd)}"
    local parent="$(dirname "${current_wd}")"
    while [ "${parent}" != "/" ]
    do
        if [ -e "${current_wd}/${target}" ]
        then
            return 0
        fi
        current_wd="${parent}"
        parent="$(dirname "${parent}")"
    done
    return 1
}

theme_rbenv_prompt () {
    if ! type rbenv > /dev/null
    then
        echo -n ""
    else
        local VERSION="$(rbenv_prompt_info)"
        [ "$VERSION" != "system" ] && echo "%{$fg_bold[red]%}%{$reset_color%}:${VERSION} " || echo -n ""
    fi
}

theme_node_prompt () {
    if rev_search "package.json" || rev_search "node_modules"
    then
        local NODE_VERSION="$(node -v)"
        local NPM_VERSION="$(npm -v)"
        echo "%{$fg[green]%}%{$reset_color%}:${NODE_VERSION} %{$fg_bold[red]%}%{$reset_color%}:${NPM_VERSION} "
    fi
}

theme_python_prompt () {
    if [ -v VIRTUAL_ENV ]
    then
        local VERSION="$(python -V 2>&1)"
        echo -n "%{$fg[yellow]%}%{$reset_color%}:${VERSION}(%{$fg[magenta]%}$(basename ${VIRTUAL_ENV})%{$reset_color%})"
    fi
}

theme_dev_prompt () {
    echo -n "$(theme_rbenv_prompt)$(theme_node_prompt)$(theme_python_prompt)"
}

local ret_status="%(?.%{$fg_bold[green]%}✅.%{$fg_bold[red]%}✘ )%{$reset_color%}"
local time_display="%{$fg_bold[yellow]%}$(emoji-clock)%D{%I:%M %P}%{$reset_color%}"
local name="%{$fg_bold[blue]%}%n%{$reset_color%}"

PROMPT=$'\u250c\u2524${ret_status}\u251c\u2500\u2524 ${name} \u251c\u2500\u2524%U%F{magenta}%1~%f%u\u251c\u2500\u2524 %{$time_display%} \u2502\t$(theme_dev_prompt)\n\u2514\u2534\u2500 $(battery_level_gauge) \u2534\u2500%{$fg_bold[cyan]%} ➜%{$reset_color%} '


## EMACS mode ###########################################

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
