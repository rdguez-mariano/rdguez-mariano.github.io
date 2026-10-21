# Mariano Rodriguez's website

Personal / professional website (Jekyll, `jekyll-theme-hacker`), hosted on GitHub Pages at
[rdguez-mariano.github.io](https://rdguez-mariano.github.io).

## Site structure

| Path | Role |
|---|---|
| `index.md` | Front page: identity (Co-Founder & CSO, Freeda), profile, navigation. |
| `research.md` | Industry research (Freeda, Gladia, Powder), academic research (project pages under `pages/`), PhD thesis, awards, teaching. |
| `publications.html` | Full publication list with BibTeX (source: `_bibtex/rdguez-mariano.bib`). |
| `contact.md` | Photo, contact details, CV links, timeline, office location, related posts. |
| `pages/*.md` | Academic project pages (IMAS, LOCATE, SIFT-AID, ADI-MAS, ...). |
| `files/` | Static documents served publicly (the CV PDFs). |
| `cv_latex/` | **Private git submodule** — the CV repo (source + LaTeX + build). Never published; only its built PDFs land in `files/`. |
| `scripts/sync_cv.sh` | Rebuilds the CV PDFs from the submodule and copies them into `files/`. |
| `_bibtex/` | BibTeX source of the publications page. |
| `img/`, `js/`, `assets/`, `vendor/` | Static assets. |

## CV as a private git submodule

The CV lives in a **separate, private** repo (`git@github.com:rdguez-mariano/cv_latex.git`)
that is embedded here as a git submodule under `cv_latex/`. `main.md` in that repo is the
single source of truth for all CV content.

**What the public sees — and doesn't:**

- GitHub Pages does **not** check out submodules, so nothing from `cv_latex/` (source,
  LaTeX, photos) is ever published.
- The **only** public CV artifacts are the committed PDFs in `files/`
  (`cv_founder.pdf`, `cv_research.pdf`).
- The private repo's **URL** and the pinned commit SHA are visible in the public
  `.gitmodules` / git tree — this is inherent to submodules. It does not expose content,
  only that a private repo of that name exists under this account.
- Anyone cloning this repo needs access to the private repo to materialize `cv_latex/`:
  `git clone --recurse-submodules <this-repo>` (or `git submodule update --init` afterwards).
  Without that access, `cv_latex/` is simply an empty directory — the site still builds
  and serves the PDFs from `files/`.

**Syncing the site with the CV** (keeps both in lockstep):

1. In the primary CV working copy (e.g. `~/unispace/cv_latex`): edit `main.md`,
   regenerate the affected `.tex` variant(s), commit and **push** to origin.
2. In this repo:
   ```bash
   ./scripts/sync_cv.sh
   ```
   This pulls the latest **pushed** commit of the submodule, rebuilds both PDFs
   (`pdflatex` ×2 each), enforces the page budgets (founder ≤ 2, research ≤ 3) and copies
   the PDFs into `files/`.
3. Review the diff under `files/`, then commit and push this repo.

Only **pushed** CV commits are ever published — unpushed local CV work is invisible to
the sync step by design.

## Content sources

- **Biography / experience facts**: `cv_latex/main.md` is the single source of truth.
  When the CV changes, also propagate the relevant facts to `index.md`, `research.md` and
  the timeline in `contact.md`.
- **Publications**: keep `_bibtex/rdguez-mariano.bib` in sync with the CV's publication list.
- **CV PDFs in `files/`**: built artefacts of the `cv_latex/` submodule, refreshed via
  `./scripts/sync_cv.sh` (never hand-edited).

## Requirements
```bash
sudo apt-get update
sudo apt-get -y install make ruby-full build-essential zlib1g-dev
```

## Define Ruby's location for packages

An add the following lines to the file `.bashrc`,

```
# Ruby exports
export GEM_HOME=$HOME/.gems
export PATH=$HOME/.gems/bin:$PATH
```


## Prepare for launching the local web server

Install the jekyll and bundler packages,

```bash
gem install jekyll bundler
```

and on the root folder of this repo do,

```bash
bundle install
```

## Launch the local server

```bash
bundle exec jekyll serve
```
