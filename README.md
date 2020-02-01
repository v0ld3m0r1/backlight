# backlight

This two scipts manage to change the display and keyboard backlight brightness on a MacBook Air using Kali Linux.
By changing the values in /sys/class/backlight/intel_backlight/ and /sys/class/leds/smc\:\:kbd_backlight/brightness it is possible to control your brightness.

Author: v0ld3m0r1  
Version: 1.0  
Date: 31.01.2020

## Installation
For a simple installation please use the install.sh script.
Keep in mind you have to execute the install script in the same folder as the two backlight scripts.

## backlight usage
After copying the script to /usr/bin you can execute it just by using the terminal.  
It comes with three modes:
  1. Chose between min (50) or max(2000) value
  2. Set the brightness to min or max by simply using "min"/"max" as argument
  3. Typ in a percentage Value for the brightness

Parameter:  
  -v   verbose, print new brightness value  
  -h   print help  
  -p   percentage flag, needs a value between [0..100]%  
  min  sets brightness to the minimum  
  max  sets brightness to the maximum  

Usage:  
  backlight [-v] [value(50-2000)|min|max]  
  backlight [-v] [-p [value percentage]]  
  backlight -h
  
## kbbacklight usage
After copying the script to /usr/bin you can execute it just by using the terminal.  
It comes with three modes:  
  1. Chose between min (0) or max(300) value  
  2. Set the brightness to min or max by simply using "min"/"max" as argument  
  3. Typ in a percentage Value for the brightness  

Parameter:  
  -v   verbose, print new brightness value  
  -h   print help  
  -p   percentage flag, needs a value between [0..100]%  
  min  sets brightness to the minimum  
  max  sets brightness to the maximum  

Usage:  
  kbbacklight [-v] [value(0-300)|min|max]  
  kbbacklight [-v] [-p [value percentage]]  
  kbbacklight -h          
