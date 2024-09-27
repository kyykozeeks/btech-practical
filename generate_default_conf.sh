#!/bin/sh

CONF_FILE=/etc/nginx/conf.d/default.conf

# Jika folder conf.d kosong, buat default.conf
if [ ! -f "$CONF_FILE" ]; then
    echo "Creating default.conf as it does not exist"
    cat > $CONF_FILE <<EOL
server {
    listen ${NGINX_PORT};

    location / {
        proxy_pass ${REVERSE_HOST};
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOL
else
    echo "default.conf exists, skipping creation."
fi
