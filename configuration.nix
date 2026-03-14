{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_testing;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  
  networking.hostName = "nixy";
  networking.networkmanager.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
   
  time.timeZone = "Africa/Cairo";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
 
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  users.users.typir = {
    isNormalUser = true;
    description = "typir";
    extraGroups = [ "libvirtd" "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true; };
    gamemode.enable = true;
    appimage = {
      enable = true;
      binfmt = true; };
  };
  
  environment.systemPackages = with pkgs; [
    obs-studio
    flameshot
    umu-launcher
    wine
    git
    vscodium
    qemu
    virtiofsd
    mate-polkit
    virt-manager
    libvirt
    papirus-icon-theme
    thunar
    gearlever
    qbittorrent
    mpv
    imhex
    yt-dlp
    heroic
    lutris
    protonplus
    fastfetch
    alacritty
    maim
    vim
    rofi
    nwg-look
    lxrandr
    brave
    pavucontrol
    mangohud
    xgamma
    xcalib
    pulseaudio
    adwaita-qt
    yaru-theme
    xarchiver
    lmms
  ];
 
  virtualisation = {
    libvirtd = {
      enable = true; }; 
  };
  
  services ={
    displayManager.ly = {
      enable = true; };
    pipewire ={
      enable = true;
      alsa.enable = true;
      pulse.enable = true; }; 
    xserver = {
      enable = true;
      windowManager.i3 = {
        enable = true; };
     xkb = {
     layout = "us,eg";
     options = "grp:alt_shift_toggle"; };
   };
  };
     
  system.stateVersion = "25.11";

}
