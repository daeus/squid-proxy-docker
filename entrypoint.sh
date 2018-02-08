#!/bin/bash
ALLOWED_IP_ARR=($ALLOWED_IP)

for IP in ${ALLOWED_IP_ARR[@]}
  do echo "${IP}" >> ${SQUID_CONF_DIR}/whitelist-ip.conf
done

# Create swap file
/usr/sbin/squid -z -F 

# Spin up squid
/usr/sbin/squid -N -s -l local5
