---
chapter_id: ch_live_artifact_described_by_attrkey_6c62d1
topic_id: 10
family: 01_foundation
cited_terms: ['artifact_described_by_attrkey', 'policy_basic', 'school_security_policy']
model: engine-refine
---

The governance of data assets and institutional security policies rests upon a unified attribute–value architecture that decouples metadata definitions from their concrete instantiations. Each policy entity—whether a corporate directive such as a Privacy Compliance Policy, an Access Control Policy, an Acceptable Use Policy, or a Security Baseline Policy—is first declared as a named artifact and subsequently enriched through a set of typed attributes. These attributes, designated by identifiers such as POLI-0001 through POLI-0004, encompass effective dates, enforcement status, mandatory flags, and priority levels, each bound to a strict XML Schema type: xsd:date, xsd:string, xsd:boolean, or xsd:integer. The separation of attribute schema from attribute value ensures that policy definitions remain stable across revisions while their concrete values—2025-05-22 for the effective date of one policy, 2023-08-24 for another—can be updated independently without schema migration.

**t_artifact_described_by_attrkey**

| id | artifact | uri | location |
| --- | --- | --- | --- |
| ATTR-0001 | telemetry-stream-88f | hdfs://cluster/staging | us-east-1 |
| ATTR-0002 | lab-report-mutation | s3://lake/curated | us-east-1 |
| ATTR-0003 | manifest-checksum-a1b | hdfs://cluster/staging | zone-b |
| ATTR-0004 | telemetry-stream-88f | gs://warehouse/gold | ap-south-2 |
| ATTR-0005 | provenance-trace-log | s3://lake/curated | ap-south-2 |

**t_policy_basic**

| id | policy |
| --- | --- |
| POLI-0001 | Privacy Compliance Policy |
| POLI-0002 | Access Control Policy |
| POLI-0003 | Acceptable Use Policy |
| POLI-0004 | Security Baseline Policy |
| POLI-0005 | Data Sharing Policy |
| POLI-0006 | Data Retention Policy |
| POLI-0007 | Security Baseline Policy |

**t_policy_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_policy_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2025-05-22 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2023-08-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2025-01-30 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2025-06-16 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2023-11-15 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-13 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-02-02 |

**t_policy_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 409 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 74 |
| POLI-0005 | POLI-0003 | POLI-0004 | 3 |
| POLI-0006 | POLI-0003 | POLI-0005 | 787 |
| POLI-0007 | POLI-0004 | POLI-0004 | 3 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

Typed value tables materialize the attribute definitions through a normalized entity–attribute–value pattern that preserves type safety across heterogeneous data. Boolean attributes record enforcement mandates as discrete true or false flags; for instance, the mandatory constraint on the Privacy Compliance Policy evaluates to false, whereas the corresponding constraint on the Access Control Policy resolves to true. Date attributes anchor policies to temporal boundaries, with effective dates ranging from 2023-08-24 through 2025-06-16, establishing enforceable windows of applicability. Integer attributes capture quantitative parameters such as priority scores—values of 2 and 3 for primary policy priorities, contrasted with elevated thresholds of 409 and 74 for secondary attributes—while varchar attributes store free-form descriptors including Encoding 01, Enforcement 02, calibration record, and the locale designator en. This multi-table value architecture prevents null proliferation and enforces schema-level type constraints at query time.

The same attribute–value paradigm extends to school security policies, which govern institutional safety objectives through a parallel schema structure. Institutions such as Cedar Ridge Preparatory, Westfield Middle School, Lincoln High School, and Sunrise International School each maintain a distinct security policy record that specifies both the safety objective it targets—Network intrusion detection, Unauthorized access prevention, or Cyber threat intelligence—and the constitutional constraints it must satisfy, including OSHA workplace safety, the No lethal force rule, ADA accessibility standards, and State education statutes. The attribute definitions for school security policies mirror those of the general policy table, with effective_date, enforcement, mandatory, and priority attributes typed identically, thereby enabling cross-domain policy analysis and unified compliance reporting.

Artifact provenance and geographic placement are tracked through a dedicated mapping table that associates data artifacts with their storage URIs and operational locations. Artifacts such as telemetry-stream-88f, lab-report-mutation, and manifest-checksum-a1b are registered against distributed storage endpoints spanning HDFS at hdfs://cluster/staging, S3 at s3://lake/curated, and GCS at gs://warehouse/gold. Geographic placement information—us-east-1, zone-b, ap-south-2—anchors each artifact to a specific data center region, enabling jurisdictional compliance checks and latency-aware retrieval. The artifact telemetry-stream-88f, for example, appears in both us-east-1 and ap-south-2, indicating either replication or multi-region deployment, while the URI hdfs://cluster/staging is shared between telemetry-stream-88f and manifest-checksum-a1b, suggesting a common staging pipeline.

The structural coherence of this attribute–value model lies in its recursive application: policy entities reference attribute definitions through entity_id and attr_id foreign keys, and those same keys appear consistently across boolean, date, integer, and varchar value tables, ensuring referential integrity regardless of data type. A single policy entity such as POLI-0001 may simultaneously carry a date value of 2025-05-22, a boolean value of false, an integer priority of 2, and a varchar descriptor of Encoding 01, each stored in its respective typed table but unified through the shared entity identifier. This design permits arbitrary attribute expansion—new attr_name and attr_type rows can be added to the schema definition tables without modifying any value table—and supports heterogeneous policy domains, from corporate data governance to school security compliance, under a single queryable framework.

**t_policy_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | calibration record |
| POLI-0004 | POLI-0001 | POLI-0009 | en |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | intake form |

**t_school_security_policy**

| id | school_security_policy | targets | must_satisfy |
| --- | --- | --- | --- |
| POLI-0001 | Cedar Ridge Preparatory | Network intrusion detection | OSHA workplace safety |
| POLI-0002 | Westfield Middle School | Unauthorized access prevention | No lethal force rule |
| POLI-0003 | Lincoln High School | Cyber threat intelligence | ADA accessibility standards |
| POLI-0004 | Sunrise International School | Cyber threat intelligence | State education statutes |
| POLI-0005 | Northview Technical Institute | Emergency evacuation protocols | State education statutes |
| POLI-0006 | Cedar Ridge Preparatory | Visitor management compliance | ISO 27001 framework |
| POLI-0007 | Sunrise International School | Structural integrity monitoring | ADA accessibility standards |
| POLI-0008 | Jefferson STEM Academy | Network intrusion detection | No lethal force rule |

**t_school_security_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_school_security_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | false |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | true |
| POLI-0008 | POLI-0008 | POLI-0003 | false |

**t_school_security_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-05-09 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-07-27 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-12-11 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-08-29 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-05-03 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-09-29 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2024-11-04 |
| POLI-0008 | POLI-0008 | POLI-0001 | 2024-06-30 |

**t_school_security_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 982 |
| POLI-0003 | POLI-0002 | POLI-0004 | 2 |
| POLI-0004 | POLI-0002 | POLI-0005 | 312 |
| POLI-0005 | POLI-0003 | POLI-0004 | 2 |
| POLI-0006 | POLI-0003 | POLI-0005 | 809 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 270 |

**t_school_security_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | intake form |
| POLI-0004 | POLI-0001 | POLI-0009 | ja |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | pre-release note |