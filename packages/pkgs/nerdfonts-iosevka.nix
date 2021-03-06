{ fetchzip }:

let
  version = "2.0.0";
in fetchzip rec {
  name = "nerdfonts-iosevka-${version}";

  url =
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/Iosevka.zip";

  sha256 = "1b8agwll5safqzxcf80sinxwhgqmrh3jh2arvskshvll29dzigp2";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype
  '';
}
