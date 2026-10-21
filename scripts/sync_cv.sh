#!/usr/bin/env bash
#
# sync_cv.sh — Rebuild the CV PDFs from the local cv_latex/ clone and copy
# them into files/ so the site serves the current CVs.
#
# cv_latex/ is a LOCAL-ONLY clone of the private repo
# (git@github.com:rdguez-mariano/cv_latex.git), gitignored, never published.
# The only public CV artifacts are the committed PDFs in files/.
#
# Workflow:
#   1. In cv_latex/: edit main.md, regenerate the .tex variants, commit and PUSH.
#   2. In the site repo, run:  ./scripts/sync_cv.sh
#   3. Review the diff under files/, then commit and push the site repo.
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

CV_URL="git@github.com:rdguez-mariano/cv_latex.git"
CV_DIR="${ROOT}/cv_latex"

# --- 0. Prechecks -----------------------------------------------------------
command -v pdflatex >/dev/null 2>&1 || {
  echo "ERROR: pdflatex not found. Install TeX Live with: raleway, fontawesome5, paracol, enumitem, xstring, xifthen, moresize, tikz, geometry, hyperref." >&2
  exit 1; }

# --- 1. Make sure the local clone exists ------------------------------------
if [ ! -d "${CV_DIR}/.git" ] && [ ! -f "${CV_DIR}/.git" ]; then
  echo "cv_latex/ not found — cloning the private CV repo (needs SSH access)..."
  git clone "${CV_URL}" "${CV_DIR}"
fi

cd "${CV_DIR}"
git fetch origin

# Only PUSHED commits are ever published: require a clean tree at origin/master.
if [ -n "$(git status --porcelain)" ]; then
  echo "ERROR: cv_latex/ has uncommitted or unpushed changes. Commit and push them first, then re-run." >&2
  exit 1; fi
if [ "$(git rev-parse HEAD)" != "$(git rev-parse origin/master)" ]; then
  echo "ERROR: cv_latex/ HEAD is not at origin/master. Push (or pull) so both match, then re-run." >&2
  exit 1; fi
echo "cv_latex @ $(git log -1 --oneline)"

# --- 2. Rebuild the PDFs ----------------------------------------------------
# Run twice per variant so hyperref/aux links resolve (see cv_latex README).
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
echo "Review the changes, then commit and push (cv_latex/ is gitignored — only files/ ships):"
echo "  git add files/cv_founder.pdf files/cv_research.pdf"
echo "  git commit -m 'chore: sync CV PDFs'"
echo "  git push"
