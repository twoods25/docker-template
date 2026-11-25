$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Force -Path backups | Out-Null
$timestamp = Get-Date -Format 'yyyy-MM-dd_HHmm'
$backupFile = "backups\$timestamp.sql"

docker compose exec -T db sh -c 'pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB"' | Set-Content -Path $backupFile -Encoding utf8NoBOM

if ($LASTEXITCODE -ne 0) {
    Remove-Item $backupFile -ErrorAction SilentlyContinue
    throw "Database backup failed!"
}

Write-Host "Backup saved to $backupFile"
