echo updating haproxy config with marathon at $MARATHON_ADDR ...
haproxy-marathon-bridge $MARATHON_ADDR > /usr/local/etc/haproxy/haproxy.cfg
echo reloading haproxy...
haproxy -p /var/run/haproxy.pid  -f /usr/local/etc/haproxy/haproxy.cfg -sf $(cat /var/run/haproxy.pid)
echo done.