---
chapter_id: ch_live_dataset_was_generated_by_4bc248
topic_id: 35
family: 05_provo_lineage
cited_terms: ['dataset_was_generated_by', 'policy_supersedes', 'labrun_observed_at_site']
model: engine-refine
---

Provenance and attribute governance in data management systems rest upon a disciplined separation between the entities that are observed, the attributes by which they are described, and the typed values that instantiate those descriptions. An entity—whether a laboratory run such as PCR-ALPHA or a policy document titled Privacy Impact Assessment—serves as the anchor of a fact graph, identified by a stable key such as SITE-0001 or SUPE-0001. Attributes define the dimensions along which entities are measured or characterized: duration_seconds, end_time, exit_code, and host_name are declared with explicit schema types—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—ensuring that downstream consumers can interpret values without ambiguity. A decimal measurement of 3858.44 attached to a lab run's duration attribute carries a different semantic weight than the string closeout or the integer 263, and the type system enforces this distinction at the point of ingestion rather than deferring validation to query time.

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

The relationship between entities and their attributes is mediated through a value layer that decouples schema definition from data storage. Each attribute identifier is resolved against a catalog of declared names and types, and the corresponding value—whether a timestamp such as 2024-11-18T14:57:47, a numeric result like 5434.21, or a categorical code such as failed—is stored in a type-specialized table. This normalization strategy permits heterogeneous value domains to coexist within a single entity: the same entity SITE-0001 may carry a duration of 3858.44 seconds, an end time of 2024-11-18T14:57:47, an exit code of 263, and a host identifier ingest-21, each drawn from its appropriate value store. The design avoids the pitfalls of wide, sparse tables by spreading attribute instances across typed partitions while preserving referential integrity through the entity identifier.

Provenance relationships extend this model beyond attribute-value pairs to capture the lineage of datasets themselves. A dataset such as supply-chain-manifest or genomic-variant-call is linked to its origin—edge-compute-node, telemetry-collector, or ml-training-runner—through a role-qualified association that distinguishes between an observer and a contributor. The role column encodes the nature of the relationship, enabling downstream systems to weight provenance claims differently depending on whether the source passively recorded the dataset or actively produced it. This distinction is critical in audit contexts where the provenance chain must support not only the question of where data came from but also the question of what capacity the source operated in when it generated or observed the artifact.

Policy governance introduces a temporal dimension to attribute management through review cycle configuration. The policy supersedes relationship captures versioned policy evolution—Incident Response Protocol supersedes both Legacy Data Handling and Draft Audit Logging—while the review cycle days field prescribes the cadence at which each policy must be re-examined, ranging from 131 days for the most frequently reviewed policies to 716 days for Data Residency Rule. The language field, uniformly es in the current corpus, anchors each policy to a jurisdictional or operational language domain, ensuring that multilingual deployments can route policy documents to the appropriate stakeholder groups. These review cycles function as operational timers: a policy with a 131-day review cycle generates a compliance signal approximately four times more frequently than one with a 716-day cycle, and the system must track these intervals to maintain audit readiness.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Privacy Impact Assessment | Legacy Vendor Checklist | 262 | es |
| SUPE-0002 | Incident Response Protocol | Legacy Data Handling | 131 | es |
| SUPE-0003 | Data Residency Rule | Legacy Vendor Checklist | 716 | es |
| SUPE-0004 | Incident Response Protocol | Draft Audit Logging | 336 | es |

The combined architecture—typed attributes, role-qualified provenance, and review-cycle-governed policy relationships—provides a unified substrate for data governance. Laboratory runs observed at sites such as FIELD-STATION-9 or CLEAN-ROOM-A carry structured measurements and status codes that can be queried, aggregated, and audited. Datasets generated by computational resources carry provenance claims that distinguish observation from contribution. Policies that have been superseded carry review schedules that dictate their ongoing relevance. Each layer operates independently but references the same identifier space, ensuring that an entity's attributes, its provenance links, and its policy obligations can be resolved through a single key.

**t_dataset_was_generated_by**

| id | dataset |
| --- | --- |
| GENE-0001 | supply-chain-manifest |
| GENE-0002 | satellite-imagery-stack |
| GENE-0003 | lab-culture-growth |
| GENE-0004 | genomic-variant-call |
| GENE-0005 | lab-culture-growth |
| GENE-0006 | genomic-variant-call |
| GENE-0007 | patient-vitals-csv |
| GENE-0008 | telemetry-sensor-readings |

**t_dataset_was_generated_by_was_generated_by**

| id | was_generated_by |
| --- | --- |
| GENE-0001 | edge-compute-node |
| GENE-0002 | telemetry-collector |
| GENE-0003 | ml-training-runner |
| GENE-0004 | telemetry-collector |
| GENE-0005 | kafka-ingestion-job |
| GENE-0006 | batch-cleanup-script |

**t_dataset_was_generated_by__was_generated_by**

| id | dataset_id | was_generated_by_id | role |
| --- | --- | --- | --- |
| GENE-0001 | GENE-0003 | GENE-0002 | observer |
| GENE-0002 | GENE-0001 | GENE-0002 | contributor |
| GENE-0003 | GENE-0003 | GENE-0003 | contributor |
| GENE-0004 | GENE-0005 | GENE-0001 | contributor |
| GENE-0005 | GENE-0004 | GENE-0003 | observer |
| GENE-0006 | GENE-0005 | GENE-0004 | reviewer |
| GENE-0007 | GENE-0002 | GENE-0002 | reviewer |
| GENE-0008 | GENE-0007 | GENE-0006 | observer |

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | FIELD-STATION-9 |
| SITE-0002 | RUN-2023-A4 | CLEAN-ROOM-A |
| SITE-0003 | WET-LAB-44 | SECURE-VAULT-3 |
| SITE-0004 | PLATE-A12 | BUILDING-C |
| SITE-0005 | BATCH-8812 | LAB-WING-D |
| SITE-0006 | NEXTRA-GEN-03 | BENCH-12 |
| SITE-0007 | BATCH-8812 | CORE-FACILITY |

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |