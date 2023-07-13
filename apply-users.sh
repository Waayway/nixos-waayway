#!/bin/sh

nix build .#homeManagerConfigurations.waayway.activationPackage
./result/activate
