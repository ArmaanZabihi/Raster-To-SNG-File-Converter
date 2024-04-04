#!/bin/bash

# Directories
inputDirectory="/Users/armaanzabihi/Desktop/input" # Your input directory with raster images
outputDirectory="/Users/armaanzabihi/Desktop/output" # Directory where the SVG files will be saved

# Ensure the output directory exists
mkdir -p "$outputDirectory"

# Loop through each file in the input directory
for inputFile in "$inputDirectory"/*; do
  filename=$(basename -- "$inputFile")
  baseName="${filename%.*}"
  
  # Convert to PNG (if necessary)
  
  #pngFile="$outputDirectory/$baseName.png"
  #convert "$inputFile" "$pngFile"
  
  # Convert PNG to SVG
  svgFile="$outputDirectory/$baseName.svg"
  svg "$pngFile" > "$svgFile"
  
  echo "Converted $inputFile to $svgFile"
done

echo "Conversion complete."
