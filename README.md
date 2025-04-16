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



### NOW GO TO THE PDF's FOLDER WHICH YOU WANT TO CRACK

## ✅ FOR HELP / OPTIONS :
```bash
pdfcracker -h
```

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




## 🗂 Notes

### Make sure the input PDF exists and is a valid PDF.

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
### Python 3.x

### pikepdf

### tqdm

### If not already installed, the tool will install pikepdf and tqdm automatically via install_pdfcracker.sh

##

## 🪪 License
### This project is licensed under the MIT License.
### Feel free to fork, modify, and share — just give credit where it’s due!

##


## 🙌 Author
### Made with ❤️ by Shadow-bytes007