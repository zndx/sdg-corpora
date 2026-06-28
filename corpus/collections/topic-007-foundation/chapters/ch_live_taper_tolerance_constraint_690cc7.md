---
chapter_id: ch_live_taper_tolerance_constraint_690cc7
topic_id: 7
family: 08_derived
cited_terms: ['taper_tolerance_constraint', 'requirement_min_one_verification', 'designative_subclass_basic']
model: engine-refine
---

Taper tolerance constraints serve as the foundational reference objects in a machining and tooling compliance framework, each identified by a stable code such as CONS-0001 through CONS-0004 and classified by a standard designation—ISO 7/24, R8 Taper, HSK 63A, or Brown Sharpe. These designations anchor a broader attribute-value architecture in which constraints are not described by a fixed schema but rather by a flexible set of named attributes whose types are declared once and then instantiated across multiple value tables. The attribute registry, keyed by identifiers like CONS-0001 through CONS-0004, maps attribute names such as confidence, dimension_kind, method, and recorded_at to their respective XSD types—xsd:decimal, xsd:string, and xsd:dateTime—thereby establishing a type contract that governs how values are stored and validated downstream.

**t_taper_tolerance_constraint**

| id | taper_tolerance_constraint |
| --- | --- |
| CONS-0001 | ISO 7/24 |
| CONS-0002 | R8 Taper |
| CONS-0003 | HSK 63A |
| CONS-0004 | Brown Sharpe |
| CONS-0005 | R8 Taper |
| CONS-0006 | HSK 63A |
| CONS-0007 | HSK 63A |

**t_taper_tolerance_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | confidence | xsd:decimal |
| CONS-0002 | dimension_kind | xsd:string |
| CONS-0003 | method | xsd:string |
| CONS-0004 | recorded_at | xsd:dateTime |
| CONS-0005 | uncertainty | xsd:decimal |
| CONS-0006 | unit | xsd:string |
| CONS-0007 | value | xsd:decimal |
| CONS-0008 | encoding | xsd:string |

**t_taper_tolerance_constraint_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 2023-04-13T01:14:03 |
| CONS-0002 | CONS-0002 | CONS-0004 | 2023-11-17T04:32:31 |
| CONS-0003 | CONS-0003 | CONS-0004 | 2024-02-24T21:07:21 |
| CONS-0004 | CONS-0004 | CONS-0004 | 2024-03-22T07:54:37 |
| CONS-0005 | CONS-0005 | CONS-0004 | 2024-06-16T09:28:12 |
| CONS-0006 | CONS-0006 | CONS-0004 | 2025-04-01T15:47:40 |
| CONS-0007 | CONS-0007 | CONS-0004 | 2023-11-02T02:01:06 |

**t_taper_tolerance_constraint_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 0.573 |
| CONS-0002 | CONS-0001 | CONS-0005 | 111.04 |
| CONS-0003 | CONS-0001 | CONS-0007 | 682.01 |
| CONS-0004 | CONS-0002 | CONS-0001 | 0.728 |
| CONS-0005 | CONS-0002 | CONS-0005 | 404.41 |
| CONS-0006 | CONS-0002 | CONS-0007 | 774.28 |
| CONS-0007 | CONS-0003 | CONS-0001 | 0.546 |
| CONS-0008 | CONS-0003 | CONS-0005 | 913.78 |

**t_taper_tolerance_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0002 | Dimension Kind 01 |
| CONS-0002 | CONS-0001 | CONS-0008 | Encoding 02 |
| CONS-0003 | CONS-0001 | CONS-0009 | nightly summary |
| CONS-0004 | CONS-0001 | CONS-0010 | en |
| CONS-0005 | CONS-0001 | CONS-0003 | hybrid |
| CONS-0006 | CONS-0001 | CONS-0006 | ratio |
| CONS-0007 | CONS-0002 | CONS-0002 | Dimension Kind 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | Encoding 08 |

Value storage is partitioned by type to preserve data integrity while accommodating the heterogeneity of compliance metadata. Decimal attributes, for instance, hold numeric measurements like 0.573, 111.04, and 682.01, each associated with a specific constraint entity and attribute through a composite foreign key linking entity_id and attr_id to their respective definitions. String-valued attributes capture categorical or descriptive data—Dimension Kind 01, Encoding 02, nightly summary, and language codes such as en—while datetime attributes record temporal metadata like 2023-04-13T01:14:03 or 2024-03-22T07:54:37. This type-disaggregated value model ensures that each datum is stored in a column whose schema matches its semantic type, eliminating the ambiguity of a single text column and enabling precise querying, indexing, and type coercion at read time.

The same attribute-value pattern extends to verification requirements, which govern the compliance obligations that must be satisfied for a given constraint or process. Requirements such as Latency threshold 50ms, Audit log completeness, and Backup frequency daily are identified by codes like VERI-0001 through VERI-0004 and are linked to designative entities through a verified_by foreign key that references designations such as DESI-0001, DESI-0002, DESI-0003, and DESI-0006. The attribute definitions for verifications—effective_date, enforcement, mandatory, and priority—follow the same XSD-typed schema as their constraint counterparts, with values distributed across boolean, date, integer, and varchar value tables. Boolean flags like true and false indicate whether a requirement is mandatory, date values such as 2023-09-25 and 2025-02-12 establish effective periods, and integer values like 1, 285, 542 encode priority levels or thresholds.

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | DESI-0003 |
| VERI-0002 | Audit log completeness | DESI-0001 |
| VERI-0003 | Backup frequency daily | DESI-0002 |
| VERI-0004 | Backup frequency daily | DESI-0006 |
| VERI-0005 | Schema validation strict | DESI-0007 |
| VERI-0006 | PII masking rule | DESI-0007 |

**t_requirement_min_one_verification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | effective_date | xsd:date |
| VERI-0002 | enforcement | xsd:string |
| VERI-0003 | mandatory | xsd:boolean |
| VERI-0004 | priority | xsd:integer |
| VERI-0005 | review_cycle_days | xsd:integer |
| VERI-0006 | scope | xsd:string |
| VERI-0007 | encoding | xsd:string |
| VERI-0008 | label_text | xsd:string |

**t_requirement_min_one_verification_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 2023-09-25 |
| VERI-0002 | VERI-0002 | VERI-0001 | 2024-02-07 |
| VERI-0003 | VERI-0003 | VERI-0001 | 2023-08-17 |
| VERI-0004 | VERI-0004 | VERI-0001 | 2025-02-12 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2023-06-21 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2024-04-16 |

**t_requirement_min_one_verification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0007 | Encoding 01 |
| VERI-0002 | VERI-0001 | VERI-0002 | Enforcement 02 |
| VERI-0003 | VERI-0001 | VERI-0008 | change rationale |
| VERI-0004 | VERI-0001 | VERI-0009 | fr |
| VERI-0005 | VERI-0001 | VERI-0006 | Scope 05 |
| VERI-0006 | VERI-0002 | VERI-0007 | Encoding 06 |
| VERI-0007 | VERI-0002 | VERI-0002 | Enforcement 07 |
| VERI-0008 | VERI-0002 | VERI-0008 | intake form |

Designative subclasses provide the linguistic and categorical layer that connects verification requirements to their operational context. Each designative—identified by codes such as DESI-0001 through DESI-0004—carries a human-readable label like event_tag_crash, plate_A04, or barcode_8842X, a classification code such as D-33, B-12, or E-21, and a language indicator in fr or es. This multilingual tagging enables the same verification requirement to be referenced across different language contexts without duplicating the underlying compliance logic, while the classification code provides a machine-readable grouping that can be used for aggregation, filtering, and audit reporting.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |

The foreign-key relationships between these tables form a coherent referential graph: constraint and verification entities anchor the structure, attribute definitions declare the schema of permissible metadata, type-specific value tables hold the actual data, and designative subclasses supply the linguistic and categorical context. A decimal value of 0.573 is traceable from its value row through its entity_id and attr_id back to the constraint it describes and the attribute it defines; a boolean flag of false on a mandatory requirement is similarly traceable to the verification obligation it qualifies and the designative entity it is verified against. This architecture supports both the rigidity required for compliance auditing—where every datum has a known type, a known owner, and a known provenance—and the flexibility required for evolving standards, where new attributes can be added without schema migration and new designations can be introduced without altering the core entity model.

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

**t_requirement_min_one_verification_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | 1 |
| VERI-0002 | VERI-0001 | VERI-0005 | 285 |
| VERI-0003 | VERI-0002 | VERI-0004 | 1 |
| VERI-0004 | VERI-0002 | VERI-0005 | 542 |
| VERI-0005 | VERI-0003 | VERI-0004 | 5 |
| VERI-0006 | VERI-0003 | VERI-0005 | 517 |
| VERI-0007 | VERI-0004 | VERI-0004 | 2 |
| VERI-0008 | VERI-0004 | VERI-0005 | 72 |