---
chapter_id: ch_live_existential_with_part_of_addedc
topic_id: 7
family: 01_foundation
cited_terms: ['existential_with_part_of', 'designative_with_naming_authority', 'gdpr_data_subject_right']
model: engine-refine
---

In distributed systems and regulatory frameworks alike, the integrity of named entities depends on a disciplined separation between identifiers, attributes, and their values. An identifier serves as the immutable anchor for any record: PART-0001 distinguishes one part-whole relationship from another, AUTH-0001 anchors a designative entry, and RIGH-0001 identifies the Right to Withdraw Consent as a distinct GDPR data subject right. These identifiers are not merely labels; they are the keys that bind heterogeneous data across tables, ensuring that a value such as `true` can be unambiguously traced back to the `mandatory` attribute of the Right to Object (RIGH-0003), or that the date `2025-05-21` is correctly associated with the `effective_date` of the Right to Withdraw Consent (RIGH-0001). The entity column in value tables explicitly references these identifiers, creating a foreign-key linkage that preserves referential integrity across the schema.

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | geo_redundant_backup |
| PART-0002 | alpha_compute_cluster | audit_logging_system |
| PART-0003 | alpha_query_engine | geo_redundant_backup |
| PART-0004 | primary_stream_processor | realtime_analytics_platform |

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

Attributes and their types form the structural backbone of any metadata model. The attribute name—whether `effective_date`, `enforcement`, `mandatory`, or `priority`—defines the semantic dimension along which an entity is described, while the attribute type constrains the domain of permissible values. In the GDPR rights schema, `effective_date` is typed as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. This type discipline is not decorative; it enforces data quality at the schema level, ensuring that a boolean value such as `true` is never conflated with an integer priority like `5` or a textual rationale such as `change rationale`. The separation of value types into dedicated tables—boolean, date, integer, and varchar—reflects a normalization strategy that prevents type coercion errors and supports efficient querying across heterogeneous data domains.

Checksum algorithms introduce a layer of cryptographic assurance into naming and designation systems. When a designative such as `OGC-API-Feat` is assigned by IANA, the associated checksum algorithm `md5` provides a mechanism for verifying that the designation has not been tampered with or corrupted. Similarly, the designation `HAN-0092` assigned by IANA employs `blake2b`, a more modern and collision-resistant algorithm, while `RFC-7578` relies on `sha1`. The checksum algorithm is not an afterthought; it is a governance control that ensures the provenance and integrity of assigned codes such as `C-07`, `E-21`, and `D-33`. In systems where designatives are exchanged between organizations—whether between data controllers and supervisory authorities, or between component systems in a telemetry architecture—the checksum algorithm serves as a shared trust anchor.

The interplay between identifiers, attributes, and values becomes particularly evident in regulatory compliance contexts. Consider the Right to Object (RIGH-0003): its `mandatory` attribute holds the value `false`, indicating that enforcement is not universally required, while its `priority` attribute carries the integer value `3`, suggesting a relative ordering within a broader rights hierarchy. The Right to Withdraw Consent (RIGH-0001), by contrast, has `mandatory` set to `true` and `priority` at `5`, reflecting its elevated status under GDPR. These attribute-value pairs are not isolated; they are linked through the entity identifier, which appears in both the attribute definition table and the value tables, creating a navigable graph of compliance obligations. The `enforcement` attribute, typed as `xsd:string`, holds values such as `Enforcement 02`, while the `change rationale` attribute captures free-text explanations like `ja`, demonstrating how the same entity can carry both structured and unstructured metadata.

Part-whole relationships and naming authorities operate within the same identifier-driven paradigm. The component `regional_telemetry_gateway` is recorded as part of `geo_redundant_backup` under the identifier PART-0001, while `alpha_compute_cluster` is similarly nested within the same parent system under PART-0002. This hierarchical structuring mirrors the way designatives are organized under naming authorities: `OGC-API-Feat` and `HAN-0092` are both assigned by IANA, yet they carry distinct checksum algorithms and codes, reflecting different governance regimes within a single authority. The identifier serves as the common thread, enabling systems to reason about composition, provenance, and compliance within a unified data model.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | IANA | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | Crossref | md5 | E-21 |
| AUTH-0003 | HAN-0092 | IANA | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | IANA | sha1 | D-33 |