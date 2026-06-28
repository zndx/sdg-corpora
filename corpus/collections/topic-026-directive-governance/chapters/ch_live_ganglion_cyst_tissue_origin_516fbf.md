---
chapter_id: ch_live_ganglion_cyst_tissue_origin_516fbf
topic_id: 26
family: 08_derived
cited_terms: ['ganglion_cyst_tissue_origin', 'audit_subclass', 'ebpfprogram_exactly_one_type']
model: engine-refine
---

The architecture of attribute-value storage and entity-relationship modeling in this system rests on a disciplined separation between entity definitions, attribute schemas, and their typed instantiations. At the core of each domain, entities are catalogued under unique identifiers—ORIG-0001 through ORIG-0004 for ganglion cyst tissue origins such as sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment; AUDI-0001 through AUDI-0004 for audit subclasses including SOC2 Type II Review, PCI DSS Certification, GDPR Data Flow Assessment, and HIPAA Security Audit; and TYPE-0001 through TYPE-0004 for eBPF program classifications like fentry_do_fork and kprobe_sched_switch. These identifiers serve as the stable anchor points across all relational joins, ensuring referential integrity whether the entity represents a biological tissue origin, a compliance audit, or a kernel-level program type. The entity concept thus functions as the universal node in a graph of structured knowledge, decoupled from the particular semantics of any single domain.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_audit_subclass**

| id | audit |
| --- | --- |
| AUDI-0001 | SOC2 Type II Review |
| AUDI-0002 | PCI DSS Certification |
| AUDI-0003 | GDPR Data Flow Assessment |
| AUDI-0004 | HIPAA Security Audit |
| AUDI-0005 | HIPAA Security Audit |
| AUDI-0006 | 21 CFR Part 11 Audit |

**t_audit_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2023-11-27T16:16:19 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-01-27T14:20:44 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-07-11T22:06:19 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-02-20T00:46:50 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2024-05-24T19:51:15 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-12-09T14:14:21 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-03-22T08:33:34 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-07-04T21:25:06 |

**t_audit_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 6622.09 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 3520.06 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 6281.16 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 5487.90 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1334.65 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 3072.32 |

**t_audit_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 943 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 337 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 718 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 453 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 258 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 371 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 509 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 469 |

**t_audit_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-b14 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | worker-07 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | execution |

Attribute definitions are themselves first-class entities, stored in a schema registry that pairs an attr_name with an attr_type drawn from the XSD namespace. The attribute duration_seconds carries type xsd:decimal, end_time is xsd:dateTime, exit_code is xsd:integer, and host_name is xsd:string. This type-level discipline propagates downstream into the value tables, where each typed value—misc in the schema—is stored in a dedicated table segregated by its XSD type. Decimal values such as 6622.09, 3520.06, 6281.16, and 5487.90 reside in the decimal value table; integer values like 943, 337, 718, and 453 in the integer table; datetime values including 2023-11-27T16:16:19, 2024-01-27T14:20:44, and 2024-07-11T22:06:19 in the datetime table; and string values such as node-b14, Log Level 02, execution, and running in the varchar table. The entity_id column in each value table binds the misc value back to its parent entity, while attr_id resolves to the attribute definition, forming a three-way linkage: entity → attribute → typed value. This design avoids the common pitfall of storing heterogeneous data in a single wide column, instead distributing values across type-specific tables that enforce schema conformance at insert time.

The connective tissue structure domain illustrates how hierarchical part-of relationships are modeled through a junction table that mediates between two reference tables. Tissue origins from t_ganglion_cyst_tissue_origin—sacroiliac joint, metacarpophalangeal joint, subacromial bursa, first dorsal compartment—are linked to connective tissue structures from t_ganglion_cyst_tissue_origin_part_of—periosteal layer, joint capsule, deep fascia, fibrous adventitia—via the junction table t_ganglion_cyst_tissue_origin__part_of. This junction table carries four columns: an identifier for the relationship itself, a ganglion_id designated as subject pointing to the originating tissue, a part_of_id designated as target pointing to the containing structure, and a role that qualifies the nature of the relationship. The role values reviewer, contributor, and owner are not mere labels but semantic predicates that distinguish, for instance, whether ORIG-0007 acts as reviewer of ORIG-0001 or as owner of ORIG-0005. The same pattern recurs in the eBPF program type domain, where the junction table t_ebpfprogram_exactly_one_type__program_type links ebpfprogram_id (subject) to program_type_id (target) with roles of owner and observer, as seen in the pairings TYPE-0003 to TYPE-0002 and TYPE-0005 to TYPE-0004.

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

**t_ebpfprogram_exactly_one_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | fentry_do_fork |
| TYPE-0002 | kprobe_sched_switch |
| TYPE-0003 | kprobe_sched_switch |
| TYPE-0004 | fentry_do_fork |
| TYPE-0005 | tc_ingress_filter |
| TYPE-0006 | tc_ingress_filter |

**t_ebpfprogram_exactly_one_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | kprobe |
| TYPE-0002 | kprobe |
| TYPE-0003 | kprobe |
| TYPE-0004 | socket_filter |
| TYPE-0005 | lsm |
| TYPE-0006 | kprobe |

**t_ebpfprogram_exactly_one_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0003 | TYPE-0005 | owner |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | observer |
| TYPE-0003 | TYPE-0004 | TYPE-0006 | owner |
| TYPE-0004 | TYPE-0003 | TYPE-0002 | owner |
| TYPE-0005 | TYPE-0006 | TYPE-0003 | owner |
| TYPE-0006 | TYPE-0006 | TYPE-0002 | reviewer |
| TYPE-0007 | TYPE-0004 | TYPE-0003 | owner |
| TYPE-0008 | TYPE-0005 | TYPE-0001 | observer |

The subject and target columns in these junction tables are not arbitrary naming conventions but encode a directional semantics: subject is the entity initiating or possessing the relationship, while target is the entity being related to. In the ganglion cyst domain, ORIG-0007 appears as subject in two distinct relationships—reviewing ORIG-0001 and owning ORIG-0005—demonstrating that a single entity can occupy the subject position across multiple relationships with different targets and roles. Similarly, in the eBPF domain, TYPE-0003 serves as subject in two relationships, owning both TYPE-0006 and TYPE-0002. The role column completes the triple by specifying the predicate: owner denotes a stronger, more permanent association than reviewer or contributor, and observer denotes a passive, read-only relationship. This subject-target-role triple is the fundamental unit of relational knowledge in the system, generalizing across domains from anatomical part-whole hierarchies to program type classifications.

The identifier column, present in every table, is the linchpin of the entire architecture. It is not merely a surrogate key but a domain-specific code—ORIG- prefixed for tissue origins, AUDI- prefixed for audit subclasses, TYPE- prefixed for program types—that carries human-readable meaning while remaining machine-resolvable. The identifier appears as the primary key in reference tables, as the foreign key in value tables (via entity_id and attr_id), and as the subject and target in junction tables. This uniform treatment of identifiers across all roles ensures that any entity can be referenced, queried, and joined regardless of whether it is a tissue origin, an audit type, a program type, an attribute definition, or a relationship instance. The system thus achieves a form of universal referential transparency: every node in the graph is addressable by its identifier, and every edge is addressable by its own identifier, creating a fully navigable knowledge structure.