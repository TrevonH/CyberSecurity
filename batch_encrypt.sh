#!/bin/bash

public_key="public_key.pem"

if [ ! -f "$public_key" ]; then
    echo "Public key file not found."
    exit 1
fi

for file in *.txt; do
    if [ -f "$file" ]; then
        encrypted_file="${file%.txt}.encrypted"
        openssl pkeyutl -encrypt -pubin -inkey "$public_key" -in "$file" -out "$encrypted_file"
        echo "Encrypted '$file' to '$encrypted_file'"
    fi
done

echo "Encryption complete."

