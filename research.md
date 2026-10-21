---
layout: default
title: "academy"
header-img: "/img/paris.jpg"
---

<center><a class="btn" style="float:center;" href="{{ site.baseurl }}/publications">List of Publications</a></center>

<br />

## Industry research

### Freeda — AI compliance review for the construction industry
**Co-Founder & Chief Scientific Officer** — *Nov 2024 – present, [Freeda](https://freeda.so), Paris*

I own the scientific strategy and the AI roadmap, and lead a team of 3 ML engineers. Every layer of Freeda's AI stack was shipped by that team under my direction:

- **Perception.** Up to three generations of plan-understanding models (RF-DETR, YOLO-OBB, SegFormer), all improving on the Roboflow baseline, alongside template matching and SAM 2 / SAM 3 one-click area selection.
- **Plan description layer.** A structured record of measurements derived from detected shapes, readable by agents and humans alike — one representation that stops every downstream step from re-deriving geometry.
- **Annotation tool.** In-house app for labelling text and vision data across document folders (PDFs, images), built on CVAT's vision component.
- **Document intelligence.** Freeda Assistant — MinerU OCR, contextual retrieval, hybrid search and reranking — lets domain experts search thousands of pages instead of reading them. Smart Selection uses LLM contextualisation of retrieved patterns to capture every text span tied to a concept by style and context.
- **Agentic verification.** Recipe-based: an agent follows a human-authored recipe as its roadmap and a human is asked only at final sign-off, with skills that write comments and annotations directly into the delivered PDFs.
- **Codegen.** Autonomous coding agents used for dynamic custom workflows — e.g. customer-facing interactive reports built as mini-apps: single-page HTML emitted from a real React + Tailwind app.
- **Prompt optimisation.** Automated prompt improvement adapted from a Microsoft method, removing manual prompt iteration as the bottleneck on quality.
- **Infra / DevOps.** I own the runtime these features live on: frontend, backend, CI/CD, NVIDIA Triton Inference Server and Celery workers — the first working prototype ran at less than EUR 300/month on a single NVIDIA L4 GPU.

*Product impact: took the compliance workflows, engine and infrastructure from blank page to production in a few months, cutting manual plan-review time 3× versus market standards; live with 10+ paying customers within 10 months.*

### Gladia — speech infrastructure at commercial scale
**Founding Machine Learning Engineer, Speech** — *Jan 2023 – May 2024, Paris*

Speech-to-text infrastructure sold as a public API to 100+ customers (PAYG and enterprise contracts); Gladia was later acquired by OVH.

- **Inference research with a direct margin effect.** Rebuilt Whisper for production serving (ONNX, NVIDIA Triton, flame-graph profiling): lower cost per hour of audio at better WER than the market at the time.
- **Owned a research area end to end.** Speaker diarization and voice-activity detection (pyannote, silero), which unlocked the meeting-transcription use case.

### Powder — video & multimodal in a consumer gaming product
**Machine Learning Engineer, Video & Multimodal** — *Jul 2021 – Jan 2023, Paris*

- **Research shipped to consumers.** Event and highlight detection in gameplay streamer video.
- **On-device deployment.** Game identification in video and spoken-language identification exported to ONNX/CoreML.
- **Published what shipped.** [Multi-annotation attention model for video summarization](https://openaccess.thecvf.com/CVPR2023_workshops/LSHVU), CVPR Workshop 2023.
- **Research infrastructure.** Set up the team's training and evaluation stack (PyTorch Lightning, Comet/WandB, Gin, CI with reproducible experiments).

<br />

## Academic research

Doctoral work on **affine-invariant image comparison** at [ENS Paris-Saclay](https://ens-paris-saclay.fr/) under the supervision of [Jean-Michel Morel](https://sites.google.com/site/jeanmichelmorelcmlaenscachan/) and [Julie Delon](https://delon.wp.imt.fr/):

- [**Covering the Space of Tilts**](/pages/imas) — SIAM IS 2018 / SIIMS 2018.
- [**Fast Affine Invariant Image Matching (IMAS)**](/pages/hyperdescriptors) — IPOL 2018.
- [**Affine invariant image comparison under repetitive structures**](/pages/acdesc) — ICIP 2018.
- [**SIFT-AID**: boosting SIFT with an affine invariant descriptor based on CNNs](/pages/sift-aid) — ICIP 2019.
- [**CNN-assisted coverings in the Space of Tilts (ADI-MAS)**](/pages/adimas) — ICIP 2020.
- [**Robust estimation of local affine maps** (LOCATE)](/pages/locate) — WACV 2020.
- [**Automatic detection of repeated objects in images**](/pages/autosim) — ICIP 2021.
- [**A CNN cloud detector for panchromatic satellite images**](/pages/pcd) — IGARSS 2021.
- [**Robust validation steps for clip classification**](/pages/valsteps) — preprint 2022 (Powder).

### PhD thesis

I was a PhD Student at the [ENS Paris-Saclay](https://ens-paris-saclay.fr/) under the supervision of [Jean-Michel Morel](https://sites.google.com/site/jeanmichelmorelcmlaenscachan/) and [Julie Delon](https://delon.wp.imt.fr/). The manuscript is available at:
 <center> <small><a href="https://hal.archives-ouvertes.fr/tel-02954027">Mariano Rodríguez (2020) "Affine invariant image comparison"</a> </small>  </center>
<p></p>

<br />

## Awards & fellowships

- **Laureate, FMJH Doctoral Program** — [Fondation Mathématique Jacques Hadamard](https://www.math.ens.paris-saclay.fr/). Three-year competitive fellowship. *(2016)*
- **Laureate, PGSM Masters Scholarship** — Paris Graduate School of Mathematics. Two-year international scholarship. *(2014)*
- **Top student, Faculty of Mathematics & Computer Science** — Awarded by the vice-chancellor, University of Havana. *(2011)*

<br />

## Teaching

- **Analyse de Fourier et Hilbertienne** — practical lessons, *Department of Mathematics, ENS Paris-Saclay.* *(Sep 2017 – Jan 2019)*
- **Calcul Différentiel** — practical lessons, *Department of Mathematics, ENS Paris-Saclay.* *(Sep 2016 – Jan 2017)*
- **PDE, Complex Analysis, Mathematics I–III** — lectures & practical lessons, *Mathematics Department, University of Havana.* *(2011 – 2014)*
