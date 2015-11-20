echo updating haproxy config with marathon at $MARATHON_ADDR
haproxy-marathon-bridge $MARATHON_ADDR > /usr/local/etc/haproxy/haproxy.cfg