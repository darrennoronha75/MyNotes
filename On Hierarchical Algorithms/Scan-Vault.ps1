# Set the path to scan (defaults to the location of this script)
$TargetFolder = $PSScriptRoot

# Define the indicators of an "Unpopulated" or "Template" file
# We use Regex escaping for special characters like \ and .
$TemplateIndicators = @(
    "HVault",                       # Strongest indicator as per your request
    "%\s*Insert LaTeX formula here", # Regex to catch the LaTeX placeholder
    "\\.\\\\Generate-HVault\\.ps1", # Escaped pattern for .\Generate-HVault.ps1
    "## Mathematical Formulation"   # The specific template header
)

Write-Host "Scanning folder: $TargetFolder" -ForegroundColor Cyan
Write-Host "Looking for unpopulated notes..." -ForegroundColor Gray

$report = @()

# Get all markdown files recursively
$files = Get-ChildItem -Path $TargetFolder -Recurse -Filter "*.md"

foreach ($file in $files) {
    # Read file content as a single string
    $content = Get-Content -Path $file.FullName -Raw -ErrorAction SilentlyContinue
    
    $status = "Populated"
    $reason = "Content found"

    # Check 1: Is the file completely empty?
    if ([string]::IsNullOrWhiteSpace($content)) {
        $status = "Empty/Template"
        $reason = "File is empty"
    }
    else {
        # Check 2: Does it contain any of the template substrings?
        foreach ($indicator in $TemplateIndicators) {
            if ($content -match $indicator) {
                $status = "Empty/Template"
                # Clean up the reason for display
                $cleanReason = $indicator -replace "\\", "" 
                $reason = "Contains marker: '$cleanReason'"
                break 
            }
        }
    }

    # Add to the report list
    $report += [PSCustomObject]@{
        Folder   = $file.Directory.Name
        File     = $file.Name
        Status   = $status
        Reason   = $reason
        FullPath = $file.FullName # Included if you need to debug locations
    }
}

# Display the results in a table
$report | Format-Table Folder, File, Status, Reason -AutoSize

# Export to CSV for the next step (Analysis)
$csvPath = Join-Path $TargetFolder "Vault-Audit.csv"
$report | Export-Csv -Path $csvPath -NoTypeInformation
Write-Host "`nScan complete. List saved to: $csvPath" -ForegroundColor Green