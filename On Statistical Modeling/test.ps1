# Define the root path (current directory) and the output file name
$sourcePath = ".\" 
$outputFile = ".\MarkdownContextExport.txt"

# Remove the output file if it already exists from a previous run
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

Write-Host "Starting scan of directory..." -ForegroundColor Cyan

# ---------------------------------------------------------
# PART 1: Capture Folder and File Structure
# ---------------------------------------------------------
Add-Content -Path $outputFile -Value "=========================================" -Encoding UTF8
Add-Content -Path $outputFile -Value "1. FOLDER AND FILE STRUCTURE" -Encoding UTF8
Add-Content -Path $outputFile -Value "=========================================`n" -Encoding UTF8

Write-Host "Capturing folder structure..."
# Using the native Windows tree command
$treeOutput = tree.com /A /F $sourcePath
Add-Content -Path $outputFile -Value $treeOutput -Encoding UTF8

# ---------------------------------------------------------
# PART 2: Extract Markdown Content
# ---------------------------------------------------------
Add-Content -Path $outputFile -Value "`n`n=========================================" -Encoding UTF8
Add-Content -Path $outputFile -Value "2. MARKDOWN FILE CONTENTS" -Encoding UTF8
Add-Content -Path $outputFile -Value "=========================================`n" -Encoding UTF8

Write-Host "Scanning for .md files..."
# Recursively find all .md files
$mdFiles = Get-ChildItem -Path $sourcePath -Filter "*.md" -Recurse -File

if ($null -eq $mdFiles -or $mdFiles.Count -eq 0) {
    Add-Content -Path $outputFile -Value "No .md files found in the directory." -Encoding UTF8
    Write-Host "No .md files found." -ForegroundColor Yellow
} else {
    $fileCount = $mdFiles.Count
    Write-Host "Found $fileCount .md file(s). Extracting content..."
    
    foreach ($file in $mdFiles) {
        $basePath = (Resolve-Path $sourcePath).Path
        $relativePath = $file.FullName.Substring($basePath.Length).TrimStart('\')
        
        Add-Content -Path $outputFile -Value "--- START OF FILE: $relativePath ---" -Encoding UTF8
        
        if ($file.Length -gt 0) {
            $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
            Add-Content -Path $outputFile -Value $content -Encoding UTF8
            
            if (-not $content.EndsWith("`n")) {
                Add-Content -Path $outputFile -Value "" -Encoding UTF8 
            }
        } else {
            Add-Content -Path $outputFile -Value "[FILE IS EMPTY]" -Encoding UTF8
        }
        
        Add-Content -Path $outputFile -Value "--- END OF FILE: $relativePath ---`n`n" -Encoding UTF8
    } # <-- This closes the foreach loop
} # <-- This closes the else block

Write-Host "Export complete! Context successfully saved to: " -NoNewline -ForegroundColor Green
Write-Host $outputFile -ForegroundColor White