{
  description = "Epiphany build";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
        let
          system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
        in
    {
        devShells.${system}.default =
      pkgs.mkShell {
                buildInputs = with pkgs; [
                    neovim
    ];
    nativeBuildInputs = with pkgs; [
        # bash
        # deno
        # building
        meson
        ninja
        cmake
        pkg-config
	#compiler
        gcc
        #libraries
        isocodes
        cairo
        gcr_4
        gdk-pixbuf
        gsettings-desktop-schemas
        gst_all_1.gstreamer
        gtk4
        nettle
        json-glib
	libarchive
        libadwaita
        libsecret
        libsoup_3
				libxml2
				libportal-gtk4
				sqlite
				webkitgtk_6_0
        #libend
				#programs
				itstool
				appstream
				desktop-file-utils
    ];

    shellHook =
        #"deno run --allow-read build.ts"
        "meson setup build && ninja -C build"
	;
      };


    };
}
