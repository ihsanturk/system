{ config, device, pkgs, lib, ... }:

{
  # Enable ALSA
  sound.enable = true;

  hardware = {
    # CPU microcode updates
    cpu.${device.cpu.vendor}.updateMicrocode = true;

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = lib.optionals (device.gpu == "optimus") (with pkgs; [
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-media-driver
      ]);
    };

    # Audio
    pulseaudio = {
      enable = true;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      package = pkgs.pulseaudioFull;
    };

    # Bluetooth
    bluetooth = {
      enable = true;
      config = { General.Enable = "Source,Sink,Media,Socket"; };
    };

    # Enable orientation/light sensors
    sensor.iio.enable = device.isLaptop;

    # Graphics
    bumblebee.enable = (device.gpu == "optimus");
  };

  # Allow backlight control
  programs.light.enable = device.isLaptop;

  # Optimize for SSD root partition
  fileSystems."/".options = [ "discard" ];

  # 4GB swapfile in /var
  swapDevices = [{
    device = "/var/swapfile";
    size = 4096;
  }];
}