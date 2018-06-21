#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make colorcoding available for everyone

Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


# new alert text
ALERT=${BWhite}${On_Red} # Bold White on red background

# mostly used alias functions

alias home="cd ~"
alias df="df -ahiT --total"
alias mkdir="mkdir -pv"
alias userlist="cut -d: -f1 /etc/passwd"
alias fhere="find . -name "
alias free="free -mt"
alias du="du -ach | sort -h"
alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget="wget -c"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias grep='grep --color=auto'

#sudo
alias s="sudo"

### cli editors ###
#vim is default, uncomment whichever one you want to use
#vim
alias v="vim"
alias sv="sudo vim"
export VISUAL="vim"

##nano
#alias n="nano
#alias sn="sudo nano"
#expot visual="nano"

##neovim
#alias nv="neovim"
#alias snv="sudo neovim"
#export visual="neovim"

### package managers ###

# Arch/pacman distros
alias pacman="sudo pacman"
alias pS="sudo pacman -S"
alias pSi="sudo pacman -Si"
alias pSy="sudo pacman -Sy"
alias pR="sudo pacman -R"
alias up="sudo pacman -Syu --noconfirm"
alias y="yaourt"

## Void
#alias xi="sudo xbps-install -y"
#alias xs="sudo xbps-install -Sy"
#alias xr="sudo xbps-remove -y"
#alias up="sudo xbps-install -Syuv"
#alias xc="sudo xbps-reconfigure"

## HomOseX(homebrew)
#alias bi="brew install"
#alias br="brew remove"
#alias bci="brew cask install"
#alias bcr="brew cask remove"

### Power ###
alias off="sudo shutdown -fh now"
alias re="sudo reboot"

### Cli  utliliities ###
alias r="ranger"
alias c="cmus"
alias m="mpv"
alias tr="transmission-cli"
alias out="sudo rm -rf"
alias ls="ls -CF --color=auto"
alias ll="ls -lisa --color=auto"
alias lsl="ls -lhFA | less"
alias nm="sudo NetworkManager"
alias knm="sudo killall NetworkManager"
alias wm="sudo wifi-menu"
#x*
alias x0="xrandr -o 0"
alias xL="xrandr -o left"
alias xR="xrandr -o right"
alias sex="startx"

### bash commands ###
alias e="exec"
alias q="exit"
alias cc="clear"

### directory shortcuts ###
alias ..="cd .."
alias cd..="cd .."
alias D="cd ~/Downloads"
alias lD="ls -a ~/Downloads"
alias rD="ranger ~/Downloads"
alias P="cd ~/Pictures"
alias lP="ls -a ~/Pictures"
alias rP="ranger ~/Pictures"
alias C="cd ~/.config"
alias lC="ls -a ~/.config"
alias rC="ranger ~/.config"
alias d="cd ~/Documents"
alias ld="ls -a ~/Documents"
alias rd="ranger ~/Documents"
alias M="cd ~/Music"
alias lM="ls ~/Music"
alias rM="ranger ~/Music"

### Ricefaggotry ###
alias vi3="vim ~/.config/i3/config"
alias vb="vim ~/.bashrc"
alias vX="vim ~/.Xdefaults"
alias nf="neofetch"
alias nfs="neofetch --scrot"
alias vP="vim ~/.config/polybar/config"


# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}
# create an directory and directly cd into it
mcd () {
  mkdir -p $1
  cd $1
}

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
