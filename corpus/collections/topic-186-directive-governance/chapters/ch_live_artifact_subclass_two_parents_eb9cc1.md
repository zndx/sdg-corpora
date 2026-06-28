---
chapter_id: ch_live_artifact_subclass_two_parents_eb9cc1
topic_id: 186
family: 01_foundation
cited_terms: ['artifact_subclass_two_parents', 'professional_experience', 'artifact_with_existential']
model: engine-refine
---

In modern data governance frameworks, every artifact—whether a streaming window, a telemetry aggregate, a model checkpoint, or a provenance certificate—must carry a stable, machine-actionable identifier that survives across system boundaries and time. Identifiers follow established naming conventions: a DOI such as `doi:10.1109/x` anchors an artifact to a scholarly or standards body, an OID like `oid:1.3.6.1` ties it to an organizational hierarchy, and a URN such as `urn:uuid:9f2a` provides a globally unique reference. These identifiers are not merely labels; they are the primary keys that enable cross-referencing between artifacts, their attributes, and the people and organizations responsible for them. An artifact like `streaming-window-5min` or `telemetry-aggregate-q3` gains meaning only when its identifier can be resolved to a complete record of provenance, classification, and custodianship.

**t_artifact_subclass_two_parents**

| id | artifact | artifact_2 | identifier | tags |
| --- | --- | --- | --- | --- |
| PARE-0001 | streaming-window-5min | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0002 | streaming-window-5min | metadata-registry-sync | oid:1.3.6.1 | pii |
| PARE-0003 | telemetry-aggregate-q3 | encryption-key-rotation | ref-8842 | verified |
| PARE-0004 | model-checkpoint-epoch12 | master-schema-v1 | urn:uuid:9f2a | internal |
| PARE-0005 | telemetry-aggregate-q3 | master-schema-v1 | oid:1.3.6.1 | public |
| PARE-0006 | model-checkpoint-epoch12 | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0007 | index-rebuild-prod | validation-ruleset-strict | urn:uuid:9f2a | verified |

Classification and lifecycle management depend on tags attached to each artifact. Tags such as `verified`, `pii`, and `internal` serve as machine-readable policy signals that drive downstream compliance workflows. A `pii` tag on an artifact triggers data-protection controls; a `verified` tag indicates that the artifact has passed a quality gate; an `internal` tag restricts distribution. These tags operate alongside the artifact's parentage relationships—artifacts like `streaming-window-5min` may derive from both an `ingestion-script-v2` and a `metadata-registry-sync`, forming a directed acyclic graph of dependencies that must be auditable. The two-parent relationship structure captures cases where an artifact synthesizes inputs from multiple upstream sources, a common pattern in data pipelines where transformation logic merges independent data streams.

The people and organizations behind artifacts are recorded through professional experience entries that link individuals to their roles and the institutions they represent. Elena Rostova, Marcus Chen, and Fatima Al-Mansour appear as professional experience holders associated with organizations such as Nexus Data Corp, Quality Assurance, Quantum Provenance, and the Governance Council. These entries are not free-text narratives; they are structured records with explicit encoding and language metadata. An entry might be encoded in `latin1`, `utf8`, or `ascii`, and recorded in `fr`, `de`, `es`, or `ja`. This encoding and language information is critical for interoperability: it ensures that name strings, job titles, and organizational descriptions can be correctly interpreted by systems operating in different character sets and linguistic contexts. The same person, Fatima Al-Mansour, may appear in multiple experience records with different organizations and different encodings, reflecting a career trajectory that spans institutional boundaries and language environments.

**t_professional_experience**

| id | professional_experience | holder | organization | encoding | language |
| --- | --- | --- | --- | --- | --- |
| EXPE-0001 | Elena Rostova | ML Platform Unit | Nexus Data Corp | latin1 | fr |
| EXPE-0002 | Marcus Chen | Quality Assurance | Quality Assurance | utf8 | de |
| EXPE-0003 | Fatima Al-Mansour | Quantum Provenance | Systems Reliability | ascii | es |
| EXPE-0004 | Fatima Al-Mansour | Governance Council | Quality Assurance | utf8 | ja |
| EXPE-0005 | Sofia Rossi | Atlas Infrastructure | Quantum Provenance | latin1 | es |
| EXPE-0006 | Liam O'Connor | ML Platform Unit | Stratos Cloud | ascii | es |
| EXPE-0007 | Yuki Tanaka | Platform Operations | Orion Telemetry Inc | ascii | fr |
| EXPE-0008 | Yuki Tanaka | Aegis Governance Ltd | Quality Assurance | utf8 | ja |

Artifact attributes are modeled as a three-layer structure: the attribute definition, the attribute type, and the attribute value. The attribute definition layer specifies the name and semantic type of a property—for example, `checksum` typed as `xsd:string`, `created_date` typed as `xsd:date`, or `license` typed as `xsd:string`. The type system draws from XML Schema types and domain-specific vocabularies such as `cco:DesignativeICE`, ensuring that type checking and validation can be performed consistently. Values are stored in separate typed tables: date values like `2024-03-17` or `2023-12-18` in the date table, integer values like `401` or `361` in the integer table, and string values like `5e8f3c91`, `urn:uuid:9f2a`, `proprietary`, or `on-prem-dc1` in the varchar table. Each value row references both the entity (the artifact or existential record it belongs to) and the attribute definition, creating a normalized structure that supports arbitrary attribute cardinality without schema changes.

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | backup-storage-array |
| EXIS-0002 | edge-gateway | environmental-monitor |
| EXIS-0003 | edge-gateway | network-traffic-capture |
| EXIS-0004 | audit-log-2023 | field-site-alpha |
| EXIS-0005 | edge-gateway | ingestion-pipeline |
| EXIS-0006 | audit-log-2023 | data-retention-policy |

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

**t_artifact_with_existential_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0002 | 2024-03-17 |
| EXIS-0002 | EXIS-0002 | EXIS-0002 | 2024-10-14 |
| EXIS-0003 | EXIS-0003 | EXIS-0002 | 2023-12-18 |
| EXIS-0004 | EXIS-0004 | EXIS-0002 | 2023-02-05 |
| EXIS-0005 | EXIS-0005 | EXIS-0002 | 2024-03-19 |
| EXIS-0006 | EXIS-0006 | EXIS-0002 | 2025-01-11 |

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

Existential relationships capture the dependencies between artifacts and the infrastructure or data stores they require to function. An artifact such as `edge-gateway` may depend on an `environmental-monitor` or a `network-traffic-capture` system, while a `provenance-cert` may depend on a `backup-storage-array`. These relationships are not merely descriptive; they are operational constraints. If a dependent entity becomes unavailable, the artifact that depends on it may become non-functional or its guarantees may be voided. The existential attribute framework allows each such dependency to carry its own set of typed attributes—creation dates, checksums, license terms—so that the provenance of the dependency itself is traceable. This layered approach, where attributes and values are decoupled from the entities they describe, enables fine-grained auditing and supports compliance requirements that demand evidence of data lineage, access controls, and operational dependencies.