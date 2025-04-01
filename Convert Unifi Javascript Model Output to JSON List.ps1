# Load the JSON file
$jsonFilePath = "C:\path\to\your\file.json"
$jsonContent = Get-Content -Path $jsonFilePath -Raw | ConvertFrom-Json

# Create a list to store the transformed data
$transformedData = [System.Collections.Generic.List[PSObject]]::new()

# Transform the JSON
foreach ($key in $jsonContent.PSObject.Properties.Name) {
    $item = $jsonContent.$key | Add-Member -MemberType NoteProperty -Name "model" -Value $key -PassThru
    $transformedData.Add($item)
}

# Convert back to JSON and save to a new file
$transformedJson = $transformedData | ConvertTo-Json -Depth 100
$outputFilePath = "C:\path\to\your\transformed_file.json"
Set-Content -Path $outputFilePath -Value $transformedJson

Write-Host "Transformation complete. Output saved to $outputFilePath"
