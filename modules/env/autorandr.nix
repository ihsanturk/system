{ device, pkgs, ... }:

{
  home-manager.users.imran.programs.autorandr.enable = true;

  # Define display profiles per-device
  home-manager.users.imran.programs.autorandr.profiles = {
    spectre = {
      "main" = {
        fingerprint = {
          eDP1 = "00ffffffffffff0009e5c30600000000121a0104a5221378022e10a757549f26115054000000010101010101010101010101010101014dd000a0f0703e803020350059c21000001ae08a00a0f0703e803020350059c21000001a00000000000000000000000000000000000000000002000c2dff103ca632463aa60000000095";
        };
        config = {
          eDP1 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "3840x2160";
            dpi = 192;
            rate = "60.00";
          };
        };
      };
    };
  }.${device.name};

  # Run on i3 start
  home-manager.users.imran.xsession.windowManager.i3.config.startup = [{
    command = "${pkgs.autorandr}/bin/autorandr -c --force --default main";
    always = true;
  }];
}