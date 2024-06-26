#!/bin/bash

# Generate self-signed SSL certificate
openssl req -newkey rsa:2048 -nodes -keyout "$CERTIFICICATES_KEYOUT" -x509 -days 365 \
    -out "$CERTIFICICATES_OUT" -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=$DOMAIN_NAME"

# Start nginx in the foreground with daemon off
nginx -g "daemon off;"
