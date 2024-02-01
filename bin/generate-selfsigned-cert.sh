#!/bin/bash

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=GB/ST=London/L=London/O=Example/OU=Example/CN=example.com" \
    --keyout self-signed.key -out self-signed.crt
