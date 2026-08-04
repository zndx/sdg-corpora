# Proposal: STUDIO haplotype — MBSE-subordinate admission

From: synth (zndx/synth) · To: aegir SoT owners · 2026-08-04 · DRAFT

This repo is written by `aegir.lineup sync`; nothing here is hand-merged.
This PR is a **coordination artifact**: it states what synth needs from
the aegir SoT (and would therefore appear in a future corpora release)
versus what stays isolated in the STUDIO haplotype on the synth side.
Full census with verified IRIs and firmware-derived facts:
`zndx/synth` → `docs/scratch/2026-08-04/033448_studio_sector_census.md`.

## Framing (ratified RH 2026-08-04)

No new sector, no new aperture point. A studio rig is one configured
system, not a knowledge domain. The ask is that **18.1 MBSE carries the
general capacity to admit descriptions of engineered systems**, and the
STUDIO **haplotype** (a coherent bundle of variant selections
instantiated by a real rig) slots well below the aperture under MBSE.
Sector code 20 stays free.

## (a) Requested upstream — general infrastructure

1. **Bounded SysML-v2/KerML → OWL admission profile** at 18.1: part /
   port / interface / connection definitions+usages, individuals /
   snapshots / timeslices, constraint usages, variability. A profile,
   not the metamodel; existing gates (HermiT 0-unsat, triad, notation,
   OQuaRE, discriminability) are the instruments.
2. **`sdg:STUDIO` node** under the MBSE genus (notation slot `18.1.x`
   is aegir's call) with a haplotype `skos:scopeNote` at birth.
3. **Mereology bridge** (general SDG improvement):
   `sdg:partOf ⊑ obo:BFO_0000176` · `sdg:contains ⊑ obo:BFO_0000178`.
4. **Generic connector pattern**: `sdg:ConnectorComponent` ⊑
   `cco:ont00000995`, ports as material parts `bearer of`
   (BFO_0000196) interface functions (⊑ `cco:ont00000323`), protocol
   specs as Prescriptive ICE (`cco:ont00000965`, `prescribes`
   `ont00001942`). Reusable by any hardware domain.
5. **Observer/client device classes**: `sdg:TabletComputer`,
   `sdg:LaptopComputer` ⊑ `cco:ont00000420` (Computer);
   `sdg:Smartphone` ⊑ `cco:ont00000057` (Mobile Telephone);
   `sdg:Microphone` ⊑ `cco:ont00000736` (Transducer); camera genus
   `cco:ont00000199` reused directly.
6. **Defect fixes** found during census (aegir SoT / publish):
   malformed `bfo:00000995` genus IRI ×15 in
   `sdg-ontology-comprehensive.omn`; `cco:` declared `http://` in
   `sdg-vocab.ttl:26`, `domain-concepts.ttl:28`,
   `aperture.skos.ttl:26`; published `corpora/ontology/sdg-vocab.ttl:610`
   still carries banned `cco:DirectiveICE` (SoT already corrected to
   `ont00000965`); strategy lens tier one re-seed behind SoT.

## (b) Staged for admission (content, post-ratification)

Studio device domain classes + product models (GrooveboxSampler /
SynthstromDeluge, AnalogDrumMachine / SequentialTempest,
HybridMonophonicSynthesizer / SequentialPro3,
PolyphonicAnalogSynthesizer / MoogOne, EurorackSystem, StudioRig with
zero-copy `skos:closeMatch` to IOF `construct/EngineeredSystem`);
vendor MIDI implementation charts as spec + Artifact-Model
(`ont00001045`) individuals; enum collections for vocab-lowering.
Verification slice first: one device + one port class + one enum
end-to-end through the relational projection.

## (c) Haplotype-local — stays in synth, never lands here

SysML authoring sources; firmware-derived fragments
(`Derived: oss-deluge@<sha> <path>` stamps); the rig's named
individuals, snapshots/timeslices, patch states; HermiT/kvasir
certificates shipped with the projected artifact (`zndx.verify.v1`);
the census document itself.

## Stack plan

1. **This PR** — the partition (discussion surface; not for merge as-is).
2. Profile illustration — example TTL fragments of the bounded profile
   output for one device (stacked on this branch).
3. Admission candidates — the staged content of (b), once the
   verification slice passes.
