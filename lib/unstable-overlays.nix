[
  (final: prev: {
    wlroots = prev.wlroots.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [
        (prev.fetchpatch {
          url = "https://gitlab.freedesktop.org/wlroots/wlroots/uploads/b4f932e370ed03d88f202191eaf60965/DisplayLink.patch";
          hash = "sha256-1HheLsOSnj4OMiA35QCHkWprTNgAeG2tXrGbaQyUrF4=";
        })
      ];
    });
  })
]
