Write-Host "Starting Visual Conformity and Notation Pass..." -ForegroundColor Cyan

# Target folders containing theoretical notes
$folders = @(
    "01_Foundations_and_Probability", 
    "02_Statistical_Inference", 
    "03_Statistical_Tests", 
    "04_Statistical_Models", 
    "05_Theorems_and_Proofs"
)

foreach ($folder in $folders) {
    if (-not (Test-Path ".\$folder")) { continue }
    
    $files = Get-ChildItem -Path ".\$folder" -Filter "*.md" -Recurse
    
    foreach ($f in $files) {
        $lines = Get-Content $f.FullName
        $newLines = @()
        $inCallout = $false
        $hasMotivation = $false
        $titlePassed = $false
        
        foreach ($line in $lines) {
            # 1. Enforce Schulte's Gamma notation
            $line = $line -replace '\\beta\b', '\gamma'
            $line = $line -replace 'β', '\gamma'
            
            # 2. Track Motivation Header
            if ($line -match "(?i)^## Motivation") { $hasMotivation = $true }
            
            # 3. Detect End of Section (Closes the Callout)
            if ($line -match "^#" -or $line -match "^---(?!-)") {
                if ($inCallout) {
                    $inCallout = $false
                    $newLines += "" # Add blank line before next section
                }
            }
            
            # 4. Trigger Callouts
            if ($line -match "^##\s+Definition(.*)") {
                $newLines += "> [!abstract] Definition$($matches[1])"
                $inCallout = $true
                continue
            }
            if ($line -match "^##\s+(The )?Theorem(.*)") {
                $newLines += "> [!info] Theorem$($matches[2])"
                $inCallout = $true
                continue
            }
            if ($line -match "^##\s+Strict Assumptions?(.*)") {
                $newLines += "> [!warning] Strict Assumption$($matches[1])"
                $inCallout = $true
                continue
            }
            
            # 5. Track main title
            if ($line -match "^#\s+(.*)") {
                $titlePassed = $true
            }
            
            # 6. Append Line (handling blockquote formatting)
            if ($inCallout) {
                if ($line.Trim() -eq "") {
                    $newLines += ">"
                } elseif ($line -notmatch "^>") {
                    $newLines += "> $line"
                } else {
                    $newLines += $line
                }
            } else {
                $newLines += $line
            }
        }
        
        # 7. Post-process: Inject Motivation Placeholder if missing
        if (-not $hasMotivation -and $titlePassed) {
            $finalLines = @()
            $injected = $false
            foreach ($line in $newLines) {
                $finalLines += $line
                if ($line -match "^#\s+(.*)" -and -not $injected) {
                    $finalLines += ""
                    $finalLines += "## Motivation"
                    $finalLines += "TODO: Document the mathematical or practical reason this concept exists."
                    $finalLines += ""
                    $injected = $true
                }
            }
            $newLines = $finalLines
        }
        
        Set-Content -Path $f.FullName -Value $newLines -Encoding UTF8
    }
}

Write-Host "Conformity pass complete! All math blocks mapped and formatted." -ForegroundColor Green