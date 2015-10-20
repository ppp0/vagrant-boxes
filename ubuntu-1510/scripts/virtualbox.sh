if test -f .vbox_version ; then

  # Install the VirtualBox guest additions

  # Unfortunately, VBox Guest Additions will not completely build with Virtualbox <5.0.4
  # Shared Folder special filesystem (vboxsf) will be missing
  # See also: https://www.virtualbox.org/ticket/14227

  VBOX_ISO=VBoxGuestAdditions.iso
  mount -o loop $VBOX_ISO /mnt
  yes|sh /mnt/VBoxLinuxAdditions.run || [ $? -eq 1 ]
  umount /mnt

  # Cleanup Virtualbox
  rm $VBOX_ISO
fi
