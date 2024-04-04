#!/bin/bash

# Directories
inputDirectory="/Users/armaanzabihi/Desktop/input" # Your input directory with raster images
outputDirectory="/Users/armaanzabihi/Desktop/output" # Directory where the SNG files will be saved

# Ensure the output directory exists
mkdir -p "$outputDirectory"

# Loop through each file in the input directory
for inputFile in "$inputDirectory"/*; do
  filename=$(basename -- "$inputFile")
  baseName="${filename%.*}"
  
  # Convert to PNG (if necessary)
  
  #pngFile="$outputDirectory/$baseName.png"
  #convert "$inputFile" "$pngFile"
  
  # Convert PNG to SNG
  sngFile="$outputDirectory/$baseName.sng"
  sng "$pngFile" > "$sngFile"
  
  echo "Converted $inputFile to $sngFile"
done

echo "Conversion complete."
