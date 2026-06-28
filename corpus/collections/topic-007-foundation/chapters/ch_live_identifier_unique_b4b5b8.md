---
chapter_id: ch_live_identifier_unique_b4b5b8
topic_id: 7
family: 01_foundation
cited_terms: ['identifier_unique', 'cardinality_max_one_generic', 'gdpr_lawful_basis']
model: engine-refine
---

Identifiers serve as the immutable anchors of the system, each record distinguished by a scoped key such as `UNIQ-0001` or `BASI-0001` that guarantees uniqueness within its namespace. These identifiers do not merely label records; they carry semantic weight through associated metadata. An identifier like `10.1038/s41586-023-06123` resolves to the FDA 510(k) Database, while `PDB-7XYZ-A` points to a CERN Telemetry Stream, and the system enforces referential integrity through a checksum algorithm—`md5`, `sha1`, or `blake2b`—applied to the identifier value itself. The identifier `W3C-DOI:10.1002/anie.202112345` appears in the registry for the OSMnx Graph Library, and its presence is validated against the stored digest, ensuring that downstream consumers can detect corruption or tampering before processing. Language tags such as `ja`, `en`, and `es` accompany these identifiers, enabling multilingual resolution paths without duplicating the identifier space.

**t_identifier_unique**

| id | identifier | identifies | checksum_algo | language |
| --- | --- | --- | --- | --- |
| UNIQ-0001 | 10.1038/s41586-023-06123 | FDA 510(k) Database | md5 | ja |
| UNIQ-0002 | W3C-DOI:10.1002/anie.202112345 | OSMnx Graph Library | sha1 | en |
| UNIQ-0003 | PDB-7XYZ-A | RefSeq Genome Assembly | md5 | ja |
| UNIQ-0004 | W3C-DOI:10.1002/anie.202112345 | CERN Telemetry Stream | blake2b | es |
| UNIQ-0005 | PDB-7XYZ-A | RefSeq Genome Assembly | blake2b | de |
| UNIQ-0006 | ORCID-0000-0002-1825-0097 | CERN Telemetry Stream | md5 | es |
| UNIQ-0007 | W3C-DOI:10.1002/anie.202112345 | WHO ICD-11 Code | blake2b | fr |
| UNIQ-0008 | SNOMED-123456008 | CERN Telemetry Stream | blake2b | ja |

Attributes define the shape of entity data through a schema-on-read pattern where each attribute carries a name and a declared type. The attribute `effective_date` is typed as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. This separation of attribute definition from attribute value allows the system to evolve its data model without migration: new attributes can be registered independently of any existing entity, and values are validated against the declared type at write time. The type system is not merely declarative; it governs storage layout and query semantics, ensuring that a date value such as `2023-01-18` cannot be confused with the integer `683` or the string `intake form` even though all reside in value tables with identical structural schemas.

Entity records are the concrete instances to which attributes and values are bound. An entity identified as `BASI-0001` might represent a lawful basis under the AI Act Framework, while `BASI-0002` through `BASI-0004` map to provisions within the CCPA Policy. Each entity is a vertex in a value graph: the boolean attribute `mandatory` evaluates to `false` for `BASI-0001` and `BASI-0004`, but to `true` for `BASI-0002` and `BASI-0003`; the date attribute `effective_date` takes values ranging from `2023-01-18` to `2025-03-25` across the entity set; and integer attributes such as `priority` hold values like `4`, `683`, and `470`. The varchar values—`Encoding 01`, `Enforcement 02`, `ja`—demonstrate that the same entity can carry both machine-readable codes and human-readable annotations, all resolved through the entity-attribute-value join.

**t_gdpr_lawful_basis_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0003 | false |
| BASI-0002 | BASI-0002 | BASI-0003 | true |
| BASI-0003 | BASI-0003 | BASI-0003 | true |
| BASI-0004 | BASI-0004 | BASI-0003 | false |
| BASI-0005 | BASI-0005 | BASI-0003 | true |
| BASI-0006 | BASI-0006 | BASI-0003 | false |

**t_gdpr_lawful_basis_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0007 | Encoding 01 |
| BASI-0002 | BASI-0001 | BASI-0002 | Enforcement 02 |
| BASI-0003 | BASI-0001 | BASI-0008 | intake form |
| BASI-0004 | BASI-0001 | BASI-0009 | ja |
| BASI-0005 | BASI-0001 | BASI-0006 | Scope 05 |
| BASI-0006 | BASI-0002 | BASI-0007 | Encoding 06 |
| BASI-0007 | BASI-0002 | BASI-0002 | Enforcement 07 |
| BASI-0008 | BASI-0002 | BASI-0008 | nightly summary |

Cardinality constraints govern how entities relate to one another, enforcing referential discipline across the graph. A constraint of `mandatory_one` or `strict_unique` on a relationship to `device_metrics` or `asset_registry` ensures that every referencing entity has exactly one valid target, while `singular_ref` and `first_match` provide more permissive semantics for optional associations. These constraints apply to relationships such as those linking to `audit_logs` or `config_params`, and they are evaluated independently of the attribute-value layer, allowing cardinality rules to operate on entity-level topology without inspecting the typed values that populate each entity.

The lawful basis layer ties regulatory policy to concrete data processing activities. The AI Act Framework is grounded in the lawful basis of Legitimate interests, while CCPA Policy provisions are associated with Health research or Marketing opt-in depending on the specific basis record. This mapping is not static; it is stored as a first-class entity relationship that can be queried, audited, and updated without altering the underlying attribute schema. The system thus supports a compliance model where identifiers anchor records, attributes define structure, types enforce correctness, entities instantiate data, and cardinality constraints maintain relational integrity—all while checksum algorithms and language tags provide the metadata necessary for cross-system interoperability and multilingual governance.

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

**t_gdpr_lawful_basis**

| id | gdpr | lawful_basis |
| --- | --- | --- |
| BASI-0001 | AI Act Framework | Legitimate interests |
| BASI-0002 | CCPA Policy | Health research |
| BASI-0003 | CCPA Policy | Health research |
| BASI-0004 | CCPA Policy | Marketing opt-in |
| BASI-0005 | AI Act Framework | Explicit consent |
| BASI-0006 | NIS Directive | Legitimate interests |

**t_gdpr_lawful_basis_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BASI-0001 | effective_date | xsd:date |
| BASI-0002 | enforcement | xsd:string |
| BASI-0003 | mandatory | xsd:boolean |
| BASI-0004 | priority | xsd:integer |
| BASI-0005 | review_cycle_days | xsd:integer |
| BASI-0006 | scope | xsd:string |
| BASI-0007 | encoding | xsd:string |
| BASI-0008 | label_text | xsd:string |

**t_gdpr_lawful_basis_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0001 | 2023-01-18 |
| BASI-0002 | BASI-0002 | BASI-0001 | 2023-01-24 |
| BASI-0003 | BASI-0003 | BASI-0001 | 2025-03-25 |
| BASI-0004 | BASI-0004 | BASI-0001 | 2023-04-09 |
| BASI-0005 | BASI-0005 | BASI-0001 | 2024-12-12 |
| BASI-0006 | BASI-0006 | BASI-0001 | 2025-03-12 |

**t_gdpr_lawful_basis_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0004 | 4 |
| BASI-0002 | BASI-0001 | BASI-0005 | 683 |
| BASI-0003 | BASI-0002 | BASI-0004 | 4 |
| BASI-0004 | BASI-0002 | BASI-0005 | 470 |
| BASI-0005 | BASI-0003 | BASI-0004 | 2 |
| BASI-0006 | BASI-0003 | BASI-0005 | 535 |
| BASI-0007 | BASI-0004 | BASI-0004 | 1 |
| BASI-0008 | BASI-0004 | BASI-0005 | 87 |