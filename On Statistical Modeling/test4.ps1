$root = ".\"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " REMOVING REDUNDANT H1 HEADERS" -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

$mdFiles = Get-ChildItem -Path $root -Filter "*.md" -Recurse | Where-Object { $_.FullName -notmatch "88_Source_Material" }
$removedCount = 0

foreach ($file in $mdFiles) {
    $lines = Get-Content $file.FullName
    if ($null -eq $lines -or $lines.Count -eq 0) { continue }
    
    $newLines = @()
    $baseName = $file.BaseName
    $foundH1 = $false
    $inYaml = $false
    $modified = $false
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        
        # Track YAML Frontmatter
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
        
        # Look for the very first H1 Header
        if (-not $foundH1 -and $line -match "^#\s+(.*)") {
            $foundH1 = $true
            $headerText = $matches[1].Trim()
            
            # Strip all punctuation and spaces to do a "fuzzy" comparison
            $cleanHeader = $headerText -replace '[^\w]', ''
            $cleanBaseName = $baseName -replace '[^\w]', ''
            
            # If the header is inside the filename, or filename inside the header
            if ($cleanBaseName -match [regex]::Escape($cleanHeader) -or $cleanHeader -match [regex]::Escape($cleanBaseName)) {
                $modified = $true
                
                # Check if the next line is a dangling parenthesis leftover from a split title (e.g. "(Lemma 3.6)")
                if ($i + 1 -lt $lines.Count -and $lines[$i+1] -match "^\s*\((Theorem|Lemma|Corollary|Definition)") {
                    $lines[$i+1] = "" # Blank out the dangling math tag
                }
                continue # Skip adding the H1 header to the new file
            }
        }
        
        $newLines += $line
    }
    
    # If we deleted the title, we must clean up the empty whitespace left behind at the top
    if ($modified) {
        $yamlEnd = -1
        if ($newLines.Count -gt 0 -and $newLines[0] -match "^---") {
            for ($k = 1; $k -lt $newLines.Count; $k++) {
                if ($newLines[$k] -match "^---") {
                    $yamlEnd = $k
                    break
                }
            }
        }
        
        if ($yamlEnd -ge 0) {
            $cleanedLines = @()
            # 1. Keep YAML exactly as is
            for ($k = 0; $k -le $yamlEnd; $k++) { $cleanedLines += $newLines[$k] }
            
            # 2. Skip all immediate blank lines after YAML
            $contentStart = $yamlEnd + 1
            while ($contentStart -lt $newLines.Count -and $newLines[$contentStart].Trim() -eq "") {
                $contentStart++
            }
            
            # 3. Add exactly ONE blank line for breathing room, then the rest of the content
            if ($contentStart -lt $newLines.Count) {
                $cleanedLines += ""
                for ($k = $contentStart; $k -lt $newLines.Count; $k++) {
                    $cleanedLines += $newLines[$k]
                }
            }
            
            $newLines = $cleanedLines
        }
        
        # Save output cleanly formatted as UTF-8 (No BOM)
        $outString = $newLines -join "`r`n"
        [System.IO.File]::WriteAllText($file.FullName, $outString, $utf8NoBom)
        
        Write-Host "[-] Stripped redundant header from: $baseName" -ForegroundColor Yellow
        $removedCount++
    }
}

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Cleanup Complete! Removed redundant titles from $removedCount files." -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan