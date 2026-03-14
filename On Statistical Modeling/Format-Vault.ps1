$root = ".\"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " PHASE 1: VAULT RESTRUCTURING" -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

Write-Host "1. Creating new architectural folders..." -ForegroundColor Yellow
$newFolders = @(
    "00_Home",
    "01_Foundations_and_Probability",
    "05_Theorems_and_Proofs",
    "06_Applied_Exercises",
    "06_Applied_Exercises\Sheet_01_Linear_Regression",
    "06_Applied_Exercises\Sheet_02_ANOVA_and_NonLinear",
    "07_R_Toolkit",
    "88_Source_Material",
    "99_Meta"
)

foreach ($folder in $newFolders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "   -> Created: $folder" -ForegroundColor Green
    }
}

Write-Host "`n2. Merging and migrating existing content..." -ForegroundColor Yellow

# Helper function to move contents and delete the old empty folder
function Migrate-Contents($source, $destination) {
    if (Test-Path $source) {
        Write-Host "   -> Migrating contents of [$source] to [$destination]..." -ForegroundColor White
        # Move all files and subfolders
        Get-ChildItem -Path $source | Move-Item -Destination $destination -Force
        # Remove the now-empty source folder
        Remove-Item -Path $source -Force
    }
}

# Merge Foundations and Distributions into the new 01 folder
Migrate-Contents "00_Foundations" "01_Foundations_and_Probability"
Migrate-Contents "01_Distributions" "01_Foundations_and_Probability"

# Rename Theorems, Tools, and Meta by migrating their contents
Migrate-Contents "05_Theorems_and_Lemmas" "05_Theorems_and_Proofs"
Migrate-Contents "_Software_&_Tools" "07_R_Toolkit"
Migrate-Contents "___Misc" "99_Meta"

Write-Host "`n3. Archiving raw source materials..." -ForegroundColor Yellow
# Move the raw course material folders into the 88_Source_Material folder
$rawFolders = @("__Content_Part1", "__Content_Part2", "__Exercises", "_Solutions")
foreach ($raw in $rawFolders) {
    if (Test-Path $raw) {
        Write-Host "   -> Archiving [$raw] into [88_Source_Material]..." -ForegroundColor White
        Move-Item -Path $raw -Destination "88_Source_Material\$raw" -Force
    }
}

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Vault restructuring complete!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan