

```markdown
# 🐍 python_pck — Correct Python Package Installation (Windows)

> **Offline & Production-safe Python package installation for Windows**
>
> Designed to work with:
> - Windows Task Scheduler
> - SYSTEM / service accounts
> - Air-gapped environments
> - Enterprise production servers

---

## 🚨 Why this repository exists

On Windows, **Python packages installed for a user do NOT work for Task Scheduler**.

### ❌ Common mistake
Packages get installed here:
```

C:\Users<username>\AppData\Roaming\Python\Python311\site-packages

```

Task Scheduler runs as:
```

SYSTEM / service account

```

➡️ Result:
- Script works **manually**
- Script **fails in Task Scheduler**
- `ModuleNotFoundError` despite packages being “installed”

---

## ✅ Correct installation target (MANDATORY)

All packages **must be installed system-wide**:

```

C:\Program Files\Python311\Lib\site-packages

```

Only this location is visible to:
- Task Scheduler
- SYSTEM
- Windows services

---

## 📋 System Requirements

| Requirement | Value |
|------------|------|
| OS | Windows 10 / Windows Server 2019+ |
| Python | **3.11.x (system-wide)** |
| Privileges | Administrator |
| Network | Offline / air-gapped supported |

---

## 📁 Repository Structure

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

## 1️⃣ Install Python (System-wide)

Download from:
```

[https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)

````

During installation:
- ✔ Install **for all users**
- ✔ Add Python to **SYSTEM PATH**

### Verify
```bat
where python
python --version
pip --version
````

---

## 2️⃣ Remove user-scope packages (CRITICAL)

Run **Command Prompt as Administrator**:

```bat
"C:\Program Files\Python311\python.exe" -m pip uninstall -y ^
requests pandas openpyxl numpy ^
pytz python-dateutil et-xmlfile urllib3 ^
charset-normalizer idna certifi six tzdata
```

Remove leftover user packages:

```bat
rmdir /s /q "C:\Users\<username>\AppData\Roaming\Python\Python311"
```

> This prevents pip from reusing user-scope dependencies.

---

## 3️⃣ Install packages SYSTEM-WIDE (Offline)

Navigate to:

```bat
cd python_pck\offline_packages
```

Run **as Administrator**:

```bat
"C:\Program Files\Python311\python.exe" -m pip install ^
 --no-index ^
 --find-links=. ^
 --ignore-installed ^
 -r requirements.txt
```

### Why these flags matter

| Flag                 | Purpose                    |
| -------------------- | -------------------------- |
| `--no-index`         | No internet required       |
| `--find-links=.`     | Uses local wheel files     |
| `--ignore-installed` | Forces system-wide install |
| Admin shell          | Writes to Program Files    |

---

## 4️⃣ Verify installation

### Core packages

```bat
"C:\Program Files\Python311\python.exe" -c "import requests, pandas, openpyxl, numpy; print('ALL OK')"
```

### Dependencies

```bat
"C:\Program Files\Python311\python.exe" -c "import pytz, dateutil, et_xmlfile, urllib3; print('DEPS OK')"
```

### Expected path

All modules **must resolve to**:

```
C:\Program Files\Python311\Lib\site-packages
```

❌ `AppData\Roaming` → incorrect
✅ `Program Files\Python311` → correct

---

## ⏱ Task Scheduler Compatibility

### Best practices

* Always call Python by **absolute path**
* Prefer **PowerShell wrappers**
* Recreate tasks after environment changes

Example:

```powershell
"C:\Program Files\Python311\python.exe" script.py
```

---

## 🚫 Common mistakes (DO NOT DO THESE)

❌ `pip install --user`
❌ Installing without Administrator privileges
❌ Relying on PATH for Python
❌ Mixing user-scope and system-scope packages
❌ Assuming manual run == scheduler run

---

## ✅ Final Outcome

After following this guide:

* ✔ Manual execution works
* ✔ Task Scheduler works
* ✔ SYSTEM account works
* ✔ Offline environments supported
* ✔ No `ModuleNotFoundError`

---

## 🧠 Key Takeaway

> **On Windows, Task Scheduler can only see system-wide Python packages.
> User-installed packages will always break scheduled jobs.**

---

## 📌 Recommended Standard

* Install Python under `Program Files`
* Install packages as Administrator
* Use `--ignore-installed` for offline installs
* Recreate scheduled tasks after changes

---

## 🏁 Status

```
✅ PRODUCTION READY
Python → Packages → Scheduler → Stable
```

**Maintained by Zoos / EXL Engineering**

```

---

### If you want next
I can:
- Add a **TL;DR Quick Start**
- Add a **Troubleshooting section**
- Add **CI validation**
- Add **Linux/macOS appendix**
- Convert this into a **company-wide SOP**

Just tell me 👍
```
