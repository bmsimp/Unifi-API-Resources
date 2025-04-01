# Load the JSON file
$jsonFilePath = "C:\path\to\your\file.json"
$jsonContent = Get-Content -Path $jsonFilePath -Raw | ConvertFrom-Json

# Transform the JSON
$transformedData = @()
foreach ($key in $jsonContent.PSObject.Properties.Name) {
    $item = $jsonContent.$key | Add-Member -MemberType NoteProperty -Name "model" -Value $key -PassThru
    $transformedData += $item
}

# Convert back to JSON and save to a new file
$transformedJson = $transformedData | ConvertTo-Json -Depth 100
$outputFilePath = "C:\path\to\your\transformed_file.json"
Set-Content -Path $outputFilePath -Value $transformedJson

Write-Host "Transformation complete. Output saved to $outputFilePath"
