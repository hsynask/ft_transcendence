FROM debian:oldstable-slim

EXPOSE 443

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    supervisor

WORKDIR /app

COPY . /app
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod +x /app/sh_tools/nginx.sh


ENTRYPOINT ["/bin/bash", "/app/sh_tools/nginx.sh"]

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

#CMD ["/bin/bash", "/app/sh_tools/nginx.sh"]