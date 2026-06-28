---
chapter_id: ch_live_measurement_observed_at_ac8844
topic_id: 138
family: 02_observation_measurement
cited_terms: ['measurement_observed_at', 'syscall_traceable', 'cardinality_max_one_generic']
model: engine-refine
---

In operational telemetry and compliance-oriented data governance, every durable fact must be anchored by a stable identifier that survives joins, reprocessing, and audit replay without ambiguity. Identifiers such as OBSE-0001 through OBSE-0004 denote distinct measurement observations—temperature gradient, packet loss, wind shear, and network latency—each tied to a concrete locus of collection (Monitoring Station Bravo, Observatory Dome 2, Lab Bench 7B, Weather Mast Delta). The identifier is not merely a surrogate key; it is the contractual handle by which downstream systems assert that a given row in a value store, an attribute definition, and a parent entity record refer to the same real-world assertion. Where governance frameworks require lineage, identifiers propagate into fact tables and dimension tables alike, so that TRAC-0001, TRAC-0003, and their siblings can be referenced consistently when event volumes are aggregated or when traceability labels are resolved to human-readable categories.

**t_measurement_observed_at**

| id | measurement | observed_at |
| --- | --- | --- |
| OBSE-0001 | temperature gradient | Monitoring Station Bravo |
| OBSE-0002 | packet loss | Observatory Dome 2 |
| OBSE-0003 | wind shear | Lab Bench 7B |
| OBSE-0004 | network latency | Weather Mast Delta |
| OBSE-0005 | pH level | Telemetry Gateway Alpha |
| OBSE-0006 | pH level | Calibration Rack 9 |

An entity, in this domain, is the governed object about which attributes are asserted. Each observation entity carries a primary measurement and an observed-at context, while supplementary properties are not flattened into wide columns but decomposed into named attributes. Attributes—confidence, dimension_kind, method, recorded_at—are declared separately from their values, with each attribute bound to an attr_type that prescribes validation, storage, and interchange semantics. The attr_type vocabulary draws on XSD primitives: xsd:decimal for numeric confidence scores, xsd:string for categorical or textual qualifiers, and xsd:dateTime for temporal stamps. This separation matters in practice because a single entity may hold heterogeneous properties whose values land in type-specific stores; OBSE-0001, for instance, contributes a decimal confidence of 0.528, a varchar dimension_kind of “Dimension Kind 01,” and shares recorded_at values drawn from the datetime store with peer entities whose timestamps range from 2023-09-12T00:10:32 through 2024-12-09T20:37:11. Attribute typing thus functions as a compile-time contract: processors refuse to coerce a calibration record or an encoding label into a datetime column, and auditors can verify that each misc value—misc being the operational term for the stored payload regardless of physical column name—was persisted under the correct type regime.

**t_measurement_observed_at_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSE-0001 | confidence | xsd:decimal |
| OBSE-0002 | dimension_kind | xsd:string |
| OBSE-0003 | method | xsd:string |
| OBSE-0004 | recorded_at | xsd:dateTime |
| OBSE-0005 | uncertainty | xsd:decimal |
| OBSE-0006 | unit | xsd:string |
| OBSE-0007 | value | xsd:decimal |
| OBSE-0008 | encoding | xsd:string |

**t_measurement_observed_at_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0004 | 2023-12-12T12:05:13 |
| OBSE-0002 | OBSE-0002 | OBSE-0004 | 2024-12-09T20:37:11 |
| OBSE-0003 | OBSE-0003 | OBSE-0004 | 2023-09-12T00:10:32 |
| OBSE-0004 | OBSE-0004 | OBSE-0004 | 2024-08-27T19:17:19 |
| OBSE-0005 | OBSE-0005 | OBSE-0004 | 2025-06-14T14:45:22 |
| OBSE-0006 | OBSE-0006 | OBSE-0004 | 2023-03-29T14:19:26 |

**t_measurement_observed_at_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0001 | 0.528 |
| OBSE-0002 | OBSE-0001 | OBSE-0005 | 280.63 |
| OBSE-0003 | OBSE-0001 | OBSE-0007 | 384.95 |
| OBSE-0004 | OBSE-0002 | OBSE-0001 | 0.215 |
| OBSE-0005 | OBSE-0002 | OBSE-0005 | 900.19 |
| OBSE-0006 | OBSE-0002 | OBSE-0007 | 524.13 |
| OBSE-0007 | OBSE-0003 | OBSE-0001 | 0.738 |
| OBSE-0008 | OBSE-0003 | OBSE-0005 | 695.46 |

**t_measurement_observed_at_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSE-0001 | OBSE-0001 | OBSE-0002 | Dimension Kind 01 |
| OBSE-0002 | OBSE-0001 | OBSE-0008 | Encoding 02 |
| OBSE-0003 | OBSE-0001 | OBSE-0009 | calibration record |
| OBSE-0004 | OBSE-0001 | OBSE-0010 | de |
| OBSE-0005 | OBSE-0001 | OBSE-0003 | hybrid |
| OBSE-0006 | OBSE-0001 | OBSE-0006 | nm |
| OBSE-0007 | OBSE-0002 | OBSE-0002 | Dimension Kind 07 |
| OBSE-0008 | OBSE-0002 | OBSE-0008 | Encoding 08 |

Category complements identifier and entity by supplying a controlled vocabulary for grouping traceability mechanisms without collapsing distinct keys. In the traceable-by dimension, TRAC-0001 through TRAC-0004 each carry a traceable_by_label (Traceable By Label 01 through 04) and a traceable_by_category (Traceable By Category 01 through 04), so that reporting can roll up events by category while preserving key-level granularity. Traceable_by itself names the provenance or instrumentation channel through which an action or syscall became observable: which agent, which hook, which audit partition. Fact_syscall binds traceable_by_key to event_count, quantifying how many events a given traceability path absorbed—238 and 198 events associated with TRAC-0003 and TRAC-0001 respectively, 52 and 382 under other keys—so that compliance reviewers can detect anomalous spikes or silent channels. The pattern is characteristic of star-schema governance: a conformed dimension (dim_traceable_by) enriches facts (fact_syscall) while keys remain stable across ETL cycles.

**fact_syscall**

| id | traceable_by_key | event_count |
| --- | --- | --- |
| TRAC-0001 | TRAC-0003 | 238 |
| TRAC-0002 | TRAC-0003 | 52 |
| TRAC-0003 | TRAC-0001 | 198 |
| TRAC-0004 | TRAC-0004 | 382 |
| TRAC-0005 | TRAC-0004 | 283 |
| TRAC-0006 | TRAC-0005 | 288 |

Cardinality constraints, though recorded in a generic pairing table, articulate how entities may relate to auxiliary registries without violating uniqueness or optionality rules. Cardinalities such as mandatory_one, strict_unique, singular_ref, and first_match govern whether a measurement must possess exactly one related device_metrics row, whether asset_registry links must be globally unique, or whether config_params resolution follows first-match semantics. These rules interact with the attribute model: when entity_id and attr_id repeat across value tables, as they do for OBSE-0001 accumulating multiple typed misc entries, the framework still enforces that each (entity, attr) pair respects the declared cardinality and type. A confidence reading of 0.215 on OBSE-0002 and supplementary decimals 280.63 and 384.95 on OBSE-0001 illustrate that entities may carry multiple numeric facets, but only where attribute definitions and cardinality policies permit it.

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

Taken together, identifier, entity, attr, attr_type, misc, category, traceable_by, and event_count form a layered evidentiary stack. Identifiers stitch observations to locations and timestamps; entities name what was measured; attributes and their types declare what may be said about each entity and where values must live; misc holds the evidentiary payload; categories classify traceability for aggregate control; traceable_by and event_count connect operational facts to audit volume. Practitioners who internalize this decomposition can reconstruct provenance from partial extracts, validate inbound feeds before promotion, and produce defensible compliance narratives in which every quoted value—whether a wind-shear observation at Weather Mast Delta or 382 syscall events under TRAC-0004—traces to a typed attribute on a keyed entity within a categorized traceability frame.

**dim_traceable_by**

| id | traceable_by_label | traceable_by_category |
| --- | --- | --- |
| TRAC-0001 | Traceable By Label 01 | Traceable By Category 01 |
| TRAC-0002 | Traceable By Label 02 | Traceable By Category 02 |
| TRAC-0003 | Traceable By Label 03 | Traceable By Category 03 |
| TRAC-0004 | Traceable By Label 04 | Traceable By Category 04 |
| TRAC-0005 | Traceable By Label 05 | Traceable By Category 05 |
| TRAC-0006 | Traceable By Label 06 | Traceable By Category 06 |