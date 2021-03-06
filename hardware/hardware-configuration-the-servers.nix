# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f0004b4e-136e-48b6-a409-371a1a891b53";
      fsType = "btrfs";
      options = [ "compress=zstd" "autodefrag" "noatime" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/f0004b4e-136e-48b6-a409-371a1a891b53";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "autodefrag" "noatime" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/f0004b4e-136e-48b6-a409-371a1a891b53";
      fsType = "btrfs";
      options = [ "subvol=@var" "compress=zstd" "autodefrag" "noatime" ];
    };

  fileSystems."/.snapshots" =
    { device = "/dev/disk/by-uuid/f0004b4e-136e-48b6-a409-371a1a891b53";
      fsType = "btrfs";
      options = [ "subvol=@snapshots" "compress=zstd" "autodefrag" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/EF13-5201";
      fsType = "vfat";
    };

  swapDevices = [ ];

}

