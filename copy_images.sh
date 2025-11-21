#!/bin/bash

# Script to copy images from the original images folder to iOS Assets
# Run this script from the project root directory

SOURCE_DIR="images"
DEST_DIR="SunitPortal/SunitPortal/Assets.xcassets"

# Create imageset directories for each image
for img in "$SOURCE_DIR"/*.{jpg,png,gif}; do
    if [ -f "$img" ]; then
        filename=$(basename "$img")
        name="${filename%.*}"
        
        # Handle img3.jpg conflict - rename to img3_icici
        if [ "$filename" = "img3.jpg" ]; then
            name="img3_icici"
        fi
        
        imageset_dir="$DEST_DIR/${name}.imageset"
        
        mkdir -p "$imageset_dir"
        cp "$img" "$imageset_dir/"
        
        # Create Contents.json for the imageset
        extension="${filename##*.}"
        cat > "$imageset_dir/Contents.json" << EOF
{
  "images" : [
    {
      "filename" : "$filename",
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF
        echo "Copied $filename to $imageset_dir"
    fi
done

echo "All images copied successfully!"

