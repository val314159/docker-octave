#!/bin/bash
echo START
/usr/sbin/sshd -p 2222 -f /etc/ssh/sshd_config
echo END START1
sleep 3600
echo END START
