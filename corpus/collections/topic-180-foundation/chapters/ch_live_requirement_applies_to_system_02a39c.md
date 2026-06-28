---
chapter_id: ch_live_requirement_applies_to_system_02a39c
topic_id: 180
family: 03_directive_governance
cited_terms: ['requirement_applies_to_system', 'ringbuf_map_subclass', 'schemaorg_product_price']
model: engine-refine
---

Governance and compliance systems treat durable facts as typed assertions bound to stable keys. An identifier is that key: the canonical handle by which a record is retrieved, compared across pipelines, and cited in audit trails without ambiguity. Requirement bindings to monitored systems carry identifiers such as SYST-0001 through SYST-0004, each anchoring a distinct obligation—latency under 50ms, audit logging enabled, encryption at rest, backup frequency daily—so that downstream enforcement, reporting, and exception handling always resolve to exactly one governed object rather than to a display label or transient configuration name.

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

**t_ringbuf_map_subclass**

| id | ringbuf |
| --- | --- |
| MAP-0001 | metrics capture ring |
| MAP-0002 | diagnostic trace buffer |
| MAP-0003 | audit log ring |
| MAP-0004 | sensor stream buffer |
| MAP-0005 | diagnostic trace buffer |
| MAP-0006 | event queue ring |
| MAP-0007 | telemetry fifo ring |

The entity is the thing those assertions describe: the governed object itself, not the assertion row and not the storage partition. In attribute–value models, entity_id ties each stored value back to its bearer; SYST-0001 may simultaneously carry an effective_date of 2025-05-21, a mandatory flag of false, and varchar miscellany such as Encoding 01 or Enforcement 02, while SYST-0002 carries 2024-02-21, mandatory true, and integer priorities 5 and 295 on related attribute slots. Separating entity from identifier matters because identifiers proliferate across junction and history tables, whereas the entity remains the semantic constant whose compliance posture reviewers must interpret.

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

Attributes name the dimensions along which an entity may be characterized, and attr_type fixes the legal shape of whatever may be stored under that name. Declared attributes effective_date, enforcement, mandatory, and priority are typed respectively as xsd:date, xsd:string, xsd:boolean, and xsd:integer, which is why boolean misc values land in one persistence path (false for SYST-0001 and SYST-0004, true for SYST-0002 and SYST-0003 on mandatory), dates in another (2023-05-13 through 2025-05-21), integers in another (1, 391, 5, 295), and residual string misc in varchar (audit excerpt, fr). The attr_type is not decorative metadata: it is the contract that prevents category errors—treating a enforcement label as a calendar date, or a priority rank as a truth value—before data ever reaches validators, exporters, or policy engines.

Misc, in this architecture, denotes the payload held at the end of the attribute edge: the concrete value instance once entity and attr have been resolved. Whether the misc is false, 2025-05-21, 391, or Encoding 01, its meaning is always local to the triple (entity, attr, attr_type); the same column name value across typed tables does not imply interchangeable semantics. Operational guides therefore treat misc as evidentiary fact, not as a free-form comment field—suitable for machine comparison, threshold checks, and evidentiary replay—while attr and attr_type supply the interpretive frame auditors use when reconciling ostensibly identical strings that belong to different attribute definitions.

Many domains also require relationships between first-class records, and there subject, target, and role articulate directed associations without collapsing two distinct entities into one wide row. A ring-buffer subclass such as the metrics capture ring (MAP-0001) or audit log ring (MAP-0003) appears as subject linked to a target configuration record—sync mode spec, compression profile, buffer depth spec—while role states how that subject participates relative to the target: observer, reviewer, contributor, or owner, as when MAP-0001 is tied to MAP-0006 as observer and later to MAP-0007 as owner. The same pattern governs commercial catalog bindings: schemaorg subjects Apple AirPods Pro and Bose QC Ultra connect to price targets 1599 GBP, $449.95, or cross-linked PRIC-0007 rows, with role distinguishing reviewer from contributor responsibility over which price assertion is authoritative for a given product identity.

**t_ringbuf_map_subclass_ring_buffer_config**

| id | ring_buffer_config |
| --- | --- |
| MAP-0001 | sync mode spec |
| MAP-0002 | sync mode spec |
| MAP-0003 | compression profile |
| MAP-0004 | buffer depth spec |
| MAP-0005 | compression profile |
| MAP-0006 | sample rate config |
| MAP-0007 | overflow handling spec |
| MAP-0008 | compression profile |

**t_ringbuf_map_subclass__ring_buffer_config**

| id | ringbuf_id | ring_buffer_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | observer |
| MAP-0002 | MAP-0003 | MAP-0004 | reviewer |
| MAP-0003 | MAP-0005 | MAP-0004 | contributor |
| MAP-0004 | MAP-0001 | MAP-0007 | owner |
| MAP-0005 | MAP-0002 | MAP-0006 | contributor |
| MAP-0006 | MAP-0006 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0002 | owner |
| MAP-0008 | MAP-0002 | MAP-0003 | owner |

**t_schemaorg_product_price**

| id | schemaorg |
| --- | --- |
| PRIC-0001 | Apple AirPods Pro |
| PRIC-0002 | Dyson V15 |
| PRIC-0003 | Bose QC Ultra |
| PRIC-0004 | Samsung Galaxy S24 |
| PRIC-0005 | Dyson V15 |
| PRIC-0006 | Apple AirPods Pro |

**t_schemaorg_product_price_price**

| id | price |
| --- | --- |
| PRIC-0001 | 1599 GBP |
| PRIC-0002 | 199.99 CAD |
| PRIC-0003 | $449.95 |
| PRIC-0004 | $349.00 |
| PRIC-0005 | $349.00 |
| PRIC-0006 | $349.00 |
| PRIC-0007 | 1599 GBP |

**t_schemaorg_product_price__price**

| id | schemaorg_id | price_id | role |
| --- | --- | --- | --- |
| PRIC-0001 | PRIC-0001 | PRIC-0001 | reviewer |
| PRIC-0002 | PRIC-0003 | PRIC-0007 | reviewer |
| PRIC-0003 | PRIC-0003 | PRIC-0003 | contributor |
| PRIC-0004 | PRIC-0001 | PRIC-0007 | contributor |
| PRIC-0005 | PRIC-0006 | PRIC-0002 | contributor |
| PRIC-0006 | PRIC-0002 | PRIC-0003 | contributor |
| PRIC-0007 | PRIC-0001 | PRIC-0006 | reviewer |
| PRIC-0008 | PRIC-0004 | PRIC-0006 | owner |

Taken together, identifier stabilizes reference; entity names what is governed; attr and attr_type define which questions may be asked and how answers must be encoded; misc records the answers; and subject–target–role triples express cross-entity structure when compliance, telemetry, or merchandising data must remain normalized yet richly qualified. Reviewers who internalize that separation can trace why SYST-0003’s mandatory true coexists with varchar misc audit excerpt without conflating log samples with boolean policy flags, and why PRIC-0003 may appear twice as subject with different roles toward price targets—mechanisms that keep heterogeneous evidence dense, queryable, and defensible in practice.

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |