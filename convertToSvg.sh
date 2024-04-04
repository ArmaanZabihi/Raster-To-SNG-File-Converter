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
    
    # Define the output SVG file path
    svgFile="$outputDirectory/$baseName.svg"
    
    # Use Inkscape to convert JPEG directly to SVG
    # Replace "/path/to/inkscape" with the full path to your Inkscape installation
    /Applications/Inkscape.app/Contents/MacOS/inkscape "$inputFile" --export-type=svg --export-filename="$svgFile"
   
    
    echo "Converted $inputFile to $svgFile"
  fi
done

echo "Conversion complete."


