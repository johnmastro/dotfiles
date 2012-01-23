#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
This script has the dubious honor of being both major overkill and totally
insufficient.
"""

from os import mkdir, remove
from os.path import exists, expanduser, join
from subprocess import call


# From fabric.utils, where's it's _AttributeDict
class attrdict(dict):
    def __getattr__(self, key):
        try:
            return self[key]
        except KeyError:
            return AttributeError(key)

    def __setattr__(self, key, value):
        self[key] = value


home = attrdict({'root': expanduser('~')})
dotfiles = attrdict({'root': join(home.root, 'dotfiles')})

for env in [home, dotfiles]:
    env.bashrc       = join(env.root, '.bashrc')
    env.bash_aliases = join(env.root, '.bash_aliases')
    env.gitconfig    = join(env.root, '.gitconfig')
    env.inputrc      = join(env.root, '.inputrc')
    env.vimrc        = join(env.root, '.vimrc')


if __name__ == '__main__':
    if not exists(dotfiles.root):
        print "Dotfiles repository doesn't exist; bailing out."
        exit(1)

    skipped = []
    print "\nCreating links into dotfiles repo:"
    for d in dotfiles:
        if d == 'root': continue
        target = dotfiles[d]
        link = home[d]
        if not exists(link):
            print '{:38} -> {}'.format(link, target.rjust(38))
            # call(['ln', '-s', target, link])
        else:
            skipped.append(link)

    if skipped:
        print "\nSkipped these because a file or link already exists there:"
        for s in skipped:
            print s

    vim_dir    = join(home.root, '.vim')
    vim_tmp    = join(vim_dir, 'tmp')
    vim_backup = join(vim_tmp, 'backup')
    vim_swap   = join(vim_tmp, 'swap')
    vim_undo   = join(vim_tmp, 'undo')
    vim_dirs   = [vim_dir, vim_tmp, vim_backup, vim_swap, vim_undo]

    print "\nCreating a directory structure for Vim's temporary files:"
    print """\
.vim/
|
-- .vim/tmp/
   |
   -- .vim/tmp/backup/
   |
   -- .vim/tmp/swap/
   |
   -- .vim/tmp/undo/\
"""

    for v in vim_dirs:
        if not exists(v):
            pass
            # mkdir(v)

    print "\nAll done; exiting.\n"
    exit()
