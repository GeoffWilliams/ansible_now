#!/bin/bash

if [ $(whoami) == "root" ] ; then
  echo "dont run as root!"
  exit
fi

PYTHON_VERSION=3.11.6
sudo dnf install -y git make gcc patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2

# pyenv
if [ ! -d ~/.pyenv ] ; then
  curl https://pyenv.run | bash
fi

# only do once, if we have marked our territory leave alone
if grep -v ansiblenow ~/.bashrc ; then
  cat <<'EOM' >> ~/.bashrc
# ansiblenow was here...
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

EOM
fi

source ~/.bashrc

pyenv install ${PYTHON_VERSION}
PYTHON_ACTIVATE="pyenv global ${PYTHON_VERSION}"
echo $PYTHON_ACTIVATE >> ~/.bashrc

#!/bin/bash

# Compatibility:
#   cp-ansible 7.5.1

VENV=~/ansible_now_venv
python -mvenv $VENV

. $VENV/bin/activate
pip install ansible==7.7.0

cat <<EOM

**LOGOUT AND BACK IN AGAIN**

then run:
. $VENV/bin/activate

To enable ansible commands
EOM

