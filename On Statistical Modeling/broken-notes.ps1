$sourcePath = ".\" 
$outputFile = ".\BrokenNotesReport.txt"

if (Test-Path $outputFile) { Remove-Item $outputFile }

Write-Host "Scanning for corrupted/unopenable Obsidian notes..." -ForegroundColor Cyan

Add-Content -Path $outputFile -Value "=========================================" -Encoding UTF8
Add-Content -Path $outputFile -Value " REPORT: UNOPENABLE OBSIDIAN NOTES" -Encoding UTF8
Add-Content -Path $outputFile -Value "=========================================`n" -Encoding UTF8

$mdFiles = Get-ChildItem -Path $sourcePath -Filter "*.md" -Recurse -File
$brokenCount = 0

foreach ($file in $mdFiles) {
    # Read the raw bytes to check for null characters (0x00)
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    
    if ($bytes -contains 0x00) {
        $brokenCount++
        $basePath = (Resolve-Path $sourcePath).Path
        $relativePath = $file.FullName.Substring($basePath.Length).TrimStart('\')
        
        Write-Host "Found broken note: $relativePath" -ForegroundColor Yellow
        
        Add-Content -Path $outputFile -Value "--- START OF BROKEN FILE: $relativePath ---" -Encoding UTF8
        
        # Read the raw text. If it was saved as UTF-16, it will appear as text separated by nulls.
        # We strip the null bytes in memory so the output report is actually readable.
        $rawText = [System.IO.File]::ReadAllText($file.FullName)
        $salvagedText = $rawText.Replace("`0", "")
        
        Add-Content -Path $outputFile -Value $salvagedText -Encoding UTF8
        Add-Content -Path $outputFile -Value "`n--- END OF BROKEN FILE: $relativePath ---`n`n" -Encoding UTF8
    }
}

if ($brokenCount -eq 0) {
    Write-Host "No broken notes found! Your vault is clean." -ForegroundColor Green
    Add-Content -Path $outputFile -Value "No corrupted notes detected." -Encoding UTF8
} else {
    Write-Host "`nFound $brokenCount broken note(s). Content extracted to: $outputFile" -ForegroundColor Red
}