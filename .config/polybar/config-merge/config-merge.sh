#!/bin/bash
LOCATION="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

OUTPUT_FILE="$1"
INPUT_DIR="${2:-$LOCATION}"

echo -n "Merging files in '$INPUT_DIR'"

if [ -n "$OUTPUT_FILE" ]; then
    echo " into '$OUTPUT_FILE'"
    if [ -f "$OUTPUT_FILE" ]; then
        mv "$OUTPUT_FILE" "$OUTPUT_FILE.bak"
    fi
fi

find "$INPUT_DIR" -regextype sed -regex ".*c[0-9]*-.*" -print0 | sort -z |
    while IFS= read -r -d '' filePath; do
        file="${filePath:$((${#LOCATION} + 1))}"

        if [ -z "$OUTPUT_FILE" ]; then
            OUTPUT_FILE=$(echo "$file" | awk -F "[-]" '{print $2}')
            echo " into '$OUTPUT_FILE'"
            if [ -f "$OUTPUT_FILE" ]; then
                mv "$OUTPUT_FILE" "$OUTPUT_FILE.bak"
            fi
        fi

        if [ ! -f "$OUTPUT_FILE" ]; then
            touch "$OUTPUT_FILE"
        fi

        echo "> $file"
        (cat "$INPUT_DIR/$file"; echo) >> "$OUTPUT_FILE"
    done
