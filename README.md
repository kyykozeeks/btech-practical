## Setup

### Task 1

```bash
docker build -t nginx-reverse-proxy .
docker run -d -p 8080:80 -v $(pwd)/conf:/etc/nginx/conf.d -e NGINX_PORT=8080 -e REVERSE_HOST=http://info.cern.ch nginx-reverse-proxy
```
### Task 2

```bash
kubectl apply -f config-kubernetes.yaml
kubectl get pods
kubectl get svc
kubectl get ingress
```
1. Dapatkan IP Minikube
Jalankan perintah berikut untuk mendapatkan IP Minikube:
```bash
minikube ip
```
Hasil dari perintah ini akan menunjukkan IP dari Minikube, misalnya 192.168.49.2.

3. Edit /etc/hosts
Pada sistem berbasis Linux atau Mac, Anda dapat mengedit file /etc/hosts dengan hak akses superuser (root).
```bash
sudo nano /etc/hosts
```
Kemudian tambahkan entri seperti berikut ini di bagian akhir file:

192.168.49.2   example.com

Penjelasan:
192.168.49.2: Ini adalah IP dari Minikube (atau Kubernetes cluster Anda).

example.com: Domain yang akan Anda gunakan dalam konfigurasi Ingress di Kubernetes.

Berikut adalah cara menginstal Nginx Ingress controller di Minikube:

```bash
minikube addons enable ingress
```
Uji koneksi ke domain tujuan
```bash
curl http://example.com
