# SysTrack Desktop Health Monitor - Production Dependencies
# Python Version: 3.11.0
# Generated: 2026-01-03
# Installation: pip install -r requirements.txt

# Core HTTP and API handling
requests==2.31.0
urllib3==2.1.0

# Excel/CMDB processing (optimized for Python 3.11)
pandas==2.1.4
openpyxl==3.1.2

# Required by pandas (Python 3.11 compatible)
numpy==1.26.3
python-dateutil==2.8.2
pytz==2024.1
tzdata==2023.4

# Required by openpyxl
et-xmlfile==1.1.0

# Required by requests
charset-normalizer==3.3.2
idna==3.6
certifi==2023.11.17
