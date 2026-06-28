---
chapter_id: ch_live_ebpfmap_with_key_type_17d850
topic_id: 26
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_key_type', 'annotation_only_about_artifact', 'control_with_owner']
model: engine-refine
---

In governed data architectures, identifiers serve as the immutable anchors that enable traceability across every layer of an annotation pipeline. Each record carries a unique identifier—such as TYPE-0001 for a key type, ARTI-0001 for an annotation, or OWNE-0001 for a control—that persists across fact and dimension tables, ensuring that every measurement, classification, and attribute value can be unambiguously traced back to its source. These identifiers are not merely labels; they are the connective tissue that binds operational telemetry to its semantic context. For instance, the eBPF map identified as TYPE-0001 occupies 208,979,093 bytes and is tracked at version 3, while the annotation ARTI-0001 carries a confidence score of 0.845 and an uncertainty of 690.59, demonstrating how identifiers carry both structural and probabilistic metadata simultaneously.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

Annotations themselves represent the scored interpretations applied to observed data, and their quality is quantified through confidence and uncertainty metrics that govern downstream decision-making. A confidence value of 0.845 on annotation ARTI-0001 signals a high degree of model certainty, whereas ARTI-0002, with a confidence of only 0.236, warrants manual review or suppression in automated workflows. The corresponding uncertainty values—ranging from 22.02 on ARTI-0001 to 690.59 on ARTI-0001—provide the complementary variance signal that risk models and compliance engines use to weight evidence. These paired metrics allow systems to distinguish between confident but imprecise assessments and uncertain but potentially critical findings, enabling tiered response strategies where high-confidence, low-uncertainty annotations trigger automated actions and borderline cases escalate to human analysts.

The categorization layer—spanning annotation categories, key type categories, and control classifications—imposes a structured taxonomy that transforms raw identifiers into actionable governance signals. An annotation labeled "Annotation Label 01" belongs to "Annotation Category 01," a key type labeled "Key Type Label 01" falls under "Key Type Category 01," and controls such as "Vendor Risk Assessment" and "Data Retention Policy" are tracked within the control registry. This categorical hierarchy enables aggregation and filtering at scale: compliance dashboards can roll up all annotations within a category, security teams can filter eBPF maps by key type category, and audit workflows can group controls by their classification. The category column thus functions as the primary dimension for reporting, policy enforcement, and regulatory mapping.

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

Attribute values are stored in a type-dispatched schema where each attribute—identified by its name and typed by its schema definition—routes to a value table matching its data type. The attribute registry defines names such as effective_date, enforcement, mandatory, and priority, each bound to an XSD type like xsd:date, xsd:string, xsd:boolean, or xsd:integer. Boolean attributes store values like true and false across entity-attribute pairs, date attributes capture effective dates such as 2024-04-04 and 2025-04-01, integer attributes hold numeric values ranging from 4 to 806, and varchar attributes preserve free-form strings like "change rationale" and "Encoding 01." This normalization by type ensures type safety at query time while allowing the attribute model to remain extensible: new attributes can be added to the registry without schema migrations, and their values flow into the appropriate typed value table automatically.

Entity identifiers tie every attribute value back to the governed object it describes, creating a many-to-many relationship between entities and their attribute assignments. The entity_id column in each typed value table references the control registry, meaning that a single control like "Vendor Risk Assessment" can carry multiple attributes—its effective_date, its enforcement status, whether it is mandatory, and its priority level—each stored in its respective value table but unified through the shared entity identifier. This design supports fine-grained attribute management where different controls can share the same attribute definitions while holding distinct values, and where attribute types can evolve independently of the entities they describe. The result is a flexible, type-safe attribute model that scales across thousands of controls without sacrificing query performance or data integrity.

**t_control_with_owner_attr**

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

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |