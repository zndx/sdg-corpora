---
chapter_id: ch_live_artifact_with_existential_ac767e
topic_id: 186
family: 01_foundation
cited_terms: ['artifact_with_existential', 'artifact_with_min_two_parts', 'artifact_with_role']
model: engine-refine
---

In governed artifact registries, every registrable object is an entity: a durable record whose meaning persists across storage locations, pipeline stages, and audit cycles. Each entity is addressed by an identifier—a stable, designative key that must remain unambiguous even when the underlying bytes move, are copied, or are referenced from multiple contexts. Identifiers such as EXIS-0001 and ROLE-0001 are not decorative labels; they are the anchors compliance officers, automation, and downstream systems use to assert that a provenance certificate, an edge gateway configuration, or a patient cohort dataset is the same logical artifact today as it was when last reviewed. Where governance requires explicit designation semantics, attribute typing can elevate identifier itself to a first-class property—typed, for instance, as a designative information content entity—so that naming authority and referential integrity are machine-checkable rather than inferred from convention alone.

Attributes extend entities without collapsing them into wide, brittle tables. An attr is a named facet of an entity—checksum, created_date, license, deployment site—while attr_type declares how that facet must be interpreted and validated. Typing with xsd:date constrains temporal assertions such as 2024-03-17 for one edge-gateway record and 2023-02-05 for a field-site audit log; xsd:string accommodates opaque or lexical values like proprietary licensing terms or urn:uuid:9f2a; specialized ontological types such as cco:DesignativeICE signal that the value participates in identity designation rather than mere description. Separating name from type is what allows a single registry to host heterogeneous metadata under common retrieval and policy rules: validators know which parser to apply, retention engines know which fields are legally salient, and cross-system exchange can map local columns to a shared semantic layer without rewriting core entity records.

Values are materialized through typed stores that all converge on the same logical shape: entity plus attribute plus payload. The payload column—often surfaced generically as misc—holds the literal assertion once typing has routed it to the correct physical representation. Dates land in date-valued stores; counts and versions in integer stores; checksums, URNs, licenses, and site codes in character stores. A provenance certificate may therefore carry both an integer size assertion (401) and a separate integer version or cardinality marker (10) under different attribute bindings for the same EXIS-0001 entity, while its checksum 5e8f3c91 and site designation on-prem-dc1 sit alongside as distinct varchar-backed facts. This pattern trades normalized elegance for operational resilience: new attributes can be introduced without schema migrations, historical values remain addressable by identifier triples, and auditors can reconstruct “who said what about which entity, when, and under which type” from immutable attribute rows rather than from overwritten document fields.

**t_artifact_with_existential_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0002 | 2024-03-17 |
| EXIS-0002 | EXIS-0002 | EXIS-0002 | 2024-10-14 |
| EXIS-0003 | EXIS-0003 | EXIS-0002 | 2023-12-18 |
| EXIS-0004 | EXIS-0004 | EXIS-0002 | 2023-02-05 |
| EXIS-0005 | EXIS-0005 | EXIS-0002 | 2024-03-19 |
| EXIS-0006 | EXIS-0006 | EXIS-0002 | 2025-01-11 |

**t_artifact_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | 5e8f3c91 |
| EXIS-0002 | EXIS-0001 | EXIS-0003 | urn:uuid:9f2a |
| EXIS-0003 | EXIS-0001 | EXIS-0004 | proprietary |
| EXIS-0004 | EXIS-0001 | EXIS-0009 | on-prem-dc1 |
| EXIS-0005 | EXIS-0001 | EXIS-0005 | application/json |
| EXIS-0006 | EXIS-0001 | EXIS-0010 | Name 06 |
| EXIS-0007 | EXIS-0001 | EXIS-0011 | platform-team |
| EXIS-0008 | EXIS-0001 | EXIS-0012 | Tags 08 |

**t_artifact_with_min_two_parts**

| id | artifact | checksum | version |
| --- | --- | --- | --- |
| PART-0001 | raw_telemetry_dump | c0ffee42 | 7 |
| PART-0002 | compliance_manifest | a3f9c21e | 5 |
| PART-0003 | inference_model_final | 5e8f3c91 | 11 |
| PART-0004 | ingestion_script_main | 7b14de08 | 10 |
| PART-0005 | etl_pipeline_run | 1a4b6c2d | 9 |

Checksum and version are the twin pillars of integrity and lifecycle control, and they appear both as first-class columns where artifacts are stored in compact, two-part records and as attributed properties where existential modeling demands richer context. A checksum such as 5e8f3c91 functions as a content fingerprint: it lets operators prove that an inference model final artifact, a provenance certificate, and a transform-stage patient-cohort derivative either share identical payload or—when they differ, as with 7b14de08 on an ingestion script versus a transform-stage output—must be treated as distinct materializations requiring separate approval. Version, expressed as integers like 7 for a raw telemetry dump or 11 for an inference model, orders authorized replacements within a single logical lineage so that rollback, diff review, and “latest approved” queries do not depend on file timestamps or repository tags alone. In pipeline-oriented registrations, the same logical artifact name may recur across roles—patient-cohorts-2023 as source-dataset, transform-stage, output-sink, and archival-copy—each row distinguished by role, checksum, and measured size rather than by a naive one-name-one-row assumption.

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | backup-storage-array |
| EXIS-0002 | edge-gateway | environmental-monitor |
| EXIS-0003 | edge-gateway | network-traffic-capture |
| EXIS-0004 | audit-log-2023 | field-site-alpha |
| EXIS-0005 | edge-gateway | ingestion-pipeline |
| EXIS-0006 | audit-log-2023 | data-retention-policy |

Sizebytes closes the loop between logical registry entries and physical obligations. Recording 666903238 bytes for a source dataset, 309925726 for an intermediate transform-stage artifact, and smaller footprints such as 29914871 for a feature-store cache makes capacity planning, data-minimization review, and breach-impact estimation auditable directly from the catalog. Size does not replace checksum—two artifacts can differ in role and byte count while sharing no content relationship—but together they support proportionality analysis: archival copies at 347040623 bytes can be weighed against active sinks, and anomalies (a cache an order of magnitude smaller than its source) become visible without opening object stores. For compliance programs, that measurability matters when demonstrating that only necessary copies exist, that transformations did not silently expand sensitive cohorts, and that retention schedules attach to entities with quantifiable storage commitment.

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | source-dataset | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | transform-stage | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | output-sink | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | archival-copy | 9d2b7a16 | 347040623 |

Taken together, identifier, entity, attr, attr_type, misc, checksum, version, and sizebytes describe a registry grammar for trustworthy operations. Identifiers bind existential records—provenance-cert linked to backup-storage-array, duplicate edge-gateway instances tied to environmental monitoring versus network capture, audit logs scoped to field-site-alpha—to the wider system graph through related associations without conflating identity with placement. Attributes carry the evidentiary detail; typing ensures those details are admissible in automated policy checks; checksums and versions guard against silent substitution; sizebytes grounds abstract approvals in resource reality. Mature practice treats these elements not as incidental columns but as contractual interfaces: change an attribute without updating type and value stores and you break validation; reuse a checksum across roles without documenting lineage and you invite false equivalence; advance version without retaining prior identifiers and you forfeit demonstrable continuity under examination. The examples above are small in count yet representative in force—each value illustrates how dense, typed, entity-centric metadata converts a list of filenames into a governable corpus whose integrity claims can be tested, not merely asserted.

**t_artifact_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | checksum | xsd:string |
| EXIS-0002 | created_date | xsd:date |
| EXIS-0003 | identifier | cco:DesignativeICE |
| EXIS-0004 | license | xsd:string |
| EXIS-0005 | mime_type | xsd:string |
| EXIS-0006 | size_bytes | xsd:long |
| EXIS-0007 | uri | xsd:string |
| EXIS-0008 | version | xsd:integer |

**t_artifact_with_existential_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0006 | 401 |
| EXIS-0002 | EXIS-0001 | EXIS-0008 | 10 |
| EXIS-0003 | EXIS-0002 | EXIS-0006 | 361 |
| EXIS-0004 | EXIS-0002 | EXIS-0008 | 7 |
| EXIS-0005 | EXIS-0003 | EXIS-0006 | 386 |
| EXIS-0006 | EXIS-0003 | EXIS-0008 | 10 |
| EXIS-0007 | EXIS-0004 | EXIS-0006 | 351 |
| EXIS-0008 | EXIS-0004 | EXIS-0008 | 8 |