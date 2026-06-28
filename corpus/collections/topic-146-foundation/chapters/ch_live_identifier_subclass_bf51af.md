---
chapter_id: ch_live_identifier_subclass_bf51af
topic_id: 146
family: 01_foundation
cited_terms: ['identifier_subclass', 'existential_two_clauses', 'directive_supersedes_directive']
model: engine-refine
---

An identifier in a governance registry is not merely a string but a structured reference that binds a human-readable token to a directive or entity within a compliance framework. The identifier subclass table establishes this binding: the token `HANDLE-1234/5678` resolves to directive `DIRE-0002`, while `SEQ-NF2024` maps to `DIRE-0008`, `SN-8842XJ` to `DIRE-0003`, and `ACCN-GSM7829104` to `DIRE-0004`. These tokens span naming conventions—handle-style URIs, sequential prefixes, serial-number formats, and accession codes—reflecting the heterogeneous provenance of identifiers drawn from disparate regulatory regimes. Each identifier carries a stable primary key (`IDEN-0001` through `IDEN-0004`) that anchors its metadata and value assignments across the registry, ensuring that lookups remain deterministic even as the underlying directive landscape evolves.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | DIRE-0002 |
| IDEN-0002 | SEQ-NF2024 | DIRE-0008 |
| IDEN-0003 | SN-8842XJ | DIRE-0003 |
| IDEN-0004 | ACCN-GSM7829104 | DIRE-0004 |
| IDEN-0005 | RUN-20231105 | DIRE-0001 |
| IDEN-0006 | GUID-f47ac10b | DIRE-0003 |
| IDEN-0007 | DOI-10.1234/abc | DIRE-0005 |

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

Attributes attached to identifiers follow a typed, extensible schema that separates the definition of an attribute from its concrete values. The attribute dictionary records four attribute names—`checksum_algo`, `code`, `format`, and `issued_date`—each declared with an XML Schema datatype (`xsd:string` for the first three, `xsd:date` for the last). This separation enables the registry to store heterogeneous values without schema migration: string-valued attributes such as `Checksum Algo 01`, `B-12`, `Encoding 03`, and `JSON` reside in the varchar value table, while date-valued attributes like `2023-11-13`, `2024-05-25`, `2024-09-11`, and `2025-05-27` occupy the dedicated date value table. The entity column in both value tables creates a many-to-many linkage, allowing a single identifier to accumulate multiple attribute values and a single attribute definition to be reused across identifiers.

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

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

Directives themselves form a supersedence hierarchy that captures the temporal and normative relationships between regulatory requirements. The directive supersedence table records which directive references another, with entries such as `PCI DSS v4.0` appearing as the source of supersedence in three of four rows and `NERC CIP-003` in the fourth, indicating that these standards serve as anchors in a web of replacement and obsolescence. Attributes on these relationships—`effective_date`, `enforcement`, `mandatory`, and `priority`—are similarly typed, with `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer` respectively. Boolean values (`true` and `false`) encode whether a supersedence is mandatory, date values such as `2024-04-11`, `2024-01-18`, `2023-05-24`, and `2023-10-24` mark when each relationship took effect, and integer values like `2`, `436`, `3`, and `990` quantify priority levels. String attributes capture enforcement classifications (`Enforcement 02`) and contextual notes (`audit excerpt`).

Existential clauses provide a further layer of relational structure, connecting operational entities to directives through binary predicates. The clause table maps existential subjects—`TelemetryHub`, `DataLake`, `AuditLog`—to directive targets (`DIRE-0005`, `DIRE-0006`, `DIRE-0007`) and secondary qualifiers (`VersionTag`, `AuditTrail`, `QualityFlag`, `ValidationSet`). These clauses express assertions such as "TelemetryHub is governed by DIRE-0005 under VersionTag" or "AuditLog is governed by DIRE-0006 under QualityFlag," forming a graph of compliance obligations that can be traversed programmatically. The clause identifiers (`CLAU-0001` through `CLAU-0004`) serve as stable handles for these relationships, enabling audit trails and policy engines to reference them without ambiguity.

**t_existential_two_clauses**

| id | existential | related | related_2 |
| --- | --- | --- | --- |
| CLAU-0001 | TelemetryHub | DIRE-0005 | VersionTag |
| CLAU-0002 | DataLake | DIRE-0005 | AuditTrail |
| CLAU-0003 | AuditLog | DIRE-0006 | QualityFlag |
| CLAU-0004 | TelemetryHub | DIRE-0007 | ValidationSet |
| CLAU-0005 | DataLake | DIRE-0004 | RetentionRule |
| CLAU-0006 | DataPipeline | DIRE-0001 | AuditTrail |
| CLAU-0007 | StreamProcessor | DIRE-0002 | AuditTrail |
| CLAU-0008 | TelemetryHub | DIRE-0004 | QualityFlag |

The overall architecture—where identifiers, attributes, values, directives, and existential clauses are modeled as distinct but interlocking tables—reflects a design philosophy that prioritizes extensibility and type safety over simplicity. By separating attribute definitions from their values, and by partitioning values according to their XML Schema types, the registry avoids the pitfalls of untyped key-value stores while remaining agnostic to the specific attributes any given identifier or directive may require. This structure supports compliance workflows that demand precise temporal reasoning (through date-valued effective dates), normative clarity (through mandatory flags and priority integers), and traceable provenance (through typed identifiers and supersedence chains).

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