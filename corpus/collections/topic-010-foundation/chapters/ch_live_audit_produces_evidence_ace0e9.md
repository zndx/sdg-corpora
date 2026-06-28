---
chapter_id: ch_live_audit_produces_evidence_ace0e9
topic_id: 10
family: 07_long_tail
cited_terms: ['audit_produces_evidence', 'measurement_with_unit', 'ebpfprogram_not_unloaded']
model: engine-refine
---

In compliance and operational telemetry systems, durable reference is established first through the identifier, a stable token that survives renaming, reclassification, and cross-system federation without collapsing distinct records into a single narrative. Evidence artifacts carry identifiers such as EVID-0001 through EVID-0004, each anchoring a distinct audit outcome—Data Retention Policy Audit, ISO27001 Certification, or repeated Cloud Infrastructure Scan engagements—so that downstream controls, retention schedules, and certification renewals can cite the same object across years of governance activity. The same discipline applies outside the audit domain: measurement definitions (UNIT-0001–UNIT-0004) and eBPF program instances (UNLO-0001–UNLO-0004) receive their own identifier namespaces, permitting heterogeneous inventories—blood pressure versus network latency, flow_dissector versus kretprobe_mmap—to coexist in one repository without collision. Identifier design is therefore not merely syntactic convenience; it is the contractual substrate on which traceability, non-repudiation, and differential access control depend.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

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

**t_ebpfprogram_not_unloaded**

| id | ebpfprogram | ebpfprogram_2 |
| --- | --- | --- |
| UNLO-0001 | flow_dissector | tracepoint_sched_switch |
| UNLO-0002 | cgroup_device | perf_event_open |
| UNLO-0003 | socket_cookie | xdp_router |
| UNLO-0004 | kretprobe_mmap | cgroup_device |
| UNLO-0005 | netns_attach | flow_dissector |
| UNLO-0006 | cgroup_skb_ingress | cgroup_device |

The entity is the governed object to which assertions attach. In attribute-value encodings, entity does not denote a table row in the abstract but the particular instance whose properties are being recorded: EVID-0001 as the evidence record entitled to a confidence score, an ISO27001 certification at EVID-0002 entitled to its own confidence and timestamp, or UNLO-0001 as the flow_dissector program entitled to checksum, license, and deployment metadata. Separating entity from identifier allows the same identifier to function simultaneously as primary key, foreign key, and semantic handle—EVID-0001 appears as entity_id when binding the decimal 0.658 to confidence and again when binding Dimension Kind 01 to a categorical descriptor—while preserving the interpretive rule that all values sharing an entity_id describe one coherent subject of compliance or operations. Entity granularity is a governance choice: too coarse and heterogeneous measurements collapse; too fine and relational integrity fragments across review cycles.

Attributes name the dimensions along which entities are characterized, and attr_type declares the interpretive contract under which each named property must be stored, validated, and compared. Declaring confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime routes each assertion into a type-specialized value store rather than forcing a single untyped column to absorb incompatible semantics. The eBPF inventory extends this pattern with richer typing: created_date as xsd:date, identifier as cco:DesignativeICE, checksum and license as xsd:string, license values such as MPL-2.0 and regional deployment tags such as us-east-1 then inherit the validation and display rules appropriate to their declared types. attr_type is thus the bridge between governance vocabulary—what auditors and operators agree to measure—and physical representation; mis-typed attributes undermine aggregation (summing timestamps), break ordering (lexicographic sort of decimals), and invalidate cross-framework mappings to external ontologies.

**t_ebpfprogram_not_unloaded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNLO-0001 | checksum | xsd:string |
| UNLO-0002 | created_date | xsd:date |
| UNLO-0003 | identifier | cco:DesignativeICE |
| UNLO-0004 | license | xsd:string |
| UNLO-0005 | mime_type | xsd:string |
| UNLO-0006 | size_bytes | xsd:long |
| UNLO-0007 | uri | xsd:string |
| UNLO-0008 | version | xsd:integer |

Concrete property values reside in the misc role: the typed payload bound to an (entity, attr) pair at a point in time or configuration state. For audit evidence, misc manifests as 0.814 confidence on ISO27001 Certification, 291.89 and 838.98 as decimal measurements on a single evidence entity, and recorded_at instants spanning 2023-02-07T18:23:26 through 2025-03-28T10:19:21—temporal anchors that allow retention-policy findings to be sequenced against certification events and repeated infrastructure scans. In the eBPF domain, misc carries operational fingerprints (checksum 9d2b7a16), designative identifiers (oid:1.3.6.1), integer counters (186, 206), and creation dates (2025-04-28, 2025-06-17) that together establish program provenance and runtime posture. Because misc is always interpreted through its attr_type, the same lexical token cannot silently change meaning; a string labeled license remains a license assertion, not an arbitrary annotation.

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

**t_ebpfprogram_not_unloaded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0002 | 2025-04-28 |
| UNLO-0002 | UNLO-0002 | UNLO-0002 | 2025-01-07 |
| UNLO-0003 | UNLO-0003 | UNLO-0002 | 2025-02-14 |
| UNLO-0004 | UNLO-0004 | UNLO-0002 | 2025-06-17 |
| UNLO-0005 | UNLO-0005 | UNLO-0002 | 2025-05-28 |
| UNLO-0006 | UNLO-0006 | UNLO-0002 | 2023-03-06 |

**t_ebpfprogram_not_unloaded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0006 | 186 |
| UNLO-0002 | UNLO-0001 | UNLO-0008 | 5 |
| UNLO-0003 | UNLO-0002 | UNLO-0006 | 206 |
| UNLO-0004 | UNLO-0002 | UNLO-0008 | 3 |
| UNLO-0005 | UNLO-0003 | UNLO-0006 | 203 |
| UNLO-0006 | UNLO-0003 | UNLO-0008 | 2 |
| UNLO-0007 | UNLO-0004 | UNLO-0006 | 499 |
| UNLO-0008 | UNLO-0004 | UNLO-0008 | 1 |

**t_ebpfprogram_not_unloaded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNLO-0001 | UNLO-0001 | UNLO-0001 | 9d2b7a16 |
| UNLO-0002 | UNLO-0001 | UNLO-0003 | oid:1.3.6.1 |
| UNLO-0003 | UNLO-0001 | UNLO-0004 | MPL-2.0 |
| UNLO-0004 | UNLO-0001 | UNLO-0009 | us-east-1 |
| UNLO-0005 | UNLO-0001 | UNLO-0005 | application/json |
| UNLO-0006 | UNLO-0001 | UNLO-0010 | Name 06 |
| UNLO-0007 | UNLO-0001 | UNLO-0011 | analytics |
| UNLO-0008 | UNLO-0001 | UNLO-0012 | Tags 08 |

Not all governance knowledge reduces to entity-bound properties. Many compliance statements are inherently relational: they assert how one governed object stands with respect to another, and for that purpose subject, target, and role form a typed triple. In measurement–unit associations, the subject (measurement_id) names the quantity under definition—network latency, ozone concentration, seismic magnitude—while the target (unit_id) names the unit in which that quantity is expressed—milliseconds, milligrams per deciliter, Richter scale, beats per minute—and role qualifies the nature of the linkage rather than leaving it implicit. Assigning owner to the association between UNIT-0004 and UNIT-0001, reviewer to UNIT-0002 with UNIT-0002, and observer to another pairing makes explicit that identical subject–target pairs may coexist under different participatory semantics, a distinction material to separation-of-duties controls and to audit trails that must show who attested, who approved, and who merely witnessed a mapping. The same relational vocabulary extends by analogy to program coexistence assertions—flow_dissector paired with tracepoint_sched_switch, cgroup_device with cgroup_device—where subject and target identify endpoints and role would encode dependency, supervision, or conflict if elaborated in the schema.

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

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role implement a layered information architecture suited to evidence-heavy operations. Identifiers and entities stabilize what is being governed; attributes and attr_types declare what may be said and how it may be stored; misc records what was actually said; and subject–target–role triples capture relational structure that flat attribute bags cannot express. Operational practice therefore treats attr_type assignment, entity boundary definition, and role enumeration as policy decisions with the same rigor as control selection itself, because errors at this layer propagate unchanged into certification dashboards, automated scan correlation, and kernel-telemetry inventories long before any human reviewer inspects a single nonconformance.