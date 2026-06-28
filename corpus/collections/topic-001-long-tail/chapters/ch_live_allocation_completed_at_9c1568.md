---
chapter_id: ch_live_allocation_completed_at_9c1568
topic_id: 1
family: 05_provo_lineage
cited_terms: ['allocation_completed_at', 'identifier_subclass', 'hipaa_safeguard_technical']
model: engine-refine
---

Within governance architectures that must reconcile heterogeneous regulatory requirements with operational telemetry, the relational model relies on a disciplined separation between entity definitions, attribute schemas, and typed value stores. An entity represents a discrete governed object—whether a resource allocation such as `data-lake-partition` or `k8s-pod-quota`, a HIPAA safeguard designation like `Breach Notification Rule`, or an identifier binding such as `HANDLE-1234/5678` that asserts ownership over a `telemetry-stream`. Each entity receives a stable identifier, `COMP-0001` through `COMP-0004` for allocation records and `IDEN-0001` through `IDEN-0004` for identifier subclass instances, which serves as the anchor for all downstream relationships and attribute bindings. The identifier itself carries semantic weight: `SEQ-NF2024` and `SN-8842XJ` and `ACCN-GSM7829104` are not arbitrary tokens but structured handles that declare what they identify, whether a `telemetry-stream` or a `calibration-run`, thereby establishing a chain of provenance that auditors can trace from regulatory requirement to operational artifact.

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | data-lake-partition |
| COMP-0002 | storage-tier-archival |
| COMP-0003 | data-lake-partition |
| COMP-0004 | k8s-pod-quota |
| COMP-0005 | telemetry-ingest-pipe |
| COMP-0006 | k8s-pod-quota |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | telemetry-stream |
| IDEN-0002 | SEQ-NF2024 | telemetry-stream |
| IDEN-0003 | SN-8842XJ | telemetry-stream |
| IDEN-0004 | ACCN-GSM7829104 | calibration-run |
| IDEN-0005 | RUN-20231105 | wet-lab-sample |
| IDEN-0006 | GUID-f47ac10b | quality-control-report |
| IDEN-0007 | DOI-10.1234/abc | clinical-trial-arm |

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

**t_hipaa_safeguard_technical**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| TECH-0001 | Transaction Rule | Intrusion Detection |
| TECH-0002 | Data Backup | Enforcement Rule |
| TECH-0003 | Enforcement Rule | Breach Notification Rule |
| TECH-0004 | Breach Notification Rule | Privacy Rule |
| TECH-0005 | Breach Notification Rule | Transmission Security |
| TECH-0006 | Access Control | Enforcement Rule |

**t_hipaa_safeguard_technical_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TECH-0001 | effective_date | xsd:date |
| TECH-0002 | enforcement | xsd:string |
| TECH-0003 | mandatory | xsd:boolean |
| TECH-0004 | priority | xsd:integer |
| TECH-0005 | review_cycle_days | xsd:integer |
| TECH-0006 | scope | xsd:string |
| TECH-0007 | encoding | xsd:string |
| TECH-0008 | label_text | xsd:string |

**t_hipaa_safeguard_technical_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0003 | true |
| TECH-0002 | TECH-0002 | TECH-0003 | true |
| TECH-0003 | TECH-0003 | TECH-0003 | false |
| TECH-0004 | TECH-0004 | TECH-0003 | false |
| TECH-0005 | TECH-0005 | TECH-0003 | true |
| TECH-0006 | TECH-0006 | TECH-0003 | true |

**t_hipaa_safeguard_technical_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0004 | 2 |
| TECH-0002 | TECH-0001 | TECH-0005 | 620 |
| TECH-0003 | TECH-0002 | TECH-0004 | 3 |
| TECH-0004 | TECH-0002 | TECH-0005 | 784 |
| TECH-0005 | TECH-0003 | TECH-0004 | 3 |
| TECH-0006 | TECH-0003 | TECH-0005 | 568 |
| TECH-0007 | TECH-0004 | TECH-0004 | 1 |
| TECH-0008 | TECH-0004 | TECH-0005 | 831 |

**t_hipaa_safeguard_technical_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0007 | Encoding 01 |
| TECH-0002 | TECH-0001 | TECH-0002 | Enforcement 02 |
| TECH-0003 | TECH-0001 | TECH-0008 | change rationale |
| TECH-0004 | TECH-0001 | TECH-0009 | fr |
| TECH-0005 | TECH-0001 | TECH-0006 | Scope 05 |
| TECH-0006 | TECH-0002 | TECH-0007 | Encoding 06 |
| TECH-0007 | TECH-0002 | TECH-0002 | Enforcement 07 |
| TECH-0008 | TECH-0002 | TECH-0008 | intake form |

Attributes define the dimensional space in which entities are described, and their types constrain the value store to a small set of disciplined carriers. The attribute `checksum_algo` is declared as `xsd:string`, as are `code` and `format`, while `issued_date` carries the type `xsd:date`; similarly, the HIPAA safeguard attributes include `effective_date` as `xsd:date`, `enforcement` as `xsd:string`, `mandatory` as `xsd:boolean`, and `priority` as `xsd:integer`. This type discipline is not decorative—it dictates which value table receives a given binding. A date attribute such as `issued_date` resolves to a value like `2023-11-13` or `2024-05-25` stored in the date-valued table, while a string attribute like `code` resolves to `B-12` or `JSON` in the varchar-valued table, and a boolean attribute such as `mandatory` resolves to `true` or `false` in the boolean-valued table. The integer attribute `priority` accepts values like `620` or `784`. The separation of value tables by type ensures that queries can be routed to the appropriate storage format without runtime casting, and that schema evolution on one attribute type does not destabilize another.

The entity-attribute-value pattern is realized through a join that binds three components: the entity, the attribute, and the value. In the identifier subclass domain, entity `IDEN-0001` receives the attribute `IDEN-0004` (which corresponds to `issued_date`) with the value `2023-11-13`; the same entity receives attributes `IDEN-0001`, `IDEN-0002`, `IDEN-0006`, and `IDEN-0003` with varchar values `Checksum Algo 01`, `B-12`, `Encoding 03`, and `JSON` respectively. In the HIPAA domain, entity `TECH-0001` receives attribute `TECH-0003` (the `mandatory` boolean) with value `true`, and attribute `TECH-0001` (the `effective_date`) with value `2025-01-15`. The entity column in each value table is the foreign key back to the entity definition, and the attribute column is the foreign key to the attribute schema—this dual foreign-key constraint is what guarantees that every value is both semantically well-typed and semantically attributable.

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

Relationships between entities introduce a fourth dimension: the role. A junction table linking allocation records to completion timestamps does not merely assert that `COMP-0005` is associated with `COMP-0003`; it declares that the association carries the role `observer`, while the pairing of `COMP-0002` with `COMP-0005` carries the role `owner`, and the pairing of `COMP-0001` with `COMP-0002` carries the role `contributor`. The role column is itself a typed attribute of the relationship, not a free-text annotation, and it enables access control decisions, audit trail filtering, and policy evaluation that depend on the nature of the association rather than its mere existence. The subject and target columns of the junction table are the foreign keys to the two entity tables being related, and their naming convention—`allocation_id` as subject, `completed_at_id` as target—encodes the directionality of the relationship, which matters when the same pair of entities participates in multiple relationship types with different roles.

**t_allocation_completed_at__completed_at**

| id | allocation_id | completed_at_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0005 | COMP-0003 | observer |
| COMP-0002 | COMP-0006 | COMP-0003 | observer |
| COMP-0003 | COMP-0002 | COMP-0005 | owner |
| COMP-0004 | COMP-0001 | COMP-0002 | contributor |
| COMP-0005 | COMP-0004 | COMP-0004 | owner |
| COMP-0006 | COMP-0001 | COMP-0005 | owner |
| COMP-0007 | COMP-0003 | COMP-0003 | reviewer |
| COMP-0008 | COMP-0004 | COMP-0006 | observer |

The practical consequence of this architecture is that governance policies can be expressed as queries over a uniform pattern: find all entities of a given subclass, join to their attributes by type, filter on value constraints, and traverse relationships by role. A compliance officer can ask which `telemetry-stream` identifiers have an `issued_date` after `2024-05-25` and a `code` attribute matching `B-12`, or which HIPAA safeguards marked `mandatory` as `true` have an `effective_date` before `2024-09-26`. The same query engine that evaluates these policy conditions can also produce the audit artifacts required by regulators, because every value is traceable to its entity, its attribute, and its type. The identifiers `COMP-0001` through `COMP-0004` and `IDEN-0001` through `IDEN-0004` and `TECH-0001` through `TECH-0004` are not merely primary keys; they are the stable anchors that make this traceability possible across the full lifecycle of a governed resource, from initial allocation through completion, from identifier issuance through attribute mutation, from safeguard definition through enforcement.

**t_hipaa_safeguard_technical_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0001 | 2025-01-15 |
| TECH-0002 | TECH-0002 | TECH-0001 | 2025-02-09 |
| TECH-0003 | TECH-0003 | TECH-0001 | 2023-08-04 |
| TECH-0004 | TECH-0004 | TECH-0001 | 2024-09-26 |
| TECH-0005 | TECH-0005 | TECH-0001 | 2025-05-30 |
| TECH-0006 | TECH-0006 | TECH-0001 | 2024-11-22 |