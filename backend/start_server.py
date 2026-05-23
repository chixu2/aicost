import uvicorn
import sys
sys.path.insert(0, 'C:\\Users\\Administrator\\AppData\\Roaming\\TRAE SOLO CN\\ModularData\\ai-agent\\work-mode-projects\\6a0fb65b56c92673ac94d23f\\aicost-main\\backend')

if __name__ == "__main__":
    uvicorn.run("app.main:app", host="0.0.0.0", port=8000, reload=True)
