---
chapter_id: ch_live_transformation_associated_with_agent_659d32
topic_id: 38
family: 05_provo_lineage
cited_terms: ['transformation_associated_with_agent', 'ebpf_event_min_one_attribute', 'verification_subclass']
model: engine-refine
---

In governed operational telemetry and compliance systems, every record that must survive audit, replay, or cross-system reconciliation depends first upon a stable identifier—a durable surrogate key that names an instance without embedding mutable descriptive text. Identifiers such as AGEN-0001 through AGEN-0004, ATTR-0001 through ATTR-0004, and VERI-0001 through VERI-0004 function as the authoritative handles by which transformations, eBPF-derived events, and verification subclasses are referenced across association tables, attribute registries, and typed value stores; they matter because governance frameworks require that the same logical object be retrievable under the same name whether the inquiry originates in a pipeline incident review, a GDPR data-flow examination, or a security posture assessment, and because without such keys the evidentiary chain between a measured outcome and the process that produced it cannot be reconstructed. The identifier therefore precedes description: it is not the Archive Export Run or the perf_event_sample, but the token—AGEN-0001, ATTR-0001—that permits those labels to change, localize, or redact without severing lineage.

**t_ebpf_event_min_one_attribute**

| id | ebpf |
| --- | --- |
| ATTR-0001 | perf_event_sample |
| ATTR-0002 | xdp_rx_drop |
| ATTR-0003 | tc_ingress_filter |
| ATTR-0004 | perf_event_sample |
| ATTR-0005 | tracepoint_sched_switch |
| ATTR-0006 | lsm_bpf_attach |

**t_ebpf_event_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

An entity is the governed object to which observable facts attach—the concrete instance whose existence the framework must account for, distinct from the catalog entry that names what kind of thing it is. In practice, entity identifiers appear as foreign keys in value-bearing relations: ATTR-0001 may carry multiple attribute assertions (duration_seconds, end_time, exit_code, host_name among them) while ATTR-0002 receives a separate end_time of 2023-08-09T05:49:50; likewise VERI-0001 accumulates duration_seconds 5469.69, exit_code 616, host_name node-a01, and temporal stamps across coordinated review cycles, whereas VERI-0002 is associated with materially different measurements (821.61 seconds, exit_code 105). Entities matter because compliance obligations attach to instances—this calibration pass, that GDPR data flow review—not merely to class definitions; auditors and automated controls evaluate whether specific governed objects satisfied retention, accuracy, and access constraints at identifiable moments in time.

Attributes and attribute types constitute the typed vocabulary through which entities are described without collapsing heterogeneous measurements into a single undifferentiated field. An attr names the semantic dimension—duration_seconds, end_time, exit_code, host_name—while attr_type declares the interpretive contract under which values must be parsed, compared, and validated: xsd:decimal for continuous durations such as 2938.76 or 6550.82, xsd:dateTime for instants including 2024-05-05T15:51:23 and 2024-10-23T14:58:17, xsd:integer for discrete status codes (465, 59, 938, 81 in the eBPF lineage; 616, 105, 713, 29 in verification), and xsd:string for symbolic or categorical literals such as node-b14, Log Level 02, initiation, pending, review, and running. The separation of attr from attr_type matters operationally because type discipline prevents category errors—treating an exit_code as free text, or a host_name as a numeric aggregate—that would invalidate automated thresholding, SLA computation, and cross-domain joins; the same attribute names recur across eBPF event subclasses and verification subclasses precisely because shared dimensional vocabulary enables uniform reporting even when the underlying entity populations differ.

**t_ebpf_event_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-05-05T15:51:23 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2023-02-23T16:05:24 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2023-10-25T19:35:09 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-08-09T05:49:50 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2025-04-07T23:06:46 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2023-01-30T19:25:12 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2023-12-02T01:15:04 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2023-01-06T05:08:04 |

**t_ebpf_event_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 2938.76 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3337.03 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 6550.82 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 5328.03 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 811.82 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 7052.31 |

The misc designation, in this framework, denotes the stored assertion itself—the material value bound to a particular entity-attribute pair at persistence time, held in type-specialized containers so that validation rules can be enforced at write and read. Thus misc is not miscellaneous in the colloquial sense but the concrete evidentiary payload: 3337.03 seconds of observed runtime, 2023-02-23T16:05:24 as a recorded boundary instant, exit_code 81 attached to ATTR-0002, host_name pending on ATTR-0001, or verification-side readings including 4016.93, 2024-10-31T01:53:25, and running on VERI-0001. Partitioning values by type while repeating entity_id and attr_id in each partition ensures that queries remain well-typed and that integrity constraints—decimal precision, datetime timezone semantics, integer enumerations, varchar length—apply without exception. In audit practice, misc entries are the primary artifacts investigators examine; identifiers and attribute metadata establish context, but misc supplies the measurable fact on which pass-fail determinations rest.

**t_ebpf_event_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | node-b14 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | pending |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | edge-03 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | closeout |

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

Relational governance extends beyond unary description through subject–target associations qualified by role, a tripartite pattern that records who or what participated in an event, how, and in what directional capacity. Here the subject names the active or originating node in the relationship—in recorded cases transformation identifiers including AGEN-0006 and AGEN-0007 linked against association rows AGEN-0001 and AGEN-0002—while the target names the associated party or infrastructure element referenced by was_associated_with_id values such as AGEN-0001 (GitHub CI Pipeline), AGEN-0002 (Docker Container), and AGEN-0005. The role field disambiguates parallel edges that would otherwise appear equivalent: contributor, reviewer, and observer are not interchangeable labels but capacity declarations that determine accountability, approval authority, and non-binding observability, as when AGEN-0003’s Model Retraining Cycle associates with AGEN-0002 under observer and AGEN-0004’s Sensor Calibration Pass associates with AGEN-0005 under contributor. Subject–target–role triples matter because transformation provenance—Archive Export Run executed via GitHub CI Pipeline with a Senior Data Engineer as reviewer on a separate edge—cannot be inferred from attribute values alone; they supply the procedural graph on which segregation-of-duties reviews, change-management attestations, and incident root-cause analysis depend.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Archive Export Run |
| AGEN-0002 | Feature Engineering Job |
| AGEN-0003 | Model Retraining Cycle |
| AGEN-0004 | Sensor Calibration Pass |
| AGEN-0005 | Schema Migration Run |
| AGEN-0006 | Partition Pruning Step |
| AGEN-0007 | Daily ETL Pipeline |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |

**t_transformation_associated_with_agent__was_associated_with**

| id | transformation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0006 | AGEN-0001 | contributor |
| AGEN-0002 | AGEN-0007 | AGEN-0001 | reviewer |
| AGEN-0003 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0004 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0007 | AGEN-0006 | contributor |
| AGEN-0007 | AGEN-0001 | AGEN-0004 | observer |
| AGEN-0008 | AGEN-0003 | AGEN-0002 | observer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form an interlocking evidentiary grammar: identifiers stabilize reference; entities anchor obligations; attrs and attr_types standardize meaning; misc carries the measured fact; and subject–target–role bindings externalize participation structure. Operational guides that omit any layer invite reconciliation failure—duplicate entities under new keys, untyped values that resist aggregation, or associations stripped of role that collapse approvers into executors. The recurring attribute vocabulary across perf_event_sample, xdp_rx_drop, tc_ingress_filter, Compliance renewal verification, and GDPR data flow review instances demonstrates intentional schema reuse: diverse governed subclasses remain comparable because they speak the same dimensional language while preserving distinct identifier namespaces and, where required, distinct association topologies. That design is what permits a single compliance handbook to govern kernel-level telemetry and enterprise verification workflows without conflating their evidentiary objects or diluting the specificity on which determinations before the administrator—or before any designated control authority—must rest.

**t_ebpf_event_min_one_attribute_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 465 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 59 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 938 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 81 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 9 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 492 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 120 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 470 |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |