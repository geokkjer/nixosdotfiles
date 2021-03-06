# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, modulesPath, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      	./hardware/hardware-configuration-the-revisionist.nix
      	./system/common.nix
      	./system/tty.nix
      	./network/ssh.nix
      	./services/libvirtd-qemu.nix
      
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.memtest86.enable = true;

  networking.hostName = "the-revisionist";
  
  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Networking
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.enp6s0.useDHCP = true;
  networking.bridges.br-lan.interfaces = [ "enp6s0" ];
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "no";
   };

  

  users.users.geir = {
     shell = pkgs.bash;
     isNormalUser = true;
     extraGroups = [ "wheel" "libvirtd" ];
  };

  # Allow unfree
  nixpkgs.config.allowUnfree = true;
  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

