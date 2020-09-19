# display settings
[ -x "$(command -v xrandr)" ] && xrandr --output LVDS-1 --brightness 0.9
[ -x "$(command -v redshift)" ] && redshift -O 3600
[ -x "$(command -v dropbox)" ] && dropbox start &

setxkbmap -layout us,th -option grp:win_space_toggle

while true; do
	xsetroot -name "$(date +'%a %Y-%m-%d %I:%M:%S%p')"
	sleep 1
done &
