import pikepdf
import itertools
import string
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor, as_completed

# ----------------- Password Generators ------------------

def generate_passwords(chars, min_length, max_length):
    for length in range(min_length, max_length + 1):
        for password in itertools.product(chars, repeat=length):
            yield ''.join(password)

def load_passwords(wordlist_file):
    with open(wordlist_file, 'r', encoding='utf-8') as file:
        for line in file:
            yield line.strip()

# ----------------- Password Attempt ------------------

def try_password(pdf_file, password):
    try:
        with pikepdf.open(pdf_file, password=password):
            return password
    except pikepdf._core.PasswordError:
        return None
    except Exception as e:
        return None

# ----------------- PDF Decryption ------------------

def decrypt_pdf(pdf_file, passwords, max_workers=4, total_passwords=None):
    found_password = None

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {executor.submit(try_password, pdf_file, pwd): pwd for pwd in passwords}

        with tqdm(total=total_passwords, desc="Decrypting PDF", unit="password") as pbar:
            for future in as_completed(futures):
                pbar.update(1)
                result = future.result()
                if result:
                    found_password = result
                    break

    if found_password:
        print(f"[+] Password found: {found_password}")
        return found_password
    else:
        print("[-] Unable to decrypt PDF. Password not found.")
        return None

# ----------------- Entry Point ------------------

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Decrypt a password-protected PDF file.')
    parser.add_argument('pdf_file', help='Path to the password-protected PDF file')
    parser.add_argument('-w', '--wordlist', help='Path to the password list file')
    parser.add_argument('-g', '--generate', action='store_true', help='Generate passwords on the fly')
    parser.add_argument('-mn', '--min_length', type=int, default=1, help='Minimum length of generated passwords')
    parser.add_argument('-mx', '--max_length', type=int, default=3, help='Maximum length of generated passwords')
    parser.add_argument('--charset', type=str, default=string.ascii_letters + string.digits, help='Characters to use for password generation')
    parser.add_argument('--max_workers', type=int, default=4, help='Maximum number of parallel threads')

    args = parser.parse_args()

    if args.generate:
        passwords = generate_passwords(args.charset, args.min_length, args.max_length)
        total_passwords = sum(len(args.charset) ** i for i in range(args.min_length, args.max_length + 1))
    elif args.wordlist:
        passwords = load_passwords(args.wordlist)
        with open(args.wordlist, 'r', encoding='utf-8') as f:
            total_passwords = sum(1 for _ in f)
    else:
        print("Either --wordlist must be provided or --generate must be specified.")
        exit(1)

    decrypt_pdf(args.pdf_file, passwords, args.max_workers, total_passwords)
