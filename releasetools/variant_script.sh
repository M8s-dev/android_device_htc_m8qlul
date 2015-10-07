#!/sbin/sh
# voidzero: originally taken from the m8.
# In our case this can probably be modified to something static.

set -e

# Detect variant and create symlinks to its specific-blobs
#modelid=`getprop ro.boot.mid`
#variant="gsm"

#basedir="/system/blobs/$variant/"
#cd $basedir
#chmod 755 bin/*
#find . -type f | while read file; do ln -s $basedir$file /system/$file ; done


# Create modem firmware links based on the currently installed modem
mkdir -p /firmware/radio
busybox mount -o shortname=lower -t vfat /dev/block/bootdevice/by-name/radio /firmware/radio

base="/firmware/radio/mba"

ln -s $base.mdt /system/vendor/firmware/mba.mdt
ln -s $base.b00 /system/vendor/firmware/mba.b00
ln -s $base.b01 /system/vendor/firmware/mba.b01
ln -s $base.b02 /system/vendor/firmware/mba.b02
ln -s $base.b03 /system/vendor/firmware/mba.b03

if [ ! -f "/system/vendor/firmware/mba.mdt" ]; then
  exit 1
fi

busybox umount /firmware/radio
exit 0
