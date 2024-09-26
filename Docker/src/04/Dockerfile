FROM nginx

WORKDIR /home/

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./server.c /home/server.c
COPY ./run.sh /home/run.sh

RUN apt-get -y update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    rm -rf /var/lib/apt/lists && \
    touch /var/run/nginx.pid
    
ENTRYPOINT ["sh", "run.sh"]