---
chapter_id: ch_live_ebpfprogram_writes_to_map_xref_b7193b
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_writes_to_map_xref', 'frame_refinement', 'mass_function_min_one_focal']
model: engine-refine
---

eBPF programs are identified by unique keys such as XREF-0001 through XREF-0005 and catalogued in the fact table with their compiled binary size in bytes and software version. A program keyed as XREF-0001 occupies 784,335,640 bytes and runs version 12, while XREF-0003, which appears twice under different identifiers XREF-0002 and XREF-0003, is recorded at 641,704,069 bytes under version 9 and 113,209,263 bytes under version 11 respectively, indicating that the same logical program may be compiled into distinct binaries across versions. The dimension table attaches human-readable labels—Ebpfprogram Label 01 through Ebpfprogram Label 04—and categories such as Ebpfprogram Category 01 through Ebpfprogram Category 04, enabling classification and retrieval without exposing internal identifiers to end users.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | 784335640 | 12 |
| XREF-0002 | XREF-0003 | 641704069 | 9 |
| XREF-0003 | XREF-0003 | 113209263 | 11 |
| XREF-0004 | XREF-0005 | 161013093 | 12 |
| XREF-0005 | XREF-0004 | 352203820 | 12 |
| XREF-0006 | XREF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| XREF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| XREF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| XREF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| XREF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| XREF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| XREF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| XREF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| XREF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Frame refinements establish a directed relationship between a subject frame and a target frame, with each refinement record carrying a role that specifies the nature of the contribution. A refinement identified as REFI-0001 links subject REFI-0005 to target REFI-0004 under the role of observer, while REFI-0002 connects REFI-0006 to REFI-0005 as an owner. The refinement REFI-0003 operates as a contributor from REFI-0005 to REFI-0006, and REFI-0002 also appears as a reviewer linking REFI-0004 to REFI-0005, demonstrating that a single refinement identifier can participate in multiple relationship contexts. The frames themselves carry descriptive content—Regulatory Audit Trail, Lab Sample Container Type, Data Lake Partition Schema, Ground Station Uplink, Sterile Container Variant, IPv4 Header Format, Ku Band Downlink—providing the semantic anchors that the refinement roles operate upon.

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

The mass function structure assigns a mass value to a focal element, where the mass is expressed as a named attribute such as audit_trail_eta, provenance_record_epsilon, or sensor_array_gamma, and the focal element references a frame refinement by its identifier. Each mass assignment carries typed attributes defined in a separate schema: confidence is typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. The actual values are stored in type-specific tables, each linking an entity to an attribute through a foreign key. Decimal values include 0.223 and 0.161 for the confidence attribute, alongside 391.04 and 110.73 for other attributes, while datetime values such as 2023-06-19T06:37:58 and 2024-04-19T20:46:34 record the temporal provenance of the mass assignment. Variable-length string values—Dimension Kind 01, Encoding 02, calibration record, and es—are stored in a separate varchar table, completing the attribute-value mapping for each entity.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | REFI-0004 |
| FOCA-0002 | audit_trail_eta | REFI-0002 |
| FOCA-0003 | provenance_record_epsilon | REFI-0002 |
| FOCA-0004 | sensor_array_gamma | REFI-0002 |
| FOCA-0005 | governance_log_delta | REFI-0001 |
| FOCA-0006 | provenance_record_epsilon | REFI-0003 |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |