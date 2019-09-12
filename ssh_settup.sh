#!/bin/bash
mkdir /root/.ssh
PROJECT_DIR="/project"
echo -e $PLUGIN_PUBLICKEY > /root/.ssh/id_rsa.pub
echo -e $PLUGIN_PRIVATEKEY > /root/.ssh/id_rsa
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
echo -e "Host *\n\tStrictHostKeyChecking no\n\tIdentityFile /root/.ssh/id_rsa\n\tAddKeysToAgent yes\n" > /root/.ssh/config