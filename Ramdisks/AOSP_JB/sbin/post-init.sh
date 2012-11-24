#!/system/bin/sh

#Set governor items
#echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_booted;
echo 1512000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;

DISLIT=0
[ "`/system/xbin/busybox grep -i 1 /data/.disable_touchlight`" ] && DISLIT=1
if [ "$DISLIT" == 1 ];
then
echo 0 > /sys/class/leds/button-backlight/max_brightness;
echo 0 > /sys/class/leds/button-backlight/brightness;
fi;

echo $(date) END of post-init.sh
