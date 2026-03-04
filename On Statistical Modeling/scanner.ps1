# Set the output filename
$OutputFile = "Vault_Master_Ledger.txt"

# Clear the file if it exists
"" | Out-File -FilePath $OutputFile -Encoding utf8

Write-Host "Scanning Vault Structure and Content..." -ForegroundColor Cyan

# 1. Generate the Visual Tree Structure (All Files)
"====================================================" | Out-File $OutputFile -Append
"VAULT STRUCTURE SNAPSHOT" | Out-File $OutputFile -Append
"Generated: $(Get-Date)" | Out-File $OutputFile -Append
"====================================================`n" | Out-File $OutputFile -Append

Get-ChildItem -Recurse | ForEach-Object {
    $Depth = ($_.FullName.Split([System.IO.Path]::DirectorySeparatorChar).Count - (Get-Location).Path.Split([System.IO.Path]::DirectorySeparatorChar).Count)
    $Indent = "  " * $Depth
    "$Indent [$($_.Attributes)] $($_.Name)" | Out-File $OutputFile -Append
}

# 2. Extract Internal Content for .md Files
"`n`n====================================================" | Out-File $OutputFile -Append
"INTERNAL NOTE CONTENT (.MD FILES ONLY)" | Out-File $OutputFile -Append
"====================================================`n" | Out-File $OutputFile -Append

$MarkdownFiles = Get-ChildItem -Recurse -Filter "*.md"

foreach ($file in $MarkdownFiles) {
    "--- START OF NOTE ---" | Out-File $OutputFile -Append
    "FILE PATH: $($file.FullName)" | Out-File $OutputFile -Append
    "FOLDER:    $($file.Directory.Name)" | Out-File $OutputFile -Append
    "FILENAME:  $($file.Name)" | Out-File $OutputFile -Append
    "----------------------------------------------------" | Out-File $OutputFile -Append
    
    # Capture the actual note content
    $Content = Get-Content -Path $file.FullName -Raw
    $Content | Out-File $OutputFile -Append
    
    "`n--- END OF NOTE ---`n" | Out-File $OutputFile -Append
}

Write-Host "Process Complete! Your vault is captured in: $OutputFile" -ForegroundColor Green