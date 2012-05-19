# -*- coding: utf-8 -*-

import os, sys
import datetime
import re

HOME = os.getenv('HOME')

user_python_dir = os.path.join(HOME, '.python')
if os.path.exists(user_python_dir):
    sys.path.append(user_python_dir)
    from utils import *
del HOME, user_python_dir
