---
chapter_id: ch_live_outlier_claim_subclass_c05cd4
topic_id: 102
family: 02_observation_measurement
cited_terms: ['outlier_claim_subclass', 'ebpfmap_subclass', 'equiv_union_basic']
model: engine-refine
---

In distributed data architectures, the integrity of a record is established not by a single attribute but by the convergence of several orthogonal identifiers: the checksum, the uniform resource identifier, and the opaque primary key. A checksum such as `9d2b7a16` or `a3f9c21e` functions as a cryptographic fingerprint of the payload it accompanies, enabling downstream consumers to detect corruption or tampering without re-fetching the source. The checksum is bound to a specific resource addressable by a URI — `abfss://prod/silver` for a production silver-layer artifact, `s3://lake/raw` for a raw-zone object in Amazon S3, or `gs://warehouse/gold` for a gold-tier asset in Google Cloud Storage. These URIs encode both the protocol and the logical container, while the checksum guarantees that the bytes retrieved at that address have not diverged from the version recorded at ingestion time. Together, checksum and URI form a minimal but sufficient provenance pair: they answer *what* was retrieved and *where* from, leaving the question of *who* and *why* to the identity and role layers.

The identity layer is populated by opaque identifiers that serve as stable handles across the lifecycle of a record. Outlier claims are referenced by keys such as `CLAI-0001` or `CLAI-0004`, eBPF map records by `EBPF-0001` through `EBPF-0004`, and equivalence unions by `UNIO-0001` through `UNIO-0004`. These identifiers are deliberately decoupled from human-readable semantics; they are lookup keys, not labels. The semantic content lives in companion columns — the `outlier` column carries values like `Network_Bandwidth_Spike` or `Patient_Vital_Anomaly`, while the `ebpfmap` column carries `sock_ops_map` or `conntrack_hash`. The identifier is the pointer; the semantic column is the payload. This separation allows the same identifier to be referenced across multiple relationship tables without ambiguity, even when the same semantic value (such as `conntrack_hash` appearing under both `EBPF-0003` and `EBPF-0004`) is duplicated.

**t_equiv_union_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| UNIO-0001 | telemetry_hub_alpha | schema_v3_prod | governance_log_f |
| UNIO-0002 | metric_bundle_plus | warehouse_db_staging | metric_aggregate_g |
| UNIO-0003 | ingest_pipeline_main | probe_array_thirteen | repository_db_j |
| UNIO-0004 | sensor_array_beta | compliance_log_sixteen | edge_node_h |
| UNIO-0005 | batch_run_four | staging_run_twelve | governance_log_f |

Relationships between records are expressed through subject-target-role triples, a pattern that generalizes across the schema. In the junction table `t_outlier_claim_subclass__explains_anomaly_in`, the column `outlier_id` designates the subject — the entity that performs or bears the relationship — while `explains_anomaly_in_id` designates the target — the entity toward which the relationship is directed. The `role` column disambiguates the nature of the connection: the same subject `CLAI-0001` acts as `reviewer` toward target `CLAI-0005` and as `observer` toward target `CLAI-0006`, while `CLAI-0005` itself assumes the role of `reviewer` over target `CLAI-0002`. This triple structure is the schema's primary mechanism for encoding governance semantics: it captures not merely that two records are related, but in what capacity and toward what end. The subject-target distinction is directional and non-symmetric; reversing the pair changes the meaning of the relationship entirely.

Equivalence relationships operate on a different axis from subject-target governance links. The table `t_equiv_union_basic` records symmetric associations between entities — `telemetry_hub_alpha` is equivalent to `schema_v3_prod`, which in turn is equivalent to `governance_log_f` — forming a transitive closure that can be traversed to resolve aliases across systems. These equivalences are themselves identified by opaque keys (`UNIO-0001`, `UNIO-0002`) and carry no role or directionality; they assert sameness rather than agency. The tripartite structure of `equiv`, `equiv_2`, and `equiv_3` within a single row suggests a batched encoding of a chain of equivalences, reducing the number of rows required to represent a connected component. This is a space-efficient representation of what could otherwise be expressed as a graph of pairwise links.

The practical consequence of this design is that any query about data lineage, accountability, or integrity must join across at least three layers: the identity layer (identifiers), the semantic layer (descriptive columns), and the relationship layer (subject-target-role triples or equivalence chains). A checksum alone cannot answer who is responsible for a given artifact; a URI alone cannot answer whether the artifact has been reviewed or overridden; an identifier alone cannot answer whether the artifact is equivalent to another under a different naming convention. The tables `t_outlier_claim_subclass` and `t_outlier_claim_subclass_explains_anomaly_in` demonstrate this interdependence: `CLAI-0001` identifies an outlier of type `Network_Bandwidth_Spike`, and the same identifier appears in the relationship table where it acts as `reviewer` over `CLAI-0005` and as `observer` over `CLAI-0006`, while also being linked to the context `Automotive_Test_Drive` in the explains-anomaly-in mapping. No single table contains the complete picture; the schema is deliberately relational, and correctness depends on joining the right tables at the right time.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |

**t_ebpfmap_subclass**

| id | ebpfmap | map_type | checksum | uri |
| --- | --- | --- | --- | --- |
| EBPF-0001 | sock_ops_map | CLAI-0004 | 9d2b7a16 | abfss://prod/silver |
| EBPF-0002 | xdp_stats_map | CLAI-0002 | 1a4b6c2d | abfss://prod/silver |
| EBPF-0003 | conntrack_hash | CLAI-0002 | a3f9c21e | s3://lake/raw |
| EBPF-0004 | conntrack_hash | CLAI-0001 | 7b14de08 | gs://warehouse/gold |
| EBPF-0005 | perf_event_map | CLAI-0003 | 9d2b7a16 | hdfs://cluster/staging |
| EBPF-0006 | stack_trace_map | CLAI-0003 | 1a4b6c2d | hdfs://cluster/staging |
| EBPF-0007 | dev_map_eth | CLAI-0004 | 5e8f3c91 | hdfs://cluster/staging |
| EBPF-0008 | xdp_stats_map | CLAI-0005 | c0ffee42 | abfss://prod/silver |