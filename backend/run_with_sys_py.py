#!/usr/bin/env python3
import sys
import os

# 添加项目路径
sys.path.insert(0, r'C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a0fb65b56c92673ac94d23f\aicost-main\backend')

# 添加 site-packages 路径
site_packages = r'C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\vm\tools\python\Lib\site-packages'
if site_packages not in sys.path:
    sys.path.insert(0, site_packages)

# 导入并运行 uvicorn
from uvicorn.main import main

if __name__ == "__main__":
    sys.argv = ["uvicorn", "app.main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]
    main()
