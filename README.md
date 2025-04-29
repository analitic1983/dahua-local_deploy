# Dahua loader local_deploy

Local deploy for dahua downloader

For correct work:

1. Add to /etc/hosts 

    127.0.0.3 camera.local

2. Generate ssl

    ./generate_ssl.sh

3. Install certs

    mkcert -install