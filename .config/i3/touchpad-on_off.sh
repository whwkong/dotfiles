#!/bin/bash
# See: https://forum.manjaro.org/t/disable-touchpad-in-i3-with-a-keystroke/50235
#
# grep for TouchPad is usually sufficient
DEVICE_ID=$(xinput list --id-only "SynPS/2 Synaptics TouchPad")

DEVICE_STATUS=$(xinput list-props $DEVICE_ID | grep "Device Enabled"|awk '{print $4}')

echo $DEVICE_STATUS
case $1 in 
    devonoff)
        if [ $DEVICE_STATUS -ne 0 ]
        then 
            echo "disabling touch pad"
            xinput --disable $DEVICE_ID
            notify-send -u low -i input-touchpad "Touchpad disabled"
        else
            echo "enabling touch pad"
            xinput --enable $DEVICE_ID
            notify-send -u low -i input-touchpad "Touchpad enabled"
        fi
    ;;
esac

