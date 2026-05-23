$pythonPath = "C:\Users\Administrator\AppData\Local\Programs\Python\Python312"
if (-not (Test-Path $pythonPath)) {
    Write-Host "Python 3.12 not found at expected location. Searching..."
    $pythonExe = Get-ChildItem -Path "C:\Users\Administrator\AppData\Local" -Recurse -Filter "python.exe" -ErrorAction SilentlyContinue | Where-Object { $_.FullName -notmatch "WindowsApps" } | Select-Object -First 1
    if ($pythonExe) {
        $pythonPath = $pythonExe.Directory.FullName
    }
}

$env:PATH = "$pythonPath;$env:PATH"
$env:PYTHONPATH = "C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a0fb65b56c92673ac94d23f\aicost-main\backend"

cd "C:\Users\Administrator\AppData\Roaming\TRAE SOLO CN\ModularData\ai-agent\work-mode-projects\6a0fb65b56c92673ac94d23f\aicost-main\backend"

& "$pythonPath\python.exe" -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
