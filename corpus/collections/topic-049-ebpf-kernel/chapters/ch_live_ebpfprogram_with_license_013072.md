---
chapter_id: ch_live_ebpfprogram_with_license_013072
topic_id: 49
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_with_license', 'artifact_min_one_id', 'soc2_security_subclass']
model: engine-refine
---

The foundational vocabulary of this governance model rests on a small set of interlocking concepts: identifier, entity, attribute, attribute type, and value, each serving a distinct purpose in the representation of compliance metadata. An identifier is a stable, machine-readable key—LICE-0001, SECU-0003, ONE-0002—that anchors a record across the system and enables unambiguous cross-referencing. An entity is the thing being described: an eBPF program such as uprobe_syscall or cgroup_sock_release, a SOC2 security subclass like SOC2-CloudInfra or SOC2-Fintech, or a software artifact such as manifest-v1 or sensor-log-2023-10. The entity is the subject of attributes, which are named properties that capture its characteristics. Attribute names—effective_date, enforcement, mandatory, priority—carry semantic meaning, while attribute types—xsd:date, xsd:string, xsd:boolean, xsd:integer—constrain the shape and validation of the values those attributes may hold. This separation of name from type from value permits a single entity to carry a heterogeneous set of properties without requiring a rigid, monolithic schema.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | Virtual Networks |
| SECU-0002 | SOC3-Public | Microservice Mesh |
| SECU-0003 | SOC2-Fintech | Database Clusters |
| SECU-0004 | SOC2-IdentityProvider | Microservice Mesh |
| SECU-0005 | SOC2-SaaS | Data Warehouses |
| SECU-0006 | SOC2-TypeII | Database Clusters |
| SECU-0007 | SOC2-SaaS | Database Clusters |

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

Values are stored in type-specialized containers that enforce schema discipline at the point of insertion. Boolean attributes such as mandatory resolve to true or false for a given entity-attribute pair; date attributes such as effective_date carry values like 2023-08-15 or 2025-05-01; integer attributes such as priority accept values ranging from 1 to 926; and string attributes capture free-form text such as audit excerpt or Encoding 01. The entity_id column in each value table establishes the foreign-key link back to the entity being described, while the attr_id column resolves to the attribute definition, ensuring that only semantically valid combinations of entity and attribute receive values. This design permits an entity to carry zero, one, or many attributes of different types without schema migration, and it guarantees that a value for a boolean attribute cannot accidentally be stored as a date.

Beyond intrinsic properties, the model captures relationships between entities through junction tables that encode subject, target, and role. A subject is the originating entity in a relationship, a target is the recipient, and a role describes the nature of the connection from the subject's perspective. In the licensing domain, an eBPF program such as cgroup_sock_release (subject) is linked to a license identifier (target) with a role of contributor, reviewer, or observer, indicating the program's relationship to that license's governance or derivation. The same pattern applies to SOC2 security subclasses, where a classification like SOC2-IdentityProvider is associated with a domain such as Microservice Mesh, and the role column captures the nature of that association. This triad—subject, target, role—provides a uniform mechanism for expressing directed, typed relationships without hardcoding relationship semantics into the entity schema itself.

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

Licenses and locations represent domain-specific attribute values that carry regulatory and operational significance. A license is an open-source or proprietary designation—MPL-2.0, EUPL-1.2, Unlicense, ISC, CC-BY-4.0, MIT, or proprietary—that determines the legal terms under which software may be used, modified, or distributed. A location is a geographic or infrastructural placement—us-east-1, eu-west-3, ap-south-2, rack-7—that establishes where data or services reside, which in turn governs jurisdictional compliance obligations. These values are not merely descriptive; they are constraints. An artifact such as manifest-v1 may carry a proprietary license in eu-west-3 and an MIT license in ap-south-2, reflecting different distribution terms in different jurisdictions. The location column thus functions as a contextual dimension that qualifies the applicability of license and other attributes.

**t_artifact_min_one_id**

| id | artifact | license | location |
| --- | --- | --- | --- |
| ONE-0001 | sensor-log-2023-10 | CC-BY-4.0 | us-east-1 |
| ONE-0002 | manifest-v1 | proprietary | eu-west-3 |
| ONE-0003 | manifest-v1 | CC-BY-4.0 | rack-7 |
| ONE-0004 | manifest-v1 | MIT | ap-south-2 |

The practical effect of this architecture is a system in which compliance metadata is both flexible and enforceable. New attribute types can be introduced without altering existing entity definitions; new relationship roles can be added without schema migration; and values are validated at insertion time against their declared attribute types. An auditor tracing the provenance of an eBPF program encounters a chain of identifiers: the program identifier resolves to its license identifiers, which resolve to license names, while the junction table reveals the contributor and reviewer roles that govern that association. A SOC2 assessor evaluating SOC2-Fintech against the Database Clusters domain inspects the mandatory boolean attribute, the effective_date attribute, and the priority integer attribute, each stored in its type-appropriate container and linked back to the entity through foreign keys. The model does not prescribe what attributes or relationships exist; it prescribes how they are represented, validated, and queried.