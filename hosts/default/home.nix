{ config, pkgs, ... }:

let
  gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img ${../../wallpapers/chinatown.png} &
  '';
in
{
  home.username = "john";
  home.homeDirectory = "/home/john";

  home.packages = with pkgs; [
    ripgrep
    fzf
    kitty
    brightnessctl
  ];

  programs.git = {
    enable = true;
    userName = "JohnIrle";
    userEmail = "irlejohn@gmail.com";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = ''${startupScript}/bin/start'';

      "$mod" = "SUPER";
      
      general = {
      	gaps_in = 2;
        gaps_out = 2;
      };

      animations = {
        enabled = "no";
      };

      bindm = [
        "$mod, mouse:272, movewindow"
	"$mod, mouse: 273, resizewindow"
	"$mod ALT, mouse:272, resizewindow"
      ];

      bindle = [
	" , XF86MonBrightnessUp, exec, brightnessctl s +5%"
	" , XF86MonBrightnessDown, exec, brightnessctl s 5%-"
	" , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
	" , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	" , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	" , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bind = [
        "$mod, M, exit" 
        "$mod, Return, exec, kitty"
	"$mod, B, exec, firefox"
	"$mod, Q, killactive"
	"$mod, T, togglefloating"
	"ALT, Tab, cyclenext"
        "SHIFT ALT, Tab, cyclenext, prev"
	"SUPER, Tab, workspace,previous"

        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        "SUPER SHIFT, h, movewindow, l"
        "SUPER SHIFT, l, movewindow, r"
        "SUPER SHIFT, k, movewindow, u"
        "SUPER SHIFT, j, movewindow, d"

	"SUPER, 1, workspace, 1"
	"SUPER, 2, workspace, 2"
	"SUPER, 3, workspace, 3"
	"SUPER, 4, workspace, 4"
	"SUPER, 5, workspace, 5"
	"SUPER, 6, workspace, 6"
	"SUPER, 7, workspace, 7"
	"SUPER, 8, workspace, 8"
	"SUPER, 9, workspace, 9"
	"SUPER, 0, workspace, 10"
	"SUPER, bracketright, workspace, e+1"
	"SUPER, bracketleft, workspace, e-1"
      ];
    };
  };


  gtk.enable = true;

  gtk.iconTheme.package = pkgs.gruvbox-plus-icons;
  gtk.iconTheme.name = "Gruvbox-Plus-Dark";

  qt.enable = true;

  # platform theme "gtk" or "gnome"
  qt.platformTheme.name = "gtk";

  programs.starship = {
    enable = true;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
