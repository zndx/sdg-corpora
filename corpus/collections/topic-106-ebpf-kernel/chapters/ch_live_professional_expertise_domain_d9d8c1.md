---
chapter_id: ch_live_professional_expertise_domain_d9d8c1
topic_id: 106
family: 08_derived
cited_terms: ['professional_expertise_domain', 'attribute_set_basic', 'ebpf_event_min_one_attribute']
model: engine-refine
---

Professional expertise domains constitute the primary classification layer for specialized service offerings, each domain identified by a stable surrogate key such as DOMA-0001 through DOMA-0004 and characterized by its functional role—Cybersecurity Auditor, Forensic Accountant, Clinical Psychologist—alongside the industry sector it serves, whether Manufacturing Operations, Commercial Real Estate, or Public Infrastructure, and the service type it delivers, including Asset Valuation, Regulatory Compliance, and Contract Drafting. This tripartite characterization anchors each domain within a two-dimensional matrix of sectoral coverage and service provision, enabling downstream queries that resolve not merely what a domain is, but where it operates and what it produces. The domain table thus functions as the canonical registry from which all attribute-value associations derive their contextual scope.

Attributes are defined independently of their values, establishing a schema layer that decouples structural metadata from data instances. Within the professional expertise domain namespace, attributes such as confidence, dimension_kind, method, and recorded_at are declared with precise XML Schema Datatypes—xsd:decimal, xsd:string, and xsd:dateTime—ensuring that every value committed to the system conforms to a rigorously typed contract. This separation of attribute definition from value storage permits the addition of new attributes without schema migration, and it enables the same attribute name to carry distinct semantic meaning across different entity namespaces. The attribute set basic registry mirrors this structure with its own attribute definitions, while the eBPF event registry introduces domain-specific attributes including duration_seconds, end_time, exit_code, and host_name, each typed as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string respectively.

**t_attribute_set_basic**

| id | attribute |
| --- | --- |
| SET-0001 | Sensor ID |
| SET-0002 | Sensor ID |
| SET-0003 | Sensor ID |
| SET-0004 | Data Source |
| SET-0005 | Sample Mass |
| SET-0006 | Quality Flag |

**t_attribute_set_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SET-0001 | confidence | xsd:decimal |
| SET-0002 | dimension_kind | xsd:string |
| SET-0003 | method | xsd:string |
| SET-0004 | recorded_at | xsd:dateTime |
| SET-0005 | uncertainty | xsd:decimal |
| SET-0006 | unit | xsd:string |
| SET-0007 | value | xsd:decimal |
| SET-0008 | encoding | xsd:string |

**t_attribute_set_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0004 | 2025-04-11T14:14:38 |
| SET-0002 | SET-0002 | SET-0004 | 2024-10-27T12:43:31 |
| SET-0003 | SET-0003 | SET-0004 | 2023-07-18T04:02:37 |
| SET-0004 | SET-0004 | SET-0004 | 2025-04-28T09:26:57 |
| SET-0005 | SET-0005 | SET-0004 | 2023-08-28T23:05:03 |
| SET-0006 | SET-0006 | SET-0004 | 2024-02-14T11:29:41 |

**t_attribute_set_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0001 | 0.501 |
| SET-0002 | SET-0001 | SET-0005 | 613.30 |
| SET-0003 | SET-0001 | SET-0007 | 863.60 |
| SET-0004 | SET-0002 | SET-0001 | 0.946 |
| SET-0005 | SET-0002 | SET-0005 | 609.02 |
| SET-0006 | SET-0002 | SET-0007 | 173.62 |
| SET-0007 | SET-0003 | SET-0001 | 0.926 |
| SET-0008 | SET-0003 | SET-0005 | 843.81 |

**t_attribute_set_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0002 | Dimension Kind 01 |
| SET-0002 | SET-0001 | SET-0008 | Encoding 02 |
| SET-0003 | SET-0001 | SET-0009 | audit excerpt |
| SET-0004 | SET-0001 | SET-0010 | fr |
| SET-0005 | SET-0001 | SET-0003 | hybrid |
| SET-0006 | SET-0001 | SET-0006 | ratio |
| SET-0007 | SET-0002 | SET-0002 | Dimension Kind 07 |
| SET-0008 | SET-0002 | SET-0008 | Encoding 08 |

Values are materialized in type-dispatched tables that partition storage by datatype, a design that enforces type safety at the persistence layer while avoiding the null-waste inherent in a single wide value column. Decimal attributes such as confidence assume values like 0.863 and 0.147 for professional expertise domains, 0.501 and 0.946 for attribute sets, and 2938.76, 3337.03, 6550.82, and 5328.03 for eBPF event durations, each stored in its dedicated decimal value table keyed by the entity identifier and the attribute identifier. String-valued attributes capture categorical metadata—Dimension Kind 01, Encoding 02, calibration record, ja for professional domains; audit excerpt, fr for attribute sets; Log Level 02, initiation, pending for eBPF events—while datetime attributes record temporal anchors such as 2024-07-30T07:07:17 and 2024-12-04T20:31:19 across the professional domain namespace, and 2025-04-11T14:14:38 and 2024-10-27T12:43:31 within the attribute set registry. Integer-valued attributes, present only in the eBPF event context, store exit codes and numeric identifiers such as 465, 59, 938, and 81.

**t_professional_expertise_domain**

| id | professional_expertise_domain | covers_sector | provides_service_type |
| --- | --- | --- | --- |
| DOMA-0001 | Cybersecurity Auditor | Manufacturing Operations | Asset Valuation |
| DOMA-0002 | Cybersecurity Auditor | Commercial Real Estate | Regulatory Compliance |
| DOMA-0003 | Forensic Accountant | Public Infrastructure | Contract Drafting |
| DOMA-0004 | Clinical Psychologist | Public Infrastructure | Asset Valuation |
| DOMA-0005 | Data Architect | Healthcare Delivery | Regulatory Compliance |
| DOMA-0006 | Data Architect | Manufacturing Operations | Clinical Diagnosis |
| DOMA-0007 | Forensic Accountant | Manufacturing Operations | Network Penetration Testing |
| DOMA-0008 | Structural Engineer | Financial Services | Asset Valuation |

**t_professional_expertise_domain_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DOMA-0001 | confidence | xsd:decimal |
| DOMA-0002 | dimension_kind | xsd:string |
| DOMA-0003 | method | xsd:string |
| DOMA-0004 | recorded_at | xsd:dateTime |
| DOMA-0005 | uncertainty | xsd:decimal |
| DOMA-0006 | unit | xsd:string |
| DOMA-0007 | value | xsd:decimal |
| DOMA-0008 | encoding | xsd:string |

**t_professional_expertise_domain_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0004 | 2024-07-30T07:07:17 |
| DOMA-0002 | DOMA-0002 | DOMA-0004 | 2024-12-04T20:31:19 |
| DOMA-0003 | DOMA-0003 | DOMA-0004 | 2024-05-12T06:41:36 |
| DOMA-0004 | DOMA-0004 | DOMA-0004 | 2024-07-23T14:51:29 |
| DOMA-0005 | DOMA-0005 | DOMA-0004 | 2023-05-19T17:35:21 |
| DOMA-0006 | DOMA-0006 | DOMA-0004 | 2023-07-26T00:07:35 |
| DOMA-0007 | DOMA-0007 | DOMA-0004 | 2023-03-21T08:57:17 |
| DOMA-0008 | DOMA-0008 | DOMA-0004 | 2023-06-16T10:20:06 |

**t_professional_expertise_domain_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0001 | 0.863 |
| DOMA-0002 | DOMA-0001 | DOMA-0005 | 628.37 |
| DOMA-0003 | DOMA-0001 | DOMA-0007 | 315.52 |
| DOMA-0004 | DOMA-0002 | DOMA-0001 | 0.147 |
| DOMA-0005 | DOMA-0002 | DOMA-0005 | 438.62 |
| DOMA-0006 | DOMA-0002 | DOMA-0007 | 381.17 |
| DOMA-0007 | DOMA-0003 | DOMA-0001 | 0.471 |
| DOMA-0008 | DOMA-0003 | DOMA-0005 | 940.55 |

**t_professional_expertise_domain_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0002 | Dimension Kind 01 |
| DOMA-0002 | DOMA-0001 | DOMA-0008 | Encoding 02 |
| DOMA-0003 | DOMA-0001 | DOMA-0009 | calibration record |
| DOMA-0004 | DOMA-0001 | DOMA-0010 | ja |
| DOMA-0005 | DOMA-0001 | DOMA-0003 | manual |
| DOMA-0006 | DOMA-0001 | DOMA-0006 | mg/L |
| DOMA-0007 | DOMA-0002 | DOMA-0002 | Dimension Kind 07 |
| DOMA-0008 | DOMA-0002 | DOMA-0008 | Encoding 08 |

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

**t_ebpf_event_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

The foreign-key topology binds every value row to its originating entity and its defining attribute through composite relationships: the entity column in each value table references the primary key of the corresponding entity registry, while the attr column references the primary key of the attribute definition table within that entity's namespace. This dual-reference pattern ensures that any value can be traced back to both what it describes and how it is defined, creating a fully navigable graph from domain to sector to service type, from attribute definition to typed value to temporal or categorical instantiation. The eBPF event registry extends this pattern with an additional ebpf column capturing event classifications such as perf_event_sample, xdp_rx_drop, and tc_ingress_filter, while the attribute set basic registry includes a parallel attribute column for Sensor ID and Data Source classifications. Together, these registries form a unified attribute-value architecture that supports heterogeneous entity types under a single, consistent modeling discipline.