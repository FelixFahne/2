#!/bin/bash
# Setup script for 2024InteractiveMetrics repository
# Creates a virtual environment and installs required Python packages

set -e

# Create virtual environment in ./venv
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

# Download required JavaScript libraries
mkdir -p libs
XLXS_JS_URL="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"
if [ ! -f libs/xlsx.full.min.js ]; then
    echo "Downloading xlsx.full.min.js from $XLXS_JS_URL"
    wget -q -O libs/xlsx.full.min.js "$XLXS_JS_URL"
fi

cat <<'INSTRUCTIONS'

The environment is now prepared. To convert the sample Excel files to CSV and
start experimenting, edit `preprocessing.py` so the paths in `excel_files` and
`csv_files` match your local files. Then run:

    python preprocessing.py

To explore the notebooks, launch Jupyter with:

    jupyter notebook

Open `dialogue_pred.ipynb` or `ESL_AddedExperinments.ipynb` and run the cells
step by step to train and evaluate models.

INSTRUCTIONS
