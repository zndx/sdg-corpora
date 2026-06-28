---
chapter_id: ch_live_instrument_subclass_037f05
topic_id: 186
family: 01_foundation
cited_terms: ['instrument_subclass', 'annotation_assigned_by', 'nist80053_high_impact']
model: engine-refine
---

In governed operational and compliance environments, every durable fact must be addressable, typed, and traceable across its lifecycle. An **identifier** is the stable handle that makes that possible: it survives renaming, reclassification, and cross-system exchange without ambiguity. Instrument subclasses carry identifiers such as `INST-0001` through `INST-0004`, each denoting a distinct measurement capability—an X-Ray Diffractometer Bruker D8, a Flow Cytometer BD FACSCanto, seismometers and spectrophotometers—rather than a transient display label. Assignment records (`ASSI-0001`–`ASSI-0004`) and high-impact control references (`IMPA-0001`–`IMPA-0006`) use the same convention, so provenance chains, audit queries, and policy mappings can join records by key even when human-readable names differ or evolve.

An **entity** is the thing those identifiers name: the instrument subclass, the annotation assignment, the NIST control artifact, or any other governed object that owns state. Attributes do not float freely; they attach to entities through explicit foreign keys. A confidence score of `0.167` on `ASSI-0001`, a dimension kind of `Dimension Kind 01`, and a `recorded_at` timestamp of `2025-05-21T21:38:03` are not interchangeable blobs—they are assertions *about* specific entities (`ASSI-0001`, `ASSI-0002`, and so on). That separation matters in practice because governance workflows treat the entity as the unit of authorization, retention, and correction: you amend or retract a statement about `ASSI-0003` (a `provenance_trace` annotation) without disturbing unrelated assignments, and you can prove which instrument subclass (`INST-0003`, a Seismometer CMG-3ESP producing ground acceleration) was in scope when the assertion was made.

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | IMPA-0005 |
| ASSI-0002 | telemetry_ingestion | IMPA-0006 |
| ASSI-0003 | provenance_trace | IMPA-0005 |
| ASSI-0004 | provenance_trace | IMPA-0006 |
| ASSI-0005 | source_system_sync | IMPA-0004 |
| ASSI-0006 | source_system_sync | IMPA-0004 |

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

**Attr** and **attr type** form the schema contract for those assertions. The attribute name declares *what* is being said—`confidence`, `dimension_kind`, `method`, `recorded_at`—while the type declares *how* it may legally be represented and validated. `confidence` is typed as `xsd:decimal` and therefore lands in decimal-valued storage; `dimension_kind` and `method` are `xsd:string` and route to character storage; `recorded_at` is `xsd:dateTime` and demands ISO-8601 temporal literals. Splitting values by type is not an implementation quirk; it is how compliance systems enforce parseability, comparison, and aggregation. A reviewer cannot silently store `calibration record` in a numeric slot, and an auditor can require that every `recorded_at` value parse as a datetime before accepting a provenance bundle. The typed partition also explains why one entity may hold multiple attribute rows keyed to different `attr_id` values while still belonging to a single logical record.

The stored payload itself—carried in the **misc** value field across typed tables—is the evidentiary content once structure is satisfied. Misc holds the literal: `0.404` as a confidence reading, `103.53` and `863.30` as other decimal measurements, `Encoding 02` as a string-encoded method detail, or `de` as a terse varchar fragment that may be incomplete or locale-specific. Datetime misc values anchor events in time (`2024-06-17T00:22:41` for telemetry ingestion, `2023-06-05T19:53:01` for an earlier provenance trace), which is essential when reconstructing sequences for incident response or control effectiveness reviews. In operations, misc is what investigators read; attr and attr type are what let them trust that what they read means what the system claims it means.

Temporal and classificatory metadata sit alongside typed assertions to govern eligibility and trust. **Createddate** marks when a governed object entered the corpus—instrument subclasses registered between `2023-03-12` and `2023-09-27`—establishing baseline freshness for downstream certification and inventory reconciliation. **Tags** apply orthogonal policy labels: `archived` signals reduced operational reliance, `internal` restricts disclosure scope, and `verified` marks records that have passed a defined attestation step, as with `INST-0003` and `INST-0004`. Tags do not replace attributes; they answer different questions. Createddate answers “when did we recognize this object?” Tags answer “under which handling rules should processors treat it now?” Together they prevent verified seismometer metadata from being ingested through the same automation path as archived diffractometer definitions without explicit exception handling.

**t_instrument_subclass**

| id | instrument | produces_measurement | created_date | tags |
| --- | --- | --- | --- | --- |
| INST-0001 | X-Ray Diffractometer Bruker D8 | ion intensity | 2023-09-27 | archived |
| INST-0002 | Flow Cytometer BD FACSCanto | infrared radiation | 2023-08-26 | internal |
| INST-0003 | Seismometer CMG-3ESP | ground acceleration | 2023-03-12 | verified |
| INST-0004 | Spectrophotometer XPS-500 | ground acceleration | 2023-09-07 | verified |
| INST-0005 | Flow Cytometer BD FACSCanto | voltage waveform | 2023-03-06 | pii |
| INST-0006 | Thermal Imager FLIR T640 | ion intensity | 2024-03-26 | archived |

Relationships between governed objects are modeled through **subject**, **target**, and **role**, not merely through shared identifiers. A subject is the originating node in a directed association—here, a NIST high-impact control reference such as `IMPA-0006` or `IMPA-0003`—while a target is the node receiving that association, such as an impact-level designation (`IMPA-0002` for Moderate, `IMPA-0003` for Tier-4 or Severity-Medium, `IMPA-0004` for Compliance-Low). The **role** qualifies the semantic obligation of the link: `contributor` versus `reviewer` versus `observer` determines whether a party may assert mappings, approve them, or only witness them. That triplet pattern mirrors how annotation assignments name both an annotation (`compliance_audit`, `telemetry_ingestion`, `provenance_trace`) and an assigner (`IMPA-0005`, `IMPA-0006`), while separate attribute rows document confidence, method, and timestamps. In practice, subject–target–role edges are how frameworks like NIST SP 800-171, SP 800-61, Zero Trust Architecture, and SP 800-161 attach to impact tiers without collapsing distinct controls into a single undifferentiated list; identifiers bind the nodes, roles bind the duties, and typed attributes plus tags supply the auditable substance between them.

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |