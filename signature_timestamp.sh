#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Enter it like this: bash $0 (txt file)"
    exit 1
fi

file_to_sign="$1"
timestamp="$(date +"%Y-%m-%d %H:%M:%S %Z %Y")"
signed_file="${file_to_sign%.txt}.signed.txt"
signature_file="${file_to_sign%.txt}.signature"

echo "Timestamp: $timestamp" >> "$file_to_sign"

openssl dgst -sha256 -sign private_key.pem -out "$signature_file" "$file_to_sign"

cat "$file_to_sign" "$signature_file" > "$signed_file"

echo "Signature and timestamp added to '$signed_file'."

