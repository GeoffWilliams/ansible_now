#!/bin/bash
if [[ $(grep -i Microsoft /proc/version) ]]; then
    echo "Bash is running on WSL! crash now to avoid destroying system, dont run this on your main PC!"
    exit 1
fi

if [ -n "$XDG_SESSION_TYPE" ] ; then
    echo "Bash is running under X11 or Wayland! crash now to avoid destroying system, dont run this on your main PC!"
    exit 1
fi

rm -rf ~/.ansible
rm -rf ~/ansible_now_venv
rm -rf ~/.pyenv
rm -rf ~/.local
echo "cleanup ~/.bashrc yourself"