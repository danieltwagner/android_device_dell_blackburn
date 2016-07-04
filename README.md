# Cyanogenmod for the Dell Venue 8 7000 (7840)

WIP

## Prerequisites

Build using a Ubuntu 16.04 LTS VM with at least 100GB disk space and >= 4GB RAM.

This is taken straight from the Cyanogen build docs:
```
sudo apt get bison build-essential curl flex git gnupg gperf libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop maven openjdk-8-jdk pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev g++-multilib gcc-multilib lib32ncurses5-dev lib32readline6-dev lib32z1-dev yasm adb fastboot

mkdir -p ~/bin
mkdir -p ~/android/system

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```

Add these lines to your `.bashrc`:
```
export EXPERIMENTAL_USE_JAVA8=true
export USE_CCACHE=1
```

Add these lines to your `.profile`:
```
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
```

Run `source .bashrc .profile`, then initialize the Android repo:
```
cd ~/android/system/
repo init -u https://github.com/CyanogenMod/android.git -b cm-13.0
repo sync
```

Edit `~/android/system/devices/asus/mofd-common/Android.mk` to include `blackburn` in the list of eligible devices:
```
ifneq ($(filter Z00A Z008 blackburn,$(TARGET_DEVICE)),)
```

## Local Manifest

Create a file `~/android/system/.repo/local_manifests/roomservice.xml` or update the existing file to contain:
```
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="danieltwagner/android_device_dell_blackburn" path="device/dell/blackburn" remote="github" />
</manifest>
```

## Building

```
cd ~/android/system/
prebuilts/misc/linux-x86/ccache/ccache -M 50G
repo sync
source build/envsetup.sh
breakfast blackburn
mka bacon
```

## Troubleshooting

- If it complains about `KERNEL_OBJ/usr` not existing, just create that folder

- If it complains that it can't stat `install-recovery.sh' - No such file or directory` remove the line
```
RECOVERY_PATCH_INSTALL := $(TARGET_OUT)/bin/install-recovery.sh
```
from `build/core/Makefile`, see https://github.com/scotthartbti/platform_build/pull/4/commits/a19b8838aef8924ba02e69fb4124084d1cf4a937

- if it complains about
```
OSError: [Errno 2] No such file or directory
build/core/Makefile:1047: recipe for target
    'out/target/product/t00n/system/bin/install-recovery.sh' failed
```
do a `mka imgdiff` and re-run `mka`. It should now complete.