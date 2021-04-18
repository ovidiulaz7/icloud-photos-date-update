#!/bin/bash
# Sunday April 18, 2021 00:13 AM GMT
dateFormat="%A %B %d,%Y %H:%M %p %Z"
# 2021:04:18 00:13:00:00+0000
outputFormat="%Y:%m:%d %H:%M:00%z"
sed 1d "$1" | while IFS=, read fileName fileDate; do 
  	echo "Updating $fileName with date $fileDate"
  	date=$(eval "date -jf '$dateFormat' $fileDate +'$outputFormat'")
  	exiftool -DateTime="$date" -DateTimeOriginal="$date" -FileModifyDate="$date" "$fileName"
done
