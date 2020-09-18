# display settings
[ -x "$(command -v xrandr)" ] && xrandr --output LVDS-1 --brightness 0.9
[ -x "$(command -v redshift)" ] && redshift -O 3600
[ -x "$(command -v dropbox)" ] && dropbox start &

#setxkbmap -model pc105 -layout us,th -option grp:win_space_toggle
setxkbmap -layout us,th -option grp:win_space_toggle

while true; do
	xsetroot -name "$(date +'%a %+4Y-%m-%d %I:%M:%S%p')"
	#xsetroot -name "$(date --rfc-2822)"
	sleep 1
done &
