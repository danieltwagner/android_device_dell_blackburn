USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/dell/blackburn/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := blackburn

BOARD_KERNEL_CMDLINE := init=/init pci=noearly loglevel=0 vmalloc=256M androidboot.hardware=mofd_v1 watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 gpt snd_pcm.maximum_substreams=8 panic=15 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on debug_locks=0 n_gsm.mux_base_conf="ttyACM0,0 ttyXMM0,1" bootboost=1
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08c60000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/dell/blackburn/kernel

BOARD_HAS_NO_SELECT_BUTTON := true
