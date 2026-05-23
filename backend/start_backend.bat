@echo off
cd /d "C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a0fb65b56c92673ac94d23f\aicost-main\backend"
set PYTHONPATH=C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a0fb65b56c92673ac94d23f\aicost-main\backend
"C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\vm\tools\python\Scripts\uvicorn.exe" app.main:app --reload --host 0.0.0.0 --port 8000
pause
