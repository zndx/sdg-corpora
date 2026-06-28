---
chapter_id: ch_live_directive_only_governs_artifact_2c74b1
topic_id: 3
family: 07_long_tail
cited_terms: ['directive_only_governs_artifact', 'agent_identified_by_uri', 'equiv_union_basic']
model: engine-refine
---

Governance metadata rests on a small set of relational primitives—entity, attr, attr_type, identifier, misc, and owner—whose joint operation converts policy intent into auditable, machine-checkable fact. An entity is the governed object under management: a compliance directive bound to an operational artifact, an autonomous agent enrolled in an identity registry, or a logical resource participating in an equivalence class. Entities are not inferred from labels alone; they are addressed through identifiers that remain stable across schema evolution, cross-system federation, and longitudinal audit. In the directive–artifact binding pattern, entities such as ARTI-0001 through ARTI-0004 denote distinct governance records whose directives—ISO 27001 Security Policy, SOC 2 Type II Standard, GDPR Compliance Mandate, and PCI DSS v4.0 Compliance—each govern a concrete operational surface, from Sensor Data Streams and Network Access Control Lists to the Data Lake Metadata Catalog. The identifier therefore functions as the durable join key: it permits attribute values, ownership assertions, and external references to accumulate on the same logical subject without collapsing distinct governance scopes, as when ARTI-0003 and ARTI-0004 both govern the Data Lake Metadata Catalog yet remain separately identifiable obligations.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | Sensor Data Streams |
| ARTI-0002 | SOC 2 Type II Standard | Network Access Control Lists |
| ARTI-0003 | GDPR Compliance Mandate | Data Lake Metadata Catalog |
| ARTI-0004 | PCI DSS v4.0 Compliance | Data Lake Metadata Catalog |
| ARTI-0005 | FISMA Moderate Baseline | Laboratory Reagent Inventory |
| ARTI-0006 | OWASP Top Ten Control | Access Control Matrices |
| ARTI-0007 | NIST Cybersecurity Framework | Sensor Data Streams |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

**t_equiv_union_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| UNIO-0001 | telemetry_hub_alpha | schema_v3_prod | governance_log_f |
| UNIO-0002 | metric_bundle_plus | warehouse_db_staging | metric_aggregate_g |
| UNIO-0003 | ingest_pipeline_main | probe_array_thirteen | repository_db_j |
| UNIO-0004 | sensor_array_beta | compliance_log_sixteen | edge_node_h |
| UNIO-0005 | batch_run_four | staging_run_twelve | governance_log_f |

Attributes name the measurable or declarative properties that entities carry, while attr_type constrains how those properties may be represented and validated at ingest and query time. The attribute vocabulary effective_date, enforcement, mandatory, and priority is not arbitrary nomenclature; each attr is paired with an attr_type—respectively xsd:date, xsd:string, xsd:boolean, and xsd:integer—that prescribes lexical form, comparison semantics, and the physical store in which values reside. Typed decomposition is operationally decisive: a mandatory flag evaluated as xsd:boolean cannot be coerced from a free-text field without breaking compliance logic, and an effective_date encoded as xsd:date enables temporal ordering that varchar storage would foreclose. The attr–attr_type pairing thus constitutes a lightweight ontology: it tells auditors and automation alike what question is being asked (attr) and what answer shape is admissible (attr_type), prior to any value ever being recorded.

The misc dimension—materialized as typed value stores keyed by entity and attr—holds the evidentiary payload that makes governance assertions falsifiable. Each value row binds entity_id to attr_id and deposits a single misc value whose interpretation is fully determined by the attr’s declared type. Effective dates of 2023-09-27, 2025-04-15, 2024-03-21, and 2024-02-09 attach to ARTI-0001 through ARTI-0004 under the effective_date attribute, establishing when respective directives become operative without conflating calendar facts with enforcement text. Boolean misc entries under mandatory show ARTI-0001, ARTI-0002, and ARTI-0003 as true while ARTI-0004 is false—a distinction material to control design when PCI DSS applicability is optional rather than compulsory. Integer misc values (5, 959, 4, 97) and varchar misc values such as Enforcement 02, Encoding 01, nightly summary, and en populate enforcement and ancillary string attributes on overlapping entities, demonstrating that a single entity may host heterogeneous misc facts distributed across type-appropriate tables while remaining logically unified through shared entity_id and attr_id foreign keys. The identifier on each value row additionally supports idempotent upsert, correction without entity duplication, and line-level provenance in downstream attestation pipelines.

Identifier semantics extend beyond internal surrogate keys when systems must interoperate with persistent namespaces and human-meaningful aliases. Agent registration illustrates layered identification: weather-station-alpha, compliance-audit-bot, genomics-lab-director, and edge-device-gateway are located in authoritative registries through identified_by_u_r_i values including ark:/13030/n8yy3r and urn:isbn:978316148, while parallel identifier fields carry operational handles—ref-8842, ARN:res/41, urn:uuid:9f2a—that downstream services resolve without re-deriving URIs. Deliberate duplication of ark:/13030/n8yy3r across URI-0001 and URI-0002, and of ARN:res/41 across URI-0003 and URI-0004, encodes equivalence or shared resolution targets rather than accidental collision; identifier design must distinguish canonical persistence keys from convenience aliases. Owner completes the accountability chain by assigning custodial responsibility independent of technical identity: data-engineering owns weather-station-alpha, whereas ml-infra owns compliance-audit-bot, genomics-lab-director, and edge-device-gateway, signaling that lifecycle approval, access review, and incident routing follow organizational lines even when agents share URI schemes or ARN patterns.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |

Equivalence constructs show how identifier-centric modeling supports semantic unification without destructive merge. Records UNIO-0001 through UNIO-0004 align telemetry_hub_alpha with schema_v3_prod and governance_log_f, metric_bundle_plus with warehouse_db_staging and metric_aggregate_g, ingest_pipeline_main with probe_array_thirteen and repository_db_j, and sensor_array_beta with compliance_log_sixteen and edge_node_h—each triad expressing that differently named resources refer to the same governed surface across ingestion, storage, and edge contexts. Attr and attr_type metadata attached at the entity level propagate through equivalence only when mapping rules preserve type fidelity; misc values do not automatically harmonize across equivalents unless explicitly synchronized. In practice, operators treat entity as the locus of policy attachment, attr and attr_type as the contract governing permissible misc, identifier as the crosswalk key among registries and namespaces, and owner as the authority accountable for correctness—so that a GDPR mandatory=true on ARTI-0003, an effective_date of 2024-03-21, and ml-infra ownership of genomics-lab-director compose into a single auditable narrative rather than disconnected rows. Mature implementations enforce attr_type at write time, index identifier for federation, partition misc by type for integrity, and require owner on every externally exposed entity, because governance frameworks fail silently when any primitive is optional: untyped misc becomes unverifiable assertion, orphaned entities escape review, and ambiguous identifiers fracture the evidentiary chain compliance depends upon.