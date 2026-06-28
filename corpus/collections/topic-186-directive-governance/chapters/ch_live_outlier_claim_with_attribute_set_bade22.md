---
chapter_id: ch_live_outlier_claim_with_attribute_set_bade22
topic_id: 186
family: 02_observation_measurement
cited_terms: ['outlier_claim_with_attribute_set', 'storage_structure_composition', 'board_membership']
model: engine-refine
---

In operational data architectures, the tracking of anomalous conditions relies on a structured relationship between outlier events and their diagnostic attributes. Outlier claims such as `checksum_mismatch`, `pipeline_stall`, `log_flooding`, and `latency_spike` are each associated with one or more attribute sets—`tolerance_ranges`, `baseline_values`, and `calibration_constants`—that define the parameters against which deviation is measured. The association is not merely many-to-many; it carries semantic weight through a role dimension. An attribute set may act as the `owner` of an outlier claim, establishing primary responsibility for its diagnostic criteria, or serve as a `contributor`, supplying supplementary reference data. For instance, the outlier `SET-0003` (a `log_flooding` event) is linked to attribute set `SET-0005` as a `contributor`, while `SET-0001` (a `checksum_mismatch`) has `SET-0004` designated as its `owner`. This role-bearing join table ensures that the provenance of each diagnostic parameter is auditable and that remediation workflows can trace back to the authoritative attribute set.

Storage infrastructure follows an analogous pattern of composition, where abstract storage structures are decomposed into concrete database containers. A `tiered-storage-pool` or `archive-tape-library` or `san-disk-array` serves as the logical grouping, while the actual data-bearing entities—`dev-mongo-shard`, `staging-redis-cluster`, `s3-logs-bucket`, `cassandra-data-node`—are the containers that realize that structure in practice. The relationship between a storage composition and its constituent containers is again mediated by a role dimension, this time distinguishing between `observer` and `reviewer` relationships. Container `COMP-0006` appears as a `reviewer` of composition `COMP-0002` and as an `observer` of composition `COMP-0003`, indicating that the same physical or logical container can participate in multiple structural relationships with different governance postures. This design supports complex topologies where a single database node may be monitored by one storage tier while simultaneously contributing to another.

Governance and accountability extend beyond infrastructure into the tracking of board-level or committee-level activities through a fact-dimension model. The fact table records `event_count` values—such as `236`, `403`, `359`, and `26`—for each recorded session or meeting, while a foreign key (`has_participant_key`) links each event to a participant dimension. The dimension table enriches these keys with human-readable labels (`Has Participant Label 01` through `Has Participant Label 04`) and categorical classifications (`Has Participant Category 01` through `Has Participant Category 04`). This separation of measured quantities from descriptive metadata enables flexible aggregation: one can sum event counts across all participants in a given category, or drill into the activity level of a specific labeled participant without conflating identity with measurement.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |

The underlying schema design across all three domains shares a common relational pattern: a subject-target join table that carries a role attribute, enabling many-to-many relationships to express nuanced participation rather than simple membership. In the outlier-attribute domain, the join table `t_outlier_claim_with_attribute_set__attribute_set` uses `outlier_id` as the subject and `attribute_set_id` as the target, with roles of `contributor` or `owner`. In the storage domain, `t_storage_structure_composition__comprises` uses `storage_id` as the subject and `comprises_id` as the target, with roles of `observer` or `reviewer`. This consistent use of a role-bearing association table means that any query or analytical pipeline can filter, aggregate, or audit relationships by their functional significance rather than treating all links as equivalent. The `identifier` column in each table provides a stable, opaque key that decouples the relational structure from the business-meaningful codes (`SET-0001`, `COMP-0001`, `MEMB-0001`) that appear in the data.

**t_outlier_claim_with_attribute_set**

| id | outlier |
| --- | --- |
| SET-0001 | checksum_mismatch |
| SET-0002 | pipeline_stall |
| SET-0003 | log_flooding |
| SET-0004 | latency_spike |
| SET-0005 | checksum_mismatch |
| SET-0006 | log_flooding |
| SET-0007 | latency_spike |

**t_outlier_claim_with_attribute_set_attribute_set**

| id | attribute_set |
| --- | --- |
| SET-0001 | tolerance_ranges |
| SET-0002 | baseline_values |
| SET-0003 | baseline_values |
| SET-0004 | calibration_constants |
| SET-0005 | tolerance_ranges |
| SET-0006 | temporal_windows |

**t_outlier_claim_with_attribute_set__attribute_set**

| id | outlier_id | attribute_set_id | role |
| --- | --- | --- | --- |
| SET-0001 | SET-0003 | SET-0005 | contributor |
| SET-0002 | SET-0001 | SET-0004 | owner |
| SET-0003 | SET-0004 | SET-0001 | contributor |
| SET-0004 | SET-0007 | SET-0002 | contributor |
| SET-0005 | SET-0004 | SET-0005 | contributor |
| SET-0006 | SET-0006 | SET-0006 | contributor |
| SET-0007 | SET-0004 | SET-0002 | owner |
| SET-0008 | SET-0001 | SET-0006 | owner |

**t_storage_structure_composition**

| id | storage_structure_composition |
| --- | --- |
| COMP-0001 | tiered-storage-pool |
| COMP-0002 | archive-tape-library |
| COMP-0003 | tiered-storage-pool |
| COMP-0004 | san-disk-array |
| COMP-0005 | archive-tape-library |
| COMP-0006 | flash-memory-pool |

**t_storage_structure_composition_comprises**

| id | comprises |
| --- | --- |
| COMP-0001 | dev-mongo-shard |
| COMP-0002 | staging-redis-cluster |
| COMP-0003 | s3-logs-bucket |
| COMP-0004 | cassandra-data-node |
| COMP-0005 | oracle-tablespace-main |
| COMP-0006 | neo4j-graph-store |

**t_storage_structure_composition__comprises**

| id | storage_id | comprises_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0003 | COMP-0006 | observer |
| COMP-0002 | COMP-0002 | COMP-0004 | reviewer |
| COMP-0003 | COMP-0006 | COMP-0001 | observer |
| COMP-0004 | COMP-0003 | COMP-0006 | reviewer |
| COMP-0005 | COMP-0002 | COMP-0002 | contributor |
| COMP-0006 | COMP-0001 | COMP-0006 | reviewer |
| COMP-0007 | COMP-0006 | COMP-0003 | owner |
| COMP-0008 | COMP-0002 | COMP-0006 | reviewer |