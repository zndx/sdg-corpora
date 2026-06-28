# Collection — topic 50 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **1 chapters** · **1 topics** (target + style) · **3 ontology terms** · **3 underlying tables**.

> **Topic gist** (representative FinePDFs text): Logical Biological’s purpose is to enable scientists to create a healthier world by being your trusted partner of choice for human biospecimens. We specialise in providing human tissues, isolated blood cell populations, PBMCs, serum, plasma, swabs, and other biospecimens for diagnostics and drug development. We understand your specific requirements, before condensing our extensive list of materi.. …

## Chapters

- [ch_live_labrun_subclass_63fb5d](chapters/ch_live_labrun_subclass_63fb5d.md)

## Ontology terms grounding this collection

- `ganglion_cyst_imaging_finding` — GanglionCystImagingFinding is an information content entity that visualizes some MagneticResonanceImagingModality.
- `labrun_subclass` — {X} is a process that has input sample {Y}
- `transformation_generates_entity` — {X} is a process that generates entity {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_ganglion_cyst_imaging_finding`](tables/t_ganglion_cyst_imaging_finding.sql) — realizes `ganglion_cyst_imaging_finding` · _shared with 11 other collection(s)_
- [`t_labrun_subclass`](tables/t_labrun_subclass.sql) — realizes `labrun_subclass` · _shared with 10 other collection(s)_
- [`t_transformation_generates_entity`](tables/t_transformation_generates_entity.sql) — realizes `transformation_generates_entity` · _shared with 7 other collection(s)_
