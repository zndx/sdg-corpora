---
chapter_id: ch_live_classification_basic_486f68
topic_id: 1
family: 03_directive_governance
cited_terms: ['classification_basic', 'anonymous_demographic_information', 'control_only_addresses_threat_class']
model: engine-refine
---

Operational classification frameworks require that every data handling event be anchored to a discrete classification record, a phase of engagement, and a deterministic trigger mechanism. The classification registry captures this triad through identifiers such as `CLAS-0001` through `CLAS-0004`, each associated with a classification domain—sensor calibration, data validation, pipeline orchestration—alongside a phase designation of either execution or review, and a trigger modality drawn from schedule, manual, or retry. This structure ensures that classification decisions are not ephemeral but are instead traceable to their origin: a scheduled pipeline run, a manual override, or an automated retry sequence. The phase dimension further distinguishes between active operational states and post-hoc review cycles, enabling auditors to reconstruct the lifecycle of any classification decision from initiation through validation.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

The demographic information domain introduces a more granular concern: the separation and linkage of anonymous demographic attributes from personally identifiable information. Records such as `INFO-0001` through `INFO-0004` establish explicit mappings between anonymous demographic fields—school_district_enrollment, household_size, geographic_region, health_survey_responses—and their corresponding demographic_information counterparts, which include health_survey_responses, geographic_region, age_brackets, and household_size. Critically, each record also carries a personally_identifiable_information column that stores sensitive identifiers such as home_address, full_legal_name, and passport_number. This tripartite structure enforces a data governance boundary: anonymous demographic data can be analyzed and reported upon without exposing the PII linkage, while the mapping itself remains controlled and auditable. The attribute registry for these records—capturing properties such as confidence (typed as `xsd:decimal`), dimension_kind (`xsd:string`), method (`xsd:string`), and recorded_at (`xsd:dateTime`)—provides a metadata layer that describes the provenance and quality of each demographic observation.

**t_anonymous_demographic_information**

| id | anonymous_demographic_information | demographic_information | personally_identifiable_information |
| --- | --- | --- | --- |
| INFO-0001 | school_district_enrollment | health_survey_responses | home_address |
| INFO-0002 | household_size | geographic_region | home_address |
| INFO-0003 | geographic_region | age_brackets | full_legal_name |
| INFO-0004 | health_survey_responses | household_size | passport_number |
| INFO-0005 | housing_market_surveys | age_brackets | passport_number |
| INFO-0006 | marital_status | disability_status | financial_account |

**t_anonymous_demographic_information_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INFO-0001 | confidence | xsd:decimal |
| INFO-0002 | dimension_kind | xsd:string |
| INFO-0003 | method | xsd:string |
| INFO-0004 | recorded_at | xsd:dateTime |
| INFO-0005 | uncertainty | xsd:decimal |
| INFO-0006 | unit | xsd:string |
| INFO-0007 | value | xsd:decimal |
| INFO-0008 | encoding | xsd:string |

**t_anonymous_demographic_information_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0004 | 2024-08-15T06:37:30 |
| INFO-0002 | INFO-0002 | INFO-0004 | 2023-10-27T17:02:18 |
| INFO-0003 | INFO-0003 | INFO-0004 | 2023-05-03T14:37:32 |
| INFO-0004 | INFO-0004 | INFO-0004 | 2023-05-25T07:11:49 |
| INFO-0005 | INFO-0005 | INFO-0004 | 2024-09-13T22:50:49 |
| INFO-0006 | INFO-0006 | INFO-0004 | 2024-02-07T11:47:33 |

**t_anonymous_demographic_information_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0001 | 0.448 |
| INFO-0002 | INFO-0001 | INFO-0005 | 124.47 |
| INFO-0003 | INFO-0001 | INFO-0007 | 40.18 |
| INFO-0004 | INFO-0002 | INFO-0001 | 0.771 |
| INFO-0005 | INFO-0002 | INFO-0005 | 477.18 |
| INFO-0006 | INFO-0002 | INFO-0007 | 862.09 |
| INFO-0007 | INFO-0003 | INFO-0001 | 0.785 |
| INFO-0008 | INFO-0003 | INFO-0005 | 9.71 |

**t_anonymous_demographic_information_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | INFO-0002 | Dimension Kind 01 |
| INFO-0002 | INFO-0001 | INFO-0008 | Encoding 02 |
| INFO-0003 | INFO-0001 | INFO-0009 | pre-release note |
| INFO-0004 | INFO-0001 | INFO-0010 | de |
| INFO-0005 | INFO-0001 | INFO-0003 | automated |
| INFO-0006 | INFO-0001 | INFO-0006 | nm |
| INFO-0007 | INFO-0002 | INFO-0002 | Dimension Kind 07 |
| INFO-0008 | INFO-0002 | INFO-0008 | Encoding 08 |

Value storage for demographic attributes follows an entity-attribute-value pattern partitioned by data type, ensuring type safety and query efficiency across heterogeneous attribute kinds. Decimal-valued attributes such as confidence scores are stored with precision values like 0.448 and 0.771, while string-valued attributes capture categorical descriptors such as Dimension Kind 01 and Encoding 02. Datetime attributes record temporal metadata with ISO 8601 precision—2024-08-15T06:37:30, 2023-10-27T17:02:18—enabling temporal analysis of when demographic attributes were last updated or validated. The entity_id column in each value table references the demographic information record, establishing a clear foreign-key relationship that allows reconstruction of a complete attribute profile for any given demographic entity. This type-partitioned design means that a single demographic record can simultaneously carry decimal confidence scores, string-valued encoding schemes, and datetime stamps without type coercion overhead.

The threat classification domain mirrors this structural pattern but applies it to the mapping of security controls against risk categories. Control records such as `THRE-0001` through `THRE-0004` associate specific controls—Multi-Factor Authentication, Incident Response Plan, Access Review Policy—with the risks they address, including Data Exfiltration, System Downtime, and Configuration Drift. The attribute registry for threat classifications captures properties such as effective_date (`xsd:date`), enforcement (`xsd:string`), mandatory (`xsd:boolean`), and priority (`xsd:integer`), each stored in its own type-specific value table. Boolean attributes encode whether a control is mandatory, with values such as true and false, while integer attributes capture priority levels ranging from 5 to 926. Date attributes record effective dates such as 2024-12-09 and 2025-01-04, establishing temporal validity windows for each control-risk pairing. String-valued attributes store enforcement descriptors and change rationales, including values like Encoding 01, Enforcement 02, and fr.

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | Data Exfiltration |
| THRE-0002 | Incident Response Plan | System Downtime |
| THRE-0003 | Incident Response Plan | Configuration Drift |
| THRE-0004 | Access Review Policy | System Downtime |
| THRE-0005 | Backup Retention Schedule | Configuration Drift |
| THRE-0006 | Backup Retention Schedule | Configuration Drift |
| THRE-0007 | Access Review Policy | Credential Theft |
| THRE-0008 | Incident Response Plan | Supply Chain Compromise |

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

The parallel architecture between demographic and threat classification domains reveals a deliberate design philosophy: data governance structures should be type-safe, auditable, and extensible. Both domains use the same entity-attribute-value pattern with type-partitioned value tables, the same foreign-key relationships between entity definitions and their attributes, and the same approach to capturing metadata about data quality and provenance. This uniformity enables a single governance engine to process both demographic information and threat classifications without domain-specific logic, while the type system ensures that decimal confidence scores, boolean mandatory flags, and datetime timestamps are each handled with appropriate precision and semantics. The result is a compliance framework where every data element—whether it describes a household size, a sensor calibration event, or an incident response plan—carries with it a complete audit trail of its classification, its attributes, and the conditions under which it was recorded.