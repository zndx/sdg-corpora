---
chapter_id: ch_live_requirement_min_one_verification_559e71
topic_id: 129
family: 03_directive_governance
cited_terms: ['requirement_min_one_verification', 'policy_with_review_cycle', 'transformation_basic']
model: engine-refine
---

IDENTIFIERS serve as the immutable keys by which every compliance entity is addressed across the governance framework. Each record carries a prefixed code—VERI-0001 through VERI-0004 for verification requirements, CYCL-0001 through CYCL-0004 for policy review cycles, and TRAN-0001 through TRAN-0004 for data transformations—ensuring unambiguous cross-referencing between the core entity table and its associated value stores. The identifier anchors the entity itself: a requirement such as "Latency threshold 50ms" or "Audit log completeness," a policy such as "FedRAMP" or "NIST SP 800-53," or a transformation such as "Currency conversion" or "JSON to Parquet conversion." These identifiers are not merely labels; they are the join keys that bind an entity to its attributes, to the values those attributes assume, and to the organizational units responsible for verification, whether that be the Architecture Review Board, the Internal Audit Team, or a Certification Authority.

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | Architecture Review Board |
| VERI-0002 | Audit log completeness | Architecture Review Board |
| VERI-0003 | Backup frequency daily | Internal Audit Team |
| VERI-0004 | Backup frequency daily | Certification Authority |
| VERI-0005 | Schema validation strict | NIST 800-53 |
| VERI-0006 | PII masking rule | Architecture Review Board |

**t_requirement_min_one_verification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | effective_date | xsd:date |
| VERI-0002 | enforcement | xsd:string |
| VERI-0003 | mandatory | xsd:boolean |
| VERI-0004 | priority | xsd:integer |
| VERI-0005 | review_cycle_days | xsd:integer |
| VERI-0006 | scope | xsd:string |
| VERI-0007 | encoding | xsd:string |
| VERI-0008 | label_text | xsd:string |

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

**t_requirement_min_one_verification_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 2023-09-25 |
| VERI-0002 | VERI-0002 | VERI-0001 | 2024-02-07 |
| VERI-0003 | VERI-0003 | VERI-0001 | 2023-08-17 |
| VERI-0004 | VERI-0004 | VERI-0001 | 2025-02-12 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2023-06-21 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2024-04-16 |

**t_requirement_min_one_verification_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | 1 |
| VERI-0002 | VERI-0001 | VERI-0005 | 285 |
| VERI-0003 | VERI-0002 | VERI-0004 | 1 |
| VERI-0004 | VERI-0002 | VERI-0005 | 542 |
| VERI-0005 | VERI-0003 | VERI-0004 | 5 |
| VERI-0006 | VERI-0003 | VERI-0005 | 517 |
| VERI-0007 | VERI-0004 | VERI-0004 | 2 |
| VERI-0008 | VERI-0004 | VERI-0005 | 72 |

**t_requirement_min_one_verification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0007 | Encoding 01 |
| VERI-0002 | VERI-0001 | VERI-0002 | Enforcement 02 |
| VERI-0003 | VERI-0001 | VERI-0008 | change rationale |
| VERI-0004 | VERI-0001 | VERI-0009 | fr |
| VERI-0005 | VERI-0001 | VERI-0006 | Scope 05 |
| VERI-0006 | VERI-0002 | VERI-0007 | Encoding 06 |
| VERI-0007 | VERI-0002 | VERI-0002 | Enforcement 07 |
| VERI-0008 | VERI-0002 | VERI-0008 | intake form |

**t_transformation_basic**

| id | transformation |
| --- | --- |
| TRAN-0001 | Currency conversion |
| TRAN-0002 | Customer deduplication |
| TRAN-0003 | Feature scaling |
| TRAN-0004 | JSON to Parquet conversion |
| TRAN-0005 | Currency conversion |
| TRAN-0006 | Schema evolution migration |

**t_transformation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAN-0001 | duration_seconds | xsd:decimal |
| TRAN-0002 | end_time | xsd:dateTime |
| TRAN-0003 | exit_code | xsd:integer |
| TRAN-0004 | host_name | xsd:string |
| TRAN-0005 | log_level | xsd:string |
| TRAN-0006 | phase | xsd:string |
| TRAN-0007 | retry_count | xsd:integer |
| TRAN-0008 | scheduled_at | xsd:dateTime |

**t_transformation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0003 | 133 |
| TRAN-0002 | TRAN-0001 | TRAN-0007 | 93 |
| TRAN-0003 | TRAN-0002 | TRAN-0003 | 142 |
| TRAN-0004 | TRAN-0002 | TRAN-0007 | 123 |
| TRAN-0005 | TRAN-0003 | TRAN-0003 | 502 |
| TRAN-0006 | TRAN-0003 | TRAN-0007 | 13 |
| TRAN-0007 | TRAN-0004 | TRAN-0003 | 896 |
| TRAN-0008 | TRAN-0004 | TRAN-0007 | 153 |

Attributes and their types constitute the schema of compliance metadata, decoupled from the values they carry to permit flexible, type-safe storage. The attribute definition table enumerates property names—effective_date, enforcement, mandatory, priority for verification entities; duration_seconds, end_time, exit_code, host_name for transformation entities—each paired with an XSD type such as xsd:date, xsd:string, xsd:boolean, xsd:integer, xsd:decimal, or xsd:dateTime. This separation of schema from data is deliberate: it allows the value layer to be partitioned into type-specific tables, each enforcing its own constraint discipline. A boolean attribute like mandatory stores values of true or false across entities; a date attribute like effective_date carries values such as 2023-09-25, 2024-02-07, 2023-08-17, or 2025-02-12; an integer attribute like priority holds values ranging from 1 to 542; and a decimal attribute such as duration_seconds records values like 795.94, 7139.05, 5074.97, or 6971.76. The entity_id column in each value table re-establishes the link to the core record, while attr_id references the attribute definition, forming a normalized triple of entity, attribute, and value.

Scope and language define the jurisdictional and linguistic boundaries within which a policy or requirement applies. The scope column distinguishes between local, team, and regional applicability—FedRAMP operating at the local level, NIST SP 800-53 at the team level, and both CCPA and SOC 2 Type II at the regional level—thereby encoding the organizational reach of each governance artifact. The language column records the operative language of the policy document, with values such as ja (Japanese) appearing for FedRAMP, NIST SP 800-53, and SOC 2 Type II, and fr (French) for CCPA. These two dimensions are essential for routing compliance obligations to the correct stakeholders and for ensuring that policy texts are accessible in the appropriate linguistic register.

The miscellaneous value tables—varchar, boolean, date, integer, decimal, and datetime—collect the actual attribute assignments for each entity, forming the operational data layer of the framework. A varchar value table might record "Encoding 01" or "Enforcement 02" or "change rationale" or the language code "fr" against a single entity; a boolean table might mark one entity's mandatory attribute as false while marking another's as true; a datetime table might timestamp a transformation's end_time as 2025-05-04T13:03:22 or 2023-11-24T00:59:19. The review_cycle column on the policy table—annual, fiscal-year, or semi-annual—further structures the temporal cadence of compliance obligations, with FedRAMP subject to annual review, SOC 2 Type II to semi-annual review, and NIST SP 800-53 and CCPA both to fiscal-year review cycles. Together, these structures form a coherent, queryable record of what must be verified, by whom, under what scope, in what language, and according to what temporal rhythm.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | annual | local | ja |
| CYCL-0002 | NIST SP 800-53 | fiscal-year | team | ja |
| CYCL-0003 | CCPA | semi-annual | regional | fr |
| CYCL-0004 | SOC 2 Type II | fiscal-year | regional | ja |
| CYCL-0005 | GDPR | quarterly | global | ja |
| CYCL-0006 | FedRAMP | continuous | global | fr |
| CYCL-0007 | SOC 2 Type II | continuous | global | ja |
| CYCL-0008 | CCPA | monthly | local | ja |

**t_transformation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0002 | 2025-05-04T13:03:22 |
| TRAN-0002 | TRAN-0001 | TRAN-0008 | 2023-11-24T00:59:19 |
| TRAN-0003 | TRAN-0001 | TRAN-0009 | 2024-10-31T22:10:22 |
| TRAN-0004 | TRAN-0002 | TRAN-0002 | 2024-05-26T15:20:00 |
| TRAN-0005 | TRAN-0002 | TRAN-0008 | 2024-04-05T04:09:32 |
| TRAN-0006 | TRAN-0002 | TRAN-0009 | 2025-06-07T09:12:29 |
| TRAN-0007 | TRAN-0003 | TRAN-0002 | 2023-11-14T02:28:35 |
| TRAN-0008 | TRAN-0003 | TRAN-0008 | 2023-01-21T02:20:55 |

**t_transformation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0001 | 795.94 |
| TRAN-0002 | TRAN-0002 | TRAN-0001 | 7139.05 |
| TRAN-0003 | TRAN-0003 | TRAN-0001 | 5074.97 |
| TRAN-0004 | TRAN-0004 | TRAN-0001 | 6971.76 |
| TRAN-0005 | TRAN-0005 | TRAN-0001 | 5283.27 |
| TRAN-0006 | TRAN-0006 | TRAN-0001 | 1285.62 |

**t_transformation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0004 | edge-03 |
| TRAN-0002 | TRAN-0001 | TRAN-0005 | Log Level 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0006 | review |
| TRAN-0004 | TRAN-0001 | TRAN-0010 | complete |
| TRAN-0005 | TRAN-0001 | TRAN-0011 | Triggered By 05 |
| TRAN-0006 | TRAN-0002 | TRAN-0004 | edge-03 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | Log Level 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | initiation |