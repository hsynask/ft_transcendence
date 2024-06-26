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

COPY . /app

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Generate SSL certificate with the correct CN
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=localhost"

RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --upgrade pip
RUN . venv/bin/activate && pip install -r ./backend_src/requirements.txt

RUN chmod +x /app/sh_tools/nginx.sh

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
