
#!/bin/bash

openssl req -newkey rsa:2048 -nodes -keyout $CERTIFICICATES_KEYOUT -x509 -days 365 \
-out $CERTIFICICATES_OUT -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=$DOMAIN_NAME";

nginx -g "daemon off;"

exec "$@"
