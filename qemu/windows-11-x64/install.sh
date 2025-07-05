#!/bin/sh

# REQUIREMENTS 
#
# o qemu installed
#   - run `sudo pacman -Syu qemu-full`
#
# o GPU device id(s) passed through in boot loader
#   - update bios settings to allow for IOMMU
#   - add "amd_iommu=on iommu=pt vfio-pci.ids=10de:2684,10de:22ba" options to /boot/loader/entries/arch.conf
#   - update /etc/mkinitcpio.conf MODULES to "MODULES=(vfio vfio_pci)"
#   - run `sudo mkinitcpio -P`
#   - reboot
#   - run `lspci -nnkd ::300` and ensure that the installed module is vfio
#
# o windows 11 iso installed
#   - install windows 11 iso 
#   - move to current directory and change name to image.iso

# 2) install uefi firmware
# curl -LO https://github.com/qemu/qemu/raw/refs/heads/master/pc-bios/edk2-x86_64-code.fd.bz2
# bzip2 -d edk2-x86_64-code.fd.bz2

# 3) install virtio windows firmware
# curl -LO https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.271-1/virtio-win.iso

# 4) create boot image with qcow2 format
# qemu-img create -f qcow2 image.qcow2 128G

# 5) boot vm into installation media
sudo qemu-system-x86_64 \
    -machine type=q35 \
    -cpu host,kvm=on,topoext=on \
    -accel kvm \
    -smp sockets=1,cores=8,threads=2 \
    -m 16384 \
    -boot order=d \
    -device usb-ehci,id=ehci \
    -device usb-tablet \
    -device vfio-pci,host=01:00.0,multifunction=on,x-vga=on \
    -device vfio-pci,host=01:00.1 \
    -device virtio-keyboard-pci \
    -device virtio-net-pci,netdev=internet \
    -cdrom image.iso \
    -drive file=virtio-win.iso,media=cdrom \
    -drive if=pflash,format=raw,readonly=on,file=edk2-x86_64-code.fd \
    -drive if=virtio,format=qcow2,file=image.qcow2 \
    -display none \
    -netdev user,id=internet

