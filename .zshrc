# Set up the prompt
OLDPATH=/home/shane/.cabal/bin:/home/shane/local/bin:/var/lib/gems/1.8/bin:/home/shane/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
#OLDPATH=/home/shane/.cabal/bin:/opt/cabal/1.22/bin:/home/shane/.cabal/bin:/home/shane/local/bin:/var/lib/gems/1.8/bin:/home/shane/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

PATH=/home/shane/.local/bin:/opt/ghc/8.0.1/bin:/home/shane/.cabal/bin/cabal:/home/shane/.cabal/bin:/home/shane/local/bin:/var/lib/gems/1.8/bin:/home/shane/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$PATH

NEWPATH=/opt/ghc/8.0.1/bin:/home/shane/.cabal/bin/cabal:/home/shane/.cabal/bin:/home/shane/local/bin:/var/lib/gems/1.8/bin:/home/shane/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

CDPATH=~/Dropbox:~/Dropbox/work:~/Dropbox/Applications
FIGNORE='.log:.aux:.nav:.toc'

export TODOTXT_DEFAULT_ACTION=ls
export TERM=xterm-256color

latexfind(){cat ~/bin/latexPreamble.tex <(textLatexSearch $*) ~/bin/latexPostamble.tex>~/searched.tex; pdflatex --output-directory ~ ~/searched.tex; evince -f ~/searched.pdf }

setopt HIST_IGNORE_SPACE



alias cythonize="python setup.py build_ext --inplace"
alias math="/home/shane/myapps/local/bin/math"
alias mathematica="/home/shane/myapps/local/bin/Mathematica&"
alias clm=/home/shane/Software/clean/bin/clm
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep \"percentage\|time to empty\""
alias sage="~/Software/sage/sage "
alias jfuguec='javac -classpath $HOME/javafiles/jfugue-4.0.3.jar'
alias jfuguer='java -cp $HOME/javafiles/jfugue-4.0.3.jar:$HOME'
alias hp='jfuguer MyMusicApp'
alias dic=sdcv

bindkey -v
bindkey '\eq' push-line-or-edit
bindkey '\eh' run-help

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
#source .sbc/.als
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


alias ls='ls --color=auto'
alias feh='feh -FZ'
#alias weather="weather kisp| grep '\-*[0-9\.][0-9\.]* C\|\-*[0-9\.][0-9\.]*%\|rain\|'"
wthr() {
	case $1 in 
		"") curl wttr.in/pune;;
		*) curl wttr.in/$1;;
	esac
}
alias video='mplayer -fs "$(yad --filename='/home/shane/Videos/' --file --maximized)"'

alias pdfgen='(enscript -p - -f "Helvetica@12" -B | ps2pdf - - | zathura -)'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias parallel='parallel --gnu'
    alias pdfgrep='pdfgrep -n'
    alias grep='grep --color=auto -i'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias sagi='sudo apt-get install'
	alias cp='cp -i'
	alias mv='mv -i'
	alias rm='rm -i'
	
setopt correctall

autoload -U colors && colors

PROMPT="%(?.%{$fg[red]%}.%{$fg[magenta]%})👍 %{$fg[cyan]%}"

precmd ()
{
code=$?
case $code in
	0) PROMPT="%(?.%{$fg[red]%}.%{$fg[magenta]%})👍 %{$fg[cyan]%}"; RPROMPT="%{$fg_bold[blue]%}%~ %{$reset_color%}%{$fg[cyan]%}";;
	*) RPROMPT="%{$fg_bold[blue]%}%~ %{$reset_color%}%{$fg[cyan]%}";PROMPT="%(?.%{$fg[red]%}.%{$fg[magenta]%})👎 %{$fg[cyan]%}";;
esac
}

eoc()
{
code=$?
case $code in
	0) echo "Command $* successful"| speak;;
	*) echo "Command $* failed. Code $code"| speak;;
esac
}

preexec ()
{
echo '\e[0;32m\c'
}


export EDITOR="vim"

echo "$fg[yellow]\c"
MAIL=/home/shane/mail/inbox && export MAIL


alias rindex='find /home/shane/ -iname \*fb2 -o -iname \*webm -o -iname \*ps -o -iname \*lit -o -iname \*m4v -o -iname \*cbz -o -iname \*cbr -o -iname \*mp3 -o -iname \*mkv -o -iname \*mp4 -o -iname \*flv -o -iname \*avi -o -iname \*pdf -o -iname \*djvu -o -iname \*wav -o -iname \*pls -o -iname \*epub -o -iname \*tex -o -iname \*shak -o -iname \*mobi>~/db/files'
alias rindex2='find /home/shane/ -iname \*html -o -iname \*mobi>>~/db/files'
alias lock='xscreensaver-command -lock'
alias smoke="while [ 1 ]; do; cat < thepipe; done&"
alias mirror="mplayer -vf mirror -fs tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0"
alias nospin="sudo hdparm -B 255 /dev/sda"
alias gmt='zdump Europe/Dublin|grep "[0-9][0-9]:[0-9][0-9]"'
alias ist="zdump Asia/Calcutta|grep '[0-9][0-9]:[0-9][0-9]'"
alias clock='while true; do echo -ne "\e[s\e[0;$((COLUMNS-27))H$(\date)\e[u"; sleep 1; done &'
alias beep="screen -d -m play $HOME/Music/Music/SFX/beep.wav"
alias emid="grep "@" | sed 's/.*[|, ]\([a-zA-Z0-9_\.]*@[a-zA-Z0-9_]*\.[a-zA-Z0-9_\.]*\)[|, ].*/\1/'"
alias normalscreen="xrandr --output LVDS1 --mode 1280x800"
alias week="rem -cuc+1"
alias week2="rem -cuc+2"
alias slaveplay="screen -d -m mplayer -input file=/home/shane/mplayerfifo"
alias radio="mplayer -idle -input file=/home/shane/mplayerfifo -playlist"
alias mplayerd="screen -d -m mplayer -idle -input file=/home/shane/mplayerfifo"
alias pause='echo "pause" > $HOME/mplayerfifo'
alias shutup='killall mplayer'
alias prev='echo "pt_step -1" > $HOME/mplayerfifo'
alias next='echo "pt_step 1" > $HOME/mplayerfifo'
alias shot='echo "screenshot 0" > $HOME/mplayerfifo'
alias refresh="source ~/.zshrc"
alias caps2esc="xmodmap ~/.capsesc"
alias refresh="source /home/shane/.zshrc"
alias fa='find -maxdepth 2 -type f -iname \*.mp3 | sort > playlist.pls'
alias dim="xbacklight -20"
alias bright="xbacklight +20"
alias twin="rsync -av --delete"
alias bye="sudo shutdown -h 0"
alias voicememo="rec ~/Music/Memos/\$(date +'%y-%m-%d,%H:%M:%S,%a').ogg"
alias todo="t add"
alias bsnl="sudo wvdial -C ~/Dropbox/wvdial.bsnl"
alias tata="sudo wvdial -C ~/Dropbox/wvdial.conf.tata"

wiki(){wiki=$(dig +short txt "$*".wp.dg.cx|sed 's/"$//'|sed 's/^"//'); echo $wiki; wiki=$(echo $wiki| grep -o 'http://[^:]*$');} 
sinfo(){dig +short txt "$*".wp.dg.cx | sed 's/http:.*$//' | sed 's/\\[0-9][0-9]*//g' | speak}
whatis(){dig +short txt "$*".wp.dg.cx | sed 's/\..*$//' | sed 's/\\[0-9][0-9]*//g' | speak} 
qfind(){find -iname \*$1\*}
tweet () { curl -u shane84 -d status="$*" http://twitter.com/statuses/update.xml; }
tv(){grep -i "$*" $HOME/Dropbox/hathwaytv}
info(){grep -i "$*" $HOME/Dropbox/scrap.txt}

click(){(sleep $1; import -window root $2)&}
later(){(sleep $(echo "$1*60" | bc -l); notify-send "$*";)&}
alarm(){(sleep $(echo "$1*60" | bc -l); notify-send "$*"; play -q /home/shane/Music/SFX/alarm.wav)&}
add2wall(){composite -gravity SouthEast \( $1 -resize '1000x164>' -geometry +20+20 \) ~/Pictures/blank.jpg ~/Pictures/blank.jpg}
mu()
	{
	pgrep mplayer>/dev/null	
	if [ $? = 0 ];
	then ;
		else screen -d -m mplayer -idle -input file=/home/shane/mplayerfifo;
	fi
	case $1 in
		pl*) echo "loadfile \"${PWD}/$2\"">/home/shane/mplayerfifo;;
		ad*) echo "loadfile \"${PWD}/$2\" 1">/home/shane/mplayerfifo;;
		*/*.pls) echo "loadlist \"${PWD}/$1\" 1">/home/shane/mplayerfifo;ln -f -s ${PWD}/$1 /dev/shm/current.pls;;
		*/*) echo "loadfile \"${PWD}/$1\" 1">/home/shane/mplayerfifo;;
		ra*) echo "loadlist \"${PWD}/$2\" 0">/home/shane/mplayerfifo;;
		pa*) echo "pause">/home/shane/mplayerfifo;;
		vo*) echo "volume $2 1">/home/shane/mplayerfifo;;
		*) echo "$1 $2 $3">/home/shane/mplayerfifo;;
	esac;
	}
skip(){echo "pt_step $1" > mplayerfifo}
say(){while read statement; do;mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.co.uk/translate_tts?tl=en&q=$statement" 2>/dev/null; done&}

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}


alias outscr="tty>$HOME/pipetty&"
inbar() {tid=$(cat $HOME/pipetty)
exec &>$tid
preexec ()
{
clear
echo '\e[0;32m\c'
}
}
export PERL_LOCAL_LIB_ROOT="/home/shane/perl5";
export PERL_MB_OPT="--install_base /home/shane/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/shane/perl5";
export PERL5LIB="/home/shane/perl5/lib/perl5/i686-linux-gnu-thread-multi-64int:/home/shane/perl5/lib/perl5";
export PATH="/home/shane/perl5/bin:$PATH";

calc(){qalc "$*"}
bindkey "^R" history-incremental-search-backward
alias record="mencoder tv://device=/dev/video0 -nosound -ovc lavc -o"
alias whats=wiki
alias what=wiki

## suffix aliases
alias -s tex=vim
alias -s txt=vim
alias -s html=firefox
alias -s org=firefox


command_not_found_handler(){wyrd -a "$*" 2>/dev/null || fo $* || (echo "what is $*?" | grep "$*")}
filestore(){Files=$(cat); echo $Files}
emailstore(){Emails=$(cat); echo $Emails}
store(){eval "$1=\$(cat)"; Last=$1; eval echo \$$1}
restrict(){eval "$1=\$(echo \$$1| grep $2)"; Last=$1; eval echo \$$1}
resume(){fg %$(jobs|grep "$*"| sed 's/^\[\([0-9]*\)\].*/\1/')}
alias netspeed="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
dump() { mplayer -playlist $1 -dumpstream -dumpfile ~/${2}.mp3 -vc dummy -vo null; }
alias calvin='calvin=$(ls -d $(ls -d $HOME/Pictures/CalvinHobbes/*|shuf -n 1)/* | shuf -n 1| tee >(feh -FZ -f -))'
alias wilde="shuf -n 1 $HOME/wilde"
alias smith="grep -vn '^$' ~/Documents/LBooks/Adam\ Smith\ Wealth\ of\ Nations.txt| shuf -n 1"

###syntax highlighting
#source $HOME/.myzshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan,underline'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=white'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=white'

## Stopping certain autocorrects
alias frasier="nocorrect frasier"

##Correcting only commands
unsetopt correct_all
##setopt correct
callit(){ aliased=$(history -1| cut -c 8-); alias $1=\'$aliased\';echo "alias $1='$aliased'">>~/.zshrc}
alias backup='rsync -avz ~/Dropbox/work/dedicatafirstreview/deg6knots.tex tifr:~/Documents/deg6knots/'
noiseless(){sox $* -n trim 0 1 noiseprof | play $* noisered}
t(){todo.sh $1 "${@:2}" | grep -v "^--$\|^TODO: [0-9][0-9]* of [0-9][0-9]* tasks shown$"}

APPLICATIONS=~/Dropbox/Application/2014
alias firefox="nohup firefox &>/dev/null &"
alias chromium="chromium-browser 2>/dev/null &"
alias videwall="mplayer -loop 0 -rootwin -ao null -noconsolecontrols -fs"
alias application="gvim $APPLICATIONS/deadlines.mine"
alias deadlines="gvim $APPLICATIONS/deadlines.mine"
alias list="gvim $APPLICATIONS/deadlines.mine"
alias deadlines="gvim ~/Dropbox/Application/2014/deadlines.mine"
alias picasify="mogrify -quality 25 -resize 50%"
alias rem="remind -n ~/.reminders | sed 's#^[0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9] ##'"
alias backup="cp ~/.zshrc ~/Dropbox/myinstaller/packages/; cp ~/.reminders ~/Dropbox/myinstaller/packages/"

pgrep dropbox &>/dev/null || nohup dropbox start &>/dev/null &
/home/shane/bin/wallpaper





export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias tmux="tmux -u -2"
autoload -Uz compinit && compinit


autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

alias correctbluetooth="sudo -i pactl load-module module-bluetooth-discover; pulseaudio -k"


# ghc-pkg-reset
# Removes all installed GHC/cabal packages, but not binaries, docs, etc.
# Use this to get out of dependency hell and start over, at the cost of some rebuilding time.
function ghc-pkg-reset() {
    read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
    test x$ans == xy && ( \
        echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
        echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
        )
}

alias ghci="ghci +RTS -M1000M -K500M"

# OPAM configuration
. /home/shane/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

alias ghc8=/home/shane/GHC8.0.1/bin/ghc
alias ghci8=/home/shane/GHC8.0.1/bin/ghci

alias ghc7=/usr/local/bin/ghc
alias ghci7=/usr/local/bin/ghci


wallclip(){feh --bg-max $(xsel -b -o)}
wallclipf(){feh --bg-fill $(xsel -b -o)}
fehclip(){feh $(xsel -b -o)}

alias vol="pactl set-sink-volume 0"
alias mute="vol 0%"
alias betty="~/betty/main.rb"

export NO_AT_BRIDGE=1
source ~/.zshenv


sl(){rm -f /tmp/ramdisk/results.tex; cat ~/bin/latexPreamble.tex <(searchlatex $*) ~/bin/latexPostamble.tex>/tmp/ramdisk/results.tex; (cd /tmp/ramdisk; pdflatex results.tex &>/dev/null; zathura results.pdf 2>/dev/null) }

alias brightest="xbacklight -set 100%"
alias dimmest="xbacklight -set 10%"

watchtex(){while inotifywait -q -q $1 ; do entry=$( yes X | pdflatex $1 ) || echo $entry | yad --on-top --no-buttons --wrap --center --text-info --width=700 --height=750; sleep 1; done
}
alias ffmpeg=~/Software/ffmpeg/ffmpeg-git-20150506-64bit-static/ffmpeg
alias euterpeaallow="sudo rmmod snd_seq_dummy"
alias qprint="lp -d ShaneA463 -o sides=two-sided-long-edge -o media=a4"
