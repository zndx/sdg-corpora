---
chapter_id: ch_live_transformation_min_one_output_761160
topic_id: 0
family: 05_provo_lineage
cited_terms: ['transformation_min_one_output', 'profiling_only_targets_datasets', 'clinical_quality_research_role']
model: engine-refine
---

Governance of operational and clinical-quality data rests on a small set of recurring semantic primitives that recur across profiling, transformation, and accountability subgraphs. An identifier supplies the durable surrogate key that permits stable reference under schema evolution and cross-table reconciliation: OUTP-0001 through OUTP-0004 name distinct transformation outputs and their dataset bindings, DATA-0001 through DATA-0004 anchor profiling targets and their attribute registries, and ROLE-0001 through ROLE-0004 enumerate clinical-quality research roles and their jurisdictional attachments. Without such keys, assertions about who reviewed which output, which attribute was profiled, or which regulatory office holds authority over a given safety function cannot be replayed, audited, or joined across heterogeneous stores; the identifier is therefore not merely a storage convenience but the evidential spine on which lineage, access control, and compliance attestations depend.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_clinical_quality_research_role_holds_role_in**

| id | holds_role_in |
| --- | --- |
| ROLE-0001 | EMA Governance Office |
| ROLE-0002 | CDC Regulatory Division |
| ROLE-0003 | Joint Commission Authority |
| ROLE-0004 | DoD Clinical Trial Office |
| ROLE-0005 | NHS Research Ethics Board |
| ROLE-0006 | VA Research Authority |
| ROLE-0007 | CDC Regulatory Division |
| ROLE-0008 | VA Research Authority |

**t_clinical_quality_research_role__holds_role_in**

| id | clinical_id | holds_role_in_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0002 | ROLE-0006 | reviewer |
| ROLE-0002 | ROLE-0002 | ROLE-0008 | observer |
| ROLE-0003 | ROLE-0005 | ROLE-0008 | reviewer |
| ROLE-0004 | ROLE-0006 | ROLE-0001 | reviewer |
| ROLE-0005 | ROLE-0004 | ROLE-0005 | owner |
| ROLE-0006 | ROLE-0005 | ROLE-0006 | owner |
| ROLE-0007 | ROLE-0003 | ROLE-0007 | owner |
| ROLE-0008 | ROLE-0001 | ROLE-0004 | owner |

Entity and attr jointly specify what is being described and under which measurable dimension. An entity denotes the governed object instance—here, profiling subjects such as DATA-0001 and DATA-0002 that accumulate observations across multiple attribute slots—while attr names the facet under scrutiny: duration_seconds, end_time, exit_code, and host_name each declare a distinct analytical or operational property to be measured, validated, or reported. Attr type constrains interpretation and routes persistence: xsd:decimal for duration_seconds, xsd:dateTime for end_time, xsd:integer for exit_code, and xsd:string for host_name enforce lexical and computational semantics so that downstream profiling (null rate analysis, cardinality profiling, data lineage sweep, hash integrity check) operates on values whose structure is known in advance. Typed value stores then hold the misc payload—the concrete datum attached to an entity–attr pair—such as 30.48 and 6189.13 under duration_seconds, 2024-10-18T20:19:23 and 2025-02-03T06:32:48 under datetime attributes, exit codes 255 and 337, and host or status literals gw-12, Log Level 02, closeout, and failed. Partitioning misc by attr type prevents silent coercion, preserves audit integrity, and allows cardinality and distribution analyses to respect the intended measurement scale.

Relational governance extends entity–attribute modeling through subject–target assertions qualified by role and, where multiplicity must be explicit, cardinality note. In junction patterns, subject identifies the originating governed node and target the node acted upon or produced: transformation_id OUTP-0006 and OUTP-0003 link to output_dataset_id OUTP-0003, OUTP-0005, and OUTP-0001, materializing how data normalization and format conversion steps yield parsed access logs, curated events tables, and a standardized inventory index; parallel clinical bindings pair clinical_id ROLE-0002, ROLE-0005, ROLE-0001, and ROLE-0004 with applies_to_id targets that reference governed clinicalqualitydata artifacts. Role annotates the nature of participation without collapsing it into ownership alone—reviewer, contributor, and observer on transformation–dataset edges, owner and contributor on clinical applicability edges—so that separation-of-duties reviews can distinguish attestation from authorship and passive oversight from active remediation. Cardinality note (Cardinality Note 01 through Cardinality Note 04 in the applies_to subgraph) records explicit multiplicity or coverage constraints where a one-to-many or qualified many-to-many relationship would otherwise remain implicit; such notes matter when regulators expect documented scope limits—e.g., whether a Safety Monitor’s authority extends to all instances of an Adverse Event Log or only to a bounded subset—and when automated policy engines must reject over-broad role assignments.

Clinical-quality governance instantiates these primitives in domain-specific taxonomies. A clinicalqualityresearchrole names the functional stewardship category—Quality Assurance Lead, Safety Monitor, Data Integrity Auditor—while emsauthority (expressed as holds_role_in) situates that function inside a recognized enforcement or oversight body: EMA Governance Office, CDC Regulatory Division, Joint Commission Authority, DoD Clinical Trial Office. The pairing is seldom one-to-one at the assertion level: duplicate Safety Monitor entries and cross-links such as clinical_id ROLE-0002 holding reviewer status within ROLE-0008 illustrate how the same role archetype may be exercised under different authorities or with different interaction modes (reviewer versus observer on holds_role_in edges). Clinicalqualitydata designates the regulated information product to which those roles apply—Adverse Event Log, Procedure Coding Set, Electronic Health Record Extract, Imaging Metadata Archive—so that accountability is anchored to artifacts subject to SOPs, retention rules, and inspection scope rather than to abstract job titles alone. Owner and contributor roles on applies_to edges, together with cardinality notes, define who may certify completeness, who may amend coding sets, and under what numerical or temporal bounds those permissions remain valid.

**t_clinical_quality_research_role_applies_to**

| id | applies_to |
| --- | --- |
| ROLE-0001 | Adverse Event Log |
| ROLE-0002 | Procedure Coding Set |
| ROLE-0003 | Electronic Health Record Extract |
| ROLE-0004 | Imaging Metadata Archive |
| ROLE-0005 | Vital Signs Stream |
| ROLE-0006 | Laboratory Results Database |

In operational data pipelines, the same subject–target–role fabric governs non-clinical transformations and profiling-only targets. Transformations labeled data normalization or format conversion do not merely rename files; they assert accountable production of output_dataset products whose fitness for analytics depends on prior profiling of attrs such as duration_seconds and host_name on entities DATA-0001–DATA-0004. When OUTP-0001 carries role reviewer while sibling edges carry contributor or observer, the pipeline encodes a controlled visibility and approval lattice over curated events tables and inventory indices—distinct from clinical owner/contributor semantics yet structurally homologous, enabling unified policy engines to reason across research, safety, and infrastructure domains. Profiling attr registries decoupled from misc value tables exemplify why attr and attr_type must precede value capture: lineage sweeps and hash integrity checks reference attribute identity before scanning concrete literals, ensuring that anomalies in exit_code 67 versus 59 or in failed versus closeout status strings are attributed to the correct entity and measurement definition.

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, role, cardinality note, clinicalqualityresearchrole, emsauthority, and clinicalqualitydata form an interlocking compliance vocabulary in which facts are never free-floating. Identifiers stabilize records; entities and attrs define the ontological locus of measurement; typed misc values supply evidentiary content; subject–target edges with role (and cardinality note where multiplicity is material) express governed relationships among transformations, datasets, authorities, and clinical artifacts. Practitioners who maintain this separation—naming what exists, typing how it is measured, binding who acts in which capacity, and documenting cardinality where scope could be disputed—produce audit trails that survive organizational change, regulatory inspection, and cross-system integration without loss of interpretive force.

**t_clinical_quality_research_role**

| id | clinical_quality_research_role |
| --- | --- |
| ROLE-0001 | Quality Assurance Lead |
| ROLE-0002 | Safety Monitor |
| ROLE-0003 | Safety Monitor |
| ROLE-0004 | Data Integrity Auditor |
| ROLE-0005 | Principal Investigator |
| ROLE-0006 | Regulatory Submission Specialist |

**t_clinical_quality_research_role__applies_to**

| id | clinical_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | ROLE-0006 | owner | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0001 | owner | Cardinality Note 02 |
| ROLE-0003 | ROLE-0001 | ROLE-0005 | contributor | Cardinality Note 03 |
| ROLE-0004 | ROLE-0004 | ROLE-0001 | contributor | Cardinality Note 04 |
| ROLE-0005 | ROLE-0001 | ROLE-0002 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0002 | ROLE-0006 | owner | Cardinality Note 06 |
| ROLE-0007 | ROLE-0003 | ROLE-0001 | observer | Cardinality Note 07 |
| ROLE-0008 | ROLE-0006 | ROLE-0004 | owner | Cardinality Note 08 |