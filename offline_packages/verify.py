#!/usr/bin/env python3
"""Verify SysTrack Dependencies Installation"""

import sys

def verify():
    print("="*60)
    print("SysTrack Dependencies Verification")
    print("="*60)
    print()
    
    # Check Python version
    py_version = sys.version_info
    print(f"Python Version: {py_version.major}.{py_version.minor}.{py_version.micro}")
    
    if py_version.major != 3 or py_version.minor != 11:
        print("⚠️  Warning: Expected Python 3.11.x")
    print()
    
    # Package verification
    packages = [
        ("requests", "2.31.0"),
        ("urllib3", "2.1.0"),
        ("pandas", "2.1.4"),
        ("openpyxl", "3.1.2"),
        ("numpy", "1.26.3"),
        ("python_dateutil", "2.8.2"),
        ("pytz", "2024.1"),
    ]
    
    all_ok = True
    
    print("Package Verification:")
    print("-" * 60)
    
    for pkg_name, expected_version in packages:
        try:
            module = __import__(pkg_name)
            actual_version = getattr(module, '__version__', 'unknown')
            
            if actual_version == expected_version:
                status = "✅"
            else:
                status = "⚠️"
                all_ok = False
            
            print(f"{status} {pkg_name:20} Expected: {expected_version:10} Actual: {actual_version}")
            
        except ImportError:
            print(f"❌ {pkg_name:20} NOT INSTALLED")
            all_ok = False
    
    print("="*60)
    
    if all_ok:
        print("✅ All dependencies installed correctly!")
        print("✅ Ready to run sv_health_desktop.py")
        return 0
    else:
        print("⚠️  Some packages have issues")
        print("   Run: py -3.11 -m pip install --no-index --find-links=. -r requirements.txt")
        return 1

if __name__ == "__main__":
    sys.exit(verify())
