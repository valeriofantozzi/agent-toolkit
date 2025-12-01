#!/bin/bash

# Script per creare symlink dei file .md in due directory diverse
# Directory sorgente (directory dove si trova questo script)
SOURCE_DIR="$(dirname "$(realpath "$0")")"

# Directory destinazione
GEMINI_DIR="$HOME/.gemini/antigravity/global_workflows"
CURSOR_DIR="$HOME/.cursor/commands"

# Crea le directory se non esistono
mkdir -p "$GEMINI_DIR"
mkdir -p "$CURSOR_DIR"

# Trova tutti i file .md nella directory sorgente
for file in "$SOURCE_DIR"/*.md; do
    # Estrai solo il nome del file senza percorso
    filename=$(basename "$file")

    # Cancella eventuali symlink esistenti e crea i nuovi
    echo "Creando symlink per $filename..."

    # Rimuovi symlink esistenti se presenti
    rm -f "$GEMINI_DIR/$filename"
    rm -f "$CURSOR_DIR/$filename"

    # Crea i nuovi symlink
    ln -s "$file" "$GEMINI_DIR/$filename"
    ln -s "$file" "$CURSOR_DIR/$filename"

    echo "Symlink creati per $filename"
done

echo "Operazione completata!"
