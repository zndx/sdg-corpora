---
chapter_id: ch_live_table_provenance_source_5137b3
topic_id: 36
family: 07_long_tail
cited_terms: ['table_provenance_source', 'process_max_one_operator', 'attribute_set_supports_outlier_claim']
model: engine-refine
---

In data provenance and attribute management, the identifier serves as the immutable anchor for every record, whether it appears as a fact-level key such as SOUR-0001 or as an operator reference like OPER-0001. These identifiers propagate across related structures: a fact record carries a sourced_from_table_key that resolves to a label and category in a dimension table, while process records carry an operator identifier that in turn links to a set of typed attribute values. The dimension table for sourced-from-table entries, for instance, pairs SOUR-0001 with the label Sourced From Table Label 01 and the category Sourced From Table Category 01, establishing a controlled vocabulary through which raw fact records are classified. This separation of identity from descriptive metadata ensures that provenance labels can be updated without touching the fact records themselves.

**fact_table**

| id | sourced_from_table_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SOUR-0001 | SOUR-0008 | 0.274 | 648.78 | 608.50 |
| SOUR-0002 | SOUR-0006 | 0.140 | 899.39 | 639.23 |
| SOUR-0003 | SOUR-0006 | 0.609 | 885.54 | 470.53 |
| SOUR-0004 | SOUR-0006 | 0.874 | 289.58 | 720.41 |

**dim_sourced_from_table**

| id | sourced_from_table_label | sourced_from_table_category |
| --- | --- | --- |
| SOUR-0001 | Sourced From Table Label 01 | Sourced From Table Category 01 |
| SOUR-0002 | Sourced From Table Label 02 | Sourced From Table Category 02 |
| SOUR-0003 | Sourced From Table Label 03 | Sourced From Table Category 03 |
| SOUR-0004 | Sourced From Table Label 04 | Sourced From Table Category 04 |
| SOUR-0005 | Sourced From Table Label 05 | Sourced From Table Category 05 |
| SOUR-0006 | Sourced From Table Label 06 | Sourced From Table Category 06 |
| SOUR-0007 | Sourced From Table Label 07 | Sourced From Table Category 07 |
| SOUR-0008 | Sourced From Table Label 08 | Sourced From Table Category 08 |

**t_process_max_one_operator**

| id | process | operator |
| --- | --- | --- |
| OPER-0001 | SchemaEvolution | CLAI-0002 |
| OPER-0002 | BatchExport | CLAI-0001 |
| OPER-0003 | KeyRotation | CLAI-0004 |
| OPER-0004 | SchemaEvolution | CLAI-0002 |
| OPER-0005 | ModelTraining | CLAI-0002 |
| OPER-0006 | AuditCompaction | CLAI-0005 |

**t_process_max_one_operator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OPER-0001 | duration_seconds | xsd:decimal |
| OPER-0002 | end_time | xsd:dateTime |
| OPER-0003 | exit_code | xsd:integer |
| OPER-0004 | host_name | xsd:string |
| OPER-0005 | log_level | xsd:string |
| OPER-0006 | phase | xsd:string |
| OPER-0007 | retry_count | xsd:integer |
| OPER-0008 | scheduled_at | xsd:dateTime |

**t_process_max_one_operator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0002 | 2025-02-16T08:36:01 |
| OPER-0002 | OPER-0001 | OPER-0008 | 2025-02-03T08:52:18 |
| OPER-0003 | OPER-0001 | OPER-0009 | 2024-10-29T11:02:54 |
| OPER-0004 | OPER-0002 | OPER-0002 | 2024-01-13T15:11:53 |
| OPER-0005 | OPER-0002 | OPER-0008 | 2023-10-19T14:19:43 |
| OPER-0006 | OPER-0002 | OPER-0009 | 2025-02-16T12:03:32 |
| OPER-0007 | OPER-0003 | OPER-0002 | 2024-02-17T13:45:28 |
| OPER-0008 | OPER-0003 | OPER-0008 | 2024-11-18T13:09:46 |

**t_process_max_one_operator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0001 | 3596.17 |
| OPER-0002 | OPER-0002 | OPER-0001 | 2700.62 |
| OPER-0003 | OPER-0003 | OPER-0001 | 5101.62 |
| OPER-0004 | OPER-0004 | OPER-0001 | 2639.57 |
| OPER-0005 | OPER-0005 | OPER-0001 | 6522.26 |
| OPER-0006 | OPER-0006 | OPER-0001 | 4952.76 |

**t_process_max_one_operator_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0003 | 284 |
| OPER-0002 | OPER-0001 | OPER-0007 | 368 |
| OPER-0003 | OPER-0002 | OPER-0003 | 91 |
| OPER-0004 | OPER-0002 | OPER-0007 | 298 |
| OPER-0005 | OPER-0003 | OPER-0003 | 778 |
| OPER-0006 | OPER-0003 | OPER-0007 | 263 |
| OPER-0007 | OPER-0004 | OPER-0003 | 756 |
| OPER-0008 | OPER-0004 | OPER-0007 | 105 |

**t_process_max_one_operator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OPER-0001 | OPER-0001 | OPER-0004 | gw-12 |
| OPER-0002 | OPER-0001 | OPER-0005 | Log Level 02 |
| OPER-0003 | OPER-0001 | OPER-0006 | initiation |
| OPER-0004 | OPER-0001 | OPER-0010 | pending |
| OPER-0005 | OPER-0001 | OPER-0011 | Triggered By 05 |
| OPER-0006 | OPER-0002 | OPER-0004 | node-a01 |
| OPER-0007 | OPER-0002 | OPER-0005 | Log Level 07 |
| OPER-0008 | OPER-0002 | OPER-0006 | execution |

Attribute definitions and their values are organized by type to support efficient storage and validation. The attribute catalog assigns names such as duration_seconds, end_time, exit_code, and host_name to identifiers, each annotated with an XSD type—xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string—that determines which value table holds the corresponding data. Decimal attributes like duration_seconds carry values in the range 2639.57 to 5101.62; datetime attributes such as end_time span from 2024-01-13T15:11:53 to 2025-02-16T08:36:01; integer attributes like exit_code take values between 91 and 368; and varchar attributes including host_name and status fields hold strings such as gw-12, initiation, and pending. The entity column in each value table ties these measurements back to the process record that generated them, so that OPER-0001, for example, is associated with a duration of 3596.17 seconds, an end time of 2025-02-16T08:36:01, an exit code of 284, and a host name of gw-12.

Confidence and uncertainty quantify the reliability of fact-level observations. In the fact table, confidence values range from 0.140 to 0.874, with SOUR-0004 exhibiting the highest confidence at 0.874 and SOUR-0002 the lowest at 0.140. Uncertainty, expressed as a scalar magnitude, spans from 289.58 for SOUR-0004 to 899.39 for SOUR-0002, inversely tracking confidence as expected. The associated value column holds the measured quantity itself—470.53 for SOUR-0003, 720.41 for SOUR-0004—allowing downstream consumers to weigh each observation against its stated reliability before incorporating it into analysis or reporting.

The relationship between attributes and supporting evidence is modeled through a subject–target–role triad. An attribute such as source system ID, validation rule, geolocation accuracy, or sensor calibration (identified by CLAI-0001 through CLAI-0004) is linked to a support entity—API gateway, PostgreSQL instance, or Ontology registry—via a junction table that records the subject (the attribute identifier), the target (the support identifier), and the role (contributor or owner) that the support plays in substantiating an outlier claim. CLAI-0001, for instance, is a contributor to the claim supported by CLAI-0001 (API gateway), while CLAI-0003 and CLAI-0005 both contribute to the claim supported by CLAI-0005 (Ontology registry), and CLAI-0003 additionally serves as the owner of that same support. This explicit role annotation distinguishes between entities that merely contribute evidence and those that hold primary responsibility for the support, enabling fine-grained audit trails in governance workflows.

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |