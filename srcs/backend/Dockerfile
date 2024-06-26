FROM debian:oldstable-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

EXPOSE 80

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    python3 \
    python3-pip \
    python3-venv \
    openssl \
    supervisor

WORKDIR /app

COPY backend_src /app

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --upgrade pip
RUN . venv/bin/activate && pip install -r requirements.txt

ENTRYPOINT ["./sh_tools/nginx.sh"]

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
