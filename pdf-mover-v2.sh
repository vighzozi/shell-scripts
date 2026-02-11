#!/bin/bash

#!/bin/bash

location=$1
target=$2

# Check if arguments were actually provided
if [[ -z "$location" || -z "$target" ]]; then
    echo "Usage: $0 <location> <target>"
    exit 1
fi

# Check if location actually exist
if [[ ! -d "$location" ]]; then
    echo "Error: directory '$location' does not exist."
    exit 1
fi

# Loop directly through the files
# Quotes around "$location" prevent issues with spaces in paths
pdf_files=("$location"/*.pdf)

if [ ${#pdf_files[@]} -eq 0 ]; then
    echo "No PDF files found in $location"
else
    for f in "${pdf_files[@]}"; do
        echo "Moving PDF: $f to $target"
        mv -- "$f" "$target"
    done
    echo "Scan finished. Moved ${#pdf_files[@]} files."
fi
