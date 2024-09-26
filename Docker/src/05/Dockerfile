FROM nginx:latest

WORKDIR /home/

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.c /home/server.c
COPY ./run.sh /home/run.sh

RUN apt-get -y update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    rm -rf /var/lib/apt/lists && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /var/cache/nginx && \
    
    chmod 777 /home && \
   chmod u-s /usr/bin/gpasswd && \
   chmod u-s /usr/bin/mount && \
   chmod u-s /usr/bin/newgrp && \
   chmod u-s /usr/bin/umount && \
   chmod u-s /usr/bin/chsh && \
   chmod u-s /usr/bin/chfn && \
   chmod u-s /usr/bin/passwd && \
   chmod u-s /usr/bin/su && \
   chmod u-s /usr/sbin/unix_chkpwd && \
   chmod g-s /usr/bin/wall && \
   chmod g-s /usr/bin/chage && \
   chmod g-s /usr/bin/expiry && \
   chmod 755 /usr/sbin/unix_chkpwd 

USER nginx

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1


ENTRYPOINT ["bash", "run.sh"]