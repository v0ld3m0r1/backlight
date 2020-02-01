#!/bin/bash

#######################################################################
#                                                                     #
#  Name:          backlight                                           #
#                                                                     #
#  Author:        v0ld3m0r1                                           #
#  Version:       1.0                                                 #
#  Date:          16.01.2020                                          #
#                                                                     #
#  Description: This script manages to change the displaybrightness   #
#               of a MacBook by manupulating the brightness textfile  #
#               in /sys/class/backlight/intel_backlight/ . It comes   #
#               with three modes:                                     #
#                  1. Chose between min (50) or max(2000) value       #
#                  2. Set the brightness to min or max by simply      #
#                     using "min"/"max" as argument                   #
#                  3. Typ in a percentage Value for the brightness    #
#                                                                     #
#  Parameter:                                                         #
#    -v   verbose, print new brightness value                         #
#    -h   print help                                                  #
#    -p   percentage flag, needs a value between [0..100]%            #
#    min  sets brightness to the minimum                              #
#    max  sets brightness to the maximum                              #
#                                                                     #
#  Usage: backlight [-v] [value(50-2000)|min|max]                     #
#         backlight [-v] [-p [value percentage]]                      #
#         backlight -h                                                #
#                                                                     #
#######################################################################

MIN=50
MAX=2000
DIFF=$(($MAX-$MIN))
BRIGHTNESSPATH=/sys/class/backlight/intel_backlight/brightness

function print_help {
	echo "                 backlight - help"
	echo " Author: v0ld3m0r1   Version 1.0   Date: 16.01.2020"
	echo " Parameter:"
	echo "   -v   verbose, print new brightness value"
	echo "   -h   print help"
	echo "   -p   percentage flag, needs a value between"
	echo "        [0..100]%"
	echo "   min  sets brightness to the minimum"
	echo "   max  sets brightness to the maximum"
	echo ""
	echo " Usage: backlight [-v] [value(50-2000)|min|max]"
	echo "        backlight [-v] [-p [value percentage]]"
	echo "        backlight -h"
	echo ""
}

if [ $# -eq 1 ]; then
	if [ $1 = -h ]; then print_help	
	elif [ $1 = "min" ]; then echo $MIN > $BRIGHTNESSPATH
	elif [ $1 = "max" ]; then echo $MAX > $BRIGHTNESSPATH
	elif [ $1 -lt 2001 -a $1 -gt 49 ]; then echo $1 > $BRIGHTNESSPATH
	else
		echo "Unknown parameter. Try backlight -h for help."
	fi
elif [ $# -eq 2 ]; then
	if [ $1 = "-v" -a $2 = "min" ]; then
		echo $MIN > $BRIGHTNESSPATH
		echo "Set screen brightness to $MIN (of $MAX)."
	elif [ $1 = "-v" -a $2 = "max" ]; then
		echo $MAX > $BRIGHTNESSPATH
		echo "Set screen brightness to $MAX (of $MAX)."
	elif [ $1 = "-v" -a $2 -lt 2001 -a $2 -gt 49 ]; then
		echo $2 > $BRIGHTNESSPATH
		echo "Set screen brightness to $2 (of $MAX)."
	elif [ $1 = "-p" -a $2 -lt 101 -a $2 -gt -1 ]; then
		percent=$(($DIFF*$2/100))
		echo $(($percent+50)) > $BRIGHTNESSPATH
	else
		echo "Unknown arguments. Try backlight -h for help."
	fi
elif [ $# -eq 3 ]; then
	if [ $1 = "-v" -a $2 = "-p" -a $3 -lt 101 -a $3 -gt -1 ]; then
		percent=$(($DIFF*$3/100))
		echo $(($percent+50)) > $BRIGHTNESSPATH
		echo "Set screen brightness to $3% ($(($percent+50)) of $MAX)."
	else
		echo "Unknown arguments. Try backlight -h for help."
	fi
elif [ $# -gt 3 ]; then
	echo "Too many argumnents. Try backlight -h for help."
else
	echo "Not enough arguments. Try backlight -h for help."
fi
