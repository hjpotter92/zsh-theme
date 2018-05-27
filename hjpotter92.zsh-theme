
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_TERM_TITLE_IDLE="%~ - Terminal"

ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[red]%}%{☀%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[red]%}%{❌%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[blue]%}%{✫%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{⇂%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↿%G%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:%{$reset_color%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔ "


local ret_status="%(?.%{$fg_bold[green]%}✔.%{$fg_bold[red]%}✗)%{$reset_color%}"
local time_display="%{$fg_bold[yellow]%}$(emoji-clock) %D{%I:%M %P}%{$reset_color%}"
local name="%{$fg_bold[blue]%}%n%{$reset_color%}"
PROMPT=$'\u250c\u2524${ret_status} \u251c\u2500\u2524 ${name} \u251c\u2500\u2524%U%F{magenta}%1~%f%u\u251c\u2500\u2524 %{$time_display%} \u2502\t$(virtualenv_prompt_info)\n\u2514\u2534\u2500 $(battery_level_gauge) \u2534\u2500%{$fg_bold[cyan]%}➜%{$reset_color%} '


## EMACS mode ###########################################

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
