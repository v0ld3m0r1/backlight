#!/bin/bash

#######################################################################
#                                                                     #
#  Name:          kbbacklight                                         #
#                                                                     #
#  Author:        v0ld3m0r1                                           #
#  Version:       1.0                                                 #
#  Date:          31.01.2020                                          #
#                                                                     #
#  Description: This script manages to change the keyboardbrightness  #
#               of a MacBook by manupulating the brightness textfile  #
#               in /sys/class/leds/smc\:\:kbd_backlight/brightness .  #
#               It comes with three modes:                            #
#                  1. Chose between min (0) or max(300) value         #
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
#  Usage: kbbacklight [-v] [value(0-300)|min|max]                     #
#         kbbacklight [-v] [-p [value percentage]]                    #
#         kbbacklight -h                                              #
#                                                                     #
#######################################################################

MIN=0
MAX=300
DIFF=$(($MAX-$MIN))
BRIGHTNESSPATH=/sys/class/leds/smc\:\:kbd_backlight/brightness

function print_help {
	echo "                kbbacklight - help"
	echo " Author: v0ld3m0r1   Version 1.0   Date: 31.01.2020"
	echo " Parameter:"
	echo "   -v   verbose, print new keyboard brightness value"
	echo "   -h   print help"
	echo "   -p   percentage flag, needs a value between"
	echo "        [0..100]%"
	echo "   min  sets keyboard brightness to the minimum"
	echo "   max  sets keyboard  brightness to the maximum"
	echo ""
	echo " Usage: kbbacklight [-v] [value(0-300)|min|max]"
	echo "        kbbacklight [-v] [-p [value percentage]]"
	echo "        kbbacklight -h"
	echo ""
}

if [ $# -eq 1 ]; then
	if [ $1 = -h ]; then print_help	
	elif [ $1 = "min" ]; then echo $MIN > $BRIGHTNESSPATH
	elif [ $1 = "max" ]; then echo $MAX > $BRIGHTNESSPATH
	elif [ $1 -lt 301 -a $1 -gt -1 ]; then echo $1 > $BRIGHTNESSPATH
	else
		echo "Unknown parameter. Try kbbacklight -h for help."
	fi
elif [ $# -eq 2 ]; then
	if [ $1 = "-v" -a $2 = "min" ]; then
		echo $MIN > $BRIGHTNESSPATH
		echo "Set keyboard brightness to $MIN (of $MAX)."
	elif [ $1 = "-v" -a $2 = "max" ]; then
		echo $MAX > $BRIGHTNESSPATH
		echo "Set keyboard brightness to $MAX (of $MAX)."
	elif [ $1 = "-v" -a $2 -lt 301 -a $2 -gt -1 ]; then
		echo $2 > $BRIGHTNESSPATH
		echo "Set keyboard brightness to $2 (of $MAX)."
	elif [ $1 = "-p" -a $2 -lt 101 -a $2 -gt -1 ]; then
		percent=$(($DIFF*$2/100))
		echo $(($percent)) > $BRIGHTNESSPATH
	else
		echo "Unknown arguments. Try kbbacklight -h for help."
	fi
elif [ $# -eq 3 ]; then
	if [ $1 = "-v" -a $2 = "-p" -a $3 -lt 101 -a $3 -gt -1 ]; then
		percent=$(($DIFF*$3/100))
		echo $(($percent)) > $BRIGHTNESSPATH
		echo "Set keyboard brightness to $3% ($(($percent)) of $MAX)."
	else
		echo "Unknown arguments. Try kbbacklight -h for help."
	fi
elif [ $# -gt 3 ]; then
	echo "Too many argumnents. Try kbbacklight -h for help."
else
	echo "Not enough arguments. Try kbbacklight -h for help."
fi
