#!/bin/bash

TARGET="/usr/local/bin/pdfcracker"

echo "[*] Uninstalling pdfcracker..."

if [ -f "$TARGET" ]; then
    sudo rm "$TARGET"
    echo "[+] pdfcracker removed from $TARGET"
else
    echo "[-] pdfcracker not found at $TARGET"
fi
