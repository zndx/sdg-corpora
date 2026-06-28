---
chapter_id: ch_live_allocation_succeeded_or_failed_de1d08
topic_id: 161
family: 05_provo_lineage
cited_terms: ['allocation_succeeded_or_failed', 'black_belt_certification_requirement', 'measurement_produced_by_run']
model: engine-refine
---

The governance of measurement systems rests on a disciplined separation between the identifiers that anchor each record and the attributes that describe its properties. Every allocation event—whether triggered manually, by schedule, or through an API call—receives a unique identifier such as FAIL-0001 or FAIL-0002, which serves as the immutable key across all downstream references. These identifiers are not arbitrary; they encode the lifecycle state of the allocation itself, with statuses ranging from failed through running to complete, and they persist regardless of the allocation type, whether that be event-trace-log, replication-stream, burst-window-epsilon, or tenant-quota-gold. The trigger mechanism—manual intervention, a scheduled job, or an API invocation—provides an auditable provenance chain, ensuring that every state transition can be traced to its origin point.

**t_allocation_succeeded_or_failed**

| id | allocation | allocation_2 | allocation_3 | status | triggered_by |
| --- | --- | --- | --- | --- | --- |
| FAIL-0001 | event-trace-log | governance-tag-set | processing-shard-kappa | failed | manual |
| FAIL-0002 | replication-stream | burst-window-epsilon | telemetry-buffer | running | schedule |
| FAIL-0003 | burst-window-epsilon | tenant-quota-gold | burst-window-epsilon | complete | manual |
| FAIL-0004 | event-trace-log | audit-retention-vault | quality-rule-std | failed | api |
| FAIL-0005 | compute-pool-alpha | metric-rollup-daily | event-trace-log | running | api |

Certification requirements introduce a parallel taxonomy of attributes, each typed to enforce data integrity at the schema level. A requirement such as ProvenanceTrackingBB or LabQualityControlBB is not a monolithic blob but a structured collection of named attributes—confidence, dimension_kind, method, recorded_at—each bound to a precise type: xsd:decimal for numerical precision, xsd:string for categorical labels, and xsd:dateTime for temporal anchoring. The value tables decompose these attributes by type, storing decimal values like 0.856 or 807.42 in one table, string values such as Dimension Kind 01 or Encoding 02 in another, and timestamps like 2025-05-17T18:36:12 in yet a third. This type-disaggregated design ensures that a confidence score of 0.026 is never conflated with a methodological note or a pre-release annotation, and that temporal attributes carry the full ISO 8601 precision required for audit trails.

Measurement facts sit at the intersection of these attribute structures and the categorical dimensions that organize them. Each measurement record carries a confidence value—0.945 for one observation, 0.307 for another—alongside an uncertainty bound that quantifies the margin of error, whether 279.24 units or 364.07. The measured value itself, ranging from 64.10 to 878.99, is meaningless without its category context: Measurement Category 01 through Measurement Category 04, each associated with a descriptive label and a category identifier that links back to the dimension table. The measurement_key field provides a cross-reference to the measurement dimension, enabling joins that reconstruct the full analytical lineage from raw observation through categorical classification to certified attribute enrichment.

**fact_measurement**

| id | measurement_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| RUN-0001 | RUN-0003 | 0.496 | 306.26 | 353.34 |
| RUN-0002 | RUN-0001 | 0.945 | 279.24 | 660.64 |
| RUN-0003 | RUN-0006 | 0.506 | 120.70 | 878.99 |
| RUN-0004 | RUN-0006 | 0.307 | 364.07 | 64.10 |
| RUN-0005 | RUN-0003 | 0.923 | 642.96 | 897.70 |

**dim_measurement_category**

| id | category_name |
| --- | --- |
| RUN-0001 | Category Name 01 |
| RUN-0002 | Category Name 02 |
| RUN-0003 | Category Name 03 |
| RUN-0004 | Category Name 04 |
| RUN-0005 | Category Name 05 |
| RUN-0006 | Category Name 06 |

**dim_measurement**

| id | measurement_label | measurement_category | category_id |
| --- | --- | --- | --- |
| RUN-0001 | Measurement Label 01 | Measurement Category 01 | RUN-0004 |
| RUN-0002 | Measurement Label 02 | Measurement Category 02 | RUN-0003 |
| RUN-0003 | Measurement Label 03 | Measurement Category 03 | RUN-0002 |
| RUN-0004 | Measurement Label 04 | Measurement Category 04 | RUN-0005 |
| RUN-0005 | Measurement Label 05 | Measurement Category 05 | RUN-0003 |
| RUN-0006 | Measurement Label 06 | Measurement Category 06 | RUN-0001 |
| RUN-0007 | Measurement Label 07 | Measurement Category 07 | RUN-0002 |

The interplay between these tables forms a coherent governance model. An allocation event identified by FAIL-0003, running under the allocation type burst-window-epsilon and governed by the tenant-quota-gold policy, may produce a measurement whose confidence of 0.506 and uncertainty of 120.70 must be evaluated against the LabQualityControlBB certification requirement. That requirement, in turn, specifies that the recorded_at attribute must carry an xsd:dateTime value and that the confidence attribute must be a valid xsd:decimal. The entity_id fields in the value tables bind these typed attributes back to their originating requirement, while the category_id in the measurement dimension ensures that every measurement is classified within the appropriate organizational taxonomy. This architecture—where identifiers, attributes, types, values, categories, and statuses are each first-class citizens—enables compliance verification that is both granular and auditable, ensuring that every numerical observation can be traced through its provenance chain from trigger to certification.

**t_black_belt_certification_requirement**

| id | black_belt_certification_requirement |
| --- | --- |
| REQU-0001 | ProvenanceTrackingBB |
| REQU-0002 | LabQualityControlBB |
| REQU-0003 | ProvenanceTrackingBB |
| REQU-0004 | LabQualityControlBB |
| REQU-0005 | ProvenanceTrackingBB |
| REQU-0006 | DataEngineeringBlackBelt |
| REQU-0007 | MLOpsQualityBB |
| REQU-0008 | APIGatewayBB |

**t_black_belt_certification_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | confidence | xsd:decimal |
| REQU-0002 | dimension_kind | xsd:string |
| REQU-0003 | method | xsd:string |
| REQU-0004 | recorded_at | xsd:dateTime |
| REQU-0005 | uncertainty | xsd:decimal |
| REQU-0006 | unit | xsd:string |
| REQU-0007 | value | xsd:decimal |
| REQU-0008 | encoding | xsd:string |

**t_black_belt_certification_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 2025-05-17T18:36:12 |
| REQU-0002 | REQU-0002 | REQU-0004 | 2024-10-05T03:41:40 |
| REQU-0003 | REQU-0003 | REQU-0004 | 2024-07-29T04:57:09 |
| REQU-0004 | REQU-0004 | REQU-0004 | 2025-04-05T22:06:20 |
| REQU-0005 | REQU-0005 | REQU-0004 | 2024-09-27T11:02:14 |
| REQU-0006 | REQU-0006 | REQU-0004 | 2023-05-05T18:06:19 |
| REQU-0007 | REQU-0007 | REQU-0004 | 2023-08-07T06:49:00 |
| REQU-0008 | REQU-0008 | REQU-0004 | 2023-09-09T17:25:37 |

**t_black_belt_certification_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 0.856 |
| REQU-0002 | REQU-0001 | REQU-0005 | 807.42 |
| REQU-0003 | REQU-0001 | REQU-0007 | 629.05 |
| REQU-0004 | REQU-0002 | REQU-0001 | 0.026 |
| REQU-0005 | REQU-0002 | REQU-0005 | 321.43 |
| REQU-0006 | REQU-0002 | REQU-0007 | 502.76 |
| REQU-0007 | REQU-0003 | REQU-0001 | 0.827 |
| REQU-0008 | REQU-0003 | REQU-0005 | 134.63 |

**t_black_belt_certification_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | Dimension Kind 01 |
| REQU-0002 | REQU-0001 | REQU-0008 | Encoding 02 |
| REQU-0003 | REQU-0001 | REQU-0009 | pre-release note |
| REQU-0004 | REQU-0001 | REQU-0010 | ja |
| REQU-0005 | REQU-0001 | REQU-0003 | hybrid |
| REQU-0006 | REQU-0001 | REQU-0006 | m/s |
| REQU-0007 | REQU-0002 | REQU-0002 | Dimension Kind 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | Encoding 08 |