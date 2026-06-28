---
chapter_id: ch_live_ganglion_cyst_tissue_origin_ce3766
topic_id: 125
family: 08_derived
cited_terms: ['ganglion_cyst_tissue_origin', 'soc2_trust_criterion', 'qualification_process']
model: engine-refine
---

The foundational layer of the data model rests upon a uniform identifier scheme, where every entity—whether a ganglion cyst tissue origin, a SOC 2 trust criterion, or a qualification process—is assigned a stable, prefixed key such as ORIG-0001 or CRIT-0003. These identifiers function as the primary keys across all tables and serve as the join points for every relationship, ensuring referential integrity without ambiguity. The identifier column appears in every table, sometimes as the sole key and sometimes as part of a composite foreign key, and its consistent naming convention allows any consumer of the data to trace a value back to its originating entity regardless of which table they encounter it in.

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

**t_soc2_trust_criterion**

| id | soc | soc2_trust_criterion |
| --- | --- | --- |
| CRIT-0001 | CyberShield Ltd | Transaction Accuracy |
| CRIT-0002 | DataVault Inc | Transaction Accuracy |
| CRIT-0003 | CloudScale Services | Data Privacy |
| CRIT-0004 | HealthSys Networks | Security |
| CRIT-0005 | RetailChain Partners | Security |
| CRIT-0006 | FinTech Global | Transaction Accuracy |

**t_qualification_process**

| id | qualification_process | requires_membership | yields_championship_entry |
| --- | --- | --- | --- |
| PROC-0001 | Regional Wildcard Series | FIDE Master Rating | Finals Roster Position |
| PROC-0002 | Continental Draft Combine | FIFA Member Federation | Final Four Invitation |
| PROC-0003 | Regional Wildcard Series | USATF Athletic License | Playoff Wildcard Spot |
| PROC-0004 | North American Open Bracket | USATF Athletic License | Playoff Wildcard Spot |

Anchored to these identifiers are the attribute definitions that govern how properties of each entity are typed and validated. The SOC 2 trust criterion attribute table declares attributes such as effective_date, enforcement, mandatory, and priority, each bound to an XML Schema type—xsd:date, xsd:string, xsd:boolean, xsd:integer—thereby establishing a schema-on-read discipline that constrains the values permitted in the corresponding value tables. This separation of attribute metadata from attribute values is the structural mechanism that enables the model to store heterogeneous data without sacrificing type safety: boolean values flow into the boolean value table, dates into the date value table, integers into the integer value table, and free-form strings into the varchar value table, each table keyed by the same entity_id and attr_id columns that reference back to the criterion and its attribute definition.

**t_soc2_trust_criterion_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CRIT-0001 | effective_date | xsd:date |
| CRIT-0002 | enforcement | xsd:string |
| CRIT-0003 | mandatory | xsd:boolean |
| CRIT-0004 | priority | xsd:integer |
| CRIT-0005 | review_cycle_days | xsd:integer |
| CRIT-0006 | scope | xsd:string |
| CRIT-0007 | encoding | xsd:string |
| CRIT-0008 | label_text | xsd:string |

**t_soc2_trust_criterion_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0003 | false |
| CRIT-0002 | CRIT-0002 | CRIT-0003 | false |
| CRIT-0003 | CRIT-0003 | CRIT-0003 | true |
| CRIT-0004 | CRIT-0004 | CRIT-0003 | false |
| CRIT-0005 | CRIT-0005 | CRIT-0003 | false |
| CRIT-0006 | CRIT-0006 | CRIT-0003 | false |

**t_soc2_trust_criterion_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0001 | 2025-04-05 |
| CRIT-0002 | CRIT-0002 | CRIT-0001 | 2024-03-02 |
| CRIT-0003 | CRIT-0003 | CRIT-0001 | 2023-07-21 |
| CRIT-0004 | CRIT-0004 | CRIT-0001 | 2023-05-30 |
| CRIT-0005 | CRIT-0005 | CRIT-0001 | 2023-01-08 |
| CRIT-0006 | CRIT-0006 | CRIT-0001 | 2024-01-19 |

**t_soc2_trust_criterion_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0004 | 2 |
| CRIT-0002 | CRIT-0001 | CRIT-0005 | 749 |
| CRIT-0003 | CRIT-0002 | CRIT-0004 | 4 |
| CRIT-0004 | CRIT-0002 | CRIT-0005 | 767 |
| CRIT-0005 | CRIT-0003 | CRIT-0004 | 3 |
| CRIT-0006 | CRIT-0003 | CRIT-0005 | 559 |
| CRIT-0007 | CRIT-0004 | CRIT-0004 | 1 |
| CRIT-0008 | CRIT-0004 | CRIT-0005 | 187 |

**t_soc2_trust_criterion_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CRIT-0001 | CRIT-0001 | CRIT-0007 | Encoding 01 |
| CRIT-0002 | CRIT-0001 | CRIT-0002 | Enforcement 02 |
| CRIT-0003 | CRIT-0001 | CRIT-0008 | change rationale |
| CRIT-0004 | CRIT-0001 | CRIT-0009 | en |
| CRIT-0005 | CRIT-0001 | CRIT-0006 | Scope 05 |
| CRIT-0006 | CRIT-0002 | CRIT-0007 | Encoding 06 |
| CRIT-0007 | CRIT-0002 | CRIT-0002 | Enforcement 07 |
| CRIT-0008 | CRIT-0002 | CRIT-0008 | audit excerpt |

The value tables themselves embody a vertical partitioning strategy that maps each entity-attribute pair to a typed value column. For instance, the mandatory attribute (attr_id CRIT-0003) holds boolean values across four entities, with CRIT-0003 itself evaluating to true while CRIT-0001, CRIT-0002, and CRIT-0004 evaluate to false; the effective_date attribute (attr_id CRIT-0001) stores dates ranging from 2023-05-30 to 2025-04-05; and the priority attribute (attr_id CRIT-0004) carries integer values of 2 and 4. The varchar value table captures string-valued attributes such as Encoding 01, Enforcement 02, change rationale, and en, each associated with distinct attribute identifiers (CRIT-0007, CRIT-0002, CRIT-0008, CRIT-0009) on the same entities. This design permits each SOC 2 trust criterion—whether belonging to CyberShield Ltd, DataVault Inc, CloudScale Services, or HealthSys Networks and whether addressing Transaction Accuracy, Data Privacy, or Security—to carry an arbitrary set of typed properties without requiring schema migrations.

Beyond the SOC 2 domain, the model extends into anatomical and procedural ontologies that share the same structural patterns. The ganglion cyst tissue origin table assigns tissue origins such as sacroiliac joint, metacarpophalangeal joint, subacromial bursa, and first dorsal compartment to identifiers ORIG-0001 through ORIG-0004, while the part-of table maps those same identifiers to connective tissue structures including periosteal layer, joint capsule, deep fascia, and fibrous adventitia. A junction table then relates ganglion origins to part-of structures through a role column, establishing directed relationships with roles such as reviewer, contributor, and owner; for example, ganglion ORIG-0007 is linked to tissue origin ORIG-0001 with the role reviewer, while ganglion ORIG-0002 is linked to tissue origin ORIG-0006 with the role owner. The subject and target columns in this junction table function as foreign keys into the ganglion and part-of tables respectively, creating a graph of anatomical composition that mirrors the entity-attribute-value pattern in its use of typed relationships.

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

The qualification process table closes the model by capturing procedural workflows that bind membership requirements to championship outcomes. Processes such as the Regional Wildcard Series, Continental Draft Combine, and North American Open Bracket are each identified by a PROC- prefixed key and specify a requires_membership column that references registrations like FIDE Master Rating, FIFA Member Federation, and USATF Athletic License, alongside a yields_championship_entry column that produces outcomes such as Finals Roster Position, Final Four Invitation, and Playoff Wildcard Spot. This table demonstrates how the same identifier-driven, foreign-keyed architecture that supports typed attribute storage and anatomical relationship graphs also governs business-process mappings, ensuring that every qualification, membership, and championship entry can be traced, queried, and constrained through the same referential infrastructure.