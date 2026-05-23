$env:PYTHONPATH = 'C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a0fb65b56c92673ac94d23f\aicost-main\backend'
cd 'C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a0fb65b56c92673ac94d23f\aicost-main\backend'
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
