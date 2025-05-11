use os
use re
use file
use epm

# install elvish support for micro
if (not (os:is-regular ~/.config/micro/syntax/elvish.yaml)) {
  mkdir -p ~/.config/micro/syntax/
  git clone https://github.com/bkataru/elvish-micro-syntax.git
  mv elvish-micro-syntax/elvish.yaml ~/.config/micro/syntax/
  rm -rf elvish-micro-syntax
}

if (not (os:is-regular ~/.config/elvish/rc.elv)) {
  mkdir -p ~/.config/elvish
  touch ~/.config/elvish/rc.elv
}

fn count-in-elvish-config {|query|
  put (cat ~/.config/elvish/rc.elv | slurp | re:find $query (all) | count)
}

# install & configure the chain theme for elvish
epm:install github.com/zzamboni/elvish-themes &silent-if-installed=$true
if (== (count-in-elvish-config 'chain') 0) {
  var f = (file:open-output ~/.config/elvish/rc.elv &if-exists=append)

  var chain-config = '
use github.com/zzamboni/elvish-themes/chain
chain:init
'

  echo $chain-config > $f
  file:close $f
}

# configure carapace completions for elvish
if (== (count-in-elvish-config 'carapace') 0) {
  var f = (file:open-output ~/.config/elvish/rc.elv &if-exists=append)

  var carapace-config = '
set-env CARAPACE_BRIDGES ''zsh,fish,bash,inshellisense''
eval (carapace _carapace|slurp)
'

  echo $carapace-config > $f
  file:close $f
}

try {
  zellij a twelve-labours-of-elvish options --default-shell elvish --scrollback-editor micro
} catch {
  zellij a --create twelve-labours-of-elvish options --default-shell elvish --scrollback-editor micro
}