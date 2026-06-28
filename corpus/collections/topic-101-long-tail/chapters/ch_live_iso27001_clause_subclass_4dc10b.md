---
chapter_id: ch_live_iso27001_clause_subclass_4dc10b
topic_id: 101
family: 07_long_tail
cited_terms: ['iso27001_clause_subclass', 'frame_coarsening', 'ebpfmap_with_max_entries']
model: engine-refine
---

In governed information systems, stable identifiers anchor every assertion that must survive reconciliation, audit, and cross-domain linkage. An identifier is not merely a surrogate key for storage convenience; it is the durable handle by which an organization names a fact, a relationship, or a participant without collapsing distinct meanings into a single label. When a clause subclass is recorded as CLAU-0001 and later bound to ISO material and to a specific clause theme, the same identifier reappears across contexts so that “Risk treatment,” “Performance evaluation,” and “Leadership” remain distinguishable commitments rather than interchangeable text. The same discipline applies outside compliance catalogs: frame-coarsening definitions keyed as COAR-0001 through COAR-0004, and eBPF map capacity records keyed as ENTR-0001 through ENTR-0004, each preserve identity even when descriptive labels such as devmap, cgroup_storage, or quarterly region cluster are reused, abbreviated, or translated.

**t_iso27001_clause_subclass**

| id | iso |
| --- | --- |
| CLAU-0001 | Iso 01 |
| CLAU-0002 | Iso 02 |
| CLAU-0003 | Iso 03 |
| CLAU-0004 | Iso 04 |
| CLAU-0005 | Iso 05 |
| CLAU-0006 | Iso 06 |

**t_iso27001_clause_subclass_iso27001_clause**

| id | iso27001_clause |
| --- | --- |
| CLAU-0001 | Risk treatment |
| CLAU-0002 | Performance evaluation |
| CLAU-0003 | Improvement |
| CLAU-0004 | Leadership |
| CLAU-0005 | Risk treatment |
| CLAU-0006 | Risk treatment |

**t_frame_coarsening**

| id | frame | coarsens_frame |
| --- | --- | --- |
| COAR-0001 | temporal observation scope | micro batch window |
| COAR-0002 | raw sensor tick | quarterly region cluster |
| COAR-0003 | raw sensor tick | spatial zone seven |
| COAR-0004 | processing pipeline tier | raw sensor tick |
| COAR-0005 | metadata catalog level | daily telemetry window |
| COAR-0006 | hourly sensor grid | logical dataset slice |

An entity is the unit to which attributes attach—the object of record whose properties are asserted, versioned, and validated over time. Entities need not be physical assets; they may be logical constructs such as a coarsening rule that maps raw sensor tick to micro batch window, or an operational artifact such as a queue map constrained by max_entries 16384. What matters in practice is that the entity boundary defines where attribute sets begin and end, and where provenance attaches. Multiple value assertions may therefore refer to the same entity without duplicating its identity: COAR-0001 carries decimal confidence 0.517, a varchar dimension_kind of “Dimension Kind 01,” and a recorded_at timestamp of 2025-04-27T07:32:48, while COAR-0002 receives a separate confidence reading of 0.922. The entity is the stable referent; the attributes are the evolving or contextualized statements about it.

Attributes name the dimensions along which entities are described, and attribute type governs how those dimensions may legally be expressed. Attribute declarations such as confidence, dimension_kind, method, and recorded_at are meaningless without a typing contract: xsd:decimal for numeric measures, xsd:string for categorical or lexical content, and xsd:dateTime for instants that must sort, compare, and serialize consistently across pipelines. Type discipline prevents silent corruption—storing 637.59 beside 0.517 in a decimal-typed slot preserves magnitude and precision semantics, whereas forcing the same numbers into unconstrained text would break aggregation, thresholding, and control testing. In operational telemetry and compliance evidence alike, attr and attr_type jointly define the vocabulary and grammar of assertions: what may be said, and in what form it must be said, before downstream analytics or auditors can treat the data as authoritative.

The stored payload—the misc value—is the typed instantiation of an attribute on an entity at a point in the evidence chain. Misc is where abstraction meets fact: 121.11 and 637.59 as decimal readings, Encoding 02 and nightly summary as string classifications, en as a language tag, and 2023-04-01T23:44:45 as a temporal anchor. Because values are partitioned by type into dedicated stores, each misc record carries both entity_id and attr_id so that interpretation is unambiguous: the same recorded_at attribute on four distinct coarsening entities yields four different instants, documenting when each rule or transformation was captured rather than implying a single global timestamp. This pattern is essential for traceability; without entity–attribute–value binding, dashboards collapse unrelated measurements into one series and audit trails lose the ability to reconstruct who knew what, about which object, at which moment.

Subject and target formalize directed relationships between identified participants, while role states what kind of participation the binding entails. In association patterns, the subject is the node from which responsibility, ownership, or origination is asserted, and the target is the node that is referenced, governed, or qualified by that assertion. A clause subclass identified as CLAU-0001 may appear as subject iso_id CLAU-0004 relating to target iso27001_clause_id CLAU-0001 under role reviewer, encoding that a particular ISO artifact reviews a clause mapping rather than owns it; elsewhere, CLAU-0006 paired under role owner signals accountable custody. The same structural logic appears in capacity governance: ebpfmap_id ENTR-0001 as subject bound to max_entries_id ENTR-0001 as target with role owner differs materially from ENTR-0004 linked to ENTR-0006 as reviewer, even when both concern stack_trace or queue maps. Roles therefore convert a bare graph edge into an obligation surface—contributor, observer, owner, reviewer—so that access control, workflow routing, and accountability matrices can be derived without re-deriving intent from informal naming.

**t_iso27001_clause_subclass__iso27001_clause**

| id | iso_id | iso27001_clause_id | role |
| --- | --- | --- | --- |
| CLAU-0001 | CLAU-0004 | CLAU-0001 | reviewer |
| CLAU-0002 | CLAU-0001 | CLAU-0003 | contributor |
| CLAU-0003 | CLAU-0004 | CLAU-0006 | contributor |
| CLAU-0004 | CLAU-0005 | CLAU-0006 | owner |
| CLAU-0005 | CLAU-0005 | CLAU-0004 | owner |
| CLAU-0006 | CLAU-0006 | CLAU-0006 | owner |
| CLAU-0007 | CLAU-0001 | CLAU-0006 | reviewer |
| CLAU-0008 | CLAU-0005 | CLAU-0003 | contributor |

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role constitute the minimum apparatus for evidence-grade description across heterogeneous domains. Identifiers stabilize reference; entities delimit what is being described; attributes and types declare measurable or reportable facets; misc values supply the evidentiary content; and subject–target–role triples express governed linkage among identified participants. Whether the domain is ISO 27001 clause alignment, frame coarsening from temporal observation scope through spatial zone seven, or eBPF map sizing where devmap tolerates 1048576 entries while cgroup_storage is capped at 262144, the mechanics are the same: name things once, type assertions correctly, bind values to the right entity and attribute, and annotate relationships with explicit roles so that compliance reviewers, pipeline operators, and security engineers can query the model for meaning rather than infer it from collocated strings. Systems that honor this separation scale because they can exchange facts without exchanging ambiguous prose; systems that collapse these layers eventually fail audit, drift in production, or both.

**t_frame_coarsening_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COAR-0001 | confidence | xsd:decimal |
| COAR-0002 | dimension_kind | xsd:string |
| COAR-0003 | method | xsd:string |
| COAR-0004 | recorded_at | xsd:dateTime |
| COAR-0005 | uncertainty | xsd:decimal |
| COAR-0006 | unit | xsd:string |
| COAR-0007 | value | xsd:decimal |
| COAR-0008 | encoding | xsd:string |

**t_frame_coarsening_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0004 | 2025-04-27T07:32:48 |
| COAR-0002 | COAR-0002 | COAR-0004 | 2023-03-09T02:04:03 |
| COAR-0003 | COAR-0003 | COAR-0004 | 2024-05-12T02:02:48 |
| COAR-0004 | COAR-0004 | COAR-0004 | 2023-04-01T23:44:45 |
| COAR-0005 | COAR-0005 | COAR-0004 | 2024-09-19T04:18:56 |
| COAR-0006 | COAR-0006 | COAR-0004 | 2024-03-20T18:21:57 |

**t_frame_coarsening_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0001 | 0.517 |
| COAR-0002 | COAR-0001 | COAR-0005 | 121.11 |
| COAR-0003 | COAR-0001 | COAR-0007 | 637.59 |
| COAR-0004 | COAR-0002 | COAR-0001 | 0.922 |
| COAR-0005 | COAR-0002 | COAR-0005 | 777.00 |
| COAR-0006 | COAR-0002 | COAR-0007 | 979.20 |
| COAR-0007 | COAR-0003 | COAR-0001 | 0.376 |
| COAR-0008 | COAR-0003 | COAR-0005 | 973.40 |

**t_frame_coarsening_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0002 | Dimension Kind 01 |
| COAR-0002 | COAR-0001 | COAR-0008 | Encoding 02 |
| COAR-0003 | COAR-0001 | COAR-0009 | nightly summary |
| COAR-0004 | COAR-0001 | COAR-0010 | en |
| COAR-0005 | COAR-0001 | COAR-0003 | hybrid |
| COAR-0006 | COAR-0001 | COAR-0006 | count |
| COAR-0007 | COAR-0002 | COAR-0002 | Dimension Kind 07 |
| COAR-0008 | COAR-0002 | COAR-0008 | Encoding 08 |