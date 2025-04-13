#!/bin/bash

# Set target path
TARGET="/usr/local/bin/pdfcracker"
SCRIPT_NAME="pdf_cracker.py"

echo "[*] Installing pdfcracker..."

# Ensure script is executable
chmod +x "$SCRIPT_NAME"

command -v python3 >/dev/null 2>&1 || {
    echo >&2 "Python3 is not installed. Aborting."; exit 1;
}

# Add shebang line to the script if not present
if ! head -n 1 "$SCRIPT_NAME" | grep -q "python3"; then
    sed -i '1i#!/usr/bin/env python3' "$SCRIPT_NAME"
fi

# Copy script to /usr/local/bin
sudo cp "$SCRIPT_NAME" "$TARGET"

# Install required Python packages
echo "[*] Installing required Python packages..."
pip3 install --user pikepdf tqdm

# Ensure pikepdf & tqdm is installed
pip3 show pikepdf >/dev/null 2>&1 || {
    echo "[*] Installing required Python packages..."
    pip3 install pikepdf
}

pip3 show tqdm >/dev/null 2>&1 || {
    echo "[*] Installing required Python packages..."
    pip3 install tqdm
}

echo "[+] pdfcracker installed successfully!"
echo "    ➤ You can now run it :"
echo "    ➤ pdf_cracker -h (for help)"
