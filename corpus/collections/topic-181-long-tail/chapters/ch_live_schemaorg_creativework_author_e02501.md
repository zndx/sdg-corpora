---
chapter_id: ch_live_schemaorg_creativework_author_e02501
topic_id: 181
family: 07_long_tail
cited_terms: ['schemaorg_creativework_author', 'ganglion_cyst_tissue_origin', 'policy_only_governs_artifacts']
model: engine-refine
---

Within this data model, every artifact, policy, or anatomical entity is anchored by a unique identifier that serves as the primary key for cross-referencing and traceability. Identifiers follow a structured naming convention—AUTH-0001 for creative work authorship records, ORIG-0001 for ganglion cyst tissue origins, and ARTI-0001 for policy-governed artifacts—each scoped to its domain table yet universally resolvable. The creative work authorship table, for instance, assigns identifiers such as AUTH-0001 through AUTH-0004 to document the linkage between creative works like the API_Reference_Guide and Provenance_Trace_Report and their respective authors, identified by codes such as ARTI-0006, ARTI-0005, and ARTI-0004. This identifier discipline ensures that every entity, whether it is a policy document or a tissue origin record, can be unambiguously referenced across the system's relational graph.

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | ARTI-0006 |
| AUTH-0002 | Provenance_Trace_Report | ARTI-0005 |
| AUTH-0003 | API_Reference_Guide | ARTI-0006 |
| AUTH-0004 | Provenance_Trace_Report | ARTI-0004 |
| AUTH-0005 | Sensor_Network_Spec | ARTI-0006 |
| AUTH-0006 | Catalog_Metadata_Index | ARTI-0005 |
| AUTH-0007 | Telemetry_Config_Spec | ARTI-0003 |
| AUTH-0008 | Catalog_Metadata_Index | ARTI-0005 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

Attributes and their associated types provide a flexible, schema-on-read mechanism for enriching entities with metadata beyond their core identity. The attribute definition table maps each attribute to a type—xsd:string for textual values like the checksum 7b14de08 or the license GPL-3.0, xsd:date for temporal markers such as 2023-12-01 or 2024-12-04, and cco:DesignativeICE for designative identifiers like gid://svc/77. This typed attribute system decouples metadata from the entity itself, storing attribute values in specialized value tables keyed by entity and attribute identifiers. Integer-valued attributes, such as those holding the values 363, 12, 393, and 3, reside in their own typed storage, ensuring type safety and efficient querying while preserving the extensibility needed to describe heterogeneous entities without schema migrations.

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

The anatomical domain of ganglion cyst tissue origins demonstrates how entities relate to one another through role-mediated associations. Tissue origins—such as the sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment—are linked to connective tissue structures including the periosteal layer, joint capsule, deep fascia, and fibrous adventitia via a junction table that captures the subject-target relationship with an explicit role. The role field distinguishes whether a tissue origin participates as a reviewer, contributor, or owner within its connective tissue structure context. For example, the tissue origin ORIG-0007 may serve as both a reviewer and an owner across different connective tissue targets, while ORIG-0002 and ORIG-0006 are associated through an owner relationship. This tripartite subject-role-target pattern generalizes beyond anatomy to any domain requiring typed, role-bearing relationships between entities.

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

Policy governance introduces enforcement and priority as operational dimensions that determine how rules are applied and ordered. The policy governance table associates each policy—Data Retention Policy, Access Control Policy, Privacy Compliance Policy, and Immutable Audit Policy—with an enforcement mode drawn from blocking, advisory, or deprecated, and a numeric priority ranging from 1 to 5. The Privacy Compliance Policy carries the highest priority at level 1 with a deprecated enforcement status, while the Access Control Policy operates at priority 4 under advisory enforcement. These enforcement and priority attributes enable the system to resolve conflicts between overlapping policies, enforce compliance at the appropriate severity level, and maintain a clear hierarchy of regulatory obligations across governed artifacts.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |