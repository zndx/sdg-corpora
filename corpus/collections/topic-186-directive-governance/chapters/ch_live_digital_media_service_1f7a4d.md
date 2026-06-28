---
chapter_id: ch_live_digital_media_service_1f7a4d
topic_id: 186
family: 08_derived
cited_terms: ['digital_media_service', 'artifact_with_universal', 'control_under_framework']
model: engine-refine
---

Governance frameworks rely on structured metadata to track controls, their attributes, and the artifacts that implement them. Each control is assigned a unique identifier such as FRAM-0001 or FRAM-0003, which serves as the primary key across multiple related tables. These identifiers anchor the control definitions—Network firewall, Threat detection, Session timeout, and Configuration baseline—within a broader framework hierarchy. The framework itself is represented by universal identifiers like UNIV-0002 and UNIV-0004, which link to concrete artifacts such as Feature_Vector_Store and Schema_Definition. These artifacts carry a createddate field that records when they were instantiated, with dates ranging from 2024-10-11 for Schema_Definition to 2024-12-09 for Audit_Reporter, establishing a temporal lineage for each component. Location metadata further contextualizes deployment, distinguishing between cloud regions like us-east-1 and on-premises infrastructure such as on-prem-dc1, which is where Schema_Definition resides.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | FRAM-0006 | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | FRAM-0004 | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | FRAM-0002 | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | FRAM-0003 | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | FRAM-0005 | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | FRAM-0005 | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | FRAM-0006 | 2023-11-17 | on-prem-dc1 |

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | UNIV-0003 |
| FRAM-0002 | Threat detection | UNIV-0005 |
| FRAM-0003 | Session timeout | UNIV-0006 |
| FRAM-0004 | Configuration baseline | UNIV-0007 |
| FRAM-0005 | Vulnerability scan | UNIV-0005 |
| FRAM-0006 | Access review | UNIV-0005 |

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

Attributes provide the mechanism for enriching controls with additional properties beyond their core definition. The attribute schema is defined in a dedicated table where each attribute carries a name—effective_date, enforcement, mandatory, priority—and a corresponding attr_type that specifies its data type. These types follow XML Schema definitions, including xsd:date for temporal values, xsd:string for free-form text, xsd:boolean for binary flags, and xsd:integer for numeric measures. This type discipline ensures that attribute values are stored in appropriately typed tables, each dedicated to a single data type. Boolean attributes such as mandatory are stored in a separate value table where the entity column references the control identifier and the attr_id column points to the attribute definition, with values like true or false indicating whether a control is mandatory. Date attributes such as effective_date follow the same pattern, with values like 2024-07-12 and 2023-06-25 recording when controls became or ceased to be in effect. Integer attributes capture priority levels and other numeric measures, with values ranging from 1 to 994, while varchar attributes store textual metadata such as Enforcement 02, pre-release note, and ja, providing flexible annotation capacity.

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |

The entity column in each value table serves as the foreign key linking back to the control definition, ensuring referential integrity between attribute values and their parent controls. For instance, the boolean value true for the mandatory attribute is associated with entity FRAM-0001, directly tying that enforcement decision to the Network firewall control. This design allows a single control to carry multiple attributes of different types without schema modification, supporting a flexible extensible model. The attr_id column further distinguishes which attribute definition a value corresponds to, enabling a single control to have multiple attributes of the same type—for example, integer values 3 and 104 both reference attr_id FRAM-0004 and FRAM-0005 respectively within entity FRAM-0001.

Service-level operations are tracked through a fact table that records event counts against service identifiers and function references. Identifiers such as SERV-0001 and SERV-0002 anchor individual service records, while the event_count column quantifies operational activity, with observed values of 311, 322, 297, and 386. The provides_function_key column links each service record to a dimension table that defines the function's label and category. Labels such as Provides Function Label 01 through Provides Function Label 04 pair with categories like Provides Function Category 01 through Provides Function Category 04, creating a classification hierarchy that supports aggregation and reporting. This separation of operational metrics from functional classification enables independent analysis of service volume and functional grouping. The misc column, used across value tables for attribute values and dimension tables for function labels, serves as a generic storage field for free-form text that does not fit into typed attribute columns, providing a catch-all for annotations, notes, and localized strings.

**fact_digital**

| id | provides_function_key | event_count |
| --- | --- | --- |
| SERV-0001 | SERV-0005 | 311 |
| SERV-0002 | SERV-0003 | 322 |
| SERV-0003 | SERV-0002 | 297 |
| SERV-0004 | SERV-0002 | 386 |
| SERV-0005 | SERV-0005 | 377 |
| SERV-0006 | SERV-0006 | 162 |

**dim_provides_function**

| id | provides_function_label | provides_function_category |
| --- | --- | --- |
| SERV-0001 | Provides Function Label 01 | Provides Function Category 01 |
| SERV-0002 | Provides Function Label 02 | Provides Function Category 02 |
| SERV-0003 | Provides Function Label 03 | Provides Function Category 03 |
| SERV-0004 | Provides Function Label 04 | Provides Function Category 04 |
| SERV-0005 | Provides Function Label 05 | Provides Function Category 05 |
| SERV-0006 | Provides Function Label 06 | Provides Function Category 06 |