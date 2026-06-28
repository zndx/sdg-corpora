---
chapter_id: ch_live_claim_governed_by_directive_050271
topic_id: 21
family: 06_belief_structure
cited_terms: ['claim_governed_by_directive', 'ebpfprogram_min_one_hook', 'column_tag_subclass']
model: engine-refine
---

Governed compliance assertions and instrumented runtime attachments share a common metadata architecture in which stable identifiers anchor every auditable fact, typed attributes carry interpretable measurements, and categorical labels situate each artifact within an operational taxonomy. A directive-governed claim such as DIRE-0001—“Mercury threshold exceeded”—is not merely a textual assertion; it is a durable entity whose meaning is recoverable only when its identifier is joined to the attribute definitions that prescribe how evidence may be recorded. The same identifier namespace extends to column-level governance, where TAG-0003 annotates `patient_id` against DIRE-0004, and to hook-bound programs registered as HOOK-0001 through HOOK-0004, so that auditors, policy engines, and deployment pipelines can traverse a single referential fabric rather than reconcile ad hoc naming schemes.

**t_claim_governed_by_directive**

| id | claim |
| --- | --- |
| DIRE-0001 | Mercury threshold exceeded |
| DIRE-0002 | Access policy enforced |
| DIRE-0003 | Latency within bounds |
| DIRE-0004 | Mercury threshold exceeded |
| DIRE-0005 | Emission limits met |
| DIRE-0006 | Certificate chain valid |
| DIRE-0007 | Sampling frequency adequate |
| DIRE-0008 | Sensor calibration valid |

**t_claim_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | confidence | xsd:decimal |
| DIRE-0002 | dimension_kind | xsd:string |
| DIRE-0003 | method | xsd:string |
| DIRE-0004 | recorded_at | xsd:dateTime |
| DIRE-0005 | uncertainty | xsd:decimal |
| DIRE-0006 | unit | xsd:string |
| DIRE-0007 | value | xsd:decimal |
| DIRE-0008 | encoding | xsd:string |

**t_claim_governed_by_directive_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2025-05-26T03:20:10 |
| DIRE-0002 | DIRE-0002 | DIRE-0004 | 2024-09-09T11:00:31 |
| DIRE-0003 | DIRE-0003 | DIRE-0004 | 2023-10-05T17:19:44 |
| DIRE-0004 | DIRE-0004 | DIRE-0004 | 2023-08-28T07:17:18 |
| DIRE-0005 | DIRE-0005 | DIRE-0004 | 2023-09-24T23:34:03 |
| DIRE-0006 | DIRE-0006 | DIRE-0004 | 2025-02-15T08:57:16 |
| DIRE-0007 | DIRE-0007 | DIRE-0004 | 2025-03-19T03:02:46 |
| DIRE-0008 | DIRE-0008 | DIRE-0004 | 2023-07-28T10:43:49 |

The identifier functions as the non-negotiable primary key of accountability: DIRE-0001 appears simultaneously as a claim record, as an entity_id in decimal and varchar value stores, and as the target of column annotations, while HOOK-0006 recurs as the attaches_to_hook_key for two distinct programs. Entity, in this sense, denotes whichever governed object owns a multiset of attribute bindings—whether a directive claim, a column tag subclass, or a hook registration—and entity_id in the typed value tables is the foreign key that binds a concrete measurement to that owner without collapsing heterogeneous facts into a single wide row. This separation matters because compliance evidence accrues incrementally: DIRE-0001 carries a confidence of 0.133, a dimension_kind of “Dimension Kind 01,” and a recorded_at stamp of 2025-05-26T03:20:10, each stored only after attr_id resolves the binding to the correct attribute definition.

**t_claim_governed_by_directive_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 0.133 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 628.22 |
| DIRE-0003 | DIRE-0001 | DIRE-0007 | 405.89 |
| DIRE-0004 | DIRE-0002 | DIRE-0001 | 0.222 |
| DIRE-0005 | DIRE-0002 | DIRE-0005 | 369.68 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | 150.76 |
| DIRE-0007 | DIRE-0003 | DIRE-0001 | 0.686 |
| DIRE-0008 | DIRE-0003 | DIRE-0005 | 548.91 |

**t_claim_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0002 | Dimension Kind 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0008 | Encoding 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0009 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0010 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0003 | manual |
| DIRE-0006 | DIRE-0001 | DIRE-0006 | mg/L |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Dimension Kind 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | Encoding 08 |

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | DIRE-0007 |
| TAG-0002 | log_level | DIRE-0005 |
| TAG-0003 | patient_id | DIRE-0004 |
| TAG-0004 | sensor_reading | DIRE-0004 |
| TAG-0005 | throughput_mb | DIRE-0005 |
| TAG-0006 | sensor_reading | DIRE-0004 |
| TAG-0007 | region_code | DIRE-0001 |

**t_column_tag_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAG-0001 | confidence | xsd:decimal |
| TAG-0002 | dimension_kind | xsd:string |
| TAG-0003 | method | xsd:string |
| TAG-0004 | recorded_at | xsd:dateTime |
| TAG-0005 | uncertainty | xsd:decimal |
| TAG-0006 | unit | xsd:string |
| TAG-0007 | value | xsd:decimal |
| TAG-0008 | encoding | xsd:string |

**t_column_tag_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0004 | 2023-08-03T19:45:29 |
| TAG-0002 | TAG-0002 | TAG-0004 | 2025-03-24T11:46:10 |
| TAG-0003 | TAG-0003 | TAG-0004 | 2025-05-22T05:44:38 |
| TAG-0004 | TAG-0004 | TAG-0004 | 2025-01-14T19:12:47 |
| TAG-0005 | TAG-0005 | TAG-0004 | 2024-02-24T06:52:57 |
| TAG-0006 | TAG-0006 | TAG-0004 | 2024-10-16T08:04:03 |
| TAG-0007 | TAG-0007 | TAG-0004 | 2025-02-04T08:16:45 |

**t_column_tag_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0001 | 0.376 |
| TAG-0002 | TAG-0001 | TAG-0005 | 922.76 |
| TAG-0003 | TAG-0001 | TAG-0007 | 942.47 |
| TAG-0004 | TAG-0002 | TAG-0001 | 0.809 |
| TAG-0005 | TAG-0002 | TAG-0005 | 398.44 |
| TAG-0006 | TAG-0002 | TAG-0007 | 718.52 |
| TAG-0007 | TAG-0003 | TAG-0001 | 0.172 |
| TAG-0008 | TAG-0003 | TAG-0005 | 254.23 |

**t_column_tag_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0002 | Dimension Kind 01 |
| TAG-0002 | TAG-0001 | TAG-0008 | Encoding 02 |
| TAG-0003 | TAG-0001 | TAG-0009 | intake form |
| TAG-0004 | TAG-0001 | TAG-0010 | en |
| TAG-0005 | TAG-0001 | TAG-0003 | automated |
| TAG-0006 | TAG-0001 | TAG-0006 | m/s |
| TAG-0007 | TAG-0002 | TAG-0002 | Dimension Kind 07 |
| TAG-0008 | TAG-0002 | TAG-0008 | Encoding 08 |

Attribute and attr_type constitute the schema contract that governs where a value may legally reside and how downstream consumers must parse it. For both directive claims and column tags, the attribute vocabulary is shared—confidence as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime—so that a policy evaluator encountering 0.222 on DIRE-0002 or 0.809 on TAG-0002 applies identical numeric semantics regardless of whether the provenance is a governed assertion or a field-level annotation. The attr_type therefore performs a routing function as much as a typing function: datetime literals such as 2023-10-05T17:19:44 and 2025-01-14T19:12:47 land exclusively in datetime value relations, while varchar miscellany—including “Encoding 02,” “audit excerpt,” “intake form,” and locale code “en”—remains segregated from numeric fact tables. Misc, as a storage role rather than a semantic category, captures the payload proper: the measured confidence, the encoded dimension label, the audit excerpt, or the hook’s human-readable attaches_to_hook_label; it is miscellaneous only in the sense that its interpretation is delegated entirely to attr and attr_type, not because the content is intrinsically unstructured.

Hook attachment introduces a parallel lineage dimension in which programs declare attaches_to_hook_key to indicate the kernel or framework interception point they extend, while category and version supply the governance-facing descriptors needed for inventory control and change management. Programs HOOK-0001 and HOOK-0002 both attach to HOOK-0006, yet diverge sharply in deployment footprint—784335640 and 641704069 size_bytes respectively—and in revision history, versions 12 and 9, signaling that attachment target alone does not determine binary equivalence or rollout eligibility. HOOK-0003 and HOOK-0004 instead chain to HOOK-0001 and HOOK-0002, yielding a directed attachment graph whose nodes are labeled through attaches_to_hook_label and classified through attaches_to_hook_category values such as “Attaches To Hook Category 01.” Size_bytes thus functions as a material integrity signal—sudden inflation of a program from 113209263 to 161013093 bytes without a corresponding version increment would warrant quarantine—while version supplies the temporal index against which recorded_at timestamps on related claims can be correlated during incident reconstruction.

Category, whether expressed as attaches_to_hook_category on hook dimension records or implied through annotates_column linkages that tie operational columns to directive identifiers, partitions the metadata plane so that retrieval, retention, and enforcement rules can be applied heterogeneously without fragmenting the underlying identifier graph. A sensor_reading column annotated to DIRE-0004 inherits the same recorded_at discipline as the directive claim DIRE-0004 itself, whose assertion “Mercury threshold exceeded” is duplicated at the identifier level yet distinguished in time by 2023-08-28T07:17:18; meanwhile log_level’s annotation to DIRE-0005 binds logging semantics to a different directive lineage whose decimal store holds 628.22 and 922.76 in distinct entity contexts. In practice, operators resolve compliance questions by traversing identifier to entity to attr to misc, validating attr_type at each hop, and only then consulting category and version to determine whether a observed value—0.376 confidence on TAG-0001, say, or version-11 firmware at HOOK-0003—falls within the policy window implied by the governing claim text.

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

The architecture’s operational value lies precisely in this disciplined decomposition: identifiers guarantee referential stability across claims, hooks, and column tags; entity and attr keys enforce normalized provenance; attr_type routes evidence into type-safe stores; misc carries the evidentiary payload; category and attaches_to_hook_key situate artifacts within enforceable classes and runtime topologies; and size_bytes together with version close the loop on physical deployment state. When DIRE-0003’s claim “Latency within bounds” is evaluated against its recorded_at of 2023-10-05T17:19:44 and its associated measurements, or when HOOK-0004 at version 12 and 161013093 bytes is validated against the hook category under which it was approved, the system is not reporting isolated column values—it is reconstructing a governed narrative in which every scalar is typed, owned, timestamped, and, where necessary, chained to the interception point and categorical frame that gave rise to it.

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |