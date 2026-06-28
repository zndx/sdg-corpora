---
chapter_id: ch_live_gdpr_data_subject_right_f1792e
topic_id: 138
family: 07_long_tail
cited_terms: ['gdpr_data_subject_right', 'designative_for_specific_role', 'dataset_snapshot_subclass']
model: engine-refine
---

Governance architectures depend upon unambiguous identification and precise entity resolution to maintain auditability across regulatory boundaries. Each record is anchored by a persistent identifier—RIGH-0001 through RIGH-0004 for data subject rights, ROLE-0001 through ROLE-0004 for operational designations—that serves as the immutable primary key across all relational joins. These identifiers do not merely label; they establish referential integrity, allowing an entity reference to point deterministically to its governing record. When a compliance directive references a specific right, the system resolves the entity_id back to the originating identifier, ensuring that every downstream attribute assignment maps to a single, traceable source. This deterministic linking prevents orphaned metadata and guarantees that regulatory claims, whether citing the Right to Withdraw Consent or the California CCPA framework, remain bound to their canonical definitions.

**t_gdpr_data_subject_right**

| id | gdpr | grants_data_subject_right |
| --- | --- | --- |
| RIGH-0001 | Right to Withdraw Consent | Right to Withdraw Consent |
| RIGH-0002 | California CCPA | Right to Erasure |
| RIGH-0003 | Right to Object | Right to Object |
| RIGH-0004 | Right to Lodge Complaint | Switzerland FADP |
| RIGH-0005 | Right to Automated Decisions | California CCPA |
| RIGH-0006 | Right to Withdraw Consent | Right to be Informed |

**t_gdpr_data_subject_right_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RIGH-0001 | effective_date | xsd:date |
| RIGH-0002 | enforcement | xsd:string |
| RIGH-0003 | mandatory | xsd:boolean |
| RIGH-0004 | priority | xsd:integer |
| RIGH-0005 | review_cycle_days | xsd:integer |
| RIGH-0006 | scope | xsd:string |
| RIGH-0007 | encoding | xsd:string |
| RIGH-0008 | label_text | xsd:string |

**t_gdpr_data_subject_right_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0003 | true |
| RIGH-0002 | RIGH-0002 | RIGH-0003 | true |
| RIGH-0003 | RIGH-0003 | RIGH-0003 | false |
| RIGH-0004 | RIGH-0004 | RIGH-0003 | true |
| RIGH-0005 | RIGH-0005 | RIGH-0003 | true |
| RIGH-0006 | RIGH-0006 | RIGH-0003 | true |

**t_gdpr_data_subject_right_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0001 | 2025-05-21 |
| RIGH-0002 | RIGH-0002 | RIGH-0001 | 2023-03-20 |
| RIGH-0003 | RIGH-0003 | RIGH-0001 | 2023-03-03 |
| RIGH-0004 | RIGH-0004 | RIGH-0001 | 2025-02-10 |
| RIGH-0005 | RIGH-0005 | RIGH-0001 | 2023-06-13 |
| RIGH-0006 | RIGH-0006 | RIGH-0001 | 2024-07-25 |

**t_gdpr_data_subject_right_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0004 | 5 |
| RIGH-0002 | RIGH-0001 | RIGH-0005 | 122 |
| RIGH-0003 | RIGH-0002 | RIGH-0004 | 3 |
| RIGH-0004 | RIGH-0002 | RIGH-0005 | 392 |
| RIGH-0005 | RIGH-0003 | RIGH-0004 | 1 |
| RIGH-0006 | RIGH-0003 | RIGH-0005 | 97 |
| RIGH-0007 | RIGH-0004 | RIGH-0004 | 3 |
| RIGH-0008 | RIGH-0004 | RIGH-0005 | 865 |

**t_gdpr_data_subject_right_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RIGH-0001 | RIGH-0001 | RIGH-0007 | Encoding 01 |
| RIGH-0002 | RIGH-0001 | RIGH-0002 | Enforcement 02 |
| RIGH-0003 | RIGH-0001 | RIGH-0008 | change rationale |
| RIGH-0004 | RIGH-0001 | RIGH-0009 | ja |
| RIGH-0005 | RIGH-0001 | RIGH-0006 | Scope 05 |
| RIGH-0006 | RIGH-0002 | RIGH-0007 | Encoding 06 |
| RIGH-0007 | RIGH-0002 | RIGH-0002 | Enforcement 07 |
| RIGH-0008 | RIGH-0002 | RIGH-0008 | change rationale |

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | Calibration-Standard-ISO | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | Network-Edge-Router | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | Data-Lake-Partition | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | Quality-Control-Log | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | Bioreactor-Module-B | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | Data-Lake-Partition | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | Quality-Control-Log | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | Geolocation-Map-Grid | A-01 | latin1 |

The structural integrity of such registries relies on a disciplined separation between attribute definitions and their runtime values. An attr designation—effective_date, enforcement, mandatory, priority—declares the semantic intent of a field, while its attr type enforces strict schema conformance at the point of ingestion. Typed value stores segregate data by format: xsd:date captures temporal boundaries such as 2025-05-21 or 2023-03-20; xsd:boolean gates binary compliance flags like true or false; xsd:integer quantifies thresholds ranging from 3 to 392; and xsd:string accommodates freeform descriptors. This typed partitioning ensures that validation engines can process each domain independently, rejecting malformed inputs before they propagate into reporting pipelines or regulatory submissions.

Cross-system interoperability and hierarchical classification are maintained through explicit encoding declarations and categorical taxonomies. Character encoding—whether ascii or unicode—governs how designative strings like Sensor-Array-Beta or Calibration-Standard-ISO are serialized, guaranteeing that identifiers survive translation across legacy mainframes, cloud data lakes, and international compliance portals without corruption. Simultaneously, category assignments impose a structured taxonomy upon otherwise flat registries. A snapshot_of_category such as Snapshot Of Category 01 or Snapshot Of Category 04 does not merely label a dataset; it dictates retention policy, access control scope, and audit frequency. By coupling categorical routing with encoding guarantees, the framework ensures that both machine-readable and human-auditable layers operate within consistent boundaries.

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

Data lineage and capacity governance are tracked through snapshot of relationships, version counters, and size bytes measurements. Each fact_dataset record captures a point-in-time state via snapshot_of_key, which references a parent dimension to establish provenance—SNAP-0001 pointing to SNAP-0004, for instance, creating a directed acyclic graph of lineage. The version field increments to mark iterative refinements, cycling through releases such as 2, 5, and 10, while size bytes quantifies storage footprint, ranging from approximately 31.5 MB to 676.1 MB. Together, these metrics enable compliance officers to reconstruct historical states, verify that current exports match approved baselines, and forecast infrastructure requirements without disrupting active workloads.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

Supplementary metadata fields—classified generically as misc—absorb the unstructured or semi-structured elements that structured types cannot contain. These fields hold operational codes like D-33 or B-12, human-readable labels such as change rationale or ja, and descriptive strings like Encoding 01 or Enforcement 02. Rather than diluting schema rigor, misc fields act as controlled overflow channels, preserving contextual nuance while keeping core compliance attributes strictly typed. When combined with the deterministic identifiers, typed attributes, categorical routing, and versioned snapshots, this layered approach yields a governance fabric that is simultaneously machine-enforceable and auditorily transparent.