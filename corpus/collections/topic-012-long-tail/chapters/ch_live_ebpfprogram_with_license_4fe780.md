---
chapter_id: ch_live_ebpfprogram_with_license_4fe780
topic_id: 12
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_with_license', 'tc_classifier_subclass', 'classification_under_taxonomy']
model: engine-refine
---

The governance of software artifacts and data classifications rests on a disciplined separation between identity, attribution, and measured properties. Each eBPF program—whether `uprobe_syscall`, `cgroup_sock_release`, `socket_filter`, or `lsm_bpf`—receives a stable identifier such as `LICE-0001` through `LICE-0004`, decoupling the program's functional identity from its licensing terms. Licenses themselves, including `MPL-2.0`, `EUPL-1.2`, `Unlicense`, and `ISC`, are independently catalogued under their own identifiers, enabling a many-to-many relationship between programs and licenses. The association table bridges these two entities through a subject–target–role triad: the `ebpfprogram_id` column designates the subject of the relationship, `license_id` the target, and `role` captures the nature of the connection—`contributor`, `reviewer`, or `observer`—thereby encoding not merely which license applies, but in what capacity. This structural pattern mirrors the dimensional modeling approach found in the classification domain, where the `fact_classifier` table anchors measured facts to a `t_c_direction_key` foreign key, a `size_bytes` magnitude reaching into the hundreds of millions (643947353, 883422563, 772730446, 623892633), and a `version` discriminator ranging from 1 to 9.

**t_ebpfprogram_with_license__license**

| id | ebpfprogram_id | license_id | role |
| --- | --- | --- | --- |
| LICE-0001 | LICE-0002 | LICE-0004 | contributor |
| LICE-0002 | LICE-0006 | LICE-0002 | reviewer |
| LICE-0003 | LICE-0002 | LICE-0001 | observer |
| LICE-0004 | LICE-0002 | LICE-0006 | contributor |
| LICE-0005 | LICE-0003 | LICE-0004 | reviewer |
| LICE-0006 | LICE-0005 | LICE-0003 | contributor |
| LICE-0007 | LICE-0005 | LICE-0005 | reviewer |
| LICE-0008 | LICE-0006 | LICE-0003 | contributor |

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | EDAM Ontology |
| TAXO-0002 | Anomaly Detection Model | DQO Framework |
| TAXO-0003 | Experiment Phase Code | LOINC Code Set |
| TAXO-0004 | Telemetry Stream Type | SAREK Pipeline |
| TAXO-0005 | Compliance Framework Set | ENVO Biological |
| TAXO-0006 | Experiment Phase Code | PROMISE Metrics |
| TAXO-0007 | Metadata Schema Version | SAREK Pipeline |
| TAXO-0008 | Experiment Phase Code | OMOP CDM |

The `dim_t_c_direction` dimension table provides the categorical scaffolding for these directional facts, pairing each identifier with a human-readable `t_c_direction_label`—`T C Direction Label 01` through `T C Direction Label 04`—and a `t_c_direction_category` classification such as `T C Direction Category 01` through `T C Direction Category 04`. This separation of label from category follows the same normalization principle that governs the licensing schema: descriptive text is kept distinct from structural keys, allowing labels and categories to evolve independently of the fact records that reference them. The `t_c_direction_key` in `fact_classifier` thus serves as the foreign key that binds a measured observation to its categorical context, much as `ebpfprogram_id` and `license_id` bind a program to its license through the junction table's role attribute.

**t_ebpfprogram_with_license**

| id | ebpfprogram |
| --- | --- |
| LICE-0001 | uprobe_syscall |
| LICE-0002 | cgroup_sock_release |
| LICE-0003 | socket_filter |
| LICE-0004 | lsm_bpf |
| LICE-0005 | xdp_router |
| LICE-0006 | cgroup_sock_release |

**t_ebpfprogram_with_license_license**

| id | license |
| --- | --- |
| LICE-0001 | MPL-2.0 |
| LICE-0002 | EUPL-1.2 |
| LICE-0003 | Unlicense |
| LICE-0004 | ISC |
| LICE-0005 | Apache-2.0 |
| LICE-0006 | LGPL-2.1 |
| LICE-0007 | Zlib |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

Beyond licensing and directional classification, the system supports an entity–attribute–value model for taxonomy-based metadata, where each classification—`Lab Sample Category`, `Anomaly Detection Model`, `Experiment Phase Code`, `Telemetry Stream Type`—is mapped to a governing taxonomy such as the `EDAM Ontology`, `DQO Framework`, `LOINC Code Set`, or `SAREK Pipeline`. The attribute definitions reside in a dedicated table that assigns each attribute a name (`duration_seconds`, `end_time`, `exit_code`, `host_name`) and an `attr_type` drawn from the XSD type system (`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`). This type annotation is not merely declarative; it determines which value table receives the data. Decimal attributes like `duration_seconds` are stored in the decimal value table with magnitudes such as 4845.29, 4012.23, 5805.70, and 852.80; integer attributes like `exit_code` land in the integer table with values 123, 306, 682, and 349; datetime attributes such as `end_time` are persisted with ISO 8601 timestamps including `2024-03-16T10:40:44` and `2023-03-15T13:57:05`; and string attributes like `host_name` carry values such as `worker-07`, `Log Level 02`, `initiation`, and `superseded`.

The entity column in each value table acts as the foreign key that ties a specific attribute instance back to its classification entity, while the `attr_id` column resolves to the attribute definition. This design permits a single entity to carry heterogeneous attributes of different types without requiring a fixed schema: the entity `TAXO-0001`, for example, accumulates a decimal value of 4845.29 on attribute `TAXO-0001`, a datetime value of `2024-03-16T10:40:44` on attribute `TAXO-0002`, an integer value of 123 on attribute `TAXO-0003`, and a varchar value of `worker-07` on attribute `TAXO-0004`, all within the same logical record. The `misc` column in the value tables holds the actual data payload, while the `identifier` column provides a surrogate key for each value row. Together, these tables form a unified governance substrate in which software licenses, classification facts, and taxonomy attributes are all managed through a consistent pattern of identifier-based resolution, foreign-key relationships, and type-aware storage.

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |