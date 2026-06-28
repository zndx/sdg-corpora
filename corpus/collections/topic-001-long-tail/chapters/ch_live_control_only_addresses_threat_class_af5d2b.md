---
chapter_id: ch_live_control_only_addresses_threat_class_af5d2b
topic_id: 1
family: 03_directive_governance
cited_terms: ['control_only_addresses_threat_class', 'lineage_edge_with_provenance', 'subclass_to_descriptive_ice']
model: engine-refine
---

The attribute-value model achieves type safety by partitioning values into dedicated tables according to their xsd type: boolean values populate one store, dates another, integers a third, and free-form strings a fourth. This separation ensures that each value table enforces its schema constraint—boolean columns hold only true or false, date columns conform to xsd:date, integer columns accept numeric values, and varchar columns accommodate text like "Encoding 01" or "Enforcement 02". The entity_id column in each value table references the entity being described, while attr_id points to the attribute definition, creating a flexible yet structured way to store heterogeneous metadata.

Entities are identified by codes such as THRE-0001 through THRE-0004, each representing a distinct control object within the threat-classification domain. These entities are associated with controls like Multi-Factor Authentication, Incident Response Plan, and Access Review Policy, and each control addresses one or more risks identified by codes such as ICE-0001 through ICE-0005. The attribute definitions themselves—effective_date, enforcement, mandatory, priority—are typed as xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively, establishing a formal vocabulary that governs what values may be assigned to each attribute across all entities.

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | ICE-0004 |
| THRE-0002 | Incident Response Plan | ICE-0001 |
| THRE-0003 | Incident Response Plan | ICE-0002 |
| THRE-0004 | Access Review Policy | ICE-0005 |
| THRE-0005 | Backup Retention Schedule | ICE-0001 |
| THRE-0006 | Backup Retention Schedule | ICE-0003 |
| THRE-0007 | Access Review Policy | ICE-0002 |
| THRE-0008 | Incident Response Plan | ICE-0005 |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |

Provenance and lineage information are captured through edge records that link a process to its source system. A lineage edge such as log-rotation-archival is attributed to the Audit-Trail-Service, while climate-model-updates and sensor-calibration-pipeline both trace to the Edge-Gateway-Router. Each edge carries an encoding declaration—utf8, unicode, or ascii—that specifies the character encoding of the associated data, and a label_text field that provides a human-readable descriptor such as "nightly summary" or "calibration record". This dual encoding-label structure ensures that both machine parsers and human auditors can interpret the provenance chain without ambiguity.

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | log-rotation-archival | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | climate-model-updates | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | sensor-calibration-pipeline | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | financial-reconciliation-run | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | batch-ingestion-v4 | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | telemetry-aggregation-flow | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | climate-model-updates | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | log-rotation-archival | AWS-S3-source-bucket | latin1 | change rationale |

Descriptive entities are annotated with label_text and language fields that enable multilingual interpretation. The same descriptive concept, such as metadata_registry, may carry the label_text "audit excerpt" in English (en) or "calibration record" in German (de), while other descriptors like schema_version_patch are labeled "intake form" in English. The language field disambiguates which locale a given label belongs to, allowing the system to serve localized views of the same underlying entity. Together, the encoding, label_text, and language columns form a triad that supports both internationalization and data-integrity checks across multilingual operational environments.

**t_subclass_to_descriptive_ice**

| id | descriptive | label_text | language |
| --- | --- | --- | --- |
| ICE-0001 | schema_version_patch | intake form | en |
| ICE-0002 | annotation_layer_b | intake form | de |
| ICE-0003 | metadata_registry | calibration record | de |
| ICE-0004 | metadata_registry | audit excerpt | en |
| ICE-0005 | quality_flag_alpha | nightly summary | fr |
| ICE-0006 | telemetry_header | intake form | es |