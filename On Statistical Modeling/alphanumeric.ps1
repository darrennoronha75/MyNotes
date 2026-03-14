$root = ".\"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " PHASE 4: ALPHANUMERIC ROUTING & FORMAT PASS" -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

# ---------------------------------------------------------
# STEP 1: RENAME EXISTING DIRECTORIES (DEEP FIRST)
# ---------------------------------------------------------
Write-Host "1. Upgrading to alphanumeric folder IDs..." -ForegroundColor Yellow

$renames = @(
    # Depth 3 (Do these before renaming their parent 04A_Linear_Regression)
    @(".\04_Statistical_Models\Linear_Regression\01_Model_Foundations", "04A1_Model_Foundations"),
    @(".\04_Statistical_Models\Linear_Regression\02_Estimation_and_Geometry", "04A2_Estimation_and_Geometry"),
    @(".\04_Statistical_Models\Linear_Regression\03_Testing_and_Evaluation", "04A3_Testing_and_Evaluation"),
    
    # Depth 2
    @(".\01_Foundations_and_Probability\Probability_Spaces", "01A_Probability_Spaces"),
    @(".\01_Foundations_and_Probability\Continuous_Families", "01D_Continuous_Families"),
    @(".\01_Foundations_and_Probability\Discrete_Families", "01E_Discrete_Families"),
    @(".\01_Foundations_and_Probability\Combinatorics", "01G_Combinatorics"),
    
    @(".\02_Statistical_Inference\Estimation", "02A_Estimation_Theory"),
    @(".\02_Statistical_Inference\Hypothesis_Testing", "02B_Hypothesis_Testing_Theory"),
    
    @(".\03_Statistical_Tests\Categorical_Tests", "03B_Categorical_Tests"),
    @(".\03_Statistical_Tests\Parametric_Tests", "03C_Parametric_Tests"),
    @(".\03_Statistical_Tests\Nonparametric_Tests", "03D_Nonparametric_Tests"),
    
    @(".\04_Statistical_Models\Linear_Regression", "04A_Linear_Regression"),
    @(".\04_Statistical_Models\Logistic_Regression", "04B_Logistic_Regression"),
    @(".\04_Statistical_Models\Non-Linear_Regression", "04C_Non-Linear_Regression"),
    
    @(".\05_Theorems_and_Proofs\Limit_Theorems", "05A_Limit_Theorems"),
    @(".\05_Theorems_and_Proofs\Linear_Algebra_Properties", "05B_Linear_Algebra_Properties"),
    @(".\05_Theorems_and_Proofs\Model Properties", "05C_Model_Properties"),
    @(".\05_Theorems_and_Proofs\Stochastic_Convergence", "05D_Stochastic_Convergence"),
    @(".\05_Theorems_and_Proofs\Inequalities", "05E_Inequalities")
)

foreach ($pair in $renames) {
    if (Test-Path $pair[0]) { Rename-Item -Path $pair[0] -NewName $pair[1] }
}

# ---------------------------------------------------------
# STEP 2: CREATE NEW CLASSIFICATION SUBFOLDERS
# ---------------------------------------------------------
$newFolders = @(
    ".\01_Foundations_and_Probability\01B_Random_Variables",
    ".\01_Foundations_and_Probability\01C_Distributions_and_Metrics",
    ".\01_Foundations_and_Probability\01F_Foundational_Theorems",
    ".\03_Statistical_Tests\03A_Test_Selection"
)

foreach ($f in $newFolders) {
    if (-not (Test-Path $f)) { New-Item -ItemType Directory -Path $f | Out-Null }
}

# ---------------------------------------------------------
# STEP 3: ROUTE FILES TO NEW SUBFOLDERS
# ---------------------------------------------------------
Write-Host "2. Routing loose root notes into subfolders..." -ForegroundColor Yellow

$moves = @(
    @(".\01_Foundations_and_Probability\Random Variable.md", ".\01_Foundations_and_Probability\01B_Random_Variables\"),
    @(".\01_Foundations_and_Probability\Random Vector.md", ".\01_Foundations_and_Probability\01B_Random_Variables\"),
    @(".\01_Foundations_and_Probability\Covariance Matrix.md", ".\01_Foundations_and_Probability\01B_Random_Variables\"),
    @(".\01_Foundations_and_Probability\Independent and Identically Distributed (i.i.d.).md", ".\01_Foundations_and_Probability\01B_Random_Variables\"),
    @(".\01_Foundations_and_Probability\Uncorrelated Random Vectors.md", ".\01_Foundations_and_Probability\01B_Random_Variables\"),
    @(".\01_Foundations_and_Probability\Statistic.md", ".\01_Foundations_and_Probability\01B_Random_Variables\"),
    
    @(".\01_Foundations_and_Probability\Sampling Distributions.md", ".\01_Foundations_and_Probability\01C_Distributions_and_Metrics\"),
    @(".\01_Foundations_and_Probability\Data Generating Process.md", ".\01_Foundations_and_Probability\01C_Distributions_and_Metrics\"),
    @(".\01_Foundations_and_Probability\Quantile.md", ".\01_Foundations_and_Probability\01C_Distributions_and_Metrics\"),
    @(".\01_Foundations_and_Probability\01A_Probability_Spaces\Probability Distribution.md", ".\01_Foundations_and_Probability\01C_Distributions_and_Metrics\"),
    
    @(".\01_Foundations_and_Probability\Law of Total Variance.md", ".\01_Foundations_and_Probability\01F_Foundational_Theorems\"),
    
    @(".\03_Statistical_Tests\Statistical Test Selection.md", ".\03_Statistical_Tests\03A_Test_Selection\")
)

foreach ($m in $moves) {
    if (Test-Path $m[0]) { Move-Item -Path $m[0] -Destination $m[1] -Force }
}

# ---------------------------------------------------------
# STEP 4: MARKDOWN FORMATTING (TODOs AND SPACING)
# ---------------------------------------------------------
Write-Host "3. Sanitizing Markdown (Purging TODOs, Fixing Equation Spacing)..." -ForegroundColor Yellow

$mdFiles = Get-ChildItem -Path $root -Filter "*.md" -Recurse | Where-Object { $_.FullName -notmatch "88_Source_Material" }

foreach ($file in $mdFiles) {
    $lines = Get-Content $file.FullName
    $newLines = @()
    $skipNext = 0
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($skipNext -gt 0) { $skipNext--; continue }
        
        $line = $lines[$i]
        
        # RULE 1: Remove empty Motivation sections and TODOs
        if ($line -match "^## Motivation") {
            $j = $i + 1
            while ($j -lt $lines.Count -and $lines[$j].Trim() -eq "") { $j++ }
            if ($j -lt $lines.Count -and $lines[$j] -match "^TODO:") {
                $skipNext = ($j - $i) # Skip the header, blank lines, and the TODO
                continue
            }
        }
        if ($line -match "^TODO:") { continue }
        
        # RULE 2: Fix equation spacing (Ensure blank line BEFORE $$)
        if ($line -match "^\$\$" -and $newLines.Count -gt 0) {
            if ($newLines[-1].Trim() -ne "") { $newLines += "" }
        }
        
        # RULE 3: Fix horizontal rules (Ensure blank line BEFORE ---)
        # We require newLines.Count > 3 so we don't accidentally break the YAML frontmatter
        if ($line -match "^---$" -and $newLines.Count -gt 3) { 
            if ($newLines[-1].Trim() -ne "") { $newLines += "" }
        }
        
        $newLines += $line
        
        # RULE 4: Fix equation spacing (Ensure blank line AFTER $$)
        if ($line -match "\$\$$" -and $i -lt ($lines.Count - 1)) {
            if ($lines[$i+1].Trim() -ne "") { $newLines += "" }
        }
    }
    
    # Save the cleaned file
    Set-Content -Path $file.FullName -Value $newLines -Encoding UTF8
}

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Vault Routing & Formatting Complete!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan