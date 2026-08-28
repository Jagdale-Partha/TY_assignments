# Fundamentals of Computer Vision Lab (FCVL) - Assignments Workspace

A modular and clean workspace structured for Computer Vision lab assignments, experiments, and notebook development.

---

## 📁 Repository Structure

```text
fcvl-workspace/
├── .gitignore               # Ignores large datasets, virtualenvs, checkpoints, and cache
├── README.md                # Detailed documentation and workspace guide
├── readme.sh                # Quick-reference terminal helper script
├── requirements.txt         # Required Python packages
├── data/                    # Local-only directory for storing datasets (untracked)
│   └── .gitkeep
├── notebooks/               # Jupyter notebooks for lab assignments
│   ├── 01_pixel_analysis.ipynb
│   └── 02_spatial_filtering.ipynb
├── common/                  # Shared helper modules and utility functions
│   └── visualizer.py
└── scripts/                 # Automation and helper shell scripts
    ├── download_data.sh     # Automates dataset downloading via Kaggle CLI
    └── git_push.sh          # Quick git commit & push utility script
```

---

## ⚙️ Prerequisites & Installation

### 1. Python Environment Setup
It is recommended to use a virtual environment (Python 3.9+ recommended):

```bash
# Navigate to the workspace
cd fcvl-workspace

# Create a virtual environment
python -m venv .venv

# Activate the virtual environment
# On Windows (PowerShell):
.venv\Scripts\Activate.ps1
# On Windows (Command Prompt):
.venv\Scripts\activate.bat
# On Linux / macOS / Git Bash:
source .venv/bin/activate
```

### 2. Install Dependencies
Install all required libraries including OpenCV, NumPy, Matplotlib, SciPy, Scikit-Image, Jupyter, and Kaggle CLI:

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

### 3. Kaggle API Configuration (For Datasets)
The `scripts/download_data.sh` script utilizes the Kaggle API to download assignment datasets:
1. Go to your [Kaggle Account Settings](https://www.kaggle.com/settings) and click **"Create New Token"** to download `kaggle.json`.
2. Place `kaggle.json` into:
   - **Windows:** `C:\Users\<YourUsername>\.kaggle\kaggle.json`
   - **Linux / macOS:** `~/.kaggle/kaggle.json` (chmod `600 ~/.kaggle/kaggle.json`)

---

## 🚀 Workflow & Usage Guide

### 1. Download Lab Datasets
Run the automated downloader to fetch and unzip required datasets (e.g., BCCD, PlantVillage) directly into the `data/` folder:

```bash
bash scripts/download_data.sh
```
> **Note:** The `data/` directory is excluded from Git tracking via `.gitignore` to avoid uploading large binary and dataset files.

---

### 2. Launching and Editing Notebooks
Start JupyterLab or Jupyter Notebook:

```bash
jupyter lab
# or
jupyter notebook
```

Navigate to `notebooks/` and open the desired assignment:
- **`01_pixel_analysis.ipynb`**: Pixel manipulation, intensity transformations, and histograms.
- **`02_spatial_filtering.ipynb`**: Image convolutions, smoothing/sharpening filters, and edge detection.

---

### 3. Using Shared Helper Functions (`common/visualizer.py`)
To keep notebooks clean, use the pre-built visualizer tools:

```python
import sys
sys.path.append('../common')

from visualizer import show_image, compare_images, plot_histogram
import cv2

# Example usage
img = cv2.imread('../data/sample.jpg')
show_image(img, title="Original Image")
```

---

### 4. Saving & Pushing Changes to Git
Use the included push script to stage, commit, and push your assignment work:

```bash
# Push with a custom commit message:
bash scripts/git_push.sh "Completed Lab 1 Pixel Analysis"

# Or push with automatic timestamped message:
bash scripts/git_push.sh
```

---

## 💡 Tips & Best Practices
- **Clear Outputs Before Committing (Optional):** In Jupyter, select `Kernel -> Restart Kernel and Clear Outputs of All Cells` before pushing if you want to keep repository diffs clean.
- **Keep Data Local:** Never commit raw dataset images or large `.zip`/`.tar.gz` files to GitHub.
- **Modular Code:** If you write functions that multiple notebooks need (e.g., custom filters, normalization), add them to `common/` rather than copying and pasting cells across notebooks.
