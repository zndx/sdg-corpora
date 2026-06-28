---
chapter_id: ch_live_lineage_observed_by_event_f75368
topic_id: 20
family: 05_provo_lineage
cited_terms: ['lineage_observed_by_event', 'artifact_min_one_id', 'syscall_equiv_in_subsystem']
model: engine-refine
---

Lineage observation and subsystem equivalence records rest on a small set of cross-cutting concepts that govern how evidence is named, typed, stored, and related. An **identifier** supplies the durable handle by which any record may be cited in audit trails, reconciliation queries, and downstream policy enforcement; in the lineage-observation corpus, events carry stable keys such as EVEN-0001 through EVEN-0004, each bound to a distinct processing context—sensor-fusion-pipeline, financial-risk-model, data-lake-ingestion, or quality-control-assay—so that provenance statements remain unambiguous even when descriptive labels collide across environments. The **entity** is the object those identifiers denote at the moment of assertion: not merely a row key, but the unit to which attributes attach. When decimal, varchar, and datetime value stores all reference entity_id EVEN-0001, they are asserting properties of the same observed event, permitting heterogeneous measurements—confidence 0.142 alongside dimension_kind “Dimension Kind 01” and a recorded_at stamp of 2024-07-15T19:59:01—to be composed into a single inspectable fact without collapsing distinct data shapes into one undifferentiated field.

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | sensor-fusion-pipeline |
| EVEN-0002 | financial-risk-model |
| EVEN-0003 | data-lake-ingestion |
| EVEN-0004 | quality-control-assay |
| EVEN-0005 | iot-telemetry-ingest |
| EVEN-0006 | financial-risk-model |

**t_lineage_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_lineage_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2024-07-15T19:59:01 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2023-01-03T08:23:46 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2024-06-13T23:29:26 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-03-31T12:19:15 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2023-03-05T06:53:09 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2023-03-19T16:32:15 |

**t_lineage_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.142 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 754.57 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 852.05 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.607 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 551.25 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 531.16 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.333 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 159.50 |

**t_lineage_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | pre-release note |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | en |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | ratio |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

**Attr** and **attr_type** separate what is being said from how it may legally be said. The attribute name declares the semantic slot—confidence, dimension_kind, method, recorded_at—while attr_type fixes the validation and serialization contract: xsd:decimal for numeric scores, xsd:string for categorical or lexical content, xsd:dateTime for temporal bounds. Governance value lies in this bifurcation: policy can require that any “confidence” assertion use decimal typing and fall within defined precision, while “recorded_at” must parse as an ISO-8601 instant, independent of the concrete value eventually stored. Typed value partitions then enforce attr_type at rest: EVEN-0001’s confidence 0.142 lands in the decimal store under attr_id EVEN-0001, its dimension_kind in varchar under attr_id EVEN-0002, and its observation time in datetime under attr_id EVEN-0004—a pattern repeated across EVEN-0002 (recorded_at 2023-01-03T08:23:46), EVEN-0003 (2024-06-13T23:29:26), and EVEN-0004 (2023-03-31T12:19:15). The **misc** designation marks the payload itself: the value column whose contents are miscellaneous only in the sense that they vary by attr_type, not in the sense that they are semantically uncontrolled. A pre-release note, an encoding label “Encoding 02”, or a locale tag en are varchar miscellany; 754.57 and 852.05 are decimal miscellany tied to the same entity EVEN-0001 under distinct attr_ids, illustrating how one entity may carry multiple concurrent measurements without identifier proliferation.

Artifact registries extend the same discipline from event attributes to distributable objects and their compliance posture. Each artifact record again anchors on an identifier—ONE-0001 through ONE-0004—while the artifact field names the deliverable (sensor-log-2023-10 or manifest-v1). **License** encodes the legal and operational constraints on reuse: CC-BY-4.0 permits attribution-bound redistribution, MIT imposes minimal conditions, and a proprietary designation signals that downstream copying or model training may be prohibited without contractual authority. Because manifest-v1 appears under ONE-0002, ONE-0003, and ONE-0004 with differing licenses (proprietary, CC-BY-4.0, MIT), governance cannot infer entitlement from filename alone; reviewers must resolve license per identifier. **Location** completes the artifact picture by binding custody and jurisdictional exposure: us-east-1 and eu-west-3 denote regional object stores, rack-7 a physical rack placement, ap-south-2 another regional partition—information material to data-residency rules, failover planning, and evidence-chain integrity when demonstrating where a licensed artifact resided at the time of an observed event.

**t_artifact_min_one_id**

| id | artifact | license | location |
| --- | --- | --- | --- |
| ONE-0001 | sensor-log-2023-10 | CC-BY-4.0 | us-east-1 |
| ONE-0002 | manifest-v1 | proprietary | eu-west-3 |
| ONE-0003 | manifest-v1 | CC-BY-4.0 | rack-7 |
| ONE-0004 | manifest-v1 | MIT | ap-south-2 |

Subsystem equivalence modeling introduces relational semantics atop identifiers through **subject**, **target**, and **role**. A syscall equivalence record (SUBS-0001 through SUBS-0004 mapping Syscall 01–04) may participate in a containment graph via in_syscall_subsystem associations (In Syscall Subsystem 01–04), but the junction semantics are explicit only when subject and target are populated: syscall_id SUBS-0003 relates to in_syscall_subsystem_id SUBS-0007 with role owner, while SUBS-0002 relates to SUBS-0006 as reviewer, SUBS-0004 to SUBS-0007 as observer, and SUBS-0005 to SUBS-0006 again as reviewer. Here the **subject** is the syscall-side participant whose obligations or authorities are being qualified; the **target** is the subsystem context in which that participation holds; and **role** narrows generic linkage into actionable capacity—ownership versus review versus observation—so access-control matrices, segregation-of-duties checks, and incident-response playbooks can be evaluated against named relationships rather than undifferentiated graph edges.

**t_syscall_equiv_in_subsystem**

| id | syscall |
| --- | --- |
| SUBS-0001 | Syscall 01 |
| SUBS-0002 | Syscall 02 |
| SUBS-0003 | Syscall 03 |
| SUBS-0004 | Syscall 04 |
| SUBS-0005 | Syscall 05 |
| SUBS-0006 | Syscall 06 |
| SUBS-0007 | Syscall 07 |

**t_syscall_equiv_in_subsystem_in_syscall_subsystem**

| id | in_syscall_subsystem |
| --- | --- |
| SUBS-0001 | In Syscall Subsystem 01 |
| SUBS-0002 | In Syscall Subsystem 02 |
| SUBS-0003 | In Syscall Subsystem 03 |
| SUBS-0004 | In Syscall Subsystem 04 |
| SUBS-0005 | In Syscall Subsystem 05 |
| SUBS-0006 | In Syscall Subsystem 06 |
| SUBS-0007 | In Syscall Subsystem 07 |

**t_syscall_equiv_in_subsystem__in_syscall_subsystem**

| id | syscall_id | in_syscall_subsystem_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0003 | SUBS-0007 | reviewer |
| SUBS-0002 | SUBS-0005 | SUBS-0006 | reviewer |
| SUBS-0003 | SUBS-0004 | SUBS-0007 | owner |
| SUBS-0004 | SUBS-0002 | SUBS-0006 | observer |
| SUBS-0005 | SUBS-0007 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0007 | SUBS-0002 | contributor |
| SUBS-0007 | SUBS-0004 | SUBS-0001 | reviewer |
| SUBS-0008 | SUBS-0003 | SUBS-0004 | owner |

Taken together, these concepts form an evidence-anchored reference frame. Identifiers stabilize reference; entities receive assertions; attrs and attr_types define permissible meaning; misc holds the instantiated facts under type discipline; license and location govern artifact lifecycle and custody; and subject–target–role triples express governed participation in structural relationships. Operational practice therefore proceeds by tracing identifiers through typed attribute stores for observational completeness, through license–location pairs for distributable artifacts, and through role-qualified subject–target bindings for subsystem accountability—each layer answering a distinct compliance question without substituting one kind of evidence for another.