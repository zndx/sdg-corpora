---
chapter_id: ch_live_counter_metric_subclass_7e34c4
topic_id: 136
family: 07_long_tail
cited_terms: ['counter_metric_subclass', 'school_security_policy', 'attestation_subclass']
model: engine-refine
---

The architecture of the compliance data model rests upon a disciplined separation between entity definitions, attribute schemas, and their typed values—a structure that enforces type safety while permitting heterogeneous metadata to be attached to any governed object. Each entity receives a stable identifier, whether in the form METR-0001 through METR-0004 for metric records or POLI-0001 through POLI-0004 for school security policies, and ATTE-0001 through ATTE-0004 for attestation subclass records. These identifiers serve as the primary keys of their respective dimension and fact tables and, critically, as the foreign keys that bind attribute values back to their parent entities. The entity column in each value table—t_school_security_policy_val_boolean, t_school_security_policy_val_date, t_school_security_policy_val_int, and t_school_security_policy_val_varchar—carries the identifier of the policy to which the value pertains, ensuring referential integrity across the entire attribute-value lattice.

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

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | SOC2-TypeII |
| ATTE-0002 | VulnerabilityScan-Q3 |
| ATTE-0003 | SecureBoot-Enabled |
| ATTE-0004 | TPM-Attestation |
| ATTE-0005 | GitOps-Deployment |
| ATTE-0006 | AccessControlReview |
| ATTE-0007 | ThirdPartyVendorRisk |

**t_attestation_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2025-01-08T20:38:13 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2024-01-27T20:47:31 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2024-07-24T11:57:07 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2024-04-06T01:35:21 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-02-15T00:38:24 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2023-06-05T10:05:45 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2024-06-10T20:49:48 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2023-08-11T12:49:10 |

**t_attestation_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 1293.13 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 215.34 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 4975.39 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 778.44 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5119.03 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 3990.60 |
| ATTE-0007 | ATTE-0007 | ATTE-0001 | 1452.26 |

**t_attestation_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 806 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 470 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 695 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 409 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 704 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 30 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 773 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 233 |

**t_attestation_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | gw-12 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | review |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | edge-03 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | closeout |

Attribute definitions are captured once in dedicated schema tables, where each attribute is assigned a human-readable name and a strict type from the XSD namespace. For school security policies, the attribute table records effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. The attestation subclass follows an analogous pattern, defining duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This decoupling of attribute metadata from their runtime values means that the schema can evolve—new attributes added, types refined—without restructuring the value storage layer. The type designation governs which value table receives the data: boolean values such as true and false populate t_school_security_policy_val_boolean, date values like 2023-05-09 and 2024-07-27 reside in the date table, and integer priorities such as 982 and 312 are stored in the integer table.

The school security policy domain illustrates how governance objectives, constitutional constraints, and safety targets are codified alongside their extensible attributes. Cedar Ridge Preparatory, Westfield Middle School, Lincoln High School, and Sunrise International School each carry a distinct safety objective—Network intrusion detection, Unauthorized access prevention, and Cyber threat intelligence appear across the four records—and each must satisfy a constitutional constraint drawn from OSHA workplace safety, No lethal force rule, ADA accessibility standards, or State education statutes. The policy records themselves are enriched with typed attributes: the mandatory flag is set to true for POLI-0001 and false for the remaining three; effective dates range from 2023-05-09 to 2024-08-29; and string-valued attributes such as Enforcement 02, intake form, and ja attach to the same policies through the varchar value table. This design permits a single policy entity to carry a heterogeneous set of metadata without requiring a fixed column set.

Attestation subclass records operate under the same attribute-value paradigm but serve a different compliance purpose. The attestation table enumerates concrete security claims—SOC2-TypeII, VulnerabilityScan-Q3, SecureBoot-Enabled, and TPM-Attestation—each of which can carry duration_seconds as a decimal (1293.13, 215.34, 4975.39, 778.44), end_time as an ISO 8601 datetime (2025-01-08T20:38:13, 2024-01-27T20:47:31), exit_code as an integer (806, 695), and host_name as a string (gw-12). Additional varchar attributes such as Log Level 02, review, and superseded attach to the same attestation entities, enabling auditors to record supplementary observations without altering the schema. The attr_id column in each value table references the attribute definition, while the entity_id column points back to the attestation record, forming a two-hop foreign-key path from any stored value to its semantic definition and its governing entity.

The metric domain introduces a fact-dimension relationship that tracks quantitative measurements over time. The fact_counter table records individual metric observations identified by METR-0001 through METR-0004, each associated with a metric_kind_key that references the dim_metric_kind dimension table. The dimension table itself carries a metric_kind_label—Metric Kind Label 01 through Metric Kind Label 04—and a metric_kind_category—Metric Kind Category 01 through Metric Kind Category 04—providing the categorical taxonomy under which metrics are classified. Each fact row also records size_bytes, with values ranging from 422660739 to 977102405, and a version number (5, 7, 8, 12) that enables temporal tracking of metric definitions and their associated measurements. This structure supports both point-in-time queries against specific metric versions and aggregate analysis across categories, with the foreign key from metric_kind_key to dim_metric_kind.id ensuring that every measurement is properly classified.

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |