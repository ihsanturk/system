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
      "hometv" = {
        fingerprint = {
          DP2 = "00ffffffffffff000a65010100000000ff130103800000780a0dc9a05747982712484c20000001010101010101010101010101010101023a801871382d40582c4500fa3d3200001e023a80d072382d40102c4580fa3d3200001e000000fc00424f5345204c530a2020202020000000fd00323c0f440f000a202020202020014902033e72320f7f031507503e1fc0570f005f7f01677f0052909f20212202030405060711121314151601837f00006c030c002000801ec047474747e2003f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000027";
          eDP1 = "00ffffffffffff0009e5c30600000000121a0104a5221378022e10a757549f26115054000000010101010101010101010101010101014dd000a0f0703e803020350059c21000001ae08a00a0f0703e803020350059c21000001a00000000000000000000000000000000000000000002000c2dff103ca632463aa60000000095";
        };
        config = {
          eDP1.enable = false;
          DP2 = {
            enable = true;
            primary = true;
            position = "0x0";
            mode = "1920x1080";
            dpi = 96;
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
