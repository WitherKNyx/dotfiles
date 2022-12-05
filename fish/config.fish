if type -q exa
	alias ll "exa -l --icons"
	alias lla "ll -a"
end

alias clang++ "clang++ -gdwarf-4"
alias cl "clear; neofetch"
alias gitget "git log --author witherkedward@gmail.com | grep ^commit"
alias gitgetHASS "gitget | sed s/\"commit \"/\"https:\/\/github.com\/anderm18\/HASSPathways\/commit\/\"/"
alias gitmake "gh repo create --public --source=. --remote=upstream --push"
alias coreson "ulimit -c unlimited"
alias coresoff "ulimit -c 0"

# Powerline
function fish_prompt
	powerline-shell --shell bare $status
end

if status is-interactive
	# Commands to run in interactive sessions can go here
end

export DEBUGINFOD_URLS="htps://debuginfod.archlinux.org"
export VISUAL=nvim
export EDITOR=nvim

neofetch
