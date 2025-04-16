# 🔐 PDFCracker

PDFCracker is a simple and efficient command-line tool for brute-forcing password-protected PDF files. It supports both wordlist-based and character-set-based password generation.

---

## 🚀 Features

- 🔑 Decrypt password-protected PDFs using:
  - A custom wordlist
  - Brute-force password generation
- 💻 Multithreaded for faster performance
- 🧰 Works on Unix/Linux systems
- 📦 Easy installation via `install_pdfcracker.sh`

---

## 🛠 Installation



### 🔧 Step 1: Clone the Repository


```bash
git clone https://github.com/Shadow-bytes007/PDF_CRACKER.git
 ```


### 🛠 Step 2: Make Installer Executable and Run It 


```bash
cd PDF_CRACKER
chmod +x install_pdfcracker.sh
./install_pdfcracker.sh
```

## 🚀 Usage

## ⚠️ Notes

### - You don't need to be in the same directory as the PDF to crack it — as long as you provide the correct path to the file.

### - Performance Tip: Brute-force can be slow for large length/charset combinations. Use wisely.

### - Thread Count: Default is 4. You can adjust with --max_workers.



## ✅ FOR HELP / OPTIONS :
```bash
pdfcracker -h
```
## Available Options
### Option | Description
### > --wordlist | Path to your custom wordlist
### > --generate | Enable brute-force mode with generated passwords
### > --min_length | Minimum password length (brute-force mode)
### > --max_length | Maximum password length (brute-force mode)
### > --charset | Characters to include in brute-force attempts
### > --max_workers | Number of threads to speed up cracking

### 1. Crack with a Wordlist
```bash
pdfcracker --wordlist rockyou.txt  yourfile.pdf
```

### 2.Brute Force with Character Set
```bash
pdfcracker -g -mn <minium length > -mx <max length > --charset <charactersets to generate > <yOur file.pdf >
```
### EXAMPLE
```bash
pdfcracker -g -mn 1 -mx 4 --charset abc123 yourfile.pdf
```






## ❌ Uninstallation
### To remove the tool from your system, run the uninstall script:

```bash
cd PDF_CRACKER/
chmod +x uninstall_pdfcracker.sh
./uninstall_pdfcracker.sh
```

### To remove the cloned file 

```bash
cd .. ; rm -r PDF_CRACKER && y  
```

## 🧰 Requirements
### > Python 3.x

### > pikepdf

### > tqdm

### If not already installed, the tool will install pikepdf and tqdm automatically via install_pdfcracker.sh

## ⚠️ Disclaimer
### This tool is intended for educational and authorized testing purposes only. Do not use it on PDFs you do not own or have explicit permission to access.



## 🪪 License
### This project is licensed under the MIT License.
### Feel free to fork, modify, and share — just give credit where it’s due!

##


## 🙌 Author
### Made with ❤️ by Shadow-bytes007