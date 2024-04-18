#!/bin/bash

BIOS_PATH=$1

echo "touch bios update flag"
touch /tmp/bios_update_done

echo "mount partition 12"
mkdir /tmp/mount12
mount /dev/mmcblk0p12 /tmp/mount12

echo "copy .efi and .cab file to folder"
cp ${BIOS_PATH}/fwupdx64.efi /tmp/mount12/efi/boot/
if [ ! -d /tmp/mount12/efi/boot ] ; then
  mkdir /tmp/mount12/efi/boot/fw
fi
cp -r ${BIOS_PATH}/fw /tmp/mount12/efi/boot/

echo "write efivar for fwupd"
${BIOS_PATH}/fw_upd_setup -w

echo "set bootnext"
${BIOS_PATH}/fw_upd_setup -b
${BIOS_PATH}/fw_upd_setup -n

#echo "set Debug"
#${BIOS_PATH}/fw_upd_setup -v
