# -*- coding: utf-8 -*-

import os
import copy
from contextlib import contextmanager

__all__ = ['Struct', 'cd']


class Struct(dict):
    """A dict subclass with support for attributes added."""

    def __init__(self, **entries):
        self.update(entries)

    def __repr__(self):
        args = ['%s=%s' % (k, repr(v)) for (k, v) in self.items()]
        return 'Struct(%s)' % ', '.join(args)

    def __getattr__(self, key):
        try:
            return self[key]
        except KeyError:
            # to conform with __getattr__ spec
            raise AttributeError(key)

    def __setattr__(self, key, value):
        self[key] = value

    def __delattr__(self, key):
        try:
            del self[key]
        except KeyError:
            raise AttributeError(key)

    def __deepcopy__(self, memo):
        return Struct(**copy.deepcopy(dict(self)))


@contextmanager
def cd(new):
    """Context manager for temporarily changing the working directory.

    Expands enviornment variables.
    """
    cur = os.getcwd()
    new = os.path.expandvars(new)
    os.chdir(new)
    try:
        yield
    finally:
        os.chdir(cur)
