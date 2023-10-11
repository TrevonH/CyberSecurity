#!/bin/bash

if [ ! -f "private_key.pem" ]; then
    echo "Private key file not found."
    exit 1
fi

for file in *.encrypted; do
    if [ -f "$file" ]; then
        decrypted_file="${file%.encrypted}.decrypted.txt"
        openssl pkeyutl  -decrypt -inkey private_key.pem -in "$file" -out "$decrypted_file"
        echo "Decrypted $file to $decrypted_file"
    fi
done

echo "Decryption complete."

