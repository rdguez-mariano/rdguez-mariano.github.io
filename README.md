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
| `cv_latex/` | **Local-only clone of the private CV repo** (source + LaTeX + build). Gitignored — never committed, never published; only its built PDFs land in `files/`. |
| `scripts/sync_cv.sh` | Rebuilds the CV PDFs from the local `cv_latex/` clone and copies them into `files/`. |
| `_bibtex/` | BibTeX source of the publications page. |
| `img/`, `js/`, `assets/`, `vendor/` | Static assets. |

## CV as a private repo (local-only clone)

The CV lives in a **separate, private** repo (`git@github.com:rdguez-mariano/cv_latex.git`).
`main.md` in that repo is the single source of truth for all CV content.

This site repo does **not** embed it (a submodule would break public checkouts — GitHub
Pages can't clone a private repo). Instead, `cv_latex/` is a **local-only clone** of the
private repo, kept inside this folder and covered by `.gitignore`:

- It is **never committed** to this public repo and **never published**: Jekyll's
  `exclude:` in `_config.yml` keeps it out of the built site, and `.gitignore` keeps it
  out of git entirely.
- The **only** public CV artifacts are the committed PDFs in `files/`
  (`cv_founder.pdf`, `cv_research.pdf`).

**Getting the folder in place** (one-time, needs SSH access to the private repo):

```bash
git clone git@github.com:rdguez-mariano/cv_latex.git cv_latex
```

…or simply run `./scripts/sync_cv.sh` — it does this clone for you if `cv_latex/` is
missing. Without the private repo's access, `cv_latex/` just stays empty: the site still
builds fine and serves the PDFs from `files/`.

**Syncing the site with the CV** (keeps both in lockstep):

1. In `cv_latex/`: edit `main.md`, regenerate the affected `.tex` variant(s), commit
   and **push** to origin.
2. In this repo:
   ```bash
   ./scripts/sync_cv.sh
   ```
   This refreshes the clone, verifies it is clean and at `origin/master`, rebuilds both
   PDFs (`pdflatex` ×2 each), enforces the page budgets (founder ≤ 2, research ≤ 3) and
   copies the PDFs into `files/`.
3. Review the diff under `files/`, then commit and push this repo (only `files/*.pdf` —
   `cv_latex/` is gitignored).

Only **pushed** CV commits are ever published: the script refuses to build if
`cv_latex/` has uncommitted/unpushed work, so unpushed local CV work can't leak into the
site by accident.

## Content sources

- **Biography / experience facts**: `cv_latex/main.md` is the single source of truth.
  When the CV changes, also propagate the relevant facts to `index.md`, `research.md` and
  the timeline in `contact.md`.
- **Publications**: keep `_bibtex/rdguez-mariano.bib` in sync with the CV's publication list.
- **CV PDFs in `files/`**: built artefacts of the local `cv_latex/` clone of the private
  CV repo, refreshed via `./scripts/sync_cv.sh` (never hand-edited).

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
bundle exec jekyll serve --port 4001
```
