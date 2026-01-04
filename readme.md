
# 🐍 Python Installation & Package Management (Windows)

This guide explains how to **install Python correctly for all users** on Windows and how to **install packages online and offline** using the `python_pck` repository.

---

## 1️⃣ Install Python (For All Users)

### Download Python

Download Python from the official website:

```
https://www.python.org/downloads/windows/
```

### Installation options (IMPORTANT)

During installation:

* ✅ **Install for all users**
* ✅ **Add Python to PATH**
* ❌ Do NOT install via Microsoft Store

This installs Python under:

```
C:\Program Files\Python311\
```

---

## 2️⃣ Verify Python Installation

Open **Command Prompt** and run:

```bat
where python
```

### Expected output

```text
C:\Program Files\Python311\python.exe
```

Check version:

```bat
python --version
```

Example:

```text
Python 3.11.0
```

---

## 3️⃣ Understand Where Python Installs Packages

Python installs packages in different locations depending on how it is run.

### System-wide installation path (CORRECT)

```
C:\Program Files\Python311\Lib\site-packages
```

### User installation path

```
C:\Users\<username>\AppData\Roaming\Python\Python311\site-packages
```

To make packages available to **all users**, they must be installed in the **system-wide path**.

---

## 4️⃣ Install Packages ONLINE (Internet Access)

### Open Command Prompt as Administrator

Always run package installs as **Administrator**.

### Install a package

```bat
"C:\Program Files\Python311\python.exe" -m pip install requests
```

### Install multiple packages

```bat
"C:\Program Files\Python311\python.exe" -m pip install requests pandas openpyxl numpy
```

---

## 5️⃣ Verify Online Installation

```bat
"C:\Program Files\Python311\python.exe" -c "import requests, pandas, openpyxl, numpy; print('ALL OK')"
```

Check install location:

```bat
"C:\Program Files\Python311\python.exe" -c "import pandas; print(pandas.__file__)"
```

Expected:

```
C:\Program Files\Python311\Lib\site-packages\pandas\__init__.py
```

---

## 6️⃣ Install Packages OFFLINE (Using `python_pck` Repo)

### Clone or copy the repository

```bat
git clone https://github.com/shivamzoos/python_pck
```

Or copy the repository folder manually to the target machine.

---

### Repository structure

```
python_pck/
│
├── offline_packages/
│   ├── install.bat
│   ├── requirements.txt
│   └── *.whl
│
└── README.md
```

---

## 7️⃣ Clean Old Package Installations (Recommended)

Before offline installation, remove any existing packages:

```bat
"C:\Program Files\Python311\python.exe" -m pip uninstall -y ^
requests pandas openpyxl numpy ^
pytz python-dateutil et-xmlfile urllib3 ^
charset-normalizer idna certifi six tzdata
```

Optionally remove leftover user packages:

```bat
rmdir /s /q "C:\Users\<username>\AppData\Roaming\Python\Python311"
```

---

## 8️⃣ Install Packages OFFLINE (System-Wide)

Navigate to the offline package directory:

```bat
cd python_pck\offline_packages
```

Run **Command Prompt as Administrator** and execute:

```bat
"C:\Program Files\Python311\python.exe" -m pip install ^
 --no-index ^
 --find-links=. ^
 --ignore-installed ^
 -r requirements.txt
```

### What these flags do

| Flag                 | Description               |
| -------------------- | ------------------------- |
| `--no-index`         | Prevents internet usage   |
| `--find-links=.`     | Uses local wheel files    |
| `--ignore-installed` | Forces clean installation |

---

## 9️⃣ Verify Offline Installation

```bat
"C:\Program Files\Python311\python.exe" -c "import requests, pandas, openpyxl, numpy; print('ALL OK')"
```

Verify dependencies:

```bat
"C:\Program Files\Python311\python.exe" -c "import pytz, dateutil, et_xmlfile, urllib3; print('DEPS OK')"
```

---

## 🔍 Check Installed Package Paths

```bat
"C:\Program Files\Python311\python.exe" -c "import site; print(site.getsitepackages())"
```

Expected output:

```
['C:\\Program Files\\Python311',
 'C:\\Program Files\\Python311\\Lib\\site-packages']
```

---

## 🚫 Common Mistakes to Avoid

* ❌ Installing Python via Microsoft Store
* ❌ Running `pip install` without Administrator privileges
* ❌ Using `pip install --user`
* ❌ Mixing multiple Python installations
* ❌ Installing packages without verifying paths

---

## 🧠 Key Takeaway

> **Install Python for all users and install packages as Administrator.
> This ensures packages are available system-wide and usable by everyone.**

---

## ✅ Status

```
Python installed correctly
Packages installed system-wide
Online and offline installs supported
```

---
