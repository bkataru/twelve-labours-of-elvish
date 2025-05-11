#!/usr/bin/env bash

echo '> installing nix...'

echo '-------------------------'
sh <(curl -L https://nixos.org/nix/install) --no-daemon
echo '-------------------------'

echo '> sourcing nix.sh...'

. ~/.nix-profile/etc/profile.d/nix.sh