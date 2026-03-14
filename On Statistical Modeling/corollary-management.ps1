$root = ".\"
$targetFolders = @("04_Statistical_Models", "05_Theorems_and_Proofs")

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " PHASE 3: MATH NAMING & TAG INJECTION" -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

foreach ($folder in $targetFolders) {
    $fullPath = Join-Path $root $folder
    if (-not (Test-Path $fullPath)) { continue }

    $files = Get-ChildItem -Path $fullPath -Filter "*.md" -Recurse

    foreach ($file in $files) {
        $fileName = $file.Name
        $newName = $fileName
        $mathType = $null

        # Pattern 1: Catch files that start with the Math term (e.g. "Theorem 3.10 - Concept.md")
        if ($fileName -match "^(Theorem|Lemma|Corollary)\s+([\d\.]+)\s*-\s*(.*)\.md$") {
            $type = $matches[1]
            $num = $matches[2]
            $concept = $matches[3]
            $newName = "$concept ($type $num).md"
            $mathType = $type.ToLower()
        }
        # Pattern 2: Catch files already correctly formatted (e.g. "Concept (Corollary 3.14).md")
        elseif ($fileName -match "^(.*)\s+\((Theorem|Lemma|Corollary)\s+([\d\.]+)\)\.md$") {
            $mathType = $matches[2].ToLower()
        }

        # If it's a math note, process its internal content
        if ($mathType) {
            $content = Get-Content $file.FullName -Raw
            $contentModified = $false
            
            # 1. Align the internal H1 Header to match the new format
            if ($content -match "(?m)^#\s+(Theorem|Lemma|Corollary)\s+([\d\.]+)\s*-\s*(.*)") {
                $content = $content -replace '(?m)^#\s+(Theorem|Lemma|Corollary)\s+([\d\.]+)\s*-\s*(.*)', '# $3 ($1 $2)'
                $contentModified = $true
            }
            
            # 2. Inject the structural tag into YAML frontmatter
            if ($content -match "(?m)^tags:\s*\[(.*?)\]") {
                $existingTags = $matches[1]
                if ($existingTags -notmatch "\b$mathType\b") {
                    $newTags = if ($existingTags.Trim() -eq "") { $mathType } else { "$existingTags, $mathType" }
                    $content = $content -replace '(?m)^tags:\s*\[.*?\]', "tags: [$newTags]"
                    $contentModified = $true
                }
            }

            # 3. Save modified content
            if ($contentModified) {
                Set-Content -Path $file.FullName -Value $content -Encoding UTF8
            }

            # 4. Rename the actual file
            if ($fileName -ne $newName) {
                Rename-Item -Path $file.FullName -NewName $newName
                Write-Host "   -> Flipped & Tagged: [$fileName] -> [$newName]" -ForegroundColor Green
            } elseif ($contentModified) {
                Write-Host "   -> Tag Injected:     [$fileName]" -ForegroundColor Yellow
            }
        }
    }
}

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Math renaming and tagging complete!" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan