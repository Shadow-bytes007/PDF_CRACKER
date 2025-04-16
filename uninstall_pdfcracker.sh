#!/bin/bash

echo "[*] Uninstalling pdfcracker..."

if [ -f /usr/local/bin/pdfcracker ]; then
    sudo rm /usr/local/bin/pdfcracker
    echo "[+] pdfcracker removed."
else
    echo "[-] pdfcracker not found in /usr/local/bin"
fi
