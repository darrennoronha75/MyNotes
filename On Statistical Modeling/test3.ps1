$root = ".\"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " VAULT REPAIR & CONFORMANCE PASS" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

$mdFiles = Get-ChildItem -Path $root -Filter "*.md" -Recurse | Where-Object { $_.FullName -notmatch "88_Source_Material" }

$repairedCount = 0
$fixedCount = 0

foreach ($file in $mdFiles) {
    $fileName = $file.BaseName
    
    # ---------------------------------------------------------
    # FIX 1: UNOPENABLE FILES (STRIP NULL BYTES & ENFORCE UTF-8)
    # ---------------------------------------------------------
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    if ($bytes -contains 0x00) {
        Write-Host "[REPAIRED] Corrupted encoding in: $fileName" -ForegroundColor Red
        $rawText = [System.IO.File]::ReadAllText($file.FullName)
        $cleanText = $rawText.Replace("`0", "")
        [System.IO.File]::WriteAllText($file.FullName, $cleanText, $utf8NoBom)
        $repairedCount++
    }
    
    # ---------------------------------------------------------
    # FIX 2: CONTENT CONFORMANCE
    # ---------------------------------------------------------
    $lines = Get-Content $file.FullName
    if ($null -eq $lines -or $lines.Count -eq 0) { continue }
    
    $newLines = @()
    $inCodeBlock = $false
    $skipNext = $false
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($skipNext) { $skipNext = $false; continue }
        
        $line = $lines[$i]
        
        # Track if we are inside a code block
        if ($line -match '^```') { $inCodeBlock = -not $inCodeBlock }
        
        # REPAIR: Revert \gamma back to \beta for Type II error and Power notes
        if ($fileName -match 'Type II Error|Statistical Power') {
            $line = $line -replace '\\gamma', '\beta'
        }

        # REPAIR: Remove Motivation & TODOs (especially if wrongly inside code blocks)
        if ($line -match '^## Motivation') {
            $j = $i + 1
            while ($j -lt $lines.Count -and $lines[$j].Trim() -eq '') { $j++ }
            if ($j -lt $lines.Count -and $lines[$j] -match 'TODO:') {
                $i = $j # Skip past the TODO entirely
                continue
            }
            # If we are inside an R code block, delete the stray Motivation header
            if ($inCodeBlock) { continue } 
        }
        if ($line -match '^TODO:') { continue }
        
        $newLines += $line
    }
    
    # ---------------------------------------------------------
    # FIX 3: RESTORE MISSING H1 TITLES
    # ---------------------------------------------------------
    # Find where the YAML frontmatter ends
    $contentStartIndex = 0
    if ($newLines.Count -gt 0 -and $newLines[0] -match '^---') {
        for ($k = 1; $k -lt $newLines.Count; $k++) {
            if ($newLines[$k] -match '^---') {
                $contentStartIndex = $k + 1
                break
            }
        }
    }
    
    # Check the first few lines of actual content for an H1 (# )
    $foundH1 = $false
    $searchLimit = [math]::Min($contentStartIndex + 5, $newLines.Count)
    for ($k = $contentStartIndex; $k -lt $searchLimit; $k++) {
        if ($newLines[$k] -match '^# ') { $foundH1 = $true; break }
    }
    
    # If no title exists, insert the filename as the title
    if (-not $foundH1 -and $fileName -notmatch 'MOC|Matrix') {
        $finalLines = @()
        for ($k = 0; $k -lt $contentStartIndex; $k++) { $finalLines += $newLines[$k] }
        $finalLines += ""
        $finalLines += "# $fileName"
        $finalLines += ""
        for ($k = $contentStartIndex; $k -lt $newLines.Count; $k++) { $finalLines += $newLines[$k] }
        $newLines = $finalLines
        Write-Host "[RESTORED] Missing Title in: $fileName" -ForegroundColor Yellow
        $fixedCount++
    }

    # Save output cleanly formatted as UTF-8 (No BOM) so Obsidian loves it
    $outString = $newLines -join "`r`n"
    [System.IO.File]::WriteAllText($file.FullName, $outString, $utf8NoBom)
}

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Repair Complete! $repairedCount files un-bricked. $fixedCount titles restored." -ForegroundColor Green
Write-Host " Obsidian should now open everything perfectly." -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan