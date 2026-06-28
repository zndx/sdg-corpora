---
chapter_id: ch_live_ebpfprogram_governed_by_security_policy_ed3b68
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_governed_by_security_policy', 'lineage_edge_basic', 'policy_attests_artifact']
model: engine-refine
---

The architecture of policy enforcement and data lineage tracking rests on a disciplined separation between immutable identifiers, typed attributes, and the entities they describe. Each record carries a unique identifier—POLI-0001 through POLI-0004 for eBPF programs, EDGE-0001 through EDGE-0004 for lineage edges, ARTI-0001 through ARTI-0004 for policy attestations—serving as the stable anchor across fact, dimension, and attribute-value tables. These identifiers do not merely label; they enable referential integrity between the structural core and its extensible metadata. An eBPF program identified as POLI-0001 may appear in the fact table with a size of 784,335,640 bytes at version 12, while the same identifier in the dimension table carries the label "Ebpfprogram Label 01" and the category "Ebpfprogram Category 01." The separation of mutable operational data from stable descriptive metadata ensures that program reclassification or relabeling never corrupts the audit trail.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

**t_lineage_edge_basic**

| id | lineage |
| --- | --- |
| EDGE-0001 | Financial Reconciliation Trace |
| EDGE-0002 | Compliance Verification Path |
| EDGE-0003 | Data Lake Ingestion Chain |
| EDGE-0004 | Supply Chain Audit Trail |
| EDGE-0005 | Sensor Calibration Pipeline |
| EDGE-0006 | Supply Chain Audit Trail |
| EDGE-0007 | Document Revision History |
| EDGE-0008 | Genomic Variant Processing |

**t_lineage_edge_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EDGE-0001 | confidence | xsd:decimal |
| EDGE-0002 | dimension_kind | xsd:string |
| EDGE-0003 | method | xsd:string |
| EDGE-0004 | recorded_at | xsd:dateTime |
| EDGE-0005 | uncertainty | xsd:decimal |
| EDGE-0006 | unit | xsd:string |
| EDGE-0007 | value | xsd:decimal |
| EDGE-0008 | encoding | xsd:string |

**t_policy_attests_artifact**

| id | policy |
| --- | --- |
| ARTI-0001 | FedRAMP Storage Mandate |
| ARTI-0002 | Zero Trust Access Policy |
| ARTI-0003 | NIST Encryption Protocol |
| ARTI-0004 | HIPAA Data Minimization Rule |
| ARTI-0005 | ISO Privacy Guideline |
| ARTI-0006 | Zero Trust Access Policy |

**t_policy_attests_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

Attributes and their types form the extensible layer that attaches domain-specific properties to any entity without altering the underlying schema. In the lineage edge model, attributes such as confidence, dimension_kind, method, and recorded_at are declared with their corresponding XML Schema types—xsd:decimal, xsd:string, xsd:string, and xsd:dateTime—establishing a contract for value validation before any data is persisted. The policy attestation model follows the same pattern: effective_date, enforcement, mandatory, and priority are typed as xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This typed attribute registry decouples the definition of what properties exist from the storage of their values, allowing new attributes to be introduced without schema migration.

The entity-attribute-value decomposition extends this principle to the actual data. Rather than embedding attribute values directly into a wide table, the system distributes them across type-specific value tables, each keyed by the entity and attribute identifiers. A lineage edge identified as EDGE-0001 carries a confidence score of 0.947 in the decimal value table, a dimension kind of "Dimension Kind 01" in the varchar table, and a recorded timestamp of 2023-06-18T00:21:12 in the datetime table—all referencing the same EDGE-0001 entity and distinct attribute identifiers. Similarly, policy ARTI-0001 has an effective date of 2023-10-01, a priority integer of 2, a mandatory boolean of true, and an enforcement descriptor of "Enforcement 02," each stored in its appropriate value table. This normalization eliminates null columns, enforces type safety at the storage layer, and permits attributes with heterogeneous types to coexist within the same entity without structural conflict.

**t_lineage_edge_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0004 | 2023-06-18T00:21:12 |
| EDGE-0002 | EDGE-0002 | EDGE-0004 | 2023-11-20T00:15:50 |
| EDGE-0003 | EDGE-0003 | EDGE-0004 | 2023-03-09T06:34:54 |
| EDGE-0004 | EDGE-0004 | EDGE-0004 | 2023-04-04T09:21:45 |
| EDGE-0005 | EDGE-0005 | EDGE-0004 | 2025-02-06T04:35:19 |
| EDGE-0006 | EDGE-0006 | EDGE-0004 | 2023-09-20T23:51:28 |
| EDGE-0007 | EDGE-0007 | EDGE-0004 | 2023-03-25T22:49:39 |
| EDGE-0008 | EDGE-0008 | EDGE-0004 | 2025-02-12T13:04:31 |

**t_lineage_edge_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0001 | 0.947 |
| EDGE-0002 | EDGE-0001 | EDGE-0005 | 637.72 |
| EDGE-0003 | EDGE-0001 | EDGE-0007 | 513.28 |
| EDGE-0004 | EDGE-0002 | EDGE-0001 | 0.497 |
| EDGE-0005 | EDGE-0002 | EDGE-0005 | 852.97 |
| EDGE-0006 | EDGE-0002 | EDGE-0007 | 198.62 |
| EDGE-0007 | EDGE-0003 | EDGE-0001 | 0.290 |
| EDGE-0008 | EDGE-0003 | EDGE-0005 | 468.80 |

**t_lineage_edge_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0002 | Dimension Kind 01 |
| EDGE-0002 | EDGE-0001 | EDGE-0008 | Encoding 02 |
| EDGE-0003 | EDGE-0001 | EDGE-0009 | change rationale |
| EDGE-0004 | EDGE-0001 | EDGE-0010 | de |
| EDGE-0005 | EDGE-0001 | EDGE-0003 | manual |
| EDGE-0006 | EDGE-0001 | EDGE-0006 | count |
| EDGE-0007 | EDGE-0002 | EDGE-0002 | Dimension Kind 07 |
| EDGE-0008 | EDGE-0002 | EDGE-0008 | Encoding 08 |

**t_policy_attests_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | true |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | false |

**t_policy_attests_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-10-01 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2024-11-14 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-16 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2025-04-17 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2025-02-23 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-06-05 |

**t_policy_attests_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 49 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 2 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 915 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 3 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 439 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 5 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 254 |

**t_policy_attests_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | calibration record |

The eBPF program fact table illustrates how operational telemetry integrates with this attribute framework. Programs identified as POLI-0001, POLI-0002, POLI-0003, and POLI-0004 carry size measurements ranging from 113,209,263 bytes to 784,335,640 bytes and version numbers of 9, 11, and 12. The ebpfprogram_key column establishes a self-referential relationship—POLI-0003 appears as both a program identifier and a key reference, suggesting that programs can be composed of or depend upon other programs. This self-referential structure, combined with the categorical labels from the dimension table, enables hierarchical classification of enforcement programs by both function and dependency.

Lineage edges and policy attestations demonstrate the same architectural pattern applied to compliance and audit domains. Lineage edges such as "Financial Reconciliation Trace," "Compliance Verification Path," "Data Lake Ingestion Chain," and "Supply Chain Audit Trail" are not merely descriptive strings; they are structured entities with typed attributes and multi-modal values that capture the provenance of data transformations. Policy attestations like "FedRAMP Storage Mandate," "Zero Trust Access Policy," "NIST Encryption Protocol," and "HIPAA Data Minimization Rule" carry enforcement metadata—effective dates spanning from 2023-10-01 through 2025-04-17, integer priorities of 2 and 915, and boolean mandatory flags—that allow compliance systems to evaluate which policies are active, which take precedence, and which are enforceable. The consistent use of identifiers, typed attributes, and value-type partitioning across all three domains—eBPF programs, lineage edges, and policy attestations—creates a unified data model where operational telemetry, audit provenance, and regulatory compliance share the same structural vocabulary.