#!/bin/bash

echo "[+] Installing pdfcracker..."

# Check if Python3 is installed
command -v python3 >/dev/null 2>&1 || {
    echo >&2 "Python3 is not installed. Aborting."; exit 1;
}

# Ensure required Python packages are installed
echo "[*] Checking Python dependencies..."

pip3 show pikepdf >/dev/null 2>&1 || {
    echo "[*] Installing pikepdf..."
    pip3 install pikepdf
}

pip3 show tqdm >/dev/null 2>&1 || {
    echo "[*] Installing tqdm..."
    pip3 install tqdm
}

# Make script executable and copy as command
chmod +x pdfcracker.py
cp pdfcracker.py pdfcracker
chmod +x pdfcracker
sudo mv pdfcracker /usr/local/bin/

echo "[+] Installation complete!"
echo "    ➤ You can now use 'pdfcracker' as a command:"
echo "    ➤ pdfcracker -h {for help}"
