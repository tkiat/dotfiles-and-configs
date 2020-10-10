# display settings
[ -x "$(command -v xrandr)" ] && xrandr --output LVDS-1 --brightness 0.9
[ -x "$(command -v redshift)" ] && redshift -O 3600
[ -x "$(command -v dropbox)" ] && dropbox start &

setxkbmap -layout us,th -option grp:win_space_toggle

os=$(lsb_release -ds | tr -d '"')
#mem=$(free -h | awk 'FNR == 2 {print $3"/"$2}') # used/total
while true; do
	xsetroot -name " $(date +'%a, %d %b %I:%M:%S%p') | $os"
	sleep 1
done &
