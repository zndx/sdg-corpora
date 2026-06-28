---
chapter_id: ch_live_kernelhook_subclass_71bb71
topic_id: 7
family: 04_ebpf_kernel
cited_terms: ['kernelhook_subclass', 'subclass_to_designative_ice', 'attestation_signed_by']
model: engine-refine
---

At the kernel level, hook instrumentation is captured through a fact table keyed by an identifier such as KERN-0001 or KERN-0002, each row recording the size in bytes of the associated hook binary—values ranging from 36,342,735 bytes for KERN-0001 up to 560,962,979 bytes for KERN-0002—and a version number that distinguishes releases, with version 10 appearing for KERN-0001 and version 1 for both KERN-0002 and KERN-0004. The foreign key at_kernel_function_key ties each fact row to a dimension record describing the kernel function itself, enabling dimensional analysis of hook deployments across function categories and labels. The dimension table for kernel functions carries its own identifier, a human-readable label such as At Kernel Function Label 01, and a category designation like At Kernel Function Category 01, forming a star-schema backbone that supports aggregation by function type and version lineage.

**fact_kernelhook**

| id | at_kernel_function_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0002 | 36342735 | 3 |
| KERN-0002 | KERN-0003 | 560962979 | 1 |
| KERN-0003 | KERN-0001 | 456299832 | 10 |
| KERN-0004 | KERN-0008 | 272822846 | 1 |

**dim_at_kernel_function**

| id | at_kernel_function_label | at_kernel_function_category |
| --- | --- | --- |
| KERN-0001 | At Kernel Function Label 01 | At Kernel Function Category 01 |
| KERN-0002 | At Kernel Function Label 02 | At Kernel Function Category 02 |
| KERN-0003 | At Kernel Function Label 03 | At Kernel Function Category 03 |
| KERN-0004 | At Kernel Function Label 04 | At Kernel Function Category 04 |
| KERN-0005 | At Kernel Function Label 05 | At Kernel Function Category 05 |
| KERN-0006 | At Kernel Function Label 06 | At Kernel Function Category 06 |
| KERN-0007 | At Kernel Function Label 07 | At Kernel Function Category 07 |
| KERN-0008 | At Kernel Function Label 08 | At Kernel Function Category 08 |

Beyond kernel hooks, the data model extends to designative entities that carry typed attributes in an entity-attribute-value pattern. The designative table assigns names such as CryoStream-Link, CryoVault-Label, AeroFrost-ID, and IceSheet-Ref to identifiers ICE-0001 through ICE-0004, while a parallel attribute-definition table declares the schema for those entities: ICE-0001 carries an encoding attribute of type xsd:string, ICE-0002 carries label_text of type xsd:string, and ICE-0003 carries language of type xsd:string. The value table then materializes these attributes against specific entities—ICE-0001 receives the values Encoding 01, change rationale, and es across its three attributes, while ICE-0002 receives Encoding 04 for its encoding attribute—demonstrating how a single entity can accumulate heterogeneous attribute values without requiring a fixed column set.

**t_subclass_to_designative_ice**

| id | designative |
| --- | --- |
| ICE-0001 | CryoStream-Link |
| ICE-0002 | CryoVault-Label |
| ICE-0003 | AeroFrost-ID |
| ICE-0004 | IceSheet-Ref |
| ICE-0005 | CryoStream-Link |
| ICE-0006 | IceSheet-Ref |

**t_subclass_to_designative_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | encoding | xsd:string |
| ICE-0002 | label_text | xsd:string |
| ICE-0003 | language | xsd:string |

**t_subclass_to_designative_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | Encoding 01 |
| ICE-0002 | ICE-0001 | ICE-0002 | change rationale |
| ICE-0003 | ICE-0001 | ICE-0003 | es |
| ICE-0004 | ICE-0002 | ICE-0001 | Encoding 04 |
| ICE-0005 | ICE-0002 | ICE-0002 | nightly summary |
| ICE-0006 | ICE-0002 | ICE-0003 | fr |
| ICE-0007 | ICE-0003 | ICE-0001 | Encoding 07 |
| ICE-0008 | ICE-0003 | ICE-0002 | change rationale |

A parallel attestation domain mirrors this EAV structure with richer type diversity. The attestation table records signed certifications such as System Access Certification, Data Lineage Certification, and Privacy Impact Assessment under identifiers SIGN-0001 through SIGN-0004. Its attribute-definition table declares four typed attributes: duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. Values are distributed across four type-specific value tables—datetime, decimal, integer, and varchar—each linking an entity_id to an attr_id and a typed value. For SIGN-0001, the duration_seconds attribute yields 2,368.11, the end_time attribute yields 2023-11-18T17:18:55, the exit_code attribute yields 407, and the host_name attribute yields gw-12, illustrating how a single attestation record spans multiple value tables to preserve type fidelity.

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | System Access Certification |
| SIGN-0002 | Data Lineage Certification |
| SIGN-0003 | Privacy Impact Assessment |
| SIGN-0004 | System Access Certification |
| SIGN-0005 | Data Lineage Certification |
| SIGN-0006 | Model Performance Signoff |

**t_attestation_signed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_signed_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-11-18T17:18:55 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2024-04-18T06:27:25 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2023-01-19T17:50:39 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2025-06-04T16:32:01 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-04-02T11:15:56 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2023-07-13T05:58:46 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2023-10-19T08:02:32 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2025-01-01T00:25:23 |

**t_attestation_signed_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 2368.11 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 5757.34 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 785.50 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 5676.02 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 992.24 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 815.51 |

**t_attestation_signed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 407 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 30 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 633 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 373 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 166 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 260 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 596 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 36 |

**t_attestation_signed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | gw-12 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | closeout |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | pending |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | worker-07 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | review |

The foreign-key architecture binds these domains together through identifier columns that serve as both primary keys and join points. The at_kernel_function_key in the kernel hook fact table references the identifier in the kernel function dimension, creating a many-to-one relationship that allows any number of hook measurements to be classified under a single function category. Similarly, the entity_id and attr_id columns in the attestation value tables reference the identifiers in the attestation and attribute-definition tables, respectively, forming a normalized EAV graph where the entity table, attribute table, and value tables are connected through shared identifier columns. This design supports extensibility: new attributes can be declared without schema migration, and new entities can accumulate values through inserts alone.

The practical effect of this structure is a data model that separates schema from instance, type from value, and measurement from classification. Kernel hook sizes and versions are factored into a star schema for analytical queries, while designative entities and attestations use a flexible EAV pattern to accommodate heterogeneous attribute sets. The use of XML Schema datatypes—xsd:string, xsd:decimal, xsd:dateTime, xsd:integer—across attribute definitions ensures that value tables enforce type constraints at the column level, and the identifier-based foreign keys provide a consistent join mechanism across all domains. Representative values such as the 560,962,979-byte hook binary, the CryoStream-Link designative, and the 2,368.11-second attestation duration ground the model in operational reality, showing how abstract schema constructs map to concrete system artifacts.