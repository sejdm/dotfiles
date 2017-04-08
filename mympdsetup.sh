
clear
username=$(whoami)
interface=`ip route show | cut -d ' ' -f 3 | head -1`
interface=$(ip route show | awk '{print $NF}' | tail -1)
echo "What is the full path of the directory containing your music?"
read -e -p "> " music_dir

if test -n "$(pgrep pulseaudio)";
  then
	  AUDIO='
audio_output {
               type              "pulse"
               name              "Pulseaudio"
}
'
  else
	  echo "No PulseAudio seems to be used, using autodetection instead"
	  AUDIO=""
fi

cat <<EOF


Ready to write config file.
This will delete and re-create directory "$HOME/.mpd"

EOF
read -p "Continue? (y/n) " yn

DO_CONFIG=
case $yn in
        [Yy]*) DO_CONFIG=yes ;;
        [Nn]*) exit;;
        *) echo "Please answer yes or no."; exit;;
esac

if test x$DO_CONFIG = xyes;
  then
	rm -fr $HOME/.mpd
	mkdir -p $HOME/.mpd/playlists
    touch $HOME/.mpd/log
	cat > $HOME/.mpd/mpd.conf <<EOF
music_directory                  "$music_dir"
db_file                          "$HOME/.mpd/database"
log_file                         "$HOME/.mpd/log"
pid_file                         "$HOME/.mpd/pid"
state_file                       "$HOME/.mpd/state"
playlist_directory               "$HOME/.mpd/playlists"
log_level                        "default"




bind_to_address                  "127.0.0.1"
bind_to_address                  "$HOME/.mpd/socket"
port                             "6600"
gapless_mp3_playback             "yes"
auto_update                      "yes"


input {
        plugin                   "curl"
        proxy                    "proxy.isp.com:8000"
        proxy_user               "user"
        proxy_password           "password"
}
$AUDIO
































replaygain                       "album"
replaygain_preamp                "0"










EOF
	clear
	cat <<EOF

EOF
echo "Trying to create systemd custom settings"
echo "Root previlegs needed..."

export username="$(whoami)"; sudo mkdir /etc/systemd/system/mpd.service.d && sudo echo -e \"[Service]\nUser=$username\nPAMName=system-local-login\" > /etc/systemd/system/mpd.service.d/mpd.conf
echo "Setup complete"
echo " "
echo "If you want mpd to start at boot, run:"
echo ""systemctl enable mpd""
echo " "
echo "Otherwise simply run "mpd" as user now."

  else
	echo "No config written, aborting"
	exit
fi

