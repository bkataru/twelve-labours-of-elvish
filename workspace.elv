use os
use file
use epm

# install elvish support for micro
if (not (os:is-regular ~/.config/micro/syntax/elvish.yaml)) {
  mkdir -p ~/.config/micro/syntax/
  git clone https://github.com/bkataru/elvish-micro-syntax.git
  mv elvish-micro-syntax/elvish.yaml ~/.config/micro/syntax/
  rm -rf elvish-micro-syntax
}

# install & configure powerline prompt for elvish
epm:install github.com/muesli/elvish-libs

if (not (os:is-regular ~/.config/elvish/rc.elv)) {
  mkdir -p ~/.config/elvish
  touch ~/.config/elvish/rc.elv

  var f = (file:open-output ~/.config/elvish/rc.elv)
  echo "use github.com/muesli/elvish-libs/theme/powerline" > $f
  echo "set edit:prompt-stale-transform = {|x| put $x }" > $f
  echo "set edit:rprompt-stale-transform = {|x| put $x }" > $f
  file:close $f
}

try {
  zellij a twelve-labours-of-elvish options --default-shell elvish --scrollback-editor micro
} catch {
  zellij a --create twelve-labours-of-elvish options --default-shell elvish --scrollback-editor micro
}