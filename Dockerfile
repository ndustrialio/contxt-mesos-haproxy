FROM haproxy:1.5

COPY ./haproxy-marathon-bridge /usr/local/bin/haproxy-marathon-bridge

RUN apt-get update && \
    apt-get install -y curl cron 

ADD *.sh /root/

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

ADD crontab /var/spool/cron/crontabs/root
RUN chmod 0600 /var/spool/cron/crontabs/root
RUN chown root:crontab /var/spool/cron/crontabs/root
 
CMD haproxy-marathon-bridge $MARATHON_ADDR > /usr/local/etc/haproxy/haproxy.cfg && env > /root/env.sh && crontab -l > mycron && crontab mycron && cron && haproxy -db -f /usr/local/etc/haproxy/haproxy.cfg

EXPOSE 10000-10100