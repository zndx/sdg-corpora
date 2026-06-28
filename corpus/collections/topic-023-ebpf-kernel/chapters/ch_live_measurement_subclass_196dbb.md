---
chapter_id: ch_live_measurement_subclass_196dbb
topic_id: 23
family: 02_observation_measurement
cited_terms: ['measurement_subclass', 'ebpfmap_pinned_at_path', 'outlier_claim_min_one_attribute']
model: engine-refine
---

The architecture of measurement classification and outlier attribution rests upon a layered ontology in which identifiers serve as the immutable anchors of every relationship. Measurement subclasses—designated MEAS-0001 through MEAS-0004—encode domain categories such as Heart rate, Seismic magnitude, and Soil moisture, each of which may be associated with one or more physical dimensions including Electric current, Power, Energy, and Mass. The association between a measurement and its dimension is not implicit but mediated through an explicit junction table that records, for each pairing, a role designation: owner or reviewer. This role distinction is consequential, as it establishes accountability for the dimensional interpretation of a measurement. For instance, the measurement MEAS-0004 (Soil moisture) is linked to dimension MEAS-0003 under an owner role and to dimension MEAS-0005 under the same role, while MEAS-0006 and MEAS-0005 are each associated with MEAS-0005 and MEAS-0001 respectively under a reviewer role, indicating a separation between those who define the dimensional mapping and those who validate it.

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

Operational entities—specifically, eBPF maps pinned at filesystem paths—inherit this classification framework through a foreign-key relationship to the measurement subclass space. The table t_ebpfmap_pinned_at_path records maps such as sock_hash, cpumap, conntrack_map, and flow_table, each pinned at a path that corresponds to a measurement identifier (MEAS-0001, MEAS-0005, MEAS-0002, MEAS-0004). Ownership of these pinned maps is assigned to operational teams: sre and data-engineering appear as owner values, while tags such as pii, internal, and verified provide a lightweight classification of data sensitivity and certification status. The tag pii, for example, appears on both the sock_hash map at MEAS-0001 and the cpumap at MEAS-0005, signaling that these eBPF structures handle personally identifiable information and are subject to corresponding governance controls.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | MEAS-0001 | sre | pii |
| PATH-0002 | cpumap | MEAS-0005 | data-engineering | pii |
| PATH-0003 | conntrack_map | MEAS-0002 | data-engineering | internal |
| PATH-0004 | flow_table | MEAS-0004 | sre | verified |
| PATH-0005 | sock_hash | MEAS-0006 | sre | internal |
| PATH-0006 | lru_percpu_hash | MEAS-0003 | platform-team | verified |

Outlier claims introduce a second layer of attribution, linking anomalous events to the measurement and path infrastructure through an attribute-set mechanism. The table t_outlier_claim_min_one_attribute records claims such as /run/bpf/sockops, voltage_sag_event, /var/lib/bpf/cgroup, and pH_sensor_calibration, each associated with an attribute set that references a path identifier (PATH-0001, PATH-0006, PATH-0004). These attribute sets serve as the entity anchor for a flexible, schema-on-read attribute model: individual attributes are defined in a separate table with a name (confidence, dimension_kind, method, recorded_at) and an XML Schema type (xsd:decimal, xsd:string, xsd:dateTime), and their values are stored in three type-specific value tables. The separation of value storage by type—decimal, varchar, and datetime—ensures type safety while permitting each outlier claim to carry a heterogeneous set of metadata.

**t_outlier_claim_min_one_attribute**

| id | outlier | attribute_set |
| --- | --- | --- |
| ATTR-0001 | /run/bpf/sockops | PATH-0001 |
| ATTR-0002 | voltage_sag_event | PATH-0001 |
| ATTR-0003 | /var/lib/bpf/cgroup | PATH-0006 |
| ATTR-0004 | pH_sensor_calibration | PATH-0004 |
| ATTR-0005 | log_checksum_fail | PATH-0004 |
| ATTR-0006 | batch_42_drift | PATH-0004 |

**t_outlier_claim_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_outlier_claim_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2023-09-29T17:50:45 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2023-11-30T14:55:48 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2024-10-03T15:06:44 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-24T15:12:01 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2025-03-04T01:17:47 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-12-29T13:19:15 |

**t_outlier_claim_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.179 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 145.76 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 830.74 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.034 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 316.10 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 304.68 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.373 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 478.83 |

**t_outlier_claim_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | calibration record |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | m/s |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

The value tables themselves are linked to their attribute definitions through a dual-key relationship: each row carries an entity_id that references the outlier claim's attribute set and an attr_id that references the attribute definition. For decimal values, entries such as 0.179 and 145.76 are associated with entity ATTR-0001 and attribute ATTR-0001 (confidence), while 830.74 appears under entity ATTR-0001 and attribute ATTR-0007; for varchar values, entries such as Dimension Kind 01, Encoding 02, calibration record, and de are linked to entity ATTR-0001 across attributes ATTR-0002, ATTR-0008, ATTR-0009, and ATTR-0010; and for datetime values, timestamps ranging from 2023-09-29T17:50:45 to 2025-03-24T15:12:01 are recorded under attribute ATTR-0004 (recorded_at) for entities ATTR-0001 through ATTR-0004. This design permits a single outlier claim to accumulate a rich, typed attribute profile without requiring a fixed schema, while the foreign-key constraints ensure that every value can be traced back to its defining attribute and its originating claim.