---
chapter_id: ch_live_profiling_produces_profile_5418b1
topic_id: 46
family: 02_observation_measurement
cited_terms: ['profiling_produces_profile', 'schemaorg_person_named', 'storage_structure_composition']
model: engine-refine
---

Profiling executions are tracked through a fact table keyed by unique identifiers such as PROF-0001 through PROF-0004, each recording the duration of the run in seconds—values ranging from 1113.38 to 6716.87—the exit code upon termination (725, 809, 348, 827), and the number of retries attempted (209, 186, 303, 264). The exit code serves as a diagnostic signal: non-zero values indicate abnormal termination, and the magnitude of the code may encode specific failure modes. Retry count captures the resilience behavior of the system, with higher values suggesting repeated recovery attempts before final exit. Each profiling record also carries a produces key that references a dimension table of output artifacts, where each artifact is classified by a category and labeled with a miscellaneous identifier such as Produces Label 01 through Produces Label 04, corresponding to Produces Category 01 through Produces Category 04. This separation of the produces key from the dimension allows the fact table to remain lean while preserving the ability to enrich profiling results with descriptive metadata at query time.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

The produces dimension itself is a classic lookup structure: its primary key (id) matches the produces_key found in the profiling fact, and its two descriptive columns—produces_label and produces_category—provide human-readable classification. The label column, here termed misc, holds free-form identifiers like Produces Label 01, while the category column groups these into broader classes. This design supports both granular reporting on individual outputs and aggregated analysis by category, a pattern common in dimensional modeling where facts are kept narrow and dimensions carry the descriptive weight.

Person identity is modeled across three related tables. The base table, t_schemaorg_person_named, assigns a stable identifier (NAME-0001 through NAME-0004) to each person and stores a schema.org reference such as person/tim_berners_lee, person/alan_kay, person/alan_turing, or person/john_von_neumann. A second table, t_schemaorg_person_named_full_name, maps those same identifiers to full names—Grace Hopper, Donald Knuth, John von Neumann—though the mapping is not one-to-one: Grace Hopper appears under both NAME-0001 and NAME-0004, and John von Neumann appears under NAME-0003, suggesting that multiple identifiers may resolve to the same canonical name or that the same name is associated with distinct schema.org entities. The junction table t_schemaorg_person_named__full_name links a schemaorg_id (the subject) to a full_name_id (the target) with a role attribute that describes the nature of the association—owner, observer, or reviewer. Here, subject and target are the conventional names for the two foreign keys in a many-to-many relationship: subject points to the person entity, and target points to the full-name entity. The role column adds semantic context, indicating whether the person owns the name, merely observes it, or reviews it for accuracy.

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

Storage infrastructure follows an analogous pattern of composition and association. The table t_storage_structure_composition defines storage architectures by identifier (COMP-0001 through COMP-0004) and a composition type—tiered-storage-pool, archive-tape-library, or san-disk-array. A second table, t_storage_structure_composition_comprises, enumerates the database containers that each structure holds: dev-mongo-shard, staging-redis-cluster, s3-logs-bucket, and cassandra-data-node. The junction table t_storage_structure_composition__comprises connects a storage_id (subject) to a comprises_id (target) with a role (observer or reviewer), mirroring the person-name relationship in structure and intent. For example, COMP-0003 (a tiered-storage-pool) is linked to COMP-0006 as both an observer and a reviewer, while COMP-0002 (an archive-tape-library) is linked to COMP-0004 with a reviewer role. The subject and target columns in these junction tables are not arbitrary; they encode the direction of the relationship, with subject always pointing to the composite structure and target to the contained component. This convention allows queries to distinguish between "what does X contain" and "what contains X" without requiring separate relationship tables.

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