$headers = @{
    "apikey" = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh1dXpnYm14ZnhwY3R5aGJpZm5pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYzNDE3NTQsImV4cCI6MjA4MTkxNzc1NH0.idlj01Y9rw7Gm5qZOp4hgfV4PbSwkSY26ZbWS75DA1Q"
    "Authorization" = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh1dXpnYm14ZnhwY3R5aGJpZm5pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYzNDE3NTQsImV4cCI6MjA4MTkxNzc1NH0.idlj01Y9rw7Gm5qZOp4hgfV4PbSwkSY26ZbWS75DA1Q"
}
try {
    $response = Invoke-RestMethod -Uri "https://xuuzgbmxfxpctyhbifni.supabase.co/rest/v1/books?select=*&limit=1" -Headers $headers -Method Get
    $response | ConvertTo-Json -Depth 5 | Out-File -FilePath "debug_output.json" -Encoding UTF8
    Write-Host "Done"
} catch {
    Write-Host "Error: $_"
}
