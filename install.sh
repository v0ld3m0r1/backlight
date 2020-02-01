#!/bin/bash

#######################################################################
#                                                                     #
#  Name:          install.sh                                          #
#                                                                     #
#  Author:        v0ld3m0r1                                           #
#  Version:       1.0                                                 #
#  Date:          31.01.2020                                          #
#                                                                     #
#  Description: This script manages to install the two scripts        #
#               (backlight and kbbacklight). It simply copies them to #
#               your /usr/bin folder, so you can execute them in your #
#               system.                                               #
#  IMPORTANT:   install.sh has to be in the same folder as            #
#               backlight.sh and kbbacklight.sh.                      #
#  Note:        If you want to change the install-dir, just edit      #
#               COPYPATH and you are ready to go.                     #
#                                                                     #
#######################################################################

COPYPATH=/usr/bin

echo " Installing "backlight" and "kbbacklight" on your machine ..."
cp backlight.sh $COPYPATH/backlight
cp kbbacklight.sh $COPYPATH/kbbacklight
echo " Installation finished! Have fun :-)"
