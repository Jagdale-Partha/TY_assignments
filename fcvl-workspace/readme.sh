#!/usr/bin/env bash
# ==============================================================================
# FCVL Workspace Guide & Cheatsheet (readme.sh)
# ==============================================================================

# ANSI Color codes for clean terminal output
BOLD="\033[1m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RED="\033[0;31m"
RESET="\033[0m"

clear 2>/dev/null || true

echo -e "${CYAN}${BOLD}"
echo "================================================================================"
echo "         FCVL (Fundamentals of Computer Vision Lab) Workspace Guide            "
echo "================================================================================"
echo -e "${RESET}"

echo -e "${BOLD}1. Overview & Workspace Structure:${RESET}"
echo "--------------------------------------------------------------------------------"
echo -e "  ${GREEN}fcvl-workspace/${RESET}"
echo -e "  ├── ${BLUE}common/${RESET}           -> Shared helper utilities (e.g., visualizer.py)"
echo -e "  ├── ${BLUE}data/${RESET}             -> Local-only dataset folder (ignored in git)"
echo -e "  ├── ${BLUE}notebooks/${RESET}        -> Assignment notebooks (01_pixel_analysis, etc.)"
echo -e "  ├── ${BLUE}scripts/${RESET}          -> Automation scripts (download_data.sh, git_push.sh)"
echo -e "  ├── ${YELLOW}requirements.txt${RESET}  -> Python dependencies (OpenCV, Matplotlib, etc.)"
echo -e "  ├── ${YELLOW}.gitignore${RESET}        -> Keeps large datasets & caches untracked"
echo -e "  ├── ${YELLOW}README.md${RESET}         -> Full markdown documentation"
echo -e "  └── ${YELLOW}readme.sh${RESET}         -> This interactive terminal quick-reference"
echo ""

echo -e "${BOLD}2. Environment & Installation Tips:${RESET}"
echo "--------------------------------------------------------------------------------"
echo -e "  ${YELLOW}a) Create & activate Python virtual environment:${RESET}"
echo -e "     ${CYAN}python -m venv .venv${RESET}"
echo -e "     ${CYAN}source .venv/bin/activate${RESET}   # On Linux/macOS/Git Bash"
echo -e "     ${CYAN}.venv\\Scripts\\activate${RESET}     # On Windows (CMD / PowerShell)"
echo ""
echo -e "  ${YELLOW}b) Install required dependencies:${RESET}"
echo -e "     ${CYAN}pip install -r requirements.txt${RESET}"
echo ""
echo -e "  ${YELLOW}c) Setup Kaggle API (for downloading datasets):${RESET}"
echo -e "     Place ${BOLD}kaggle.json${RESET} in ${CYAN}~/.kaggle/${RESET} (Linux/macOS) or ${CYAN}%USERPROFILE%\\.kaggle\\${RESET} (Windows)"
echo ""

echo -e "${BOLD}3. Key Commands & Workflow:${RESET}"
echo "--------------------------------------------------------------------------------"
echo -e "  ${GREEN}• Download Datasets:${RESET}"
echo -e "    ${CYAN}bash scripts/download_data.sh${RESET}"
echo ""
echo -e "  ${GREEN}• Launch Jupyter Notebooks:${RESET}"
echo -e "    ${CYAN}jupyter lab${RESET}   ${BOLD}or${RESET}   ${CYAN}jupyter notebook${RESET}"
echo ""
echo -e "  ${GREEN}• Import Reusable Visualizer in Notebooks:${RESET}"
echo -e "    ${CYAN}import sys; sys.path.append('../common')${RESET}"
echo -e "    ${CYAN}from visualizer import show_image, compare_images, plot_histogram${RESET}"
echo ""
echo -e "  ${GREEN}• Commit & Push Work to Git:${RESET}"
echo -e "    ${CYAN}bash scripts/git_push.sh \"Completed Lab Assignment 1\"${RESET}"
echo ""

echo -e "${BOLD}4. Current Environment Quick Check:${RESET}"
echo "--------------------------------------------------------------------------------"

# Check Python
if command -v python &>/dev/null; then
    PY_VER=$(python --version 2>&1)
    echo -e "  [✔] Python: ${GREEN}${PY_VER}${RESET}"
else
    echo -e "  [✘] Python: ${RED}Not found in PATH${RESET}"
fi

# Check Git
if command -v git &>/dev/null; then
    GIT_VER=$(git --version 2>&1)
    echo -e "  [✔] Git:    ${GREEN}${GIT_VER}${RESET}"
else
    echo -e "  [✘] Git:    ${RED}Not found in PATH${RESET}"
fi

# Check Jupyter
if command -v jupyter &>/dev/null; then
    echo -e "  [✔] Jupyter: ${GREEN}Installed${RESET}"
else
    echo -e "  [!] Jupyter: ${YELLOW}Not installed in active environment (run pip install -r requirements.txt)${RESET}"
fi

echo ""
echo -e "${CYAN}================================================================================${RESET}"
echo -e "For more details, view ${BOLD}README.md${RESET}."
