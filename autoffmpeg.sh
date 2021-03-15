## Requires ffmpeg and inotify-tools

SLEEP=300
MEDIADIR=/path/to/my/folder/

inotifywait --monitor $MEDIADIR --recursive --event create --event moved_to --format '%w%f' |

while read -r fname
	do
	if [[ "${fname: -3}" != ".ts" ]]; then
		echo "skipping non .ts file: ${fname}"
	elif [[ "${fname}" == *".grab"* ]]; then
		echo "skipping grab file: ${fname}"
	else
		newPath=${fname%.ts} # take off the ts
		newPath=${newPath}.mkv
		echo "converting $fname to $newPath"

		 # wait to ensure its copied
		echo "Sleeping $SLEEP"
		sleep $SLEEP

		# This just re-muxes to mkv, no trasncoding
		ffmpeg -i "${fname}" -c copy "${newPath}"

		echo "converted ${newPath##*/}"
	fi
	done


