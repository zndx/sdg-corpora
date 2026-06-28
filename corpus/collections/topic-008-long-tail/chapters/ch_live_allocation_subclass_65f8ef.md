---
chapter_id: ch_live_allocation_subclass_65f8ef
topic_id: 8
family: 05_provo_lineage
cited_terms: ['allocation_subclass', 'iso27001_annexa_subclass', 'span_within_trace']
model: engine-refine
---

In relational data modelling, the distinction between identifier, subject, target, and role constitutes the foundational grammar of entity-relationship mapping. An identifier is a stable, opaque token—such as `ALLO-0001` or `ANNE-0003`—that uniquely anchors a row within a table and serves as the sole means by which other tables may reference it. Identifiers are deliberately decoupled from business meaning; the string `ALLO-0001` carries no semantic weight of its own, yet it points unambiguously to the allocation entity `nightly-ingest` in one context and to the transformation engine `Celery Worker` in another. This separation of identity from attribute is what permits referential integrity across tables whose columns describe entirely different domains. A subject, by contrast, is the entity that initiates or owns a relationship, while the target is the entity that receives or is affected by it. The junction table that mediates between them carries both the subject and target as foreign keys, and—critically—adds a role column that qualifies the nature of the link. The role is not metadata about the tables themselves but metadata about the relationship: it answers whether the subject acts as `owner`, `contributor`, `reviewer`, or `observer` with respect to the target.

Consider the allocation-to-transformation mapping, where the junction table `t_allocation_subclass__executes_transformation` records that allocation `ALLO-0001` (`nightly-ingest`) assumes the role of `contributor` to transformation `ALLO-0001` (`Celery Worker`), while allocation `ALLO-0004` (`batch-prod-main`) assumes the role of `observer` to transformation `ALLO-0006` (`TensorFlow Serving`). The same identifier `ALLO-0004` appears in both the subject column and the target column across different rows, demonstrating that a single entity can occupy either position depending on the relationship under examination. This bidirectional capacity is essential: an allocation that is a `contributor` in one linkage may be an `observer` in another, and the role column captures that distinction without requiring separate tables. The pattern repeats across domains. In the ISO standard linkage, `t_iso27001_annexa_subclass__iso27001_annex_a` records that standard `ANNE-0003` (`ISO/IEC 27701`) is the `owner` of control `ANNE-0007` (`A.6.3 Remote working`), while standard `ANNE-0001` (`ISO/IEC 27001`) is the `reviewer` of control `ANNE-0004` (`A.8.12 Data masking`). The role here—`owner` versus `reviewer`—conveys governance posture, not technical capability.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |

The distributed-tracing domain illustrates the same structural pattern with different semantic content. Table `t_span_within_trace` holds span identifiers such as `TRAC-0001` (`lambda-process-image`) and `TRAC-0004` (`auth-validate-token`), while `t_span_within_trace_part_of` holds trace identifiers such as `TRAC-0001` (`data-ingest-job`) and `TRAC-0004` (`api-request`). The junction table `t_span_within_trace__part_of` then records that span `TRAC-0006` is a `contributor` to trace `TRAC-0006`, and span `TRAC-0002` (`http-get-users`) is an `observer` of trace `TRAC-0006`. Again, the role column distinguishes the nature of the containment relationship: a span that contributes to a trace participates in its execution, whereas a span that observes a trace monitors it without altering its behaviour. The identifier `TRAC-0006` does not appear in either the span or the part_of entity tables directly, which signals that the junction table can reference entities whose defining rows reside in tables not shown in the excerpt—a common pattern in large schemas where the full entity catalogue is partitioned across multiple files.

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | lambda-process-image |
| TRAC-0002 | http-get-users |
| TRAC-0003 | http-get-users |
| TRAC-0004 | auth-validate-token |
| TRAC-0005 | kafka-produce-metrics |
| TRAC-0006 | http-get-users |
| TRAC-0007 | batch-ingest-logs |
| TRAC-0008 | cache-lookup-session |

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

The practical significance of this four-part structure—identifier, subject, target, role—lies in its capacity to encode relationships that are inherently asymmetric and multi-valued. A single allocation can execute multiple transformations, each with a different role; a single ISO standard can govern multiple controls, each with a different governance posture; a single trace can contain multiple spans, each with a different participation mode. Without the role column, the junction table would collapse these distinctions into a flat boolean: does the relationship exist or not? With the role column, the schema preserves the qualitative dimension of the link, enabling downstream queries to filter by relationship type, to audit governance assignments, or to reconstruct execution topology from trace data. The identifier column on the junction table itself—`ALLO-0001`, `ANNE-0001`, `TRAC-0001`—provides a stable primary key for the relationship instance, ensuring that each linkage can be referenced, versioned, and audited independently of the entities it connects.

**t_span_within_trace__part_of**

| id | span_id | part_of_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0006 | TRAC-0006 | contributor |
| TRAC-0002 | TRAC-0007 | TRAC-0001 | contributor |
| TRAC-0003 | TRAC-0002 | TRAC-0006 | observer |
| TRAC-0004 | TRAC-0003 | TRAC-0006 | observer |
| TRAC-0005 | TRAC-0007 | TRAC-0003 | owner |
| TRAC-0006 | TRAC-0008 | TRAC-0006 | owner |
| TRAC-0007 | TRAC-0001 | TRAC-0006 | contributor |
| TRAC-0008 | TRAC-0007 | TRAC-0003 | owner |