---
chapter_id: ch_live_measurement_max_one_value_9a8afb
topic_id: 161
family: 02_observation_measurement
cited_terms: ['measurement_max_one_value', 'attribute_set_supports_outlier_claim', 'ebpfmap_subclass']
model: engine-refine
---

An identifier is the durable handle by which a governed record is cited, reconciled, and traced across systems without ambiguity. In operational telemetry and compliance registries alike, identifiers are assigned once and carried forward through every derivative artifact: a measurement such as Soil pH or CPU load receives a stable key (VALU-0001 through VALU-0004), as does each numeric observation (98.6, 120.5, 0.042) and each infrastructure subclass (EBPF-0001 through EBPF-0004). The practical consequence is that auditors, pipelines, and policy engines can refer to the same entity at different lifecycle stages—ingestion, validation, publication—without re-deriving identity from mutable display labels. Where two rows share a human-readable name, as with duplicate conntrack_hash entries mapped to EBPF-0003 and EBPF-0004, the identifier—not the label—preserves distinct lineage and permits divergent checksums (a3f9c21e versus 7b14de08) and divergent storage targets.

**t_measurement_max_one_value_numeric_value**

| id | numeric_value |
| --- | --- |
| VALU-0001 | 98.6 |
| VALU-0002 | 120.5 |
| VALU-0003 | 98.6 |
| VALU-0004 | 0.042 |
| VALU-0005 | 0.042 |
| VALU-0006 | 0.85 |

**t_ebpfmap_subclass**

| id | ebpfmap | map_type | checksum | uri |
| --- | --- | --- | --- | --- |
| EBPF-0001 | sock_ops_map | VALU-0004 | 9d2b7a16 | abfss://prod/silver |
| EBPF-0002 | xdp_stats_map | VALU-0002 | 1a4b6c2d | abfss://prod/silver |
| EBPF-0003 | conntrack_hash | VALU-0002 | a3f9c21e | s3://lake/raw |
| EBPF-0004 | conntrack_hash | VALU-0001 | 7b14de08 | gs://warehouse/gold |
| EBPF-0005 | perf_event_map | VALU-0003 | 9d2b7a16 | hdfs://cluster/staging |
| EBPF-0006 | stack_trace_map | VALU-0003 | 1a4b6c2d | hdfs://cluster/staging |
| EBPF-0007 | dev_map_eth | VALU-0004 | 5e8f3c91 | hdfs://cluster/staging |
| EBPF-0008 | xdp_stats_map | VALU-0005 | c0ffee42 | abfss://prod/silver |

Subject and target formalize directed relationships between identified entities. The subject names the record whose assertion is being made; the target names the record to which that assertion attaches. A measurement-to-value association, for example, declares that subject VALU-0005 (a measurement record) is linked to target VALU-0001 (a numeric value record), while a separate row may attach subject VALU-0002 to target VALU-0003. The same pattern governs evidentiary support for outlier claims: subject CLAI-0001 (source system ID) is tied to target CLAI-0001 (API gateway), whereas subject CLAI-0003 (geolocation accuracy) is tied to target CLAI-0005 (Ontology registry). This asymmetry matters because traversal semantics are directional—queries that ask “what supports this attribute?” follow subject→target edges, while provenance queries that ask “which claims does this registry underpin?” invert the path. Treating both ends as undifferentiated foreign keys collapses audit narrative into mere join keys.

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

Role qualifies the subject–target edge without introducing a new entity class. Reviewer, observer, contributor, and owner are not alternate identifiers; they annotate how the linked party participated in the relationship. Two associations may share identical structural shape yet carry different governance weight: an observer on a measurement–value link (VALU-0004) signals read-only attestation, while a contributor on an attribute–supports link (CLAI-0001, CLAI-0002, CLAI-0004) signals operational input into the evidentiary chain, and an owner on CLAI-0003 denotes accountability for geolocation accuracy backed by the Ontology registry. Roles therefore enable least-privilege enforcement, segregation-of-duties review, and role-aware retention: the same PostgreSQL instance (CLAI-0002) may appear as a contributor to validation-rule support while a different registry instance (CLAI-0005) appears variously as owner or contributor depending on claim type.

**t_measurement_max_one_value**

| id | measurement |
| --- | --- |
| VALU-0001 | Soil pH |
| VALU-0002 | Water turbidity |
| VALU-0003 | Air particulate |
| VALU-0004 | CPU load |
| VALU-0005 | Battery voltage |
| VALU-0006 | Air particulate |
| VALU-0007 | Core temperature |

**t_measurement_max_one_value__numeric_value**

| id | measurement_id | numeric_value_id | role |
| --- | --- | --- | --- |
| VALU-0001 | VALU-0005 | VALU-0001 | reviewer |
| VALU-0002 | VALU-0002 | VALU-0003 | observer |
| VALU-0003 | VALU-0005 | VALU-0005 | contributor |
| VALU-0004 | VALU-0003 | VALU-0001 | observer |
| VALU-0005 | VALU-0007 | VALU-0005 | owner |
| VALU-0006 | VALU-0004 | VALU-0005 | observer |
| VALU-0007 | VALU-0003 | VALU-0006 | contributor |
| VALU-0008 | VALU-0002 | VALU-0006 | owner |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |

A checksum supplies a compact integrity anchor for artifacts whose bytes may traverse untrusted or eventually consistent storage. For eBPF map subclasses, checksums such as 9d2b7a16 and 1a4b6c2d fingerprint the definitional payload associated with sock_ops_map and xdp_stats_map; downstream loaders compare the stored digest against a recomputed hash before attaching map_type references (VALU-0004, VALU-0002) to runtime configuration. Checksum mismatch is treated as a hard failure rather than a soft warning because kernel map layout errors and mis-typed measurement schemas propagate silently until observability breaks. The duplicate conntrack_hash name paired with distinct checksums illustrates why identifiers and digests compose: human labels converge, but cryptographic separation preserves which variant was promoted to production.

A URI locates the authoritative or staging copy of a record within a namespace-aware storage fabric. URIs in this corpus span cloud object stores—abfss://prod/silver for silver-tier lakehouse paths, s3://lake/raw for raw ingestion, gs://warehouse/gold for curated warehouse tiers—and thereby encode both physical placement and contractual data zone. URIs are not substitutes for identifiers: EBPF-0001 remains the governance key even when its artifact resides at abfss://prod/silver, and relocation to a new bucket does not retire the identifier if lineage tables are updated. Conversely, identifiers without resolvable URIs strand verification workflows; checksum validation presumes fetchability from the declared location. Together, identifier stability, directed subject–target graph edges, role-qualified participation, checksum-gated promotion, and URI-addressed persistence form the minimum contract by which distributed measurement programs—from Soil pH field sampling through CPU load telemetry—and infrastructure subclasses remain demonstrably the same object across submission, review, and operational deployment.