## Setup

### 1. Note

```bash
docker build -t nginx-reverse-proxy .
docker run -d -p 8080:80 -v $(pwd)/conf:/etc/nginx/conf.d -e NGINX_PORT=8080 -e REVERSE_HOST=http://info.cern.ch nginx-reverse-proxy


