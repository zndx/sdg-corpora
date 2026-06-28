---
chapter_id: ch_live_trace_originates_from_5ff2fb
topic_id: 46
family: 02_observation_measurement
cited_terms: ['trace_originates_from', 'lineage_edge_max_one_target', 'ganglion_cyst_tissue_origin']
model: engine-refine
---

In operational data governance, every traceable event must carry a durable identifier and a clear provenance chain. Execution records are anchored by unique identifiers such as `FROM-0001` through `FROM-0004`, each of which points back to a source origin via an `originates_from` reference. These origin references are catalogued in a dimension table where each entry carries a human-readable label—`Originates From Label 01`, `Originates From Label 02`—and a classification category like `Originates From Category 01`. The category field is the primary mechanism for grouping and filtering provenance records at scale, enabling auditors to answer questions such as which data sources belong to a particular classification without inspecting individual labels.

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |

The operational health of each trace is captured through duration, exit status, and retry metrics. A trace identified as `FROM-0003` may run for `3940.66` seconds before terminating with exit code `420`, having been retried `396` times. By contrast, `FROM-0004` completes in `3336.66` seconds with exit code `60` after `459` retries. These figures are not merely diagnostic; they form the basis of service-level compliance reporting. When a trace exceeds its expected duration or accumulates an abnormal retry count, the governance framework flags it for review, and the exit code determines whether the trace is classified as a success, a recoverable failure, or a hard error requiring manual intervention.

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

Provenance extends beyond individual traces into lineage graphs that describe how data flows between systems and stakeholders. Lineage edges are identified by keys such as `TARG-0001` and `TARG-0002`, each associated with a lineage descriptor like `Sensor calibration chain` or `Feature store refresh`. These edges connect to target entities—`Compliance audit log`, `Risk scoring model`, `Feature vector store`, `Executive dashboard`—through a junction table that records the relationship using a `subject` column (the lineage edge) and a `target` column (the destination entity). The `role` field on this junction table assigns accountability: a target may be marked as `owner`, bearing primary responsibility, or as `contributor`, indicating a supporting or downstream dependency. For example, the lineage edge `TARG-0003` appears as an `owner` of target `TARG-0005` and as a `contributor` to target `TARG-0006`, reflecting a dual role in the data flow.

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |

The same relational pattern applies to biological tissue provenance, where the domain shifts from data engineering to clinical anatomy. Tissue origins are catalogued under identifiers such as `ORIG-0001` through `ORIG-0004`, each associated with a specific anatomical site—`sacroiliac joint`, `metacarpophalangeal joint`, `subacromial bursa`, `first dorsal compartment`. These tissue origins are linked to the connective tissue structures they are part of, such as `periosteal layer`, `joint capsule`, `deep fascia`, and `fibrous adventitia`. The relationship is mediated by a junction table that records a `subject` (the tissue origin instance), a `target` (the connective tissue structure), and a `role` that assigns governance over the relationship—`reviewer`, `contributor`, or `owner`. In one instance, tissue origin `ORIG-0007` is linked to connective tissue structure `ORIG-0001` with the role `reviewer`, while tissue origin `ORIG-0002` holds the role `owner` over structure `ORIG-0006`.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

Across both domains, the structural consistency of the model is the key design principle. Every relationship—whether between a data trace and its origin, a lineage edge and its target, or a tissue origin and its connective tissue structure—is expressed through a common pattern: a subject, a target, and a role. This uniformity enables a single governance engine to enforce policies, compute impact analyses, and produce audit trails regardless of whether the underlying entities are execution traces, data pipelines, or anatomical structures. The `category` field on origin records, the `misc` label field, and the `role` field on junction tables together provide the metadata needed to classify, filter, and assign accountability across the entire provenance graph.