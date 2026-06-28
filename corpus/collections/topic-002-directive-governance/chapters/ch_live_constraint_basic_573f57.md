---
chapter_id: ch_live_constraint_basic_573f57
topic_id: 2
family: 03_directive_governance
cited_terms: ['constraint_basic', 'policy_with_jurisdiction', 'labrun_min_one_sample']
model: engine-refine
---

Attributes, their types, enforcement mechanisms, and the entities they describe form the backbone of any governance framework that must accommodate heterogeneous regulatory and operational requirements. At the core of this architecture lies a separation between attribute definitions and their concrete values: attributes are declared with a name and a type, while actual values are stored in type-specific repositories, each linked back to the entity they qualify. This design permits a single policy-jurisdiction pair to carry an effective date such as 2023-11-22, a mandatory flag set to true or false, a priority integer like 326 or 210, and a free-text descriptor such as Encoding 01 or Enforcement 02, all without schema modification. The attribute type system — drawing on xsd:date, xsd:string, xsd:boolean, xsd:integer, xsd:decimal, and xsd:dateTime — ensures that each value is validated against its declared format at ingestion, preventing type drift across the compliance record.

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | European Data Protection Board |
| JURI-0002 | European Union | CCPA |
| JURI-0003 | European Union | European Union |
| JURI-0004 | FISMA | Basel III |
| JURI-0005 | California Attorney General | EU Data Act |
| JURI-0006 | Federal Trade Commission | National Institute of Standards |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |

Enforcement is not merely a label but a structural property that determines how a constraint or policy is applied in practice. A constraint identified as CONS-0001, governing AES-256 encryption, carries a blocking enforcement posture, meaning violations halt the associated workflow entirely. Similarly, CONS-0002, which enforces unique email addresses, and CONS-0004, constraining packet size to a maximum of 1500 bytes, both operate under blocking enforcement. By contrast, CONS-0003, which limits field length to 255 characters, is marked mandatory — a distinction that signals a validation requirement rather than an immediate stop condition. These enforcement classifications are themselves typed as xsd:string, allowing them to be stored alongside other attribute values and queried uniformly, yet they carry operational weight that the system interprets at runtime.

**t_constraint_basic**

| id | constraint | enforcement | label_text |
| --- | --- | --- | --- |
| CONS-0001 | ENCRYPTION_AES256 | blocking | nightly summary |
| CONS-0002 | UNIQUE_EMAIL | blocking | intake form |
| CONS-0003 | PACKET_SIZE_MAX_1500 | mandatory | intake form |
| CONS-0004 | MAX_LENGTH_255 | blocking | pre-release note |
| CONS-0005 | MAX_LENGTH_255 | advisory | calibration record |
| CONS-0006 | CHECK_AGE_POSITIVE | advisory | change rationale |
| CONS-0007 | NOT_NULL | mandatory | change rationale |

Entities — whether they represent policy-jurisdiction pairings or laboratory run samples — are identified by stable, human-readable identifiers that anchor every attribute-value association. A policy entry such as JURI-0001 links the Financial Conduct Authority to the European Data Protection Board, while JURI-0004 connects FISMA to the Basel III framework. Each of these entities can carry multiple attributes, and the attribute definitions themselves are stored separately: SAMP-0001 declares duration_seconds as xsd:decimal, SAMP-0002 declares end_time as xsd:dateTime, SAMP-0003 declares exit_code as xsd:integer, and SAMP-0004 declares host_name as xsd:string. The entity identifier appears in every value row, creating a foreign-key relationship that ties concrete data back to its semantic context. In the lab run domain, identifiers such as SEQ-EXP-99 and PROTOCOL-V3 reference input samples like RNA-POOL-22 and CELL-LINE-Hela, establishing a parallel chain of traceability from experiment to result.

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | RNA-POOL-22 |
| SAMP-0002 | PROTOCOL-V3 | CELL-LINE-Hela |
| SAMP-0003 | CEL-SEQR-112 | BLOOD-DRAW-A1 |
| SAMP-0004 | CEL-SEQR-112 | REACTANT-SOL-4 |
| SAMP-0005 | PCR-CYCLE-44 | DNA-EXTRACT-77 |
| SAMP-0006 | METAB-ASSAY-Q2 | SOIL-SUB-09 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

Label text provides the human-facing layer of this system, attaching descriptive context to constraints and attributes without altering their machine-readable semantics. The constraint CONS-0002, which enforces unique email addresses, carries the label text intake form, indicating the operational context in which this rule applies. The same label text appears on CONS-0003, which constrains maximum field length, suggesting a shared form-based workflow. In the value tables, label text surfaces as free-text values — intake form, closeout, complete, ja — stored in varchar columns and associated with entities through the same entity_id foreign key. These values are not metadata about metadata; they are domain data that happens to be text, and they are treated as such by the query layer.

The value tables themselves are partitioned by type, a structural choice that reflects the heterogeneity of compliance and operational data. Boolean values such as false and true record whether a mandatory attribute is active for a given entity — JURI-0003 carries mandatory set to true, while JURI-0001, JURI-0002, and JURI-0004 carry it as false. Date values span from 2023-05-18 to 2025-06-18, capturing effective dates and temporal boundaries. Integer values range from 1 to 5150.87 when considering decimal types, encompassing priorities, exit codes, and numeric measurements. Datetime values such as 2024-08-01T16:02:07 and 2024-02-12T19:03:44 anchor events to precise moments. This type-partitioned storage model, while introducing join complexity, guarantees that every value conforms to its declared type and that type-specific operations — date arithmetic, boolean logic, integer comparison — execute without coercion errors.