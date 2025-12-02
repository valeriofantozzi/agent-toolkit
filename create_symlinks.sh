#!/bin/bash

# Script to create symlinks and instruction files for different AI agents
# Source directory (where this script is located)
SOURCE_DIR="$(dirname "$(realpath "$0")")"

# Destination directories
GEMINI_DIR="$HOME/.gemini/antigravity/global_workflows"
CURSOR_DIR="$HOME/.cursor/commands"
COPILOT_DIR="$HOME/.vscode/instructions"

# Create directories if they don't exist
mkdir -p "$GEMINI_DIR"
mkdir -p "$CURSOR_DIR"
mkdir -p "$COPILOT_DIR"

# Find all .md files in the source directory
for file in "$SOURCE_DIR"/*.md; do
    # Extract filename without path
    filename=$(basename "$file")
    
    # Skip README.md
    if [ "$filename" = "README.md" ]; then
        echo "Skipping $filename..."
        continue
    fi
    
    # Extract filename without extension for Copilot
    basename_no_ext="${filename%.md}"

    echo "Processing $filename..."

    # Remove existing symlinks if present
    rm -f "$GEMINI_DIR/$filename"
    rm -f "$CURSOR_DIR/$filename"

    # Create symlinks for Gemini and Cursor
    ln -s "$file" "$GEMINI_DIR/$filename"
    ln -s "$file" "$CURSOR_DIR/$filename"

    # For Copilot: create a .instructions.md file with frontmatter
    copilot_file="$COPILOT_DIR/${basename_no_ext}.instructions.md"
    rm -f "$copilot_file"
    
    # Create Copilot instruction file with frontmatter + original content
    {
        echo "---"
        echo "applyTo: '**'"
        echo "---"
        cat "$file"
    } > "$copilot_file"

    echo "Created symlinks for Gemini/Cursor and instruction file for Copilot: $filename"
done

echo "Operation completed!"
