#!/usr/bin/env bash
#
# sync_cv.sh — Pull the latest cv_latex submodule, rebuild the CV PDFs and
# copy them into files/ so the site serves the current CVs.
#
# Workflow:
#   1. Edit content in the primary cv_latex working copy (~/unispace/cv_latex):
#      change main.md, regenerate the .tex variants, commit and PUSH to origin.
#   2. In the site repo, run:  ./scripts/sync_cv.sh
#   3. Review the diff under files/, then commit and push the site repo.
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# --- 0. Prechecks -----------------------------------------------------------
command -v pdflatex >/dev/null 2>&1 || {
  echo "ERROR: pdflatex not found. Install TeX Live with: raleway, fontawesome5, paracol, enumitem, xstring, xifthen, moresize, tikz, geometry, hyperref." >&2
  exit 1; }

grep -q 'cv_latex' .gitmodules 2>/dev/null || {
  echo "ERROR: cv_latex submodule not set up. Run first:" >&2
  echo "  git submodule add git@github.com:rdguez-mariano/cv_latex.git cv_latex" >&2
  exit 1; }

# --- 1. Update the submodule to the latest PUSHED commit --------------------
# Only pushed commits are ever published: unpushed work in the primary copy
# (~/unispace/cv_latex) is invisible to this step.
git submodule update --init --remote
echo "cv_latex @ $(git -C cv_latex log -1 --oneline)"

if [ -n "$(git -C cv_latex status --porcelain)" ]; then
  echo "WARNING: cv_latex submodule has local modifications; the build includes them."
fi

# --- 2. Rebuild the PDFs ----------------------------------------------------
# Run twice per variant so hyperref/aux links resolve (see cv_latex README).
cd cv_latex
pdflatex -interaction=nonstopmode -halt-on-error main_founder.tex  >/dev/null
pdflatex -interaction=nonstopmode -halt-on-error main_founder.tex  >/dev/null
pdflatex -interaction=nonstopmode -halt-on-error main_research.tex >/dev/null
pdflatex -interaction=nonstopmode -halt-on-error main_research.tex >/dev/null

# Page budgets (hard rules from the cv_latex README)
if command -v pdfinfo >/dev/null 2>&1; then
  pf="$(pdfinfo main_founder.pdf  | awk '/^Pages/ {print $2}')"
  pr="$(pdfinfo main_research.pdf | awk '/^Pages/ {print $2}')"
  echo "Page counts: founder=${pf} (budget 2), research=${pr} (budget 3)"
  [ "${pf}" -le 2 ] || { echo "ERROR: founder variant exceeds its 2-page budget" >&2; exit 1; }
  [ "${pr}" -le 3 ] || { echo "ERROR: research variant exceeds its 3-page budget" >&2; exit 1; }
fi

# --- 3. Copy into the public files/ directory -------------------------------
cd "${ROOT}"
mkdir -p files
cp cv_latex/main_founder.pdf  files/cv_founder.pdf
cp cv_latex/main_research.pdf files/cv_research.pdf
echo "Copied: files/cv_founder.pdf, files/cv_research.pdf"

# --- 4. What to do next -------------------------------------------------------
echo
echo "Review the changes, then commit and push:"
echo "  git add files/cv_founder.pdf files/cv_research.pdf cv_latex"
echo "  git commit -m 'chore: sync CV PDFs from cv_latex'"
echo "  git push"
