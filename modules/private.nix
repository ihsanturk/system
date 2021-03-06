# A module that defines the structure of all the private info in this repo.
{ config, lib, pkgs, ... }:

with lib;
let
  mkPrivOption = description:
    mkOption {
      inherit description;
      type = types.str;
    };
in {
  options.private = {
    email = mkOption {
      description = "Email configuration";
      type = types.submodule {
        options = {
          address = mkPrivOption "Email address";
          imapServ = mkPrivOption "IMAP server address";
          imapPort = mkOption {
            description = "IMAP server port number";
            type = types.int;
          };
          smtpServ = mkPrivOption "SMTP server address";
          smtpPort = mkOption {
            description = "SMTP server port number";
            type = types.int;
          };
          smtpEncryption = mkPrivOption "SMTP encryption method";
          username = mkPrivOption "Email account username";
          password = mkPrivOption "Email account password";
        };
      };
    };

    hashedLogins = mkOption {
      description = ''
        Hashed passwords for each device in this configuration.
        Each attribute is a set and corresponds to a specific device's passwords.
      '';
      type = with types; attrsOf (attrsOf str);
    };

    rcloneConf = mkOption {
      description = "Config attribute set for rclone";
      type = types.attrs;
    };

    resticPasswordFile = mkOption {
      description =
        "Path to file containing password for restic backup repository";
      type = types.path;
    };

    everdo = mkOption {
      description = ''
        Everdo configuration.
        Attributes map to contents of files in $XDG_CONFIG_HOME/everdo.
      '';
      type = types.submodule {
        options = {
          key = mkPrivOption "Everdo product key";
          encryptionKey = mkPrivOption "ESS passphrase";
          jwt = mkPrivOption "ESS access token";
        };
      };
    };

    u2fAuthFile = mkOption {
      description = "Path to file containing u2f keys";
      type = types.path;
    };
  };

  config.private = import ../private.nix;
}
