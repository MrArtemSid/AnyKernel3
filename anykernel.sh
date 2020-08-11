# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Game_Over TEST kernel compiled with Proton Clang 12. Version of the kernel is 4.9.232. CAF TAG is LA.UM.8.6.2.r1-08100-89xx.0. Kernel is made by Sid_key
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=santoni
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## recent key fix for OSS touchscreen driver
mount -o remount,rw /vendor;
rm -rf /vendor/usr/keylayout/ft5x06_ts.kl;
ln -s /vendor/usr/keylayout/ft5x06_720p.kl /vendor/usr/keylayout/ft5x06_ts.kl;

## AnyKernel install
dump_boot;


write_boot;
## end install

