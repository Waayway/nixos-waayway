# This function is copied from:
# https://github.com/yunfachi/nypkgs/blob/master/lib/umport.nix
#
# !!! REMOVING THIS NOTICE VIOLATES THE MIT LICENSE OF THE UMPORT PROJECT !!!
# This notice must be retained in all copies of this function, including modified versions!
# The MIT License can be found here:
# https://github.com/yunfachi/nypkgs/blob/master/LICENSE
#
# This is modified by me, i needed the includeHome argument to include _home.nix
{ lib, ... }:
let
  umport =
    {
      path ? null,
      paths ? [ ],
      include ? [ ],
      exclude ? [ ],
      recursive ? true,
      includeHome ? false,
      ...
    }:
    with lib;
    with fileset;
    let
      excludedFiles = filter (path: pathIsRegularFile path) exclude;
      excludedDirs = filter (path: pathIsDirectory path) exclude;
      isExcluded =
        path:
        if hasSuffix "_lib.nix" (builtins.toString path) then # On lib files dont
          true
        else if !includeHome && hasSuffix "_home.nix" (builtins.toString path) then
          true
        else if includeHome && !(hasSuffix "_home.nix" (builtins.toString path)) then
          true
        else if elem path excludedFiles then
          true
        else
          (filter (excludedDir: lib.path.hasPrefix excludedDir path) excludedDirs) != [ ];
      output = unique (
        (filter
          (file: pathIsRegularFile file && hasSuffix ".nix" (builtins.toString file) && !isExcluded file)
          (
            concatMap (
              _path:
              if recursive then
                toList _path
              else
                mapAttrsToList (
                  name: type: _path + (if type == "directory" then "/${name}/default.nix" else "/${name}")
                ) (builtins.readDir _path)
            ) (unique (if path == null then paths else [ path ] ++ paths))
          )
        )
        ++ (if recursive then concatMap (path: toList path) (unique include) else unique include)
      );
    in
    output;
in
umport
