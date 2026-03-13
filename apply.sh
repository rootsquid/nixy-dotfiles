#!/bin/sh
echo "Copying Everything To /etc/nixos/ ..."
sudo cp ./* /etc/nixos/ -rf
echo "Rebuilding NixOS System (no flake)"
sudo nixos-rebuild switch
