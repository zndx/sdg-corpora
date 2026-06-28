---
chapter_id: ch_live_control_with_owner_3824ac
topic_id: 23
family: 03_directive_governance
cited_terms: ['control_with_owner', 'ebpfprogram_attaches_kernelhook_xref', 'transformation_governed_by']
model: engine-refine
---

The attribute-value model structures heterogeneous metadata through a disciplined separation of entity definitions, attribute schemas, and typed value assignments. An entity—such as a control identified by OWNE-0001 or an eBPF program identified by XREF-0001—serves as the anchor point for all associated properties. Attributes define the nature of those properties: effective_date, enforcement, mandatory, and priority in the control domain; checksum, created_date, identifier, and license in the eBPF program domain. Each attribute carries a declared type—xsd:date, xsd:string, xsd:boolean, xsd:integer, or the domain-specific cco:DesignativeICE—that governs how values are stored and validated. This type discipline is enforced not through a single monolithic column but through a family of value tables partitioned by type: boolean values such as true and false for the mandatory attribute, date values such as 2024-04-04 and 2025-04-01 for effective_date, integer values such as 4 and 806 for review-related measures, and string values such as "Encoding 01", "change rationale", and "Apache-2.0" for free-form descriptors. The entity_id column in each value table establishes the foreign-key linkage back to the owning entity, while attr_id resolves to the attribute definition, creating a normalized triad of entity–attribute–value that supports arbitrary attribute expansion without schema modification.

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

**t_ebpfprogram_attaches_kernelhook_xref**

| id | ebpfprogram |
| --- | --- |
| XREF-0001 | dns_query_parser |
| XREF-0002 | network_latency_tracker |
| XREF-0003 | block_io_monitor |
| XREF-0004 | tcp_retrans_monitor |
| XREF-0005 | tcp_retrans_monitor |
| XREF-0006 | syscall_trace_logger |

**t_ebpfprogram_attaches_kernelhook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | checksum | xsd:string |
| XREF-0002 | created_date | xsd:date |
| XREF-0003 | identifier | cco:DesignativeICE |
| XREF-0004 | license | xsd:string |
| XREF-0005 | mime_type | xsd:string |
| XREF-0006 | size_bytes | xsd:long |
| XREF-0007 | uri | xsd:string |
| XREF-0008 | version | xsd:integer |

**t_ebpfprogram_attaches_kernelhook_xref_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2025-04-17 |
| XREF-0002 | XREF-0002 | XREF-0002 | 2025-02-23 |
| XREF-0003 | XREF-0003 | XREF-0002 | 2025-06-16 |
| XREF-0004 | XREF-0004 | XREF-0002 | 2023-07-21 |
| XREF-0005 | XREF-0005 | XREF-0002 | 2024-01-20 |
| XREF-0006 | XREF-0006 | XREF-0002 | 2025-03-02 |

**t_ebpfprogram_attaches_kernelhook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0006 | 268 |
| XREF-0002 | XREF-0001 | XREF-0008 | 11 |
| XREF-0003 | XREF-0002 | XREF-0006 | 212 |
| XREF-0004 | XREF-0002 | XREF-0008 | 1 |
| XREF-0005 | XREF-0003 | XREF-0006 | 251 |
| XREF-0006 | XREF-0003 | XREF-0008 | 5 |
| XREF-0007 | XREF-0004 | XREF-0006 | 130 |
| XREF-0008 | XREF-0004 | XREF-0008 | 6 |

**t_ebpfprogram_attaches_kernelhook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 7b14de08 |
| XREF-0002 | XREF-0001 | XREF-0003 | ref-8842 |
| XREF-0003 | XREF-0001 | XREF-0004 | Apache-2.0 |
| XREF-0004 | XREF-0001 | XREF-0009 | ap-south-2 |
| XREF-0005 | XREF-0001 | XREF-0005 | application/octet-stream |
| XREF-0006 | XREF-0001 | XREF-0010 | Name 06 |
| XREF-0007 | XREF-0001 | XREF-0011 | platform-team |
| XREF-0008 | XREF-0001 | XREF-0012 | Tags 08 |

The identifier column functions as the universal key across all layers of this model. In entity tables, identifiers such as OWNE-0001, OWNE-0002, GOVE-0001, and XREF-0001 provide stable, opaque handles that remain invariant regardless of how attribute names or values change over time. In attribute tables, the same identifier column designates the attribute itself—OWNE-0001 may refer to effective_date in one context and to a different attribute in another—demonstrating that the identifier space is scoped to its parent table. In value tables, the identifier serves as a surrogate primary key for the value row, while the composite of entity_id and attr_id carries the semantic relationship. This layered keying strategy ensures referential integrity: a value row cannot reference an entity that does not exist, nor an attribute that is undefined, and the type of the value table itself constrains the permissible data format.

The misc column, appearing as the value field in every type-specific value table, is the designated container for the actual data payload. Its designation as misc reflects its polymorphic role—it holds a boolean, a date, an integer, or a string depending on which value table it inhabits. Representative values illustrate the range of captured information: the boolean true indicates that a mandatory policy constraint is active for entity OWNE-0001; the date 2025-06-16 records the creation timestamp for an eBPF program attachment; the integer 806 quantifies a numeric property of entity OWNE-0001; and the string "es" encodes a language or regional code for entity OWNE-0001. The categorical labels in the entity tables—Vendor Risk Assessment, Data Retention Policy, dns_query_parser, network_latency_tracker—provide human-readable context for the opaque identifiers, enabling operational users to correlate technical keys with business concepts.

**dim_transformation**

| id | transformation_label | transformation_category |
| --- | --- | --- |
| GOVE-0001 | Transformation Label 01 | Transformation Category 01 |
| GOVE-0002 | Transformation Label 02 | Transformation Category 02 |
| GOVE-0003 | Transformation Label 03 | Transformation Category 03 |
| GOVE-0004 | Transformation Label 04 | Transformation Category 04 |
| GOVE-0005 | Transformation Label 05 | Transformation Category 05 |
| GOVE-0006 | Transformation Label 06 | Transformation Category 06 |

The transformation domain introduces a fact-dimension architecture that extends the attribute-value model into analytical territory. The fact table, fact_transformation, stores measurable properties of governance transformations: a transformation_key such as GOVE-0004 or GOVE-0006 identifies the transformation to which the fact row pertains, priority assigns a numeric rank (uniformly 2 across the observed rows), and review_cycle_days quantifies the interval between required reviews, with values ranging from 89 to 888 days. The dimension table, dim_transformation, provides the descriptive context for these transformations: transformation_label columns carry human-readable names such as Transformation Label 01 through Transformation Label 04, while transformation_category assigns each transformation to a categorical bucket—Transformation Category 01 through Transformation Category 04. The foreign-key relationship between fact_transformation.transformation_key and dim_transformation.id enables aggregation and filtering by category, priority, or review cycle duration, supporting compliance reporting and audit scheduling.

**fact_transformation**

| id | transformation_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0004 | 2 | 89 |
| GOVE-0002 | GOVE-0006 | 2 | 727 |
| GOVE-0003 | GOVE-0006 | 2 | 888 |
| GOVE-0004 | GOVE-0006 | 2 | 407 |
| GOVE-0005 | GOVE-0002 | 1 | 356 |
| GOVE-0006 | GOVE-0002 | 1 | 410 |
| GOVE-0007 | GOVE-0004 | 3 | 230 |

The practical significance of this architecture lies in its capacity to support both operational governance and analytical reporting from a single data model. Operational teams use the entity–attribute–value structure to manage the lifecycle of controls and programs: setting effective dates, toggling mandatory flags, recording enforcement status, and attaching metadata such as license terms and checksums. Analytical teams use the fact-dimension structure to monitor transformation health: identifying which transformations have review cycles exceeding a threshold (727 or 888 days), grouping transformations by category, or prioritizing remediation efforts. The type-specific value tables ensure that a date value such as 2024-09-08 is never conflated with an integer such as 150 or a string such as "ref-8842", while the normalized attribute definitions allow new properties to be introduced without migrating existing data. This separation of concerns—entity identity, attribute schema, typed values, and analytical facts—constitutes a general-purpose metadata management pattern applicable across compliance, infrastructure, and data governance domains.