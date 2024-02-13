
qemu-system-x86_64 \
  -nodefaults \
  \
  -machine type=q35 `# allows for PCIe` \
  -rtc clock=host,base=localtime `# faster boot aparently` \
  \
  -enable-kvm \
  -cpu host,check,enforce,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,l3-cache=on,-hypervisor,kvm=off,migratable=no,+invtsc,hv_vendor_id=1234567890ab \
  -smp cpus=20,cores=10,threads=2,sockets=1 \
  -m 12G \
  \
  -object iothread,id=io1 \
  -device virtio-blk-pci,drive=disk0,iothread=io1 \
  -drive if=none,id=disk0,cache=none,format=qcow2,aio=threads,file=emugaming.qcow2 \
  \
  -nic user,model=virtio-net-pci `# simple passthrough networking that cant ping` \
  -boot d -cdrom Windows10-22H2.iso \
  -drive file=virtio-win-0.1.240.iso,media=cdrom,readonly=on \
  -vga std -vnc :0 && echo ok
