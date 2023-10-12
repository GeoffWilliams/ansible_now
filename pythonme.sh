#!/bin/bash

if [ $(whoami) == "root" ] ; then
  echo "dont run as root!"
  exit
fi

PYTHON_VERSION=3.11.6
curl https://pyenv.run | bash

cat <<'EOM' >> ~/.bashrc
# Load pyenv automatically by appending
# the following to ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

EOM

source ~/.bashrc
sudo dnf install -y make gcc patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2
pyenv install ${PYTHON_VERSION}
PYTHON_ACTIVATE="pyenv global ${PYTHON_VERSION}"
echo $PYTHON_ACTIVATE >> ~/.bashrc

