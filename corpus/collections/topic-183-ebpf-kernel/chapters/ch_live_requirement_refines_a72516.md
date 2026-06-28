---
chapter_id: ch_live_requirement_refines_a72516
topic_id: 183
family: 03_directive_governance
cited_terms: ['requirement_refines', 'insertion_loss_specification', 'artifact_min_one_id']
model: engine-refine
---

An identifier serves as the immutable handle by which any entity is referenced across the system, and its structure signals both provenance and category. Specification identifiers such as `SPEC-0001` through `SPEC-0004` anchor insertion loss specifications, while requirement refinement identifiers like `REFI-0001` through `REFI-0004` track how one requirement narrows or extends another. Artifact identifiers such as `ONE-0001` through `ONE-0004` similarly ground concrete deliverables—`sensor-log-2023-10`, `manifest-v1`—in a stable namespace. The entity is the thing being described: a specification, a requirement, an artifact, or any other domain object that carries properties and relationships. Every entity is addressable by its identifier, and every attribute value is resolved by joining the entity to the attribute definition and then to the appropriate value store.

**t_insertion_loss_specification**

| id | insertion_loss_specification |
| --- | --- |
| SPEC-0001 | Connector-Loss-Baseline |
| SPEC-0002 | Connector-Loss-Baseline |
| SPEC-0003 | Filter-Insertion-Depth |
| SPEC-0004 | Transceiver-Margin-Spec |
| SPEC-0005 | Antenna-Feed-Loss |
| SPEC-0006 | Optic-Coupler-Loss |

**t_insertion_loss_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_insertion_loss_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-12-28T03:34:41 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-07-30T00:55:27 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2024-10-08T23:01:51 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2024-02-08T16:58:47 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2024-02-29T05:58:20 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-21T07:18:41 |

**t_insertion_loss_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.131 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 129.10 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 470.08 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.111 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 499.91 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 156.27 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.125 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 625.08 |

**t_insertion_loss_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | intake form |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | fr |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | automated |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | ratio |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

Attributes are the named properties that give an entity its descriptive shape, and each attribute carries a type that constrains the kind of value it can hold. The attribute registry defines names such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to an XML Schema type—`xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This separation of attribute definition from attribute value is deliberate: it allows the same attribute name to be reused across entities while the type system guarantees that values are stored and validated consistently. An attribute like `recorded_at` will always resolve to a timestamp, while `dimension_kind` will always resolve to a string, regardless of which entity it describes.

The insertion loss specification is a concrete domain entity that illustrates how this pattern operates in practice. Specifications such as `Connector-Loss-Baseline`, `Filter-Insertion-Depth`, and `Transceiver-Margin-Spec` are each identified by a stable code and enriched with typed attributes. A decimal-valued attribute might record a confidence figure of `0.131` or a measurement of `129.10` or `470.08`, depending on which attribute definition is in play. A string-valued attribute might carry a label like `Dimension Kind 01`, an encoding designation of `Encoding 02`, or a free-text note such as `intake form`. A datetime-valued attribute captures the moment of recording—`2024-12-28T03:34:41`, `2023-07-30T00:55:27`, `2024-10-08T23:01:51`, `2024-02-08T16:58:47`—providing an audit trail for when the specification was last updated. The value tables are partitioned by type so that decimal, string, and datetime values are stored in separate columns, each keyed to the entity and attribute pair, ensuring type-safe lookups without runtime coercion.

Scope, language, license, and location are the contextual dimensions that govern where and how an entity applies. Scope establishes the operational boundary of a requirement or specification—`team`, `regional`, `local`, or `global`—determining which organizational units or geographic regions are bound by it. Language records the human language of the content, with values such as `en`, `es`, and `fr` appearing on requirement refinements, enabling multilingual compliance documentation without conflating translation with the underlying rule. License attaches a legal usage term to an artifact: `CC-BY-4.0` for openly licensed deliverables, `proprietary` for internally controlled assets, or `MIT` for permissively licensed components. Location pins an artifact to a physical or logical placement—`us-east-1`, `eu-west-3`, `rack-7`, `ap-south-2`—supporting traceability across cloud regions, data centers, and hardware racks. Together, these dimensions form a governance layer that sits alongside the structural model, ensuring that every entity carries not only its properties but also the context needed to enforce policy, manage compliance, and audit usage.

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | ONE-0003 | team | es |
| REFI-0002 | Data Retention Policy | ONE-0001 | regional | en |
| REFI-0003 | Data Retention Policy | ONE-0003 | local | en |
| REFI-0004 | Data Retention Policy | ONE-0006 | global | fr |

**t_artifact_min_one_id**

| id | artifact | license | location |
| --- | --- | --- | --- |
| ONE-0001 | sensor-log-2023-10 | CC-BY-4.0 | us-east-1 |
| ONE-0002 | manifest-v1 | proprietary | eu-west-3 |
| ONE-0003 | manifest-v1 | CC-BY-4.0 | rack-7 |
| ONE-0004 | manifest-v1 | MIT | ap-south-2 |
| ONE-0005 | package-lib-crypto | MPL-2.0 | on-prem-dc1 |
| ONE-0006 | image-segmentation-mask | proprietary | eu-west-3 |