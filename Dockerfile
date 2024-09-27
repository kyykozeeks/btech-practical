# Menggunakan base image nginx:alpine
FROM nginx:alpine

# Set environment variables default
ENV NGINX_PORT=80 \
    REVERSE_HOST=http://info.cern.ch

# Menambahkan skrip untuk mengisi default.conf secara dinamis
COPY generate_default_conf.sh /usr/local/bin/generate_default_conf.sh
RUN chmod +x /usr/local/bin/generate_default_conf.sh

# Memastikan folder conf.d ada dan digunakan sebagai volume
VOLUME /etc/nginx/conf.d

# Skrip entrypoint untuk membuat default.conf jika belum ada
ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/generate_default_conf.sh && nginx -g 'daemon off;'"]
