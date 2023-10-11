if [ $# -ne 2 ]; then
    echo "Type like this: $0 (signed_file) (public_key)"
    exit 1
fi

signed_file="$1"
public_key="$2"
signature_file="${signed_file%.signed.txt}.signature"

if openssl dgst -sha256 -verify "$public_key" -signature "$signature_file" "$signed_file" >/dev/null 2>&1; then
    echo "Signature is valid."
    timestamp_line=$(grep "Timestamp:" "$signed_file")
    timestamp="${timestamp_line#Timestamp: }"
    echo "Timestamp: $timestamp"
else
    echo "Signature is not valid."
fi

