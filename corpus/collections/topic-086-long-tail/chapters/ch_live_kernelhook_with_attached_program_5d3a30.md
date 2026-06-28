---
chapter_id: ch_live_kernelhook_with_attached_program_5d3a30
topic_id: 86
family: 04_ebpf_kernel
cited_terms: ['kernelhook_with_attached_program', 'outlier_detection_basic', 'requirement_verified_by']
model: engine-refine
---

Kernel hook execution and outlier detection form the operational backbone of a compliance monitoring architecture, where each event is anchored by a unique identifier and contextualized through dimensional metadata. Kernel hooks—identified by codes such as PROG-0001 through PROG-0004—represent discrete binary payloads whose sizes range from 27,282,284 bytes to 560,962,979 bytes, with version stamps (1, 3, 10) enabling traceability across deployments. Each hook is associated with an attached program through a foreign-key linkage, and those programs carry categorical labels—Attached Program Category 01 through 04—and descriptive labels such as Attached Program Label 01—that classify the hook's functional domain. Similarly, outlier events, identified by codes DETE-0001 through DETE-0004, capture anomalous execution episodes whose durations span from 1,182.39 seconds to 6,466.78 seconds, with exit codes (4, 490, 760, 124) signaling distinct failure modalities and retry counts (101, 225, 293, 308) quantifying the system's recovery attempts. These outlier records reference a dimension table through the outlier key, which supplies categorical classification (Outlier Category 01 through 04) and human-readable labels (Outlier Label 01 through 04), ensuring that each detected anomaly can be triaged against established taxonomies.

The governance layer operates through a tripartite verification model that binds requirements to responsible entities via role-based assignments. Requirements—such as Data retention policy and Compliance baseline—are catalogued independently and then linked to verification agents, which include Automated scanner, Lab director, Internal audit team, and System validator. The junction table that mediates this relationship carries three critical fields: the subject (the requirement being verified), the target (the entity performing verification), and the role (owner, observer, reviewer) that defines the nature of the verification engagement. For instance, requirement VERI-0002 is assigned to the Lab director in the role of observer, while VERI-0004 is assigned to the Internal audit team, also as observer; VERI-0003 carries the System validator as reviewer, and VERI-0006 appears in dual capacity—as both owner and reviewer—across different requirement-target pairings. This structure enforces a clear separation between the obligation (the requirement), the actor (the verified-by entity), and the capacity in which the actor operates (the role), thereby supporting auditability and accountability.

**t_requirement_verified_by**

| id | requirement |
| --- | --- |
| VERI-0001 | Data retention policy |
| VERI-0002 | Compliance baseline |
| VERI-0003 | Data retention policy |
| VERI-0004 | Data retention policy |
| VERI-0005 | Audit logging mandate |
| VERI-0006 | Provenance tracking spec |

**t_requirement_verified_by_verified_by**

| id | verified_by |
| --- | --- |
| VERI-0001 | Automated scanner |
| VERI-0002 | Lab director |
| VERI-0003 | Internal audit team |
| VERI-0004 | System validator |
| VERI-0005 | Automated scanner |
| VERI-0006 | Automated scanner |

**t_requirement_verified_by__verified_by**

| id | requirement_id | verified_by_id | role |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0006 | VERI-0006 | owner |
| VERI-0002 | VERI-0002 | VERI-0003 | observer |
| VERI-0003 | VERI-0004 | VERI-0006 | reviewer |
| VERI-0004 | VERI-0003 | VERI-0005 | observer |
| VERI-0005 | VERI-0004 | VERI-0001 | owner |
| VERI-0006 | VERI-0004 | VERI-0002 | owner |
| VERI-0007 | VERI-0001 | VERI-0002 | reviewer |
| VERI-0008 | VERI-0004 | VERI-0001 | observer |

Foreign-key relationships between the fact and dimension tables ensure that operational telemetry is consistently classified without redundancy. The fact_kernelhook table's attached_program_key column references the primary key of dim_attached_program, so that every kernel hook record inherits the categorical and descriptive metadata of its associated program without duplicating it. Analogously, fact_outlier.outlier_key points to dim_outlier.id, allowing outlier events to be enriched with category and label information on demand. This star-schema pattern—fact tables holding measurable quantities (size_bytes, duration_seconds, retry_count, exit_code) and dimension tables holding descriptive attributes (category, misc labels)—is a standard data-warehouse design choice that supports efficient querying and consistent reporting. The identifier columns in both fact tables (id) serve as the primary keys for each event record, while the foreign keys (attached_program_key, outlier_key) establish the referential integrity that ties operational data to its classification context.

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DETE-0001 | DETE-0003 | 3360.34 | 760 | 293 |
| DETE-0002 | DETE-0001 | 6466.78 | 4 | 225 |
| DETE-0003 | DETE-0002 | 5282.09 | 490 | 101 |
| DETE-0004 | DETE-0003 | 1182.39 | 124 | 308 |
| DETE-0005 | DETE-0002 | 3041.72 | 808 | 59 |
| DETE-0006 | DETE-0005 | 3852.38 | 619 | 489 |
| DETE-0007 | DETE-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

The practical significance of this architecture lies in its ability to support compliance audits that require both granular event-level detail and high-level categorical aggregation. An auditor investigating a Data retention policy violation can trace a specific kernel hook (PROG-0002, 560,962,979 bytes, version 1) to its attached program category, then cross-reference the verification records to determine whether the Internal audit team (VERI-0003, role: observer) has certified compliance. Similarly, an outlier with exit code 124 and 308 retries (DETE-0003) can be classified by its outlier category and linked to the verification chain, revealing whether the System validator (VERI-0005, role: reviewer) has acknowledged the anomaly. The role field in the junction table is particularly critical: it distinguishes between parties that own a requirement, those that review it, and those that merely observe, ensuring that the verification chain reflects organizational reality rather than an oversimplified one-to-one mapping.