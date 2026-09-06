@echo off
chcp 65001 >nul
echo 作業日報アイコンを設定します...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$iconUrl='https://safety3163.github.io/nippo/nippo_icon2.ico'; $iconPath = Join-Path $env:LOCALAPPDATA 'nippo_icon2.ico'; try { Invoke-WebRequest -Uri $iconUrl -OutFile $iconPath -UseBasicParsing } catch { Write-Host 'アイコンのダウンロードに失敗しました。Wi-Fi接続を確認してください。'; exit 1 }; $shortcutPath = Join-Path ([Environment]::GetFolderPath('Desktop')) '作業日報システム.lnk'; $ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut($shortcutPath); $edgePath = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'; if (-not (Test-Path $edgePath)) { $edgePath = 'C:\Program Files\Microsoft\Edge\Application\msedge.exe' }; $sc.TargetPath = $edgePath; $sc.Arguments = 'https://safety3163.github.io/nippo/作業日報システム.html'; $sc.IconLocation = $iconPath; $sc.WindowStyle = 3; $sc.Save(); Write-Host '完了しました！デスクトップのショートカットが更新されました。'"
echo.
echo ウィンドウを閉じてデスクトップを確認してください。
pause
