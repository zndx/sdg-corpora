---
chapter_id: ch_live_dataset_at_version_be2805
topic_id: 183
family: 07_long_tail
cited_terms: ['dataset_at_version', 'syscall_with_argument_count', 'ebpfmap_with_key_type']
model: engine-refine
---

Argument count serves as a fundamental classification mechanism in system call analysis, where each invocation is characterized by the number of arguments it receives and the frequency with which it occurs. The event count dimension captures how often particular syscall patterns manifest, with observed frequencies ranging from fifty-two occurrences for less common operations to three hundred and eighty-two for frequently executed calls. These counts are not merely tallies; they form the basis for performance profiling and resource allocation decisions. Each argument count entry carries a categorical label that groups related invocation patterns, enabling analysts to aggregate statistics across semantically similar operations. The categorical taxonomy—spanning from Argument Count Category 01 through Argument Count Category 04—provides a structured framework for understanding syscall behavior across different operational contexts.

**fact_syscall**

| id | argument_count_key | event_count |
| --- | --- | --- |
| COUN-0001 | COUN-0008 | 238 |
| COUN-0002 | COUN-0004 | 52 |
| COUN-0003 | COUN-0001 | 198 |
| COUN-0004 | COUN-0003 | 382 |
| COUN-0005 | COUN-0008 | 283 |
| COUN-0006 | COUN-0005 | 288 |

**dim_argument_count**

| id | argument_count_label | argument_count_category |
| --- | --- | --- |
| COUN-0001 | Argument Count Label 01 | Argument Count Category 01 |
| COUN-0002 | Argument Count Label 02 | Argument Count Category 02 |
| COUN-0003 | Argument Count Label 03 | Argument Count Category 03 |
| COUN-0004 | Argument Count Label 04 | Argument Count Category 04 |
| COUN-0005 | Argument Count Label 05 | Argument Count Category 05 |
| COUN-0006 | Argument Count Label 06 | Argument Count Category 06 |
| COUN-0007 | Argument Count Label 07 | Argument Count Category 07 |
| COUN-0008 | Argument Count Label 08 | Argument Count Category 08 |

The type and version dimensions govern the structural characteristics of eBPF maps, which are kernel-level data structures used for inter-process communication and state management. Each map is defined by its key type, a classification that determines how entries are indexed and retrieved, with key types organized into categories such as Key Type Category 01 through Key Type Category 04. The version field tracks the structural revision of these maps, with observed versions ranging from 3 to 12, reflecting the iterative evolution of map schemas as requirements change. Size bytes quantifies the memory footprint of each map, with values spanning from approximately thirty-one megabytes to over three hundred fifty-four megabytes, a range that directly impacts kernel memory pressure and allocation strategies. The interplay between key type, version, and size determines both the performance characteristics and the resource budget consumed by each map instance.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

Identifier serves as the universal linking mechanism across all analytical dimensions, providing a stable reference point that connects disparate fact and dimension tables. Each identifier—whether formatted as VERS-0001 for dataset versions or COUN-0001 for argument counts—anchors a row to its corresponding metadata and enables cross-referencing between operational facts and their descriptive attributes. The identifier scheme is consistent across tables, allowing analysts to trace a single entity through multiple analytical lenses. For instance, a dataset version identified as VERS-0001 can be correlated with its associated dataset (Landsat-8-OLI), its release version (v3.0.0-stable), and its role within the broader versioning hierarchy, all through a single key value.

**t_dataset_at_version**

| id | dataset |
| --- | --- |
| VERS-0001 | Landsat-8-OLI |
| VERS-0002 | UrbanAirQuality |
| VERS-0003 | Landsat-8-OLI |
| VERS-0004 | ATLAS-ICU-Cohort |
| VERS-0005 | SatelliteTelemetryRaw |
| VERS-0006 | GeospatialRoadNetwork |

**t_dataset_at_version_at_dataset_version**

| id | at_dataset_version |
| --- | --- |
| VERS-0001 | v3.0.0-stable |
| VERS-0002 | release-2023-Q4 |
| VERS-0003 | build-4491 |
| VERS-0004 | v2.1.0 |
| VERS-0005 | build-4491 |
| VERS-0006 | release-2023-Q4 |
| VERS-0007 | v2.1.0 |
| VERS-0008 | v2.1.0 |

The subject-target-role relationship model captures the governance structure of dataset versioning, where each association between a dataset and its version is mediated by a specific role. The subject column identifies the originating dataset entity, while the target column identifies the version being associated, and the role column specifies the nature of that association—whether contributor, owner, or reviewer. This tripartite structure enables fine-grained access control and auditability, as every version assignment can be traced to a responsible party. Observed associations include VERS-0004 acting as a contributor to VERS-0002, VERS-0002 serving as the owner of VERS-0001, and VERS-0005 functioning as a reviewer of VERS-0001. The role dimension is critical for compliance auditing, as it establishes clear accountability for each versioning decision.

**t_dataset_at_version__at_dataset_version**

| id | dataset_id | at_dataset_version_id | role |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0004 | VERS-0002 | contributor |
| VERS-0002 | VERS-0002 | VERS-0001 | owner |
| VERS-0003 | VERS-0005 | VERS-0001 | reviewer |
| VERS-0004 | VERS-0001 | VERS-0004 | contributor |
| VERS-0005 | VERS-0005 | VERS-0007 | owner |
| VERS-0006 | VERS-0002 | VERS-0007 | reviewer |
| VERS-0007 | VERS-0003 | VERS-0003 | reviewer |
| VERS-0008 | VERS-0003 | VERS-0002 | owner |

Dataset versioning itself operates as a multi-layered tracking system, where each version entry connects to both a named dataset and a release identifier. Datasets such as Landsat-8-OLI, UrbanAirQuality, and ATLAS-ICU-Cohort are tracked through version entries that carry release labels like v3.0.0-stable, release-2023-Q4, and build-4491. This dual-linkage ensures that every version can be traced back to its source dataset and forward to its deployment identifier, creating an auditable chain of custody for data assets. The versioning framework supports complex relationships where a single dataset may have multiple concurrent versions, each potentially serving different operational purposes or release channels.