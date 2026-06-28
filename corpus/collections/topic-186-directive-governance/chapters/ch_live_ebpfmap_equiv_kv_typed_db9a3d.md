---
chapter_id: ch_live_ebpfmap_equiv_kv_typed_db9a3d
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_equiv_kv_typed', 'instrument_subclass', 'directive_supersedes_directive']
model: engine-refine
---

In attribute-value modeling, the identifier serves as the immutable primary key for every entity and relationship record, anchoring the entire schema. Across the dataset, identifiers follow a consistent naming convention: type-level records use the `TYPE-` prefix (e.g., `TYPE-0001` through `TYPE-0004`), instruments carry the `INST-` prefix (`INST-0001` through `INST-0004`), and directives use `DIRE-` (`DIRE-0001` through `DIRE-0004`). This uniform scheme enables unambiguous cross-referencing between the entity catalog and its associated attribute values, relationship mappings, and metadata. The identifier is not merely a surrogate key; it is the stable handle by which an entity—such as the eBPF map `interface_stats`, the instrument `X-Ray Diffractometer Bruker D8`, or the directive `PCI DSS v4.0`—is referenced throughout the system.

**t_instrument_subclass**

| id | instrument | produces_measurement | created_date | tags |
| --- | --- | --- | --- | --- |
| INST-0001 | X-Ray Diffractometer Bruker D8 | DIRE-0006 | 2023-09-27 | archived |
| INST-0002 | Flow Cytometer BD FACSCanto | DIRE-0004 | 2023-08-26 | internal |
| INST-0003 | Seismometer CMG-3ESP | DIRE-0007 | 2023-03-12 | verified |
| INST-0004 | Spectrophotometer XPS-500 | DIRE-0006 | 2023-09-07 | verified |
| INST-0005 | Flow Cytometer BD FACSCanto | DIRE-0006 | 2023-03-06 | pii |
| INST-0006 | Thermal Imager FLIR T640 | DIRE-0006 | 2024-03-26 | archived |

**t_directive_supersedes_directive**

| id | directive |
| --- | --- |
| DIRE-0001 | PCI DSS v4.0 |
| DIRE-0002 | PCI DSS v4.0 |
| DIRE-0003 | NERC CIP-003 |
| DIRE-0004 | PCI DSS v4.0 |
| DIRE-0005 | NIST SP 800-53 |
| DIRE-0006 | NERC CIP-003 |
| DIRE-0007 | FedRAMP Moderate |
| DIRE-0008 | NERC CIP-003 |

**t_directive_supersedes_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_directive_supersedes_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | false |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |
| DIRE-0007 | DIRE-0007 | DIRE-0003 | false |
| DIRE-0008 | DIRE-0008 | DIRE-0003 | true |

**t_directive_supersedes_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-04-11 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2024-01-18 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2023-05-24 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2023-10-24 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2024-12-26 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2025-05-10 |
| DIRE-0007 | DIRE-0007 | DIRE-0001 | 2025-05-06 |
| DIRE-0008 | DIRE-0008 | DIRE-0001 | 2024-01-25 |

**t_directive_supersedes_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 436 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 990 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 2 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 360 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 4 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 588 |

**t_directive_supersedes_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

Attributes and their types form the backbone of the entity property model. The attribute definition table declares each attribute by name and constrains its data type using XML Schema types: `effective_date` is typed as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. This type discipline is enforced at the value storage layer, where attribute values are segregated into dedicated tables keyed by their schema type. Boolean values such as `true` and `false` reside in the boolean value table, date values like `2024-04-11` and `2023-05-24` in the date table, integer values such as `2`, `436`, `3`, and `990` in the integer table, and string values including `Encoding 01`, `Enforcement 02`, and `audit excerpt` in the varchar table. Each value row links back to its owning entity through the `entity_id` column and to its attribute definition through the `attr_id` column, ensuring that every stored value is both type-safe and semantically traceable to its schema definition.

Relationships between entities are expressed through junction tables that carry their own identifiers and a rich set of relationship metadata. The subject and target columns designate the two endpoints of a relationship: for example, in the key-type mapping, `ebpfmap_id` (the subject) references an eBPF map entity such as `TYPE-0007` or `TYPE-0002`, while `key_type_id` (the target) references a key type entity such as `TYPE-0001` or `TYPE-0004`. Similarly, the value-type mapping joins `ebpfmap_id` entities like `TYPE-0005` and `TYPE-0003` to `value_type_map_id` entities such as `TYPE-0002` and `TYPE-0003`. The role column annotates each relationship with a semantic label—`contributor`, `owner`, `reviewer`, or `observer`—distinguishing, for instance, whether a key type acts as a `contributor` to an eBPF map or an `owner`. The cardinality note column provides additional structural context, with entries such as `Cardinality Note 01` through `Cardinality Note 04` documenting multiplicity constraints on the relationship.

**t_ebpfmap_equiv_kv_typed**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | interface_stats |
| TYPE-0002 | rate_limit |
| TYPE-0003 | rate_limit |
| TYPE-0004 | socket_stats |
| TYPE-0005 | interface_stats |
| TYPE-0006 | interface_stats |
| TYPE-0007 | rate_limit |
| TYPE-0008 | rate_limit |

**t_ebpfmap_equiv_kv_typed_key_type**

| id | key_type |
| --- | --- |
| TYPE-0001 | bpf_cookie |
| TYPE-0002 | uint32_t |
| TYPE-0003 | uint32_t |
| TYPE-0004 | dev_index |
| TYPE-0005 | pid_t |
| TYPE-0006 | inode_key |

**t_ebpfmap_equiv_kv_typed__key_type**

| id | ebpfmap_id | key_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0001 | contributor |
| TYPE-0002 | TYPE-0002 | TYPE-0002 | owner |
| TYPE-0003 | TYPE-0005 | TYPE-0002 | owner |
| TYPE-0004 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0005 | reviewer |
| TYPE-0006 | TYPE-0002 | TYPE-0003 | owner |
| TYPE-0007 | TYPE-0006 | TYPE-0006 | owner |
| TYPE-0008 | TYPE-0004 | TYPE-0003 | owner |

**t_ebpfmap_equiv_kv_typed_value_type_map**

| id | value_type_map |
| --- | --- |
| TYPE-0001 | dev_entry |
| TYPE-0002 | task_struct |
| TYPE-0003 | flow_key |
| TYPE-0004 | perf_event |
| TYPE-0005 | stack_trace |
| TYPE-0006 | perf_event |
| TYPE-0007 | stack_trace |

**t_ebpfmap_equiv_kv_typed__value_type_map**

| id | ebpfmap_id | value_type_map_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | TYPE-0002 | contributor | Cardinality Note 01 |
| TYPE-0002 | TYPE-0002 | TYPE-0006 | contributor | Cardinality Note 02 |
| TYPE-0003 | TYPE-0003 | TYPE-0003 | observer | Cardinality Note 03 |
| TYPE-0004 | TYPE-0006 | TYPE-0001 | owner | Cardinality Note 04 |
| TYPE-0005 | TYPE-0007 | TYPE-0005 | owner | Cardinality Note 05 |
| TYPE-0006 | TYPE-0002 | TYPE-0002 | reviewer | Cardinality Note 06 |
| TYPE-0007 | TYPE-0005 | TYPE-0004 | observer | Cardinality Note 07 |
| TYPE-0008 | TYPE-0007 | TYPE-0001 | reviewer | Cardinality Note 08 |

Temporal and categorical metadata enriches entity records with operational context. The `created_date` column records when an instrument was registered in the system, with values ranging from `2023-03-12` (the Seismometer CMG-3ESP) to `2023-09-27` (the X-Ray Diffractometer Bruker D8), enabling chronological tracking of asset onboarding. The `tags` column provides free-form categorical labels such as `archived`, `internal`, and `verified`, allowing operators to filter and group entities by lifecycle state or compliance status. Together, these metadata fields support auditability and governance: one can determine when an instrument entered the registry, whether it has been verified, and what classification it carries, all without joining to external systems.

The interplay between these concepts—identifiers, entities, attributes, typed values, relationships with roles and cardinality notes, and metadata—creates a flexible yet rigorously typed model. An eBPF map like `rate_limit` is identified by `TYPE-0003`, associated with a key type of `uint32_t` and a value type of `flow_key`, and linked through junction tables that specify its role as `owner` and its cardinality constraints. A directive such as `PCI DSS v4.0` carries typed attributes for its effective date, enforcement status, mandatory flag, and priority level, each stored in the appropriate value table and traceable to its attribute definition. This architecture supports both the static description of entities and the dynamic relationships between them, providing a foundation for compliance tracking, instrument management, and system observability.