$root = ".\"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " FINAL POLISH: SEMANTIC BUCKETS & SPACING" -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

# ---------------------------------------------------------
# STEP 1: DYNAMIC FOLDER RENAMING (Bottom-Up)
# ---------------------------------------------------------
Write-Host "1. Stripping alphanumeric prefixes from subfolders..." -ForegroundColor Yellow

# Get all directories, sort by length descending (deepest first) to avoid path invalidation
$folders = Get-ChildItem -Path $root -Directory -Recurse | 
           Sort-Object -Property @{Expression={$_.FullName.Length}; Descending=$true}

foreach ($folder in $folders) {
    # Regex looks for patterns like '01A_' or '04A1_' at the start of the folder name
    if ($folder.Name -match "^0[1-5][A-Z]\d?_(.*)$") {
        $cleanName = $matches[1]
        Rename-Item -Path $folder.FullName -NewName $cleanName -Force
        Write-Host "   -> Renamed: [$($folder.Name)] -> [$cleanName]" -ForegroundColor Green
    }
}

# ---------------------------------------------------------
# STEP 2: HEADER BREATHING ROOM (Markdown Formatting)
# ---------------------------------------------------------
Write-Host "`n2. Enforcing Header Breathing Room (Blank lines above/below headers)..." -ForegroundColor Yellow

$mdFiles = Get-ChildItem -Path $root -Filter "*.md" -Recurse | Where-Object { $_.FullName -notmatch "88_Source_Material" }

foreach ($file in $mdFiles) {
    $lines = Get-Content $file.FullName
    if ($null -eq $lines -or $lines.Count -eq 0) { continue }
    
    $newLines = @()
    $inYaml = $false
    $modified = $false
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        
        # 1. Protect YAML Frontmatter
        if ($i -eq 0 -and $line -match "^---") {
            $inYaml = $true
            $newLines += $line
            continue
        }
        if ($inYaml -and $line -match "^---") {
            $inYaml = $false
            $newLines += $line
            continue
        }
        if ($inYaml) {
            $newLines += $line
            continue
        }
        
        # 2. Check if the line is a Header (#, ##, ###, etc.)
        if ($line -match "^#{1,6}\s+") {
            
            # Ensure blank line BEFORE the header (if it's not the very first line of content)
            if ($newLines.Count -gt 0 -and $newLines[-1].Trim() -ne "") {
                $newLines += ""
                $modified = $true
            }
            
            $newLines += $line
            
            # Ensure blank line AFTER the header (if the next line isn't already blank)
            if ($i + 1 -lt $lines.Count -and $lines[$i+1].Trim() -ne "") {
                $newLines += ""
                $modified = $true
            }
            
        } else {
            $newLines += $line
        }
    }
    
    # Save file if we added breathing room
    if ($modified) {
        $outString = $newLines -join "`r`n"
        [System.IO.File]::WriteAllText($file.FullName, $outString, $utf8NoBom)
    }
}

Write-Host "   -> Formatting complete! All headers now have adequate spacing." -ForegroundColor Green

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Vault Polish Complete! It is now a clean, semantic Zettelkasten." -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan