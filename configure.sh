#!/bin/sh

_step_counter=0
step() {
  _step_counter=$(( _step_counter + 1 ))
  printf '\n\033[1;36m%d) %s\033[0m\n' $_step_counter "$@" >&2  # bold cyan
}

step 'Set up timezone'
setup-timezone -z UTC

step 'Set up networking'
cat > /etc/network/interfaces <<-EOF
    iface lo inet loopback
    iface eth0 inet dhcp
EOF
ln -s networking /etc/init.d/net.lo
ln -s networking /etc/init.d/net.eth0

step 'Enable services'
rc-update add docker boot

