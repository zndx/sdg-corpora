# Collection — topic 166 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **4 chapters** · **7 topics** (target + style) · **9 ontology terms** · **9 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 166: topic 2, topic 12, topic 14, topic 167, topic 180, topic 191.

> **Topic gist** (representative FinePDFs text): Aspects of phytoplankton spring blooms in northern coastal/shelf areas: Diatoms vs. *Phaeocystis pouchetii* (Hariot, Lagerheim) Gunilla Kristina Eriksen BIO-3950 Master’s thesis in Biology November 2010 Front - page photo: "Phaeocystis pouchetii and Chaetoceros socialis" (Richard Andre Ingebrigtsen) Acknowledgements First of all I wish to thank my supervisor, Hans Christian Eilertsen, which ... …

## Chapters

- [ch_live_audit_produces_evidence_42848b](chapters/ch_live_audit_produces_evidence_42848b.md)
- [ch_live_requirement_min_one_verification_b47446](chapters/ch_live_requirement_min_one_verification_b47446.md)
- [ch_live_ringbuf_map_subclass_f4e716](chapters/ch_live_ringbuf_map_subclass_f4e716.md)
- [ch_live_survey_response_record_bb42d4](chapters/ch_live_survey_response_record_bb42d4.md)

## Ontology terms grounding this collection

- `artifact_max_one_owner` — {X} is an artifact
- `audit_produces_evidence` — {X} is a process that produces evidence descriptive information content entity
- `claim_supported_by_evidence` — {X} is a descriptive information content entity that supported by evidence {Y}
- `intermediate_floor_assembly` — IntermediateFloorAssembly is a material continuant that contains a LateralRestraintStrap component.
- `kernelhook_observes_syscall_xref` — {X} is an artifact that observes syscall designative information content entity
- `lift_basic` — {X} is a descriptive information content entity
- `requirement_min_one_verification` — {X} is a directive information content entity
- `ringbuf_map_subclass` — {X} is an artifact that has ring buffer config {Y}
- `survey_response_record` — SurveyResponseRecord is a subclass of cco:InformationContentEntity that captures at least one ResearcherProfileAttribute

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_artifact_max_one_owner`](tables/t_artifact_max_one_owner.sql) — realizes `artifact_max_one_owner` · _shared with 7 other collection(s)_
- [`t_audit_produces_evidence`](tables/t_audit_produces_evidence.sql) — realizes `audit_produces_evidence` · _shared with 2 other collection(s)_
- [`t_claim_supported_by_evidence`](tables/t_claim_supported_by_evidence.sql) — realizes `claim_supported_by_evidence` · _shared with 4 other collection(s)_
- [`t_intermediate_floor_assembly`](tables/t_intermediate_floor_assembly.sql) — realizes `intermediate_floor_assembly` · _shared with 7 other collection(s)_
- [`t_kernelhook_observes_syscall_xref`](tables/t_kernelhook_observes_syscall_xref.sql) — realizes `kernelhook_observes_syscall_xref` · _shared with 5 other collection(s)_
- [`t_lift_basic`](tables/t_lift_basic.sql) — realizes `lift_basic` · _shared with 2 other collection(s)_
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification` · _shared with 6 other collection(s)_
- [`t_ringbuf_map_subclass`](tables/t_ringbuf_map_subclass.sql) — realizes `ringbuf_map_subclass` · _shared with 4 other collection(s)_
- [`t_survey_response_record`](tables/t_survey_response_record.sql) — realizes `survey_response_record` · _shared with 10 other collection(s)_
