#!/bin/sh

rm -f edk2-x86_64-code.*
curl -LOSs https://github.com/qemu/qemu/raw/refs/heads/master/pc-bios/edk2-x86_64-code.fd.bz2
bzip2 -d edk2-x86_64-code.fd.bz2

qemu-system-x86_64 \
    -machine type=q35 \
    -cpu host,kvm=on,topoext=on \
    -accel kvm \
    -smp sockets=1,cores=8,threads=2 \
    -m 16384 \
    -boot order=d \
    -device virtio-gpu-gl-pci \
    -device virtio-keyboard-pci \
    -device usb-ehci,id=ehci \
    -device usb-tablet \
    -cdrom image.iso \
    -drive if=pflash,format=raw,readonly=on,file=edk2-x86_64-code.fd \
    -drive if=virtio,format=qcow2,file=image.qcow2 \
    -display gtk,gl=on
