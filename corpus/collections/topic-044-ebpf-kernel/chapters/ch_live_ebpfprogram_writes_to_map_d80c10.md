---
chapter_id: ch_live_ebpfprogram_writes_to_map_d80c10
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_writes_to_map', 'control_min_one_owner', 'measurement_aggregated_into']
model: engine-refine
---

Governance architectures of this kind rest upon a disciplined separation between measured phenomena and the metadata that contextualizes them. At the core of the measurement layer, the fact table for eBPF programs records each program by a unique identifier—MAP-0001 through MAP-0004—alongside its size in bytes, which ranges from 113,209,263 for MAP-0003 to 784,335,640 for MAP-0001, and a version number that spans 9 through 12. Each program entry carries a writes_to_map foreign key pointing to a map dimension, such that MAP-0001 and MAP-0003 both reference MAP-0003, while MAP-0002 targets MAP-0005 and MAP-0004 targets MAP-0001. The map dimension itself supplies human-readable labels—Writes To Map Label 01 through Writes To Map Label 04—and categorical classifications—Writes To Map Category 01 through Writes To Map Category 04—providing the semantic scaffolding that transforms opaque identifiers into auditable entities.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

The measurement fact table extends this pattern by recording individual observations with an aggregated_into foreign key that groups related readings. Four observations—INTO-0001 through INTO-0004—carry confidence scores ranging from 0.307 for INTO-0004 to 0.945 for INTO-0002, and uncertainty values spanning 120.70 to 364.07, while their measured values themselves range from 64.10 to 878.99. The aggregated_into_key column assigns each observation to a parent aggregation group: INTO-0001 and INTO-0002 both roll up into INTO-0005, INTO-0003 into INTO-0004, and INTO-0004 into INTO-0006. The corresponding dimension table, dim_aggregated_into, attaches labels such as Aggregated Into Label 01 and categories like Aggregated Into Category 01 through 04, ensuring that every aggregation relationship carries both machine-readable and human-interpretable descriptors.

Control definitions introduce a parallel structure centered on policy objects rather than programmatic artifacts. The control table enumerates discrete governance directives—Rate Limit Threshold, Encryption At Rest, RBAC Assignment Policy, and Backup Retention Directive—each identified by OWNE-0001 through OWNE-0004. These controls are not monolithic; they decompose into typed attributes that capture the specific parameters by which a control is evaluated. The attribute dimension records names such as effective_date, enforcement, mandatory, and priority, each bound to an XML Schema datatype: xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This type binding is not decorative—it governs how values are stored, validated, and compared across the system.

The attribute-value relationship is materialized through a family of value tables, one per datatype, each linking an entity (the control it belongs to) and an attribute (the parameter being set) to a concrete value. Boolean attributes store entries like false, false, true, and false across entities OWNE-0001 through OWNE-0004, all referencing attribute OWNE-0003. Date attributes record effective dates ranging from 2023-01-26 to 2025-01-07, all tied to attribute OWNE-0001. Integer attributes carry values as divergent as 1 and 705, associated with attributes OWNE-0004 and OWNE-0005 across entities OWNE-0001 and OWNE-0002. Varchar attributes hold strings such as Encoding 01, Enforcement 02, audit excerpt, and de, linked to attributes OWNE-0007, OWNE-0002, OWNE-0008, and OWNE-0009 within entity OWNE-0001. This normalization by datatype ensures type safety at the storage layer while preserving the flexibility to attach heterogeneous metadata to each control.

**t_control_min_one_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | false |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | false |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | true |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | false |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_min_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2023-12-25 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2023-01-26 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2024-02-04 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2025-01-07 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-09-08 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-04-04 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2024-01-22 |

**t_control_min_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | audit excerpt |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | de |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | pre-release note |

The design philosophy underlying this schema is one of explicit provenance and traceability. Every identifier—whether a program ID, a map reference, a control definition, or a measurement observation—serves as a stable anchor point across the fact and dimension tables. Foreign keys encode relationships that are semantically meaningful: a program writes to a map, a measurement aggregates into a group, a control owns an attribute, an attribute holds a typed value. The misc column, appearing in both dimension and value tables, carries free-form descriptors and raw values that resist categorization, while the category column in dimensions provides the structured taxonomy that makes bulk analysis tractable. Confidence and uncertainty fields in the measurement fact table quantify the reliability of each observation, enabling downstream risk assessments to weight evidence appropriately. Version numbers on programs track evolution over time, ensuring that size metrics and behavioral properties can be correlated with specific releases.

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

**t_control_min_one_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Rate Limit Threshold |
| OWNE-0002 | Encryption At Rest |
| OWNE-0003 | RBAC Assignment Policy |
| OWNE-0004 | Backup Retention Directive |
| OWNE-0005 | MFA Enforcement |
| OWNE-0006 | Change Approval Workflow |
| OWNE-0007 | Change Approval Workflow |

**t_control_min_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_min_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 5 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 245 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 1 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 705 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 3 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 899 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 438 |

**fact_measurement**

| id | aggregated_into_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| INTO-0001 | INTO-0005 | 0.496 | 306.26 | 353.34 |
| INTO-0002 | INTO-0005 | 0.945 | 279.24 | 660.64 |
| INTO-0003 | INTO-0004 | 0.506 | 120.70 | 878.99 |
| INTO-0004 | INTO-0006 | 0.307 | 364.07 | 64.10 |
| INTO-0005 | INTO-0006 | 0.923 | 642.96 | 897.70 |

**dim_aggregated_into**

| id | aggregated_into_label | aggregated_into_category |
| --- | --- | --- |
| INTO-0001 | Aggregated Into Label 01 | Aggregated Into Category 01 |
| INTO-0002 | Aggregated Into Label 02 | Aggregated Into Category 02 |
| INTO-0003 | Aggregated Into Label 03 | Aggregated Into Category 03 |
| INTO-0004 | Aggregated Into Label 04 | Aggregated Into Category 04 |
| INTO-0005 | Aggregated Into Label 05 | Aggregated Into Category 05 |
| INTO-0006 | Aggregated Into Label 06 | Aggregated Into Category 06 |