$root = ".\"
$lrPath = "$root\04_Statistical_Models\Linear_Regression"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " PHASE 2: CONSOLIDATION & FOLDER HEALTH" -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

# ---------------------------------------------------------
# 1. HELPER FUNCTION: MERGE NOTES
# ---------------------------------------------------------
Function Merge-Notes($targetName, $sourceName, $newHeader) {
    $target = Join-Path $lrPath $targetName
    $source = Join-Path $lrPath $sourceName

    if ((Test-Path $target) -and (Test-Path $source)) {
        Write-Host "   -> Merging [$sourceName] into [$targetName]..." -ForegroundColor Yellow
        
        # Read source content as a single string
        $sourceContent = Get-Content $source -Raw
        
        # Remove the YAML frontmatter from the source (everything between the first two ---)
        $sourceContent = $sourceContent -replace "(?s)^---.*?---`r?`n", ""
        # Remove the Title (# Title) from the source to avoid double H1 tags
        $sourceContent = $sourceContent -replace "(?m)^#\s+.*`r?`n", ""
        
        # Append to target
        Add-Content -Path $target -Value "`n---`n## $newHeader" -Encoding UTF8
        Add-Content -Path $target -Value $sourceContent -Encoding UTF8
        
        # Delete the noisy source file
        Remove-Item $source -Force
    }
}

# ---------------------------------------------------------
# 2. EXECUTE MERGES
# ---------------------------------------------------------
Write-Host "1. Consolidating noisy, sub-atomic notes..." -ForegroundColor Green

Merge-Notes "Linear Model.md" "Assumption of Deterministic Predictors.md" "Caveat: Assumption of Deterministic Predictors"
Merge-Notes "Design Matrix.md" "Models Without Intercept (Remark 3.13).md" "Variation: Models Without Intercept"
Merge-Notes "Orthogonal Projection Matrix.md" "Hat Matrix.md" "Application: The Hat Matrix in OLS"
Merge-Notes "Matrix Formulation of OLS.md" "Sample Mean as an OLS Estimator.md" "Validation: Sample Mean as an OLS Base Case (k=0)"

# ---------------------------------------------------------
# 3. CREATE SUBFOLDERS
# ---------------------------------------------------------
Write-Host "`n2. Creating structured subfolders..." -ForegroundColor Green
$subfolders = @("01_Model_Foundations", "02_Estimation_and_Geometry", "03_Testing_and_Evaluation")

foreach ($sf in $subfolders) {
    $fullPath = Join-Path $lrPath $sf
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath | Out-Null
    }
}

# ---------------------------------------------------------
# 4. MOVE FILES TO SUBFOLDERS
# ---------------------------------------------------------
Write-Host "`n3. Filing atomic notes into subfolders..." -ForegroundColor Green

$routing = @{
    "Linear Model.md" = "01_Model_Foundations"
    "Gaussian Linear Model.md" = "01_Model_Foundations"
    
    "Design Matrix.md" = "02_Estimation_and_Geometry"
    "Matrix Formulation of OLS.md" = "02_Estimation_and_Geometry"
    "Orthogonal Projection Matrix.md" = "02_Estimation_and_Geometry"
    "Fitted Values and Residuals.md" = "02_Estimation_and_Geometry"
    
    "Coefficient of Determination (R-squared).md" = "03_Testing_and_Evaluation"
    "Corollary 3.11 - t-Test for Linear Combinations.md" = "03_Testing_and_Evaluation"
    "Partial F-Test (Corollary 3.14).md" = "03_Testing_and_Evaluation"
    "Global F-Test (Corollary 3.15).md" = "03_Testing_and_Evaluation"
    "ANOVA-Regression Equivalence.md" = "03_Testing_and_Evaluation"
}

foreach ($fileName in $routing.Keys) {
    $sourceFile = Join-Path $lrPath $fileName
    $destFolder = Join-Path $lrPath $routing[$fileName]
    
    if (Test-Path $sourceFile) {
        Move-Item -Path $sourceFile -Destination $destFolder -Force
    }
}

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Subfolder Health Management Complete!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan