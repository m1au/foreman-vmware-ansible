#!/bin/bash
yum update -y
result=${PWD##*/}
export ANSIBLE_HOST_KEY_CHECKING=False
rpm -iUvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y ansible git vim
echo 127.0.0.1 > /$result/foreman
ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
cat << EOF > /$result/test.yml
---
- hosts: all
  remote_user: root
  tasks:
    - name: test connection
      ping:
      remote_user: root
EOF
ansible-playbook /$result/test.yml -i /$result/foreman
echo " ######"
echo ""
echo " if above test is successful please add following key to git, server will reboot in 15 seconds to apply patches"
echo ""
cat /root/.ssh/id_rsa.pub
echo ""
sleep 15
reboot
