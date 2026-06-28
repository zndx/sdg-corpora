---
chapter_id: ch_live_ebpfmap_basic_fcd2c3
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_basic', 'technology_promotion_initiative', 'process_produces_ice']
model: engine-refine
---

The architecture of the eBPF observability framework is predicated upon a bifurcated schema that separates quantitative telemetry from descriptive metadata, a design choice that permits independent scaling of measurement records and their associated taxonomies. The fact table, identified as fact_ebpfmap, serves as the central repository for eBPF map instances, each distinguished by a composite identifier such as EBPF-0001 through EBPF-0004, and linked to a parent map key via the ebpfmap_key column, which itself carries values like EBPF-0005 and EBPF-0001. This table records the storage footprint of each map in bytes—values ranging from 31,105,012 for EBPF-0003 to 354,373,995 for EBPF-0004—and assigns a version number, with observed instances spanning versions 3 through 12. The corresponding dimension table, dim_ebpfmap, provides the human-readable labels and categorical classifications for these same identifiers; the label Ebpfmap Label 01 maps to EBPF-0001, while Ebpfmap Category 01 through Ebpfmap Category 04 partition the maps into distinct functional groups. The join between fact_ebpfmap and dim_ebpfmap on the shared identifier column constitutes the primary referential integrity constraint of the eBPF subsystem, ensuring that every measurement record resolves to a uniquely classified entity.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

Beyond the eBPF domain, the framework extends its entity-attribute-value paradigm to the capture of process-level observability events, here designated as Intermediate Code Events or ICE. The table t_process_produces_ice enumerates the processes that generate these events, with entries such as Plate freezing, Cryogenic freezing, Spray cooling, and Direct expansion freezing, each assigned a sequential identifier from ICE-0001 through ICE-0004. The attribute schema is defined in t_process_produces_ice_attr, which declares the names and data types of measurable properties; observed attributes include duration_seconds typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This type-declaration table functions as a schema registry, constraining the value tables that follow and ensuring that every measurement is stored in a column type appropriate to its semantic domain.

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

**t_process_produces_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | duration_seconds | xsd:decimal |
| ICE-0002 | end_time | xsd:dateTime |
| ICE-0003 | exit_code | xsd:integer |
| ICE-0004 | host_name | xsd:string |
| ICE-0005 | log_level | xsd:string |
| ICE-0006 | phase | xsd:string |
| ICE-0007 | retry_count | xsd:integer |
| ICE-0008 | scheduled_at | xsd:dateTime |

**t_process_produces_ice_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0002 | 2024-12-21T05:38:52 |
| ICE-0002 | ICE-0001 | ICE-0008 | 2023-10-15T09:29:56 |
| ICE-0003 | ICE-0001 | ICE-0009 | 2023-08-06T18:23:28 |
| ICE-0004 | ICE-0002 | ICE-0002 | 2023-05-16T09:39:52 |
| ICE-0005 | ICE-0002 | ICE-0008 | 2023-09-23T10:34:19 |
| ICE-0006 | ICE-0002 | ICE-0009 | 2025-02-04T21:26:44 |
| ICE-0007 | ICE-0003 | ICE-0002 | 2023-02-04T12:13:18 |
| ICE-0008 | ICE-0003 | ICE-0008 | 2024-02-01T06:54:56 |

**t_process_produces_ice_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | 5646.64 |
| ICE-0002 | ICE-0002 | ICE-0001 | 6078.60 |
| ICE-0003 | ICE-0003 | ICE-0001 | 2298.30 |
| ICE-0004 | ICE-0004 | ICE-0001 | 3884.97 |
| ICE-0005 | ICE-0005 | ICE-0001 | 5116.46 |
| ICE-0006 | ICE-0006 | ICE-0001 | 5090.16 |

**t_process_produces_ice_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0003 | 140 |
| ICE-0002 | ICE-0001 | ICE-0007 | 235 |
| ICE-0003 | ICE-0002 | ICE-0003 | 217 |
| ICE-0004 | ICE-0002 | ICE-0007 | 99 |
| ICE-0005 | ICE-0003 | ICE-0003 | 880 |
| ICE-0006 | ICE-0003 | ICE-0007 | 326 |
| ICE-0007 | ICE-0004 | ICE-0003 | 176 |
| ICE-0008 | ICE-0004 | ICE-0007 | 291 |

The value tables implement a type-disaggregated EAV pattern, with four separate tables—t_process_produces_ice_val_datetime, t_process_produces_ice_val_decimal, t_process_produces_ice_val_int, and t_process_produces_ice_val_varchar—each holding measurements for a single data type. The decimal values table records duration_seconds for entity ICE-0001 at 5,646.64, for ICE-0002 at 6,078.60, for ICE-0003 at 2,298.30, and for ICE-0004 at 3,884.97, with the attr_id column consistently referencing ICE-0001, the identifier assigned to duration_seconds in the attribute registry. The integer values table stores exit_code measurements, with entity ICE-0001 recording values of 140 and 235 across two distinct attribute instances (ICE-0003 and ICE-0007), while entity ICE-0002 records 217 and 99. The datetime values table captures temporal markers such as 2024-12-21T05:38:52 and 2023-10-15T09:29:56, and the varchar values table holds string observations including ingest-21, Log Level 02, initiation, and running. In each case, the entity_id column references the originating process event, and the attr_id column resolves to the attribute definition, forming a two-hop foreign-key path from measurement to semantic type.

**t_process_produces_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0004 | ingest-21 |
| ICE-0002 | ICE-0001 | ICE-0005 | Log Level 02 |
| ICE-0003 | ICE-0001 | ICE-0006 | initiation |
| ICE-0004 | ICE-0001 | ICE-0010 | running |
| ICE-0005 | ICE-0001 | ICE-0011 | Triggered By 05 |
| ICE-0006 | ICE-0002 | ICE-0004 | edge-03 |
| ICE-0007 | ICE-0002 | ICE-0005 | Log Level 07 |
| ICE-0008 | ICE-0002 | ICE-0006 | closeout |

The technology promotion initiative table, t_technology_promotion_initiative, operates as an orthogonal dimension that maps strategic programs to their target sectors and dissemination channels. Four initiatives are recorded: Digital Twin Platforms, which appears twice with distinct identifiers INIT-0001 and INIT-0003, targeting Healthcare Services and Construction respectively; Carbon Capture Systems (INIT-0002) aimed at Transportation Logistics; and Solid State Batteries (INIT-0004) directed at Retail Commerce. Dissemination channels include Open Source Repositories, Technical Webinars, and Regional Innovation Hubs, with Technical Webinars serving as the channel for both Carbon Capture Systems and Solid State Batteries. This table is structurally independent of the eBPF and ICE measurement hierarchies, suggesting that the framework supports cross-domain correlation through a shared identifier namespace rather than through explicit foreign-key joins.

**t_technology_promotion_initiative**

| id | technology_promotion_initiative | targets_sector | utilizes_channel |
| --- | --- | --- | --- |
| INIT-0001 | Digital Twin Platforms | Healthcare Services | Open Source Repositories |
| INIT-0002 | Carbon Capture Systems | Transportation Logistics | Technical Webinars |
| INIT-0003 | Digital Twin Platforms | Construction | Regional Innovation Hubs |
| INIT-0004 | Solid State Batteries | Retail Commerce | Technical Webinars |
| INIT-0005 | Quantum Computing | Manufacturing | Peer Reviewed Journals |
| INIT-0006 | Solid State Batteries | Transportation Logistics | Government Grant Portals |