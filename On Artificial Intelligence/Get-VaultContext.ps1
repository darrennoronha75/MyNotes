# Set the execution location to the script's path
$rootPath = $PSScriptRoot
$outputFile = Join-Path $rootPath "_VAULT_CONTEXT_EXPORT.txt"

# Header for the output file
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
Set-Content -Path $outputFile -Value "VAULT CONTEXT EXPORT - $timestamp`n" -Encoding UTF8

# Get all folders and files, excluding .obsidian, .git, and non-md files
Write-Host "Scanning vault..." -ForegroundColor Cyan

$files = Get-ChildItem -Path $rootPath -Recurse -File | 
    Where-Object { 
        $_.Extension -eq ".md" -and 
        $_.FullName -notmatch "\\\." -and # Excludes .obsidian, .git hidden folders
        $_.Name -ne "_VAULT_CONTEXT_EXPORT.txt" 
    }

$totalFiles = $files.Count
$current = 0

foreach ($file in $files) {
    $current++
    # Get relative path (e.g., \Formalizations\Logic\Syntax.md)
    $relativePath = $file.FullName.Substring($rootPath.Length)
    
    Write-Host "Processing [$current/$totalFiles]: $relativePath" -ForegroundColor Green

    # Format the header for the LLM to recognize the file start
    $header = "`n`n<<<<< START FILE: $relativePath >>>>>`n"
    
    # Read the content
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8

    # Append to the export file
    Add-Content -Path $outputFile -Value $header -Encoding UTF8
    Add-Content -Path $outputFile -Value $content -Encoding UTF8
    Add-Content -Path $outputFile -Value "`n<<<<< END FILE >>>>>" -Encoding UTF8
}

Write-Host "`nDone! Context saved to: $outputFile" -ForegroundColor Yellow
Write-Host "Please upload '_VAULT_CONTEXT_EXPORT.txt' to the chat." -ForegroundColor Yellow
Start-Sleep -Seconds 3