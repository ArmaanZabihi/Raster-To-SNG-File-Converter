#!/bin/bash

# Directories
inputDirectory="/Users/armaanzabihi/Desktop/input" # Your input directory with raster images
outputDirectory="/Users/armaanzabihi/Desktop/output" # Directory where the SVG files will be saved

# Ensure the output directory exists
mkdir -p "$outputDirectory"

# Loop through each file in the input directory
for inputFile in "$inputDirectory"/*; do
  if [[ $inputFile == *.jpg ]] || [[ $inputFile == *.jpeg ]]; then
    filename=$(basename -- "$inputFile")
    baseName="${filename%.*}"
    
    # Intermediate PNG file (Potrace works with bitmaps, but we are skipping directly to SVG)
    # pngFile="$outputDirectory/$baseName.png"
    # convert "$inputFile" "$pngFile"

    # Convert JPEG directly to SVG assuming potrace can handle it
    svgFile="$outputDirectory/$baseName.svg"
    convert "$inputFile" BMP3:- | potrace --svg -o "$svgFile"
    
    echo "Converted $inputFile to $svgFile"
  fi
done

echo "Conversion complete."
