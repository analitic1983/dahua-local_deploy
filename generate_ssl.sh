#!/bin/bash

set -e

DOMAIN="camera.local"
CERT_DIR="./etc/nginx/ssl/camera.local"
CERT_FILE="$CERT_DIR/fullchain.pem"
KEY_FILE="$CERT_DIR/privkey.pem"

echo "▶ Checking for mkcert..."
if ! command -v mkcert >/dev/null 2>&1; then
  echo "mkcert not found. Please install it first:"
  echo "  macOS: brew install mkcert"
  echo "  Ubuntu: sudo apt install libnss3-tools && curl -JLO https://github.com/FiloSottile/mkcert/releases/latest/download/mkcert-$(uname -s)-$(uname -m)"
  echo "  Windows: choco install mkcert"
  exit 1
fi

echo "▶ Installing local CA if needed..."
mkcert -install

mkdir -p "$CERT_DIR"

echo "▶ Generating certificate for $DOMAIN..."
mkcert -cert-file "$CERT_FILE" -key-file "$KEY_FILE" "$DOMAIN"

echo "Certificate and key saved in $CERT_DIR:"
echo "   $CERT_FILE"
echo "   $KEY_FILE"

echo
echo "ℹ️ Add $DOMAIN to your /etc/hosts file:"
echo "  127.0.0.3 $DOMAIN"
