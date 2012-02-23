setopt noclobber
setopt shortloops
setopt extendedglob
setopt nomatch
setopt badpattern
setopt list_types
setopt multios
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt pushdsilent
setopt pushdtohome
setopt correct
# setopt correct_all
setopt notify
setopt nobeep

watch=all
logcheck=60
# %n = username, %M = hostname, %a = action, %l = tty, %T = time,
# %W = date
WATCHFMT="%n from %M has %a tty%l at %T %W"
