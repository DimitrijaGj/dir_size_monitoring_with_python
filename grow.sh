#!/bin/bash

# File name
file="incremental_file.txt"

# Ensure the file is empty initially
> "$file"

# Check if the file was created successfully
if [ ! -f "$file" ]; then
  echo "Error: Unable to create the file."
  exit 1
fi

# Increment size in bytes (1 MB = 1048576 bytes)
increment_size=1048576

# Maximum size in bytes (100 MB = 104857600 bytes)
max_size=104857600

# Current size of the file
current_size=0

# Loop to increment the file size
while [ "$current_size" -lt "$max_size" ]; do
  # Append 1 MB of null bytes to the file
  if ! dd if=/dev/zero bs=1 count="$increment_size" >> "$file" 2> /dev/null; then
    echo "Error: Unable to append to the file."
    exit 1
  fi
  # Update the current file size
  current_size=$(stat -c%s "$file")

  # Print current size
  echo "Current file size: $((current_size / 1048576)) MB"

  # Wait for 5 seconds
  sleep 5
done

echo "File has reached 100 MB."
