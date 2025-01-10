{
  theme = {
    wallpaper = let
      url = "https://w.wallhaven.cc/full/gp/wallhaven-gpgyw3.jpg";
      sha256 = "10zcs2z83kq02x56z7h1584ng41sjv73jsrnnklf4fk0h9axivpp";
      ext = "jpg";
    in
      builtins.fetchurl {
        name = "wallpaper-${sha256}.${ext}";
        inherit url sha256;
      };
  };
}
