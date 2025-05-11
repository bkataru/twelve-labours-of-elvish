#!/usr/bin/env elvish

# install elvish support for micro
mkdir -p ~/.config/micro/syntax/
git clone https://github.com/bkataru/elvish-micro-syntax.git
mv elvish-micro-syntax/elvish.yaml ~/.config/micro/syntax/
rm -rf elvish-micro-syntax

try {
  zellij a twelve-labours-of-elvish options --default-shell elvish --scrollback-editor micro
} catch {
  zellij a --create twelve-labours-of-elvish options --default-shell elvish --scrollback-editor micro
}