# PowerShell script to copy images from the original images folder to iOS Assets
# Run this script from the project root directory

$SourceDir = "images"
$DestDir = "SunitPortal\SunitPortal\Assets.xcassets"

# Get all image files
$ImageFiles = Get-ChildItem -Path $SourceDir -Include *.jpg,*.png,*.gif -Recurse

foreach ($img in $ImageFiles) {
    $filename = $img.Name
    $name = [System.IO.Path]::GetFileNameWithoutExtension($filename)
    
    # Handle img3.jpg conflict - rename to img3_icici
    if ($filename -eq "img3.jpg") {
        $name = "img3_icici"
    }
    
    $extension = $img.Extension
    $imagesetDir = Join-Path $DestDir "$name.imageset"
    
    # Create imageset directory
    New-Item -ItemType Directory -Force -Path $imagesetDir | Out-Null
    
    # Copy image file
    Copy-Item $img.FullName -Destination (Join-Path $imagesetDir $filename) -Force
    
    # Create Contents.json
    $contentsJson = @{
        images = @(
            @{
                filename = $filename
                idiom = "universal"
            }
        )
        info = @{
            author = "xcode"
            version = 1
        }
    } | ConvertTo-Json
    
    $contentsJson | Out-File -FilePath (Join-Path $imagesetDir "Contents.json") -Encoding UTF8
    
    Write-Host "Copied $filename to $imagesetDir"
}

Write-Host "All images copied successfully!"

