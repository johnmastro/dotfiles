###############################################################################
# ~/.bash_profile
#
# Executed by bash for login shells.
###############################################################################

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
