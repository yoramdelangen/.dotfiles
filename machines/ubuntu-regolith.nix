
{ config, pkgs, ... }:

#############################
## Ubuntu Regolith Machine ##
#############################

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "yoram";
  home.homeDirectory = "/home/yoram";
  
  # packages only necessary for this machine build
  home.packages = with pkgs; [
    # add our first package here specific to Ubuntu/regolith
    # i3? 
  ];
}
