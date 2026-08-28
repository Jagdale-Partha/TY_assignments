#!/usr/bin/env bash
set -e

# --- Configuration Variables ---
# Add your Kaggle dataset slugs or direct download links here
BCCD_DATASET="mdnoukhej/blood-cell-count-and-detection-bccd"
PLANT_DATASET="mohitsingh1804/plantvillage"
DATA_DIR="data"

echo "==> Creating data directory..."
mkdir -p "$DATA_DIR"

echo "==> Downloading BCCD Dataset..."
# Ensure Kaggle API token (~/.kaggle/kaggle.json) is configured before running
kaggle datasets download -d "$BCCD_DATASET" -p "$DATA_DIR" --unzip

echo "==> Downloading PlantVillage Dataset..."
kaggle datasets download -d "$PLANT_DATASET" -p "$DATA_DIR" --unzip

echo "==> All datasets downloaded and extracted to ./$DATA_DIR/"