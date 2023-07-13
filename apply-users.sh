#!/bin/sh

nix build path:.#homeManagerConfigurations.waayway.activationPackage
./result/activate
