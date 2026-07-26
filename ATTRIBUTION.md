# Attribution

The SDG corpora are derived work. This file credits the upstream projects that made them possible and
records the licence terms under which their material is used. Where a term below is marked
**unverified**, it has not yet been confirmed against the upstream artifact and must be settled before
that source's material appears in a published release — a declared attribution that nobody checked is
the same category of defect as a citation pointing at somebody's laptop.

## FinePDFs — the input corpus

| | |
|---|---|
| Project | **FinePDFs**, HuggingFaceFW |
| Dataset | <https://huggingface.co/datasets/HuggingFaceFW/finepdfs> |
| Licence | **ODC-By 1.0** (Open Data Commons Attribution License) |
| Used as | the input window: streamed documents, filtered by our domain aperture, that seed derivation |
| Revision | recorded per harvested document in `manifest.jsonl` (`revision` field) |

FinePDFs is the substrate this entire corpus is derived from — the domain entropy, the prose character
anchor, and the passages every derived construct traces back to. We are glad to credit it.

Two distinctions we hold deliberately:

- **The dataset is ODC-By 1.0; the FinePDFs *code repository* is AGPL-3.0.** We use the dataset only.
  No implementation code from `huggingface/finepdfs` appears in this project — verified by audit, and
  the distinction matters because AGPL-3.0 copyleft would attach to distributed work while ODC-By
  would not.
- **ODC-By is attribution-only, not share-alike** (share-alike is ODbL). Our derived dataset therefore
  carries no obligation to adopt ODC-By itself; the obligation it *does* carry is this attribution,
  preserved in every release.

ODC-By 1.0 licenses the *compilation*. The underlying documents remain the property of their authors,
and upstream operates notice-and-takedown. We therefore retain, per harvested document, its upstream
identifier, the dataset revision read, and a content hash of the normalized text — so that a later
divergence (content changed, or document withdrawn) is **detectable and reportable** rather than
silent. That cross-reference check is the remedy path; it is run periodically and ships with releases.

## BFO — the foundational ontology

| | |
|---|---|
| Project | **Basic Formal Ontology (BFO) 2020**, ISO/IEC 21838-2 |
| Artifact | `bfo.owl`, version IRI `http://purl.obolibrary.org/obo/bfo/2020/bfo-core.owl` |
| Licence | **CC BY 4.0** (as declared in the artifact) |
| Used as | the upper grounding of every realized class; the disjointness spine |

## CCO — the mid-level ontology

| | |
|---|---|
| Project | **Common Core Ontologies**, CUBRC Inc. |
| Artifact | `CommonCoreOntologiesMerged.ttl` |
| Licence | **BSD 3-Clause** — `dct:license "BSD 3-Clause: …/CommonCoreOntologies/blob/master/LICENSE"`, `dct:rights "CUBRC Inc., see full license."` |
| Used as | mid-level anchors and the authoritative term index (opaque IRIs, labels, alternates) |

A derived index of BFO and CCO entities is embedded in the `kvasir` binary for offline term
resolution; see `components/kvasir/NOTICE` for that redistribution's attribution and provenance
record.

## Standards aligned to (no material redistributed)

These are **aligned to**, not copied from: we assert correspondences to their concepts and
redistribute none of their text. Credited because the alignment is load-bearing for our semantics.

| Standard | Body | Role here |
|---|---|---|
| FIBO | EDM Council | financial-sector alignment |
| FHIR | HL7 | healthcare/diagnostics alignment |
| SysML v2 / KerML | OMG (pilot implementation: `Systems-Modeling/SysML-v2-Pilot-Implementation`) | MBSE alignment, metaclass census |
| WITSML · PRODML · RESQML | Energistics | upstream-energy alignment |

## Sources requiring confirmation before publication

**unverified** — these contribute values or structure and their terms must be settled before any
release that carries their material:

- **GitTables** — real column values grounding our empirical vocabulary members
  (`sdg:valueProvenance` claims cite `value@table:column` coordinates).
- **SchemaPile** — schema structure statistics used for the metrology comparison.

## How to cite this corpus

Cite the release tag and the certification level recorded in its certificate; the certificate states
what was verified and at what scope, which is the honest basis for reuse.
