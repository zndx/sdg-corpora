---
chapter_id: ch_live_black_belt_certification_requirement_7f2b01
topic_id: 183
family: 08_derived
cited_terms: ['black_belt_certification_requirement', 'board_membership', 'bpf_helper_called_by']
model: engine-refine
---

The data model centers on a flexible entity-attribute-value architecture that decouples what an entity is from the properties it carries. Core entities such as black belt certification requirements and BPF helper call relationships are identified by structured identifiers—REQU-0001 through REQU-0004 for certification requirements like ProvenanceTrackingBB and LabQualityControlBB, and CALL-0001 through CALL-0004 for BPF programs such as socket_connect_trace invoked by envoy or xdp_router invoked by kubelet. Each entity carries a stable, human-readable key that serves as the anchor for all downstream attribute associations and value records.

**t_black_belt_certification_requirement**

| id | black_belt_certification_requirement |
| --- | --- |
| REQU-0001 | ProvenanceTrackingBB |
| REQU-0002 | LabQualityControlBB |
| REQU-0003 | ProvenanceTrackingBB |
| REQU-0004 | LabQualityControlBB |
| REQU-0005 | ProvenanceTrackingBB |
| REQU-0006 | DataEngineeringBlackBelt |
| REQU-0007 | MLOpsQualityBB |
| REQU-0008 | APIGatewayBB |

**t_black_belt_certification_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | confidence | xsd:decimal |
| REQU-0002 | dimension_kind | xsd:string |
| REQU-0003 | method | xsd:string |
| REQU-0004 | recorded_at | xsd:dateTime |
| REQU-0005 | uncertainty | xsd:decimal |
| REQU-0006 | unit | xsd:string |
| REQU-0007 | value | xsd:decimal |
| REQU-0008 | encoding | xsd:string |

**t_black_belt_certification_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 2025-05-17T18:36:12 |
| REQU-0002 | REQU-0002 | REQU-0004 | 2024-10-05T03:41:40 |
| REQU-0003 | REQU-0003 | REQU-0004 | 2024-07-29T04:57:09 |
| REQU-0004 | REQU-0004 | REQU-0004 | 2025-04-05T22:06:20 |
| REQU-0005 | REQU-0005 | REQU-0004 | 2024-09-27T11:02:14 |
| REQU-0006 | REQU-0006 | REQU-0004 | 2023-05-05T18:06:19 |
| REQU-0007 | REQU-0007 | REQU-0004 | 2023-08-07T06:49:00 |
| REQU-0008 | REQU-0008 | REQU-0004 | 2023-09-09T17:25:37 |

**t_black_belt_certification_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 0.856 |
| REQU-0002 | REQU-0001 | REQU-0005 | 807.42 |
| REQU-0003 | REQU-0001 | REQU-0007 | 629.05 |
| REQU-0004 | REQU-0002 | REQU-0001 | 0.026 |
| REQU-0005 | REQU-0002 | REQU-0005 | 321.43 |
| REQU-0006 | REQU-0002 | REQU-0007 | 502.76 |
| REQU-0007 | REQU-0003 | REQU-0001 | 0.827 |
| REQU-0008 | REQU-0003 | REQU-0005 | 134.63 |

**t_black_belt_certification_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | Dimension Kind 01 |
| REQU-0002 | REQU-0001 | REQU-0008 | Encoding 02 |
| REQU-0003 | REQU-0001 | REQU-0009 | pre-release note |
| REQU-0004 | REQU-0001 | REQU-0010 | ja |
| REQU-0005 | REQU-0001 | REQU-0003 | hybrid |
| REQU-0006 | REQU-0001 | REQU-0006 | m/s |
| REQU-0007 | REQU-0002 | REQU-0002 | Dimension Kind 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | Encoding 08 |

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | envoy |
| CALL-0002 | xdp_router | kubelet |
| CALL-0003 | lsm:inode_create | falco |
| CALL-0004 | tracepoint:sched_process_exit | kubelet |
| CALL-0005 | raw_tracepoint:sys_enter | kubelet |
| CALL-0006 | cgroup_skb_ingress | istiod |

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

Attributes are defined independently of their values through a schema that pairs an attribute name with its type. For certification requirements, attributes include confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). For BPF helper call records, attributes encompass checksum (xsd:string), created_date (xsd:date), identifier (cco:DesignativeICE), and license (xsd:string). This separation allows the system to evolve its attribute set without restructuring value storage, and the type declaration ensures that values are routed to the correct typed value table—decimal, datetime, date, integer, or varchar—preserving type safety across the model.

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

Values are stored in type-specific tables, each linking back to both the entity and the attribute through foreign keys. A decimal attribute such as confidence on entity REQU-0001 holds the value 0.856, while the same entity carries a dimension_kind of "Dimension Kind 01" and a method value of "Encoding 02" in the varchar value table. The recorded_at attribute on entity REQU-0002 stores the timestamp 2024-10-05T03:41:40 in the datetime value table. Similarly, BPF helper call entity CALL-0001 carries a checksum of "1a4b6c2d", a created_date of 2024-07-02, and an integer attribute value of 67. This typed value partitioning means that queries can target the appropriate value table directly, avoiding the overhead of type coercion across heterogeneous columns.

The model extends beyond attribute-value pairs into dimensional and fact structures that support analytical queries. The fact_board table records event counts—236, 403, 359, and 26 for members MEMB-0001 through MEMB-0004—each linked to a participant through the has_participant_key foreign key. The corresponding dimension table, dim_has_participant, provides descriptive labels such as "Has Participant Label 01" and categorical classifications like "Has Participant Category 01" for each participant identifier. This star-schema pattern complements the EAV structure by enabling aggregation and filtering along participant dimensions, bridging the gap between operational metadata and analytical reporting.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |

Together, these components form a cohesive data architecture where identifiers provide stable entity anchors, attributes define the schema of what can be measured or described, typed value tables preserve data integrity, and dimensional-fact relationships enable analytical rollups. The design supports heterogeneous data types within a uniform query interface, allows attributes to be added without schema migrations, and maintains traceability from raw values back to their originating entities and their categorical contexts.