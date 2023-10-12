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