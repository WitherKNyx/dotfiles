# Aliases
# # Eza
if type -q eza
	alias ll "eza -l -F --icons"
	alias lla "ll -a"
	alias lt "ll --tree"
	alias lta "lt -a"
end
# # SSH
alias bella "ssh gonzae7@bella.cs.rpi.edu"
# # Coding
alias cgal-build "mkdir -p build; cd build; cmake ..; make; cd .."
alias clang++ "clang++ -gdwarf-4"
alias coreson "ulimit -c unlimited"
alias coresoff "ulimit -c 0"
alias gradletest "gradle test --tests"
alias g+++ "g++ -g -Wall -Wextra -pedantic -std=c++23 -lGL -lGLU -lm -lX11 -lpthread -lXrandr -lXi -ldl -lXinerama -lXcursor -lglfw"
# # Git
alias gitget "git log --author witherkedward@gmail.com | grep ^commit"
alias gitmake "gh repo create --public --source=. --remote=upstream --push"
alias gittop "pushd \"\$(git rev-parse --show-toplevel)\""
# # Other
alias cl "clear; neofetch"
alias reset-pacman "sudo rm -rf /etc/pacman.d/gnupg /var/lib/pacman/sync; sudo pacman-key --init; sudo pacman-key --populate"
alias simple-scan "cd ~/Documents/simple-scan/; XDG_DATA_DIRS=_install/share:$XDG_DATA_DIRS ./_install/bin/simple-scan & cd"
alias targz-extract "tar -xf"
#alias targz-compress

# Powerline
function fish_prompt
	powerline-shell --shell bare $status
end

if status is-interactive
	# Commands to run in interactive sessions can go here
end

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export EDITOR=nvim
export VISUAL=nvim
export WINEPREFIX=/home/nyx/.wine

# Path
fish_add_path ~/.config/emacs/bin
