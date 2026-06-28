---
chapter_id: ch_live_xdp_action_drop_916368
topic_id: 94
family: 07_long_tail
cited_terms: ['xdp_action_drop', 'belief_interval_at_confidence_level', 'directive_supersedes_directive']
model: engine-refine
---

In governed operational metadata, an identifier is the durable handle by which every record remains addressable across ingestion, audit, and supersession without ambiguity. Identifiers are not merely surrogate keys; they encode lineage and class membership through stable prefixes and ordinal suffixes, so that DROP-0001 through DROP-0004 denote distinct XDP packet-drop actions, LEVE-0001 through LEVE-0004 denote belief-interval observations at stated confidence levels, and DIRE-0001 through DIRE-0004 denote directives in a supersession chain. When an XDP drop action on wlan0_monitor is bound to directive DIRE-0004, or when a calibration-drift belief interval is assessed at confidence level DIRE-0002, the identifier is what permits downstream systems to join operational fact to normative obligation without re-deriving identity from free text. The same identifier often appears twice in the value layer—once as the row’s own primary key and again as entity_id—because the system deliberately separates “this assertion row” from “the entity to which the assertion applies,” a distinction that becomes essential when one entity carries many typed attribute instances over time.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | DIRE-0004 |
| DROP-0002 | veth1_filter | DIRE-0008 |
| DROP-0003 | docker0_hook | DIRE-0006 |
| DROP-0004 | nfqueue_bridge | DIRE-0003 |
| DROP-0005 | eth0_ingress | DIRE-0007 |
| DROP-0006 | wlan0_monitor | DIRE-0002 |

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_belief_interval_at_confidence_level**

| id | belief | at_confidence_level |
| --- | --- | --- |
| LEVE-0001 | Calibration drift reading | DIRE-0002 |
| LEVE-0002 | Query result set | DIRE-0003 |
| LEVE-0003 | Schema migration status | DIRE-0007 |
| LEVE-0004 | Sensor telemetry snapshot | DIRE-0002 |
| LEVE-0005 | Data lineage trace | DIRE-0002 |
| LEVE-0006 | Pipeline throughput metric | DIRE-0005 |
| LEVE-0007 | Schema migration status | DIRE-0002 |
| LEVE-0008 | Lab assay concentration | DIRE-0006 |

**t_belief_interval_at_confidence_level_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LEVE-0001 | confidence | xsd:decimal |
| LEVE-0002 | dimension_kind | xsd:string |
| LEVE-0003 | method | xsd:string |
| LEVE-0004 | recorded_at | xsd:dateTime |
| LEVE-0005 | uncertainty | xsd:decimal |
| LEVE-0006 | unit | xsd:string |
| LEVE-0007 | value | xsd:decimal |
| LEVE-0008 | encoding | xsd:string |

**t_belief_interval_at_confidence_level_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0004 | 2023-02-13T08:09:52 |
| LEVE-0002 | LEVE-0002 | LEVE-0004 | 2025-01-26T05:24:46 |
| LEVE-0003 | LEVE-0003 | LEVE-0004 | 2023-02-11T13:24:10 |
| LEVE-0004 | LEVE-0004 | LEVE-0004 | 2025-05-13T04:15:37 |
| LEVE-0005 | LEVE-0005 | LEVE-0004 | 2025-01-29T02:47:20 |
| LEVE-0006 | LEVE-0006 | LEVE-0004 | 2023-06-10T12:00:26 |
| LEVE-0007 | LEVE-0007 | LEVE-0004 | 2023-12-02T09:08:00 |
| LEVE-0008 | LEVE-0008 | LEVE-0004 | 2023-02-02T13:44:49 |

**t_belief_interval_at_confidence_level_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0001 | 0.649 |
| LEVE-0002 | LEVE-0001 | LEVE-0005 | 174.38 |
| LEVE-0003 | LEVE-0001 | LEVE-0007 | 717.12 |
| LEVE-0004 | LEVE-0002 | LEVE-0001 | 0.339 |
| LEVE-0005 | LEVE-0002 | LEVE-0005 | 870.57 |
| LEVE-0006 | LEVE-0002 | LEVE-0007 | 357.58 |
| LEVE-0007 | LEVE-0003 | LEVE-0001 | 0.361 |
| LEVE-0008 | LEVE-0003 | LEVE-0005 | 687.09 |

**t_belief_interval_at_confidence_level_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0002 | Dimension Kind 01 |
| LEVE-0002 | LEVE-0001 | LEVE-0008 | Encoding 02 |
| LEVE-0003 | LEVE-0001 | LEVE-0009 | audit excerpt |
| LEVE-0004 | LEVE-0001 | LEVE-0010 | en |
| LEVE-0005 | LEVE-0001 | LEVE-0003 | manual |
| LEVE-0006 | LEVE-0001 | LEVE-0006 | ms |
| LEVE-0007 | LEVE-0002 | LEVE-0002 | Dimension Kind 07 |
| LEVE-0008 | LEVE-0002 | LEVE-0008 | Encoding 08 |

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

An entity is the subject of description: the packet-filter hook, the belief measurement, the compliance directive, or any other governed object whose properties must be recorded, validated, and retrieved as a coherent whole. Entity identity is carried by entity_id in the value store and is always resolvable back to a canonical record in the entity’s home relation—DROP-0002 for veth1_filter, LEVE-0003 for schema-migration status, DIRE-0003 for NERC CIP-003. Multiplicity is ordinary rather than exceptional. DROP-0001 may simultaneously hold a checksum string, a created_date, a designative identifier, and a license term, each stored as a separate value row keyed to the same entity_id but differing attr_id. Likewise, LEVE-0001 accumulates a decimal confidence of 0.649, a dimension_kind of “Dimension Kind 01,” a method of “Encoding 02,” and a recorded_at timestamp of 2023-02-13T08:09:52. Treating the entity as the anchor and attributes as orthogonal facets is what allows heterogeneous evidence—network enforcement posture, statistical belief, regulatory text—to coexist in one governance fabric without collapsing distinct concerns into a single wide table.

An attr (attribute) names a single describable facet of an entity and is registered independently of any particular value assignment. Attribute definitions declare attr_name values such as checksum, created_date, confidence, effective_date, enforcement, and mandatory, each bound to a definition-level identifier (DROP-0002 for created_date on drop actions, LEVE-0001 for confidence on belief intervals, DIRE-0003 for mandatory on directives). Separating attribute identity from entity identity is deliberate: created_date is always created_date whether it annotates DROP-0001 on 2025-02-22 or DROP-0004 on 2023-05-09, and mandatory remains the same boolean predicate whether it evaluates true for DIRE-0001 and DIRE-0003 or false for DIRE-0002 and DIRE-0004. In the value layer, attr_id selects which facet is being asserted for a given entity_id pair, so that attr_id DROP-0002 consistently denotes the created_date facet across all drop-action date rows, while attr_id DIRE-0001 consistently denotes effective_date across directive records ranging from 2024-04-11 to 2023-10-24. This indirection is what makes attribute catalogs reusable, versionable, and auditable: renaming or retyping a facet touches the definition once, and all entity bindings inherit the corrected semantics.

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

attr_type assigns each attribute a machine-checkable datatype drawn from shared vocabularies, principally XML Schema datatypes (xsd:string, xsd:date, xsd:dateTime, xsd:decimal, xsd:integer, xsd:boolean) and, where domain semantics exceed lexical structure, ontology-specific classes such as cco:DesignativeICE for designative identifiers. The type is not decorative metadata; it governs storage partition, validation, and interchange. created_date is xsd:date and therefore lands in date-valued relations; confidence is xsd:decimal and is stored with fractional precision (0.649, 0.339); mandatory is xsd:boolean and admits only true or false; recorded_at is xsd:dateTime and preserves timezone-agnostic instants. When identifier on a drop action is typed cco:DesignativeICE rather than xsd:string, the system signals that values like urn:uuid:9f2a are not arbitrary text but formally designative referents within an integrated concept scheme. Enforcement of attr_type at write time prevents category errors that would otherwise corrupt analytics—treating a priority integer (2, 436, 3, 990) as a string, or coercing a license token (CC-BY-4.0) into a date— and it is the bridge between human-readable attribute names and interoperable serialization on the wire.

misc, in this architecture, is the typed payload held in the value column of a partition-specific value relation: the miscellaneous-in-name-only residue of assertion once entity and attribute have been factored out. Despite the label, misc is never semantically opaque; each value is misc only relative to the enclosing row’s structural role, and its interpretation is fully determined by the attr_id → attr_type chain. A misc of 1a4b6c2d under checksum, CC-BY-4.0 under license, us-east-1 under an undeclared varchar facet, and 265 or 394 under integer facets are all concrete operational facts about DROP-0001 and DROP-0002. On the belief side, misc carries 717.12 and 174.38 as decimal measurements, “audit excerpt” and “en” as lexical annotations, and ISO-8601 datetimes as observation stamps. Directive misc includes enforcement strings (“Encoding 01,” “Enforcement 02”), effective dates, and boolean mandatory flags that directly condition whether PCI DSS v4.0 or NERC CIP-003 entries are binding in a given compliance posture. Because misc values are sharded into type-homogeneous tables (val_date, val_int, val_varchar, val_boolean, val_decimal, val_datetime), query planners and validators encounter uniform columns within each partition while the cross-table union semantics remain recoverable through identifier joins.

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

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

Taken together, identifier, entity, attr, attr_type, and misc implement a normalized assertion model well suited to compliance and operations evidence that must survive supersession, partial description, and multi-standard typing. Identifiers knit XDP enforcement artifacts to the directives that authorize them; entities aggregate the resulting property graph; attrs define the vocabulary of what may be said; attr_types constrain how it may be said truthfully; and misc holds what was actually said at a point in time. A reviewer tracing why veth1_filter carries created_date 2023-10-04, why schema-migration belief at LEVE-0003 references DIRE-0007, or why DIRE-0004’s mandatory flag is false can follow the same join pattern in every domain: resolve entity by identifier, resolve facet by attr, confirm legality by attr_type, and read the evidentiary misc under those constraints. That uniformity is the practical payoff—governance logic scales across network policy, statistical belief, and regulatory directive without bespoke schemas per subject matter, while the evidentiary density of the underlying data (concrete hooks, confidence levels, standard names, and typed values) remains fully recoverable for audit and operational decision-making.