# Aliases
## Eza
if type -q eza
	alias ll "eza -l -F --icons"
	alias lla "ll -a"
	alias lt "ll --tree"
	alias lta "lt -a"
end
## SSH
alias bella "ssh gonzae7@bella.cs.rpi.edu"
## Coding
alias cgal-init "mkdir -p build; cd build; cmake ..; cd .."
alias cmake-init "mkdir -p build; cd build; cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1; cd .."
alias clang++ "clang++ -gdwarf-4"
alias coreson "ulimit -c unlimited"
alias coresoff "ulimit -c 0"
alias gradletest "gradle test --tests"
alias g+++ "g++ -g -Wall -Wextra -pedantic -std=c++23 -lGL -lGLU -lm -lX11 -lpthread -lXrandr -lXi -ldl -lXinerama -lXcursor -lglfw"
alias salsac "java -cp ~/Documents/salsa1.1.6.jar:. salsac.SalsaCompiler; javac -classpath ~/Documents/salsa1.1.6.jar:."
alias salsa "java -cp ~/Documents/salsa1.1.6.jar:."
## Git
alias gitget "git log --author witherkedward@gmail.com | grep ^commit"
alias gitmake "gh repo create --public --source=. --remote=upstream --push"
alias gittop "pushd \"\$(git rev-parse --show-toplevel)\""
## Other
alias cl "clear; hyfetch -b fastfetch --distro=arch"
alias reset-pacman "sudo rm -rf /etc/pacman.d/gnupg /var/lib/pacman/sync; sudo pacman-key --init; sudo pacman-key --populate"
alias targz-extract "tar -xf"
alias game-on "xinput set-prop 12 330 0"
alias game-off "xinput set-prop 12 330 1"
alias wttr "curl 'wttr.in/?m2nQF'"
#alias targz-compress

# Greeting
function fish_greeting
	hyfetch -b fastfetch --distro=arch
	echo Welcome to (set_color 0FD)$hostname(set_color normal), (set_color -o 9133FF)$USER(set_color normal)
	# curl 'wttr.in/?m0Q' &
end

if status is-interactive
	# Commands to run in interactive sessions can go here
end

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export EDITOR=nvim
export VISUAL=nvim
export WINEPREFIX=/home/nyx/.wine
export GOPATH=/home/nyx/go

zoxide init --cmd cd fish | source
# Path
fish_add_path ~/.config/emacs/bin
fish_add_path ~/.local/share/gem/ruby/3.0.0/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin

# Prompt
function fish_prompt
	echo
	eval $GOPATH/bin/powerline-go -modules newline,battery,time,user,host,newline,cwd,venv,ssh,perms,git,hg,jobs,root,exit -error $status -jobs (count (jobs -p))
end

# oh-my-posh init fish | source
# starship init fish | source
