#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import subprocess as proc


def get_authinfo_password(login, machine, port):
    """Return the password for the matching entry in ~/.authinfo.gpg.

    Each of `login`, `machine`, and `port` must match the corresponding items
    in the authinfo entry.

    This assumes that gpg-agent is installed and running.
    """
    command = "gpg -q --no-tty -d ~/.authinfo.gpg"
    pattern = "machine %(machine)s login %(login)s password ([^ ]*) port %(port)d"
    pattern = pattern % {'machine': machine, 'login': login, 'port': port}
    regexp = re.compile(pattern)
    result = proc.check_output(command, shell=True, stderr=proc.STDOUT)
    return regexp.search(result).group(1)


def get_keychain_password(account, server):
    """Return the password for `account` and `server` in OS X's keychain."""
    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
        'keychain': '/Users/jbm/Library/Keychains/login.keychain'
    }
    command = "sudo -u jbm %(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    result = proc.check_output(command, shell=True, stderr=proc.STDOUT)
    line = [l for l in result.splitlines() if l.startswith('password: ')][0]
    return re.match(r'password: "(.*)"', line).group(1)
