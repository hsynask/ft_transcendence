FROM debian:oldstable-slim

EXPOSE 443

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl \
    supervisor

WORKDIR /app

COPY frontend_src /app
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./sh_tools/env.sh /app

ENTRYPOINT ["./sh_tools/nginx.sh"]

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]