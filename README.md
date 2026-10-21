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
| `files/` | Static documents (CV PDFs). |
| `_bibtex/` | BibTeX source of the publications page. |
| `img/`, `js/`, `assets/`, `vendor/` | Static assets. |

## Content sources

- **Biography / experience facts**: the CV repo (`main.md` is the single source of truth).
  When the CV changes, propagate the relevant facts to `index.md`, `research.md` and the
  timeline in `contact.md`.
- **Publications**: keep `_bibtex/rdguez-mariano.bib` in sync with the CV's publication list.
- **CV PDFs in `files/`**: copies of the built CVs from the CV repo
  (`main_founder.pdf` → `files/cv_founder.pdf`, `main_research.pdf` → `files/cv_research.pdf`).
  Re-copy them after every CV rebuild.

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
