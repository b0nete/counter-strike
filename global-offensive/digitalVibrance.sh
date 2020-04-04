#!/bin/bash
VAL=$1
if [[ $(nvidia-settings -q "DigitalVibrance" | grep "Attribute.*$VAL\.") ]]
then
    nvidia-settings -a "DigitalVibrance=0" > /dev/null
    echo "Vibrance Disabled"
else 
    nvidia-settings -a "DigitalVibrance=$VAL" > /dev/null
    echo "Vibrance Enabled with value $VAL"
fi