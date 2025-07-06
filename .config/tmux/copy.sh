# This is used to check the current platform and use the correct clipboard for tmux

#!/bin/bash
if grep -qi microsoft /proc/version; then
    clip.exe
elif uname | grep -qi Darwin; then
    pbcopy
else
    xclip -selection clipboard
fi
