# Fonts
{ pkgs, lib, ... }:
{
  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true; # ls /run/current-system/sw/share/X11-fonts
    fontconfig = {
      enable = true;
      cache32Bit = true;
      hinting.enable = true;
      antialias = true;
      defaultFonts = {
        monospace = [ "meslo-lgs-nf" ];
        sansSerif = [ "Roboto" ];
        serif = [ "Roboto Slab" ];
      };
    };
  
  fonts = with pkgs; [
    terminus_font
    dejavu_fonts
    source-code-pro
    meslo-lgs-nf
    open-sans
    fira-code
    fira-mono
    fira-code-symbols
    roboto
    roboto-slab
    roboto-mono
    ];
  };
  
  environment.systemPackages = with pkgs;[ font-manager xorg.mkfontscale
      xorg.mkfontdir ];

}

