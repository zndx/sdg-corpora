---
chapter_id: ch_live_artifact_max_one_owner_21a951
topic_id: 46
family: 07_long_tail
cited_terms: ['artifact_max_one_owner', 'artifact_either_active_or_archived', 'schemaorg_person_named']
model: engine-refine
---

In governed artifact registries, an entity is the durable record under stewardship—not the deployable name alone, but the bounded fact the organization must be able to cite, audit, and reconcile across time. A telemetry archive, an ETL transform, or an ML inference release each constitutes such a record when registered with a stable identifier such as OWNE-0001 or ARCH-0003; the identifier is the canonical handle by which policy engines, lineage tools, and access reviews retrieve the same object regardless of how its human-readable label may drift. Where ownership is constrained so that each artifact admits at most one accountable party, the entity OWNE-0001 binds telemetry-archive-2023 to analytics-division, whereas OWNE-0002 and OWNE-0003 both reference etl-transform-stable yet diverge in owner assignment—cloud-infrastructure versus platform-engineering—making explicit that governance attaches to the registration row, not merely to a shared string name. Archival posture introduces a complementary entity shape in which a single registration may simultaneously reference an active artifact, a downstream sink or validator, and a deployment or compliance adjunct, as when sensor-telemetry-v4 is associated with output-sink-delta and test-dataset under ARCH-0001, or event-stream-kafka is triangulated with checksum-validator and compliance-tier under ARCH-0004.

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | analytics-division |
| OWNE-0002 | etl-transform-stable | cloud-infrastructure |
| OWNE-0003 | etl-transform-stable | platform-engineering |
| OWNE-0004 | ml-inference-v2.1 | cloud-infrastructure |
| OWNE-0005 | ml-inference-v2.1 | backend-architecture |
| OWNE-0006 | etl-transform-stable | ml-ops-team |

**t_artifact_either_active_or_archived**

| id | artifact | artifact_2 | artifact_3 |
| --- | --- | --- | --- |
| ARCH-0001 | sensor-telemetry-v4 | output-sink-delta | test-dataset |
| ARCH-0002 | config-repo-main | schema-registry | deployment-target |
| ARCH-0003 | data-catalog-index | upstream-source-beta | test-dataset |
| ARCH-0004 | event-stream-kafka | checksum-validator | compliance-tier |
| ARCH-0005 | config-repo-main | checksum-validator | production-cluster |
| ARCH-0006 | ml-feature-store | validation-module | test-dataset |
| ARCH-0007 | sensor-telemetry-v4 | validation-module | deployment-target |
| ARCH-0008 | batch-ingest-queue | validation-module | dev-sandbox |

Attributes declare what may be said about an entity and under what interpretive contract. An attr is the named facet—checksum, created_date, identifier, license—while attr_type fixes the semantic and syntactic regime in which assertions must be read: xsd:string for opaque text, xsd:date for calendar facts, cco:DesignativeICE for designative identifiers intended to interoperate with external identity schemes. This separation matters because compliance is not satisfied by storing values in a single undifferentiated column; auditors require proof that a date was recorded as a date, that a license token was recorded as a string, and that a cross-system identifier was recorded under a type that signals its evidentiary role. The attr layer therefore precedes enforcement: before a value of MIT or BSD-3-Clause can ground a license attestation, the license attribute must exist with attr_type xsd:string; before created_date may anchor retention schedules, it must be typed xsd:date. Typed attribute definitions are the vocabulary through which entities become inspectable objects rather than inert rows.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

Values—the misc dimension in operational parlance—materialize attribute claims as evidence bound to entity and attr through explicit linkage. Rather than collapsing heterogeneous facts into one table, implementations partition storage by value kind so that integrity checks, range queries, and format validation can be applied without coercion. For OWNE-0001, the varchar plane holds checksum c0ffee42 and license MIT alongside identifier ARN:res/41 under the designative type; the date plane records created_date as 2023-04-04; the integer plane carries counts such as 427 and 2 that may represent revision tallies, dependency cardinalities, or tier indices depending on organizational convention. The same pattern recurs for archived registrations: ARCH-0001 stores checksum 7b14de08, license BSD-3-Clause, region ap-south-2, and created_date 2024-02-12, demonstrating that lifecycle state does not relax typing discipline. misc is thus not miscellaneous in the sense of ungoverned; it is the typed payload whose admissibility is determined upstream by attr and attr_type, and whose probative force depends on remaining joinable to the correct entity_id and attr_id pair.

**t_artifact_either_active_or_archived_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0002 | 2024-02-12 |
| ARCH-0002 | ARCH-0002 | ARCH-0002 | 2023-06-04 |
| ARCH-0003 | ARCH-0003 | ARCH-0002 | 2025-05-16 |
| ARCH-0004 | ARCH-0004 | ARCH-0002 | 2024-07-03 |
| ARCH-0005 | ARCH-0005 | ARCH-0002 | 2024-07-21 |
| ARCH-0006 | ARCH-0006 | ARCH-0002 | 2024-03-16 |
| ARCH-0007 | ARCH-0007 | ARCH-0002 | 2025-02-16 |
| ARCH-0008 | ARCH-0008 | ARCH-0002 | 2024-07-02 |

**t_artifact_either_active_or_archived_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0001 | 7b14de08 |
| ARCH-0002 | ARCH-0001 | ARCH-0003 | ref-8842 |
| ARCH-0003 | ARCH-0001 | ARCH-0004 | BSD-3-Clause |
| ARCH-0004 | ARCH-0001 | ARCH-0009 | ap-south-2 |
| ARCH-0005 | ARCH-0001 | ARCH-0005 | text/csv |
| ARCH-0006 | ARCH-0001 | ARCH-0010 | Name 06 |
| ARCH-0007 | ARCH-0001 | ARCH-0011 | analytics |
| ARCH-0008 | ARCH-0001 | ARCH-0012 | Tags 08 |

Identifiers within the attribute system serve a dual office that practitioners must not conflate. At the registry level, OWNE-0004 and NAME-0001 function as primary keys—opaque, stable, and indifferent to domain semantics. As an attribute value, by contrast, identifier denotes a subject-facing designator whose meaning is externalized: ARN:res/41 for a resource record, ref-8842 for a catalog cross-reference. The attr_type cco:DesignativeICE signals precisely this latter role, instructing downstream consumers that the string is intended for correlation across systems rather than for internal surrogate-key joins. Governance workflows lean on that distinction when reconciling CMDB entries, cloud ARNs, and schema.org URIs; an internal OWNE key proves which registration row is authoritative, while an ARN or person/alan_turing path proves how the organization speaks about the asset in federated namespaces. Failure to preserve both layers—surrogate identity and designative identity—is a recurring source of audit finding, because teams report compliance against external names while retention and ownership policies execute against internal entity keys.

Not all governed facts reduce to entity–attribute–value triples. Many obligations are inherently relational: who stands in what capacity toward whom, which persona observes which named individual, which engineering account owns which schema.org subject. The subject names the party or resource that initiates or bears the relationship; the target names the object or counterpart onto which the relationship is directed; role types the obligation itself—owner, observer, reviewer—so that the same subject and target pairing may appear under different roles without ambiguity. In the schema.org person registry, NAME-0003 (person/alan_turing) is linked to NAME-0002 (Donald Knuth) with role reviewer, while NAME-0004 (person/john_von_neumann) is linked to the same full_name_id under role owner, illustrating that identity reconciliation must traverse role-qualified edges rather than assume name equality. Grace Hopper appearing twice under NAME-0001 and NAME-0004 further shows why subject–target–role modeling supersedes naive deduplication: distinct schema.org subjects may require distinct governance treatment even when display names collide.

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

Operationally, these constructs interlock into a defensible evidence chain. Custodians register an entity and assign accountability—analytics-division for telemetry-archive-2023, cloud-infrastructure for ml-inference-v2.1. Attribute definitions typed to industry or organizational vocabularies establish which claims may be recorded. Value stores attach misc payloads without erasing type boundaries. Where human or organizational relationships matter, subject, target, and role edges capture duties that scalar attributes cannot express. Reviewers traversing from identifier through entity to attr, attr_type, and misc can reconstruct what was asserted, when, and under which interpretive rules; policy officers can test whether archived artifacts still carry checksum and license evidence appropriate to their tier; and federated identity teams can map schema.org subjects to accountable owners and reviewers without collapsing distinct registrations. The architecture earns its place in compliance handbooks not as an inventory of tables but as a discipline: entities are the subjects of obligation, attributes are the controlled lexicon of assertion, typed values are the admissible evidence, and role-bearing relationships are the assignments of responsibility that make the registry legible to both machines and auditors.

**t_artifact_max_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | checksum | xsd:string |
| OWNE-0002 | created_date | xsd:date |
| OWNE-0003 | identifier | cco:DesignativeICE |
| OWNE-0004 | license | xsd:string |
| OWNE-0005 | mime_type | xsd:string |
| OWNE-0006 | size_bytes | xsd:long |
| OWNE-0007 | uri | xsd:string |
| OWNE-0008 | version | xsd:integer |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

**t_artifact_max_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0006 | 427 |
| OWNE-0002 | OWNE-0001 | OWNE-0008 | 2 |
| OWNE-0003 | OWNE-0002 | OWNE-0006 | 401 |
| OWNE-0004 | OWNE-0002 | OWNE-0008 | 12 |
| OWNE-0005 | OWNE-0003 | OWNE-0006 | 38 |
| OWNE-0006 | OWNE-0003 | OWNE-0008 | 7 |
| OWNE-0007 | OWNE-0004 | OWNE-0006 | 393 |
| OWNE-0008 | OWNE-0004 | OWNE-0008 | 7 |

**t_artifact_max_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | c0ffee42 |
| OWNE-0002 | OWNE-0001 | OWNE-0003 | ARN:res/41 |
| OWNE-0003 | OWNE-0001 | OWNE-0004 | MIT |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | rack-7 |
| OWNE-0005 | OWNE-0001 | OWNE-0005 | application/octet-stream |
| OWNE-0006 | OWNE-0001 | OWNE-0010 | Name 06 |
| OWNE-0007 | OWNE-0001 | OWNE-0011 | sre |
| OWNE-0008 | OWNE-0001 | OWNE-0012 | Tags 08 |

**t_artifact_either_active_or_archived_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARCH-0001 | checksum | xsd:string |
| ARCH-0002 | created_date | xsd:date |
| ARCH-0003 | identifier | cco:DesignativeICE |
| ARCH-0004 | license | xsd:string |
| ARCH-0005 | mime_type | xsd:string |
| ARCH-0006 | size_bytes | xsd:long |
| ARCH-0007 | uri | xsd:string |
| ARCH-0008 | version | xsd:integer |

**t_artifact_either_active_or_archived_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0006 | 356 |
| ARCH-0002 | ARCH-0001 | ARCH-0008 | 2 |
| ARCH-0003 | ARCH-0002 | ARCH-0006 | 77 |
| ARCH-0004 | ARCH-0002 | ARCH-0008 | 4 |
| ARCH-0005 | ARCH-0003 | ARCH-0006 | 218 |
| ARCH-0006 | ARCH-0003 | ARCH-0008 | 10 |
| ARCH-0007 | ARCH-0004 | ARCH-0006 | 431 |
| ARCH-0008 | ARCH-0004 | ARCH-0008 | 2 |