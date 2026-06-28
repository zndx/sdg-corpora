---
chapter_id: ch_live_column_added_at_version_5d4c6f
topic_id: 10
family: 07_long_tail
cited_terms: ['column_added_at_version', 'ebpfprogram_only_attached_to_kprobe', 'measurement_with_unit']
model: engine-refine
---

An identifier furnishes the durable handle by which any governed record is addressed, reconciled, and cited across systems that do not share a common primary key namespace. In operational registries the identifier may be an opaque surrogate such as VERS-0001 or KPRO-0003, encoding lineage and class without embedding semantics; in bibliographic or resource catalogs it may assume an externally resolvable form, as when the same eBPF attachment row carries doi:10.1109/x alongside a program checksum. The design imperative is stability under schema migration and audit: once a column-version fact is keyed as VERS-0002, every subsequent attribute assertion, decimal observation, and datetime stamp that references that entity must resolve unambiguously, regardless of whether the underlying physical column is geo_lat_dd or air_pressure_hpa. Identifiers therefore anchor provenance chains rather than merely label rows.

**t_column_added_at_version**

| id | column | added_at_schema_version |
| --- | --- | --- |
| VERS-0001 | throughput_mbps | UNIT-0007 |
| VERS-0002 | geo_lat_dd | UNIT-0004 |
| VERS-0003 | batch_number | UNIT-0001 |
| VERS-0004 | air_pressure_hpa | UNIT-0008 |
| VERS-0005 | sensor_id | UNIT-0007 |
| VERS-0006 | throughput_mbps | UNIT-0002 |

**t_column_added_at_version_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2025-04-06T14:28:17 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-08-02T01:36:48 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2025-02-20T12:13:34 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2024-08-09T17:04:50 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2025-03-12T11:57:30 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-01-03T00:21:42 |

**t_column_added_at_version_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.705 |
| VERS-0002 | VERS-0001 | VERS-0005 | 536.45 |
| VERS-0003 | VERS-0001 | VERS-0007 | 797.42 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.546 |
| VERS-0005 | VERS-0002 | VERS-0005 | 698.14 |
| VERS-0006 | VERS-0002 | VERS-0007 | 151.31 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.806 |
| VERS-0008 | VERS-0003 | VERS-0005 | 213.36 |

**t_ebpfprogram_only_attached_to_kprobe**

| id | ebpfprogram | attaches_to_hook | checksum | identifier |
| --- | --- | --- | --- | --- |
| KPRO-0001 | xdp_drop_all | UNIT-0001 | 7b14de08 | ARN:res/41 |
| KPRO-0002 | tracepoint_sched_switch | UNIT-0003 | 9d2b7a16 | doi:10.1109/x |
| KPRO-0003 | tc_egress_rate | UNIT-0003 | 9d2b7a16 | ref-8842 |
| KPRO-0004 | flow_dissector_match | UNIT-0003 | 5e8f3c91 | doi:10.1109/x |
| KPRO-0005 | tc_ingress_filter | UNIT-0002 | 7b14de08 | oid:1.3.6.1 |
| KPRO-0006 | tracepoint_sched_switch | UNIT-0003 | 5e8f3c91 | ARN:res/41 |

The entity is the object of description—the column-version record, the measurement definition, or the deployed program—while attr names the facet under which that entity is characterized. Confidence, dimension_kind, method, and recorded_at are not columns of the base fact table; they are orthogonal metadata dimensions whose interpretation is fixed by attr_type. Typing is not decorative: xsd:decimal routes assertions into a decimal value store, xsd:string into a varchar partition, and xsd:dateTime into a datetime partition, so that validation, indexing, and interchange contracts remain type-safe at the boundary. A single entity may therefore accumulate heterogeneous annotations—VERS-0001 simultaneously carries a decimal confidence of 0.705, a varchar dimension_kind of Dimension Kind 01, and a recorded_at instant of 2025-04-06T14:28:17—without collapsing distinct semantic planes into one untyped bag.

The misc designation marks the payload held in those typed value relations: the literal that satisfies an (entity, attr) pair at assertion time. Misc is deliberately agnostic about business meaning; governance attaches meaning upstream through attr and attr_type. Numeric misc values such as 536.45 and 797.42 illustrate measurements or derived quantities bound to specific attr_id references, while textual misc including Encoding 02 and change rationale documents encoding choices and migration justification. Datetime misc values—2024-08-02T01:36:48 through 2025-02-20T12:13:34—establish temporal ordering for compliance review: they answer when a method was recorded, not what the method was. Separating misc from entity and attr preserves a normalized evidentiary model in which the same entity can be re-evaluated under revised attributes without rewriting historical literals.

Checksum closes the integrity loop for artifacts whose bytes must be shown unchanged between registration and attachment. For eBPF programs bound to kernel hooks, checksum 7b14de08 for xdp_drop_all and 5e8f3c91 for flow_dissector_match function as content fingerprints independent of the hook identifier UNIT-0003; duplicate checksum 9d2b7a16 shared by tracepoint_sched_switch and tc_egress_rate signals either identical bytecode or a collision risk that audit must resolve before production promotion. Checksum does not replace identifier: ARN:res/41 and ref-8842 provide human- and system-consumable external references, while the checksum proves that the loaded object matches the registered object. Together they satisfy a dual requirement common in regulated telemetry pipelines—traceability to an authoritative catalog and cryptographic-adjacent assurance at the deployment boundary.

Subject and target formalize directed association between two governed identifiers, specifying who binds to whom without conflating the parties. In measurement–unit governance, a measurement_id such as UNIT-0004 (Network latency) constitutes the subject—the domain concept under definition—while unit_id UNIT-0001 (milligrams per deciliter in the unit lexicon) or UNIT-0005 constitutes the target—the unit or counterparty linked to that subject. The edge is intentional and asymmetric: reversing subject and target would assert a different ontological claim. Schema-version linkage exhibits the same pattern at the column-evolution layer, where throughput_mbps entered at UNIT-0007 and batch_number at UNIT-0001, encoding which schema milestone introduced each physical column.

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

Role qualifies the subject–target edge with a governance stance that pure graph topology cannot express. An association carrying role owner assigns accountable authority over the measurement–unit pairing; reviewer and observer denote graduated participation rights in validation workflows, as when UNIT-0002 (Ozone concentration) is linked under reviewer capacity while UNIT-0008 (Seismic magnitude) appears with observer status. Role is therefore not an attribute of either endpoint identifier in isolation; it is a property of the relationship instance, controlling who may certify, who may read, and who may block publication. In composite registries that unite column-version metadata, typed attribute assertions, program checksums, and measurement governance, identifier, entity, attr, attr_type, misc, checksum, subject, target, and role interoperate as a layered compliance vocabulary: stable keys, typed facets, integrity proofs, directed bindings, and accountable participation—each necessary, none substitutable for the others.

**t_column_added_at_version_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_added_at_version_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | change rationale |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | manual |
| VERS-0006 | VERS-0001 | VERS-0006 | kg |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |