---
chapter_id: ch_live_constraint_check_subclass_97615d
topic_id: 186
family: 03_directive_governance
cited_terms: ['constraint_check_subclass', 'transformation_basic', 'cardinality_min_one_generic']
model: engine-refine
---

Transformation governance rests on a layered model that separates the definition of a transformation from the attributes it exposes, the values those attributes hold, and the constraints that govern their validity. Each transformation is assigned a unique identifier—TRAN-0001 through TRAN-0004 in the reference data—corresponding to operations such as currency conversion, customer deduplication, feature scaling, and JSON-to-Parquet conversion. These identifiers serve as the primary key for all downstream references, anchoring every attribute, value, and constraint to a specific transformation instance. The attribute layer then describes what metadata each transformation produces: duration_seconds typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. By decoupling attribute definitions from their runtime values, the model supports reuse of the same attribute schema across multiple transformations while preserving type discipline.

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

Runtime values are stored in type-specialized value tables, each keyed by a composite of the transformation identifier and the attribute identifier. A single transformation such as TRAN-0001 may simultaneously carry a decimal value of 795.94 for its duration_seconds attribute, a datetime value of 2025-05-04T13:03:22 for end_time, an integer exit code of 133, and a string host_name of edge-03. This normalization by data type avoids the ambiguity of a single generic value column and ensures that type coercion errors are caught at the storage layer rather than at query time. The entity_id column in each value table points back to the transformation identifier, while attr_id references the attribute definition, forming a clear foreign-key path from concrete values through their schema to the transformation they describe.

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

**t_cardinality_min_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | exactlyOne | CHEC-0004 |
| GENE-0002 | minOne | CHEC-0004 |
| GENE-0003 | minOne | CHEC-0004 |
| GENE-0004 | required | CHEC-0005 |
| GENE-0005 | minOne | CHEC-0004 |
| GENE-0006 | many | CHEC-0001 |

Constraint enforcement is modeled through a separate subclass table that links each constraint—such as Null field rejection, Anomaly detection threshold, or Header presence check—to one or more generic checks identified by codes like GENE-0002 through GENE-0005. The mandatory flag on each constraint record determines whether the associated check must pass for the transformation to be considered compliant; in the reference data, three of four constraints are marked mandatory while the Header presence check is not. Priority, expressed as an integer from 1 to 5, orders the checks by severity: Null field rejection carries the highest priority of 1, while Anomaly detection threshold is ranked at 4. This priority ordering enables downstream systems to triage failures, escalating only the highest-priority violations while logging lower-priority ones for audit.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | GENE-0005 | true | 1 |
| CHEC-0002 | Null field rejection | GENE-0003 | true | 5 |
| CHEC-0003 | Anomaly detection threshold | GENE-0005 | true | 4 |
| CHEC-0004 | Header presence check | GENE-0002 | false | 1 |
| CHEC-0005 | Batch size limit | GENE-0002 | false | 4 |
| CHEC-0006 | Anomaly detection threshold | GENE-0001 | false | 1 |

Cardinality relationships bind generic checks to specific constraints, enforcing that each referenced check must appear at least once. The cardinality column distinguishes between exactlyOne, minOne, and required variants, all of which impose a lower bound of one on the count of related check instances. In the reference data, the check GENE-0004 is constrained to minOne across three separate cardinality records, all pointing to constraint CHEC-0004, while GENE-0001 is constrained to exactlyOne against the same constraint. This structure ensures that no constraint can be satisfied by a zero-count check, and the cardinality variant provides fine-grained control: exactlyOne enforces a strict single occurrence, whereas minOne permits multiple but demands at least one.

Together, these layers form a complete governance chain. A transformation identifier anchors the record; attribute definitions specify the shape of the metadata; value tables hold the actual data typed appropriately; constraint records declare which checks must pass and how urgently; and cardinality tables guarantee that every referenced check is exercised at least once. The mandatory and priority columns on the constraint records allow operators to distinguish between hard compliance gates and softer monitoring checks, while the type-safe value tables ensure that the data flowing through each transformation remains consistent with its declared schema.