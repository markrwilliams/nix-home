{ config, pkgs, ... }: {

  # users.mutableUsers = false;

  users.extraUsers.fmzakari = {
    # This automatically sets group to users, createHome to true,
    # home to /home/username, useDefaultShell to true, and isSystemUser to false
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
    description = "Farid Zakaria";
  };


  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=60 # only ask for password every 1h
  '';


  users.extraUsers.mrw = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [ "wheel" "networkmanager" ];
    description = "Mark Williams";
    packages = with pkgs; [
        brightnessctl
        discord
        dmenu
        docker
        emacs
        firefox
        (haskellPackages.ghcWithPackages (hpkgs: [
                hpkgs.xmonad
                hpkgs.xmonad-contrib
        ]))
        killall
        xcalib
        pass
        pavucontrol
        polybarFull
        python3
        rxvt-unicode
        signal-desktop
        virtualenv
    ];
  };
}
