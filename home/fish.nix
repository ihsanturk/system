{ config, pkgs, ...}:

let
  custompkgs = import ../packages {};
in
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      g = "git";
      hm = "home-manager";
      l = "exa";
      la = "exa -a";
      ll = "exa -al";
      lL = "exa -algiSH --git";
      lt = "exa -alT";
      t = "tmux";
      ta = "tmux a -t";
      td = "todoist";
      userctl = "systemctl --user";
      v = "nvim";
    };

    shellAliases = {
      hms = "home-manager switch";
      nxu = "nix-channel --update && sudo nix-channel --update";
      nxs = "sudo nixos-rebuild switch";
      nxb = "sudo nixos-rebuild boot";
    };

    shellInit = ''
      for file in ${custompkgs.budspencer}/lib/budspencer/*.fish; source $file; end
      fzf_key_bindings
    '';
  };
}
