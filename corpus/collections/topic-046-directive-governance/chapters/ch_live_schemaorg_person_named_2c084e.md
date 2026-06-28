---
chapter_id: ch_live_schemaorg_person_named_2c084e
topic_id: 46
family: 07_long_tail
cited_terms: ['schemaorg_person_named', 'schemaorg_review_author', 'quantum_cyber_security_field']
model: engine-refine
---

The schema organizes named entities through a stable identifier namespace, where each record in `t_schemaorg_person_named` carries a surrogate key such as `NAME-0001` or `NAME-0004` and resolves to a schema.org resource like `person/rosalind_franklin`, `Review`, `Product`, or `person/alan_kay`. The `t_schemaorg_person_named_full_name` table binds those same identifiers to human-readable names — `Grace Hopper`, `Donald Knuth`, `John von Neumann` — establishing a many-to-one mapping, since `NAME-0001` and `NAME-0004` both resolve to `Grace Hopper`. This decoupling of identifier, resource URI, and display name permits a single person to appear under multiple schema.org contexts without duplication of the canonical name. The bridging table `t_schemaorg_person_named__full_name` formalizes the linkage with a ternary structure: a `subject` column (`schemaorg_id`) points to the resource identifier, a `target` column (`full_name_id`) points to the name identifier, and a `role` column — taking values such as `owner`, `observer`, or `reviewer` — declares the nature of the association. This subject–target–role triad recurs throughout the schema as the canonical pattern for expressing typed relationships between entities.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/rosalind_franklin |
| NAME-0002 | Review |
| NAME-0003 | Product |
| NAME-0004 | person/alan_kay |
| NAME-0005 | person/alan_turing |
| NAME-0006 | Event |
| NAME-0007 | SoftwareApplication |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

Attribute metadata is defined in `t_schemaorg_review_author_attr`, where each row declares an `attr_name` — for example `checksum`, `created_date`, `identifier`, or `license` — alongside an `attr_type` that constrains the permitted value domain. The types drawn from the data include `xsd:string`, `xsd:date`, and `cco:DesignativeICE`, anchoring the attribute definitions to established vocabularies and XML Schema primitives. This separation of attribute schema from attribute values enables the same set of named properties to be applied across heterogeneous entities without schema migration. The `attr` column in the value tables serves as the foreign key back to `t_schemaorg_review_author_attr`, ensuring that every stored value corresponds to a declared attribute definition.

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | person/elon_musk | James Wilson |
| AUTH-0002 | Event | Michael Brown |
| AUTH-0003 | Service | Jane Doe |
| AUTH-0004 | person/marvin_minsky | Sarah Miller |
| AUTH-0005 | person/donald_knuth | Jane Doe |
| AUTH-0006 | Organization | Robert Chen |

**t_schemaorg_review_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

Attribute values are materialized in three type-specialized tables — `t_schemaorg_review_author_val_date`, `t_schemaorg_review_author_val_int`, and `t_schemaorg_review_author_val_varchar` — each carrying an `entity_id` that identifies the subject entity, an `attr_id` that references the attribute definition, and a `value` column holding the actual data. Date values such as `2025-02-16`, `2024-11-14`, `2023-06-05`, and `2023-01-18` populate the date table; integer values including `103`, `12`, `471`, and `5` populate the integer table; and string values like `1a4b6c2d`, `ref-8842`, `CC-BY-4.0`, and `on-prem-dc1` populate the varchar table. The `entity` column in each value table is a foreign key to the owning entity's identifier, and the `attr` column is a foreign key to the attribute definition, forming a normalized EAV (entity–attribute–value) structure that preserves type safety through table partitioning rather than runtime type tags.

**t_schemaorg_review_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2025-02-16 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-11-14 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-06-05 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-01-18 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2023-05-28 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-09-03 |

**t_schemaorg_review_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 103 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 471 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 5 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 402 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 1 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 318 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 3 |

**t_schemaorg_review_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 1a4b6c2d |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | ref-8842 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | CC-BY-4.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | application/xml |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | data-engineering |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

The quantum cybersecurity domain is modeled through `t_quantum_cyber_security_field`, which enumerates fields such as `Quantum Secure Direct Communication`, `Measurement-Device-Independent QKD`, and `Post-Quantum Cryptography` (the latter appearing twice under identifiers `FIEL-0003` and `FIEL-0004`). Each field is associated with one or more `communicationsecurityaspect` values — `Emitter Calibration Drift`, `Channel Eavesdropping Detection`, `Quantum Memory Coherence` — via the junction table `t_quantum_cyber_security_field__studies_domain_aspect`. This relationship table uses `quantum_id` as the `subject` and `studies_domain_aspect_id` as the `target`, with a `role` column that takes values like `contributor` and `owner` to distinguish primary from secondary associations. The pattern mirrors the person–name relationship: a subject–target–role triad that captures not just connectivity but the semantic weight of the connection.

**t_quantum_cyber_security_field**

| id | quantum_cyber_security_field |
| --- | --- |
| FIEL-0001 | Quantum Secure Direct Communication |
| FIEL-0002 | Measurement-Device-Independent QKD |
| FIEL-0003 | Post-Quantum Cryptography |
| FIEL-0004 | Post-Quantum Cryptography |
| FIEL-0005 | Quantum Digital Signatures |
| FIEL-0006 | Quantum Key Distribution |

**t_quantum_cyber_security_field_studies_domain_aspect**

| id | studies_domain_aspect |
| --- | --- |
| FIEL-0001 | Emitter Calibration Drift |
| FIEL-0002 | Channel Eavesdropping Detection |
| FIEL-0003 | Quantum Memory Coherence |
| FIEL-0004 | Channel Eavesdropping Detection |
| FIEL-0005 | Protocol Authentication Tokens |
| FIEL-0006 | Network Topology Integrity |

**t_quantum_cyber_security_field__studies_domain_aspect**

| id | quantum_id | studies_domain_aspect_id | role |
| --- | --- | --- | --- |
| FIEL-0001 | FIEL-0003 | FIEL-0001 | contributor |
| FIEL-0002 | FIEL-0005 | FIEL-0003 | contributor |
| FIEL-0003 | FIEL-0001 | FIEL-0001 | contributor |
| FIEL-0004 | FIEL-0001 | FIEL-0001 | owner |
| FIEL-0005 | FIEL-0003 | FIEL-0006 | owner |
| FIEL-0006 | FIEL-0001 | FIEL-0005 | contributor |
| FIEL-0007 | FIEL-0002 | FIEL-0004 | contributor |
| FIEL-0008 | FIEL-0004 | FIEL-0004 | reviewer |