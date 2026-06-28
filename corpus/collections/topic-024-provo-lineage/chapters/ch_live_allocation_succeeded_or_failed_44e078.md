---
chapter_id: ch_live_allocation_succeeded_or_failed_44e078
topic_id: 24
family: 05_provo_lineage
cited_terms: ['allocation_succeeded_or_failed', 'dataset_revision_of', 'two_disjoint_artifacts']
model: engine-refine
---

The provenance and lifecycle of distributed data assets are governed through a layered attribute model that separates declarative metadata from instance-level values. Each artifact, whether an ETL job, a configuration bundle, or a data pipeline, is identified by a unique identifier such as ARTI-0001 or ARTI-0004 and is described through a schema of named attributes defined in the attribute registry. The attribute name—checksum, created_date, identifier, or license—specifies the semantic property under consideration, while the attribute type constrains its representation to a formal datatype: xsd:string for free-form text, xsd:date for temporal values, or cco:DesignativeICE for URN-based designators. This separation of attribute definition from attribute value enables a flexible, extensible metadata model where new properties can be introduced without schema migration, and where the same attribute name may carry different type constraints across artifact families.

Attribute values are materialized in a value store partitioned by data type, each row binding a misc value to a specific entity through a foreign key on entity_id and a reference to the defining attribute via attr_id. Date attributes resolve to values such as 2023-05-13, 2024-02-28, and 2024-03-29, while integer attributes capture quantitative measures like 36, 462, and 5. String-valued attributes hold identifiers and policy references—9d2b7a16 as a checksum, urn:uuid:9f2a as a URN designator, MPL-2.0 as a license, and ap-south-2 as a regional endpoint. The entity_id column anchors each value to its parent artifact, and the attr_id column resolves to the attribute definition, forming a normalized triple of entity, attribute, and value that supports arbitrary cardinality and type-safe storage without denormalization.

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

Beyond artifact-level attributes, the system tracks allocation events and dataset revisions through parallel registries that share the same identification and ownership primitives. Allocation records—FAIL-0001 through FAIL-0004—associate a status of failed, running, or complete with a tripartite allocation signature comprising an event-trace-log, a governance-tag-set or burst-window-epsilon, and a processing-shard-kappa or telemetry-buffer. Each allocation is triggeredby a source: manual intervention, a schedule, or an api call—values that are critical for auditability and for distinguishing human-initiated operations from automated or system-driven ones. The status field, carrying values such as failed, running, and complete, provides the operational state necessary for monitoring dashboards and alerting pipelines.

**t_allocation_succeeded_or_failed**

| id | allocation | allocation_2 | allocation_3 | status | triggered_by |
| --- | --- | --- | --- | --- | --- |
| FAIL-0001 | event-trace-log | governance-tag-set | processing-shard-kappa | failed | manual |
| FAIL-0002 | replication-stream | burst-window-epsilon | telemetry-buffer | running | schedule |
| FAIL-0003 | burst-window-epsilon | tenant-quota-gold | burst-window-epsilon | complete | manual |
| FAIL-0004 | event-trace-log | audit-retention-vault | quality-rule-std | failed | api |
| FAIL-0005 | compute-pool-alpha | metric-rollup-daily | event-trace-log | running | api |

Dataset revisions are catalogued in a separate table where each record links a dataset—sensor-fusion-calibration, customer-churn-features, satellite-telemetry-v2, or genomics-raw-reads-q3—to its parent via the was_revision_of column, which references artifacts such as grid-load-forecast-base, market-index-initial, proteomics-mass-spec-v1, and baseline-genomics-q2. The mime_type column records the serialization format of the revision payload: application/xml for structured markup, application/octet-stream for binary streams, and application/parquet for columnar analytical storage. The owner column assigns accountability to a team or service principal—ml-infra for machine learning infrastructure assets, governance for policy-managed datasets—enabling access control enforcement and cost attribution. Together, the identifier, owner, status, and triggeredby fields form a minimal but sufficient provenance tuple that supports traceability from raw ingestion through transformation to final consumption.

**t_dataset_revision_of**

| id | dataset | was_revision_of | mime_type | owner |
| --- | --- | --- | --- | --- |
| REVI-0001 | sensor-fusion-calibration | grid-load-forecast-base | application/xml | ml-infra |
| REVI-0002 | customer-churn-features | market-index-initial | application/octet-stream | governance |
| REVI-0003 | satellite-telemetry-v2 | proteomics-mass-spec-v1 | application/octet-stream | ml-infra |
| REVI-0004 | genomics-raw-reads-q3 | baseline-genomics-q2 | application/parquet | ml-infra |

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |