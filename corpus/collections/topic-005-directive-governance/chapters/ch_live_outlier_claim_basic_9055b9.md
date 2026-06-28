---
chapter_id: ch_live_outlier_claim_basic_9055b9
topic_id: 5
family: 02_observation_measurement
cited_terms: ['outlier_claim_basic', 'policy_constrains_only_artifact', 'trace_subclass']
model: engine-refine
---

In governed observability and compliance systems, every assertion about anomalous behavior must be anchored to a stable identifier that survives joins, audits, and downstream enforcement. Outlier claims such as CLAI-0001 through CLAI-0004 denote distinct incidents—latency_spike_alpha, cpu_throttle_event, schema_drift_v2—each of which may recur under the same label yet remain separable in the record because the identifier is the unit of accountability. The entity linkage extends that accountability one level further: a value row is never free-floating metadata but is always bound to an entity_id that names the claim or artifact it qualifies. When CLAI-0001 carries decimal readings of 0.504, 834.64, and 880.81 alongside varchar fields including Dimension Kind 01 and Encoding 02, the entity dimension is what tells reviewers which object those readings describe, preventing cross-contamination when multiple claims share a detection method or time window.

**t_outlier_claim_basic**

| id | outlier |
| --- | --- |
| CLAI-0001 | latency_spike_alpha |
| CLAI-0002 | cpu_throttle_event |
| CLAI-0003 | schema_drift_v2 |
| CLAI-0004 | latency_spike_alpha |
| CLAI-0005 | null_partition_42 |
| CLAI-0006 | cpu_throttle_event |

**t_outlier_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.504 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 834.64 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 880.81 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.093 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 347.65 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 472.12 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.859 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 734.07 |

**t_outlier_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | en |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | mg/L |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Attributes and their declared types form the interpretive contract under which misc values may be admitted, compared, and retained. An attr such as confidence is not merely a column label; it signals semantic intent and governs which value store may legally hold its payload, here xsd:decimal for numeric scores and xsd:string for categorical descriptors like dimension_kind and method. The attr_type declaration is therefore an enforcement precursor at the data layer: without it, a reviewer cannot know whether 0.093 on CLAI-0002 is a probability, a normalized ratio, or an invalid cast. Datetime attributes typed as xsd:dateTime—exemplified by recorded_at values anchored to 2024-03-15T03:40:40 and 2024-01-05T19:13:32—establish temporal provenance that compliance workflows use to sequence events, measure staleness, and satisfy retention rules. Misc, in this architecture, is the typed payload itself: the string change rationale, the locale token en, or the sub-second duration field that would be meaningless if divorced from its attr and entity context.

Policy artifacts introduce a parallel control plane in which enforcement and scope determine how rigorously a rule binds operators. Artifact ARTI-0002 attaches SOX with blocking enforcement, a posture that halts progression rather than merely logging deviation, whereas ARTI-0001, ARTI-0003, and ARTI-0004 carry mandatory enforcement under CCPA or SOX without necessarily imposing the same hard stop. Scope modulates that binding geographically and organizationally: a global scope on ARTI-0001 and ARTI-0004 implies enterprise-wide applicability, while team and local scopes on ARTI-0002 and ARTI-0003 confine obligation to narrower constituencies. In practice, reviewers weigh enforcement severity against scope breadth before approving exceptions; a blocking rule with local scope may be easier to remediate than a mandatory global constraint that still permits silent noncompliance if monitoring is weak.

Distributed traces supply the operational evidence that links policy posture to runtime behavior through spans, categories, and quantitative exit semantics. Each fact_trace row keys to a spans identifier—TRAC-0005, TRAC-0002, TRAC-0004, TRAC-0006—that resolves through dim_spans into human-readable spans labels and spans categories, further classified by category_id references such as TRAC-0006 and TRAC-0003 into Category Name 02 and Category Name 04. Category thus operates at two resolutions: a coarse taxonomy for reporting and a finer spans_category string for operator triage. Duration_seconds records elapsed wall time—1874.27 through 3940.66 seconds in the sample—so that latency outliers like latency_spike_alpha can be correlated with observed run lengths rather than inferred from exit status alone. Exit codes, here 491, 900, 420, and 60, encode termination semantics distinct from success or failure binaries; paired with retry_count values reaching 399 and 459, they reveal whether a pipeline exhausted automated recovery or failed fast. High retry counts against non-zero exits are precisely the pattern governance frameworks flag when mandatory enforcement must escalate to blocking, because persistence without resolution indicates a control failure rather than a transient fault.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

Taken together, identifier stability, typed attrs, scoped enforcement, and span-level telemetry define a closed evidentiary chain: a claim is named, attributed to an entity, described by typed misc values, constrained by policy artifacts whose enforcement and scope prescribe organizational duty, and ultimately validated or challenged by trace facts measuring duration, exit, and retry behavior. Auditors who can traverse that chain without schema narration—reading values only where they illuminate causation—can determine not merely that schema_drift_v2 was recorded on 2024-07-22T19:11:00, but whether the organization’s global mandatory CCPA posture and the trace’s 3336.66-second run with exit 60 and 459 retries constitute acceptable operational variance or a material gap requiring remediation. That integrative reading is why these fields matter in practice: they convert isolated measurements into defensible compliance narrative.

**t_outlier_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_outlier_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-03-15T03:40:40 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-01-06T03:41:39 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-07-22T19:11:00 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-01-05T19:13:32 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2024-05-18T14:20:48 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2024-11-02T05:08:03 |

**t_policy_constrains_only_artifact**

| id | policy | enforcement | scope |
| --- | --- | --- | --- |
| ARTI-0001 | CCPA | mandatory | team |
| ARTI-0002 | SOX | blocking | global |
| ARTI-0003 | SOX | mandatory | local |
| ARTI-0004 | CCPA | mandatory | global |
| ARTI-0005 | Basel-III | deprecated | team |
| ARTI-0006 | NIST-800-53 | deprecated | regional |
| ARTI-0007 | NIST-800-53 | advisory | regional |