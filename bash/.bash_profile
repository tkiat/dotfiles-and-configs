# Honor system-wide environment variables
source /etc/profile
# [ -x "$(command -v xrandr)" ] && xrandr --output LVDS-1 --brightness 0.9
[ -x "$(command -v redshift)" ] && redshift -O 3500

setxkbmap -layout us,th -option grp:win_space_toggle
xsetroot -solid black

while xsetroot -name " $(date +'%a, %d %b %I:%M:%S%p') "; do
	sleep 1
done &
