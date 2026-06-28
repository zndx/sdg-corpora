---
chapter_id: ch_live_log_with_resource_attribute_1fca7e
topic_id: 180
family: 07_long_tail
cited_terms: ['log_with_resource_attribute', 'log_within_span_context', 'lru_hash_map_subclass']
model: engine-refine
---

Resource attributes constitute the governed metadata layer through which an organization names, classifies, and measures the durable characteristics of infrastructure artifacts—configuration objects, cache namespaces, log streams, and the operational envelopes in which they execute. Each attribute receives a stable identifier, such as ATTR-0001 through ATTR-0004, that survives relabeling, category reassignment, and successive measurement cycles; the identifier is the join key that binds descriptive dimensions to quantitative fact records without conflating identity with presentation. Human-readable misc fields—here, Resource Attribute Label 01 through Resource Attribute Label 04—supply the operational vocabulary auditors and on-call engineers recognize in dashboards and change tickets, while category assignments (Resource Attribute Category 01 through Resource Attribute Category 04) impose the taxonomic scaffold compliance reviews require: segregation of production caches from inference workloads, or separation of replication traces from interactive session telemetry. Category and misc together answer what an artifact is called and where it sits in the control framework; identifier answers which distinct entity the framework is discussing when labels collide or categories migrate.

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |

Quantitative governance depends on fact records that attach measurable properties to resource attributes at known revision points. Size in bytes—values on the order of 913386183, 303816232, 758542341, and 442933768—expresses storage footprint, transfer volume, or retained log mass attributable to a given attribute binding; version integers (6, 7, 7, and 2 in the sample ledger) record the schema or policy generation under which each measurement was taken, so that year-over-year comparisons do not silently equate incompatible baselines. A fact row keyed by identifier and carrying resource_attribute as a foreign reference (for example, resource_attribute_key values ATTR-0005, ATTR-0006, and repeated ATTR-0001) states not merely that a resource grew, but which governed attribute definition the growth accrues to and which revision of that definition was authoritative when the observation was captured. Where the same attribute identifier appears across multiple facts with divergent versions or magnitudes, analysts infer drift, re-materialization, or partial retention rather than a single static asset.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

Operational telemetry extends the same identifier discipline into span-bounded execution contexts. Log artifacts—cache-eviction.out, batch-scheduler.log, disk-io.trace—are first-class subjects located within named spans such as user-session-4492, us-east-1-cluster, ml-inference-run, and warehouse-replication; the span name encodes the blast radius and accountability boundary within which a log line or trace fragment acquires meaning for incident reconstruction. Association semantics are not implicit in co-location alone: subject–target linkages declare which log identifier (CONT-0006, CONT-0005, CONT-0004) is bound to which within_span_context identifier (CONT-0003, CONT-0004), and the role field—reviewer, observer, contributor—states the capacity in which that binding was established or maintained. A contributor on disk-io.trace under ml-inference-run differs materially from an observer on the same trace under warehouse-replication; roles supply the provenance and permission posture the governance framework needs when attributing writes, approvals, or read-only surveillance across overlapping infrastructure events.

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

Cache and rate-limiting subsystems repeat the subject–target–role pattern at the configuration plane. LRU-backed structures—primary-db-cache, stream-event-cache, global-rate-limiter, prod-session-cache—each carry identifiers in the MAP-000x namespace and may be paired with hash configurations (siphash-2-4, xxhash64, robin-hood, sparse-block-map) through explicit junction records in which lru_id and l_r_u_hash_config_id play subject and target parts. When MAP-0007 is linked to MAP-0004 under role reviewer, while MAP-0005 links to MAP-0004 under the same reviewer role, the framework documents that distinct cache instances may converge on a shared algorithmic target yet remain separately accountable at the subject edge—precisely the nuance capacity planning and security review demand when a single hash policy is promoted fleet-wide. Contributor and observer roles on adjacent rows (MAP-0004→MAP-0002 as contributor, MAP-0003→MAP-0002 as observer) further distinguish who may alter a binding from who may only attest to its observability, mirroring the separation of duties applied to log-span associations upstream.

**t_lru_hash_map_subclass**

| id | lru |
| --- | --- |
| MAP-0001 | primary-db-cache |
| MAP-0002 | stream-event-cache |
| MAP-0003 | global-rate-limiter |
| MAP-0004 | prod-session-cache |
| MAP-0005 | primary-db-cache |
| MAP-0006 | stream-event-cache |
| MAP-0007 | prod-session-cache |

**t_lru_hash_map_subclass_l_r_u_hash_config**

| id | l_r_u_hash_config |
| --- | --- |
| MAP-0001 | siphash-2-4 |
| MAP-0002 | xxhash64 |
| MAP-0003 | robin-hood |
| MAP-0004 | sparse-block-map |
| MAP-0005 | murmur3-128 |
| MAP-0006 | murmur3-128 |

**t_lru_hash_map_subclass__l_r_u_hash_config**

| id | lru_id | l_r_u_hash_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0007 | MAP-0004 | reviewer |
| MAP-0002 | MAP-0004 | MAP-0002 | contributor |
| MAP-0003 | MAP-0003 | MAP-0002 | observer |
| MAP-0004 | MAP-0005 | MAP-0004 | reviewer |
| MAP-0005 | MAP-0004 | MAP-0005 | owner |
| MAP-0006 | MAP-0001 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0005 | reviewer |
| MAP-0008 | MAP-0007 | MAP-0002 | observer |

Taken together, identifier, category, misc, resource attribute, size_bytes, version, subject, target, and role form an interlocking reference model rather than a flat inventory. Identifiers stabilize reference; category and misc orient humans and policy engines; resource_attribute keys thread description to measurement; size_bytes and version supply the evidentiary quantities and temporal anchors; subject, target, and role articulate directed relationships whose directionality matters for audit. Duplicate within_span_context values on distinct log subjects (two disk-io.trace rows sharing ml-inference-run and warehouse-replication contexts across different association ids) illustrate why composite keys and role-qualified edges are necessary: sameness of filename or span label does not imply sameness of governance event. Likewise, repeated resource_attribute_key ATTR-0001 on facts at versions 7 and 2 signals that one governed attribute may accumulate heterogeneous measurements across its lifecycle—exactly the condition under which compliance handbooks insist on version-stamped facts and non-ambiguous identifiers, so that remediation, retention, and attribution remain defensible when labels read cleanly but history does not.