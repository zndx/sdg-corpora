---
chapter_id: ch_live_reference_within_dataset_9ec0e3
topic_id: 56
family: 01_foundation
cited_terms: ['reference_within_dataset', 'schema_migration_subclass', 'cgroup_skb_subclass']
model: engine-refine
---

Unique identifiers function as the immutable anchors of data governance, binding disparate artifacts to a single, auditable lineage. Whether tracking a machine learning reference such as PROVENANCE-MAP-V4, cataloging a regulatory migration schema like compliance_audit, or isolating a network control group under user.slice/user-1001.scope, each record receives a persistent identifier—DATA-0001, MIGR-0001, SKB-0001—that survives structural refactoring and cross-environment replication. These identifiers do not merely label; they enforce referential integrity across the entire operational fabric. By decoupling the abstract entity from its physical instantiation, organizations maintain a stable coordinate system for provenance, ensuring that downstream compliance checks, audit queries, and dependency graphs resolve against a consistent truth rather than transient file paths or ephemeral service endpoints.

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | feature_store_metrics | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | production_schema | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | model_artifact_x7 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | model_artifact_x7 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | feature_store_metrics | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | compliance_register | regulatory_submission |

**t_schema_migration_subclass**

| id | schema |
| --- | --- |
| MIGR-0001 | compliance_audit |
| MIGR-0002 | inventory_snapshot |
| MIGR-0003 | sensor_telemetry |
| MIGR-0004 | transaction_ledger |
| MIGR-0005 | compliance_audit |
| MIGR-0006 | inventory_snapshot |

**t_schema_migration_subclass_migrates_schema_to**

| id | migrates_schema_to |
| --- | --- |
| MIGR-0001 | PostgreSQL_14 |
| MIGR-0002 | ClickHouse_v20 |
| MIGR-0003 | DeltaLake_v1 |
| MIGR-0004 | BigQuery_warehouse |
| MIGR-0005 | Avro_registry |
| MIGR-0006 | GraphQL_resolvers |
| MIGR-0007 | Kafka_schemas |
| MIGR-0008 | Kafka_schemas |

**t_cgroup_skb_subclass**

| id | cgroup |
| --- | --- |
| SKB-0001 | user.slice/user-1001.scope |
| SKB-0002 | user.slice/user-1000.scope |
| SKB-0003 | system.slice/postgresql.service |
| SKB-0004 | kubepods/pod1234567890ab |
| SKB-0005 | docker/4a2b3c1d5e6f |
| SKB-0006 | system.slice/nginx.service |

**t_cgroup_skb_subclass_attaches_to_cgroup**

| id | attaches_to_cgroup |
| --- | --- |
| SKB-0001 | system.slice/nginx.service |
| SKB-0002 | user.slice/user-1001.scope |
| SKB-0003 | user.slice/user-1001.scope |
| SKB-0004 | docker/7d8e9f0a1b2c |
| SKB-0005 | system.slice/docker.service |
| SKB-0006 | kubepods/burstable/pod8f9a0b1c |

Attributes capture the descriptive metadata that distinguishes one entity from another, while attr type enforces strict structural validation across heterogeneous data stores. A checksum_algo or issued_date descriptor is paired with a corresponding type constraint—xsd:string or xsd:date—that dictates how the value must be parsed, indexed, and compared. This type-level discipline prevents schema drift and guarantees that temporal markers like 2024-10-25 or 2023-06-06 are evaluated as chronological sequences rather than opaque text. Meanwhile, string-typed attributes such as format or code store operational directives like RFC-3339, A-01, or Checksum Algo 01, preserving exact formatting requirements for downstream parsers. The segregation of attribute definitions from their instantiated values allows governance engines to validate metadata contracts independently of the payload, accelerating both ingestion pipelines and regulatory reporting cycles.

The actual attribute values reside in specialized storage buckets that align with their type constraints, optimizing query performance and minimizing storage overhead. Date-typed values are isolated in dedicated temporal tables, enabling range scans and partition pruning for compliance windows spanning 2023-04-24 through 2024-10-25. String-typed values occupy separate character stores, where entries like Encoding 03 or model_artifact_x7 can be indexed without interfering with numeric or temporal workloads. This misc data partitioning reflects a deliberate architectural choice: by routing values through type-specific pathways, the system eliminates implicit casting, reduces join complexity, and ensures that validation rules applied at the attr type level are enforced at the point of insertion rather than during downstream consumption.

Cross-entity dependencies are governed through a tripartite relationship model that explicitly defines the subject, the target, and the functional role assigned to the linkage. The subject denotes the originating entity initiating the connection, the target represents the destination system or dependent artifact, and the role encodes the permission context—owner, observer, reviewer, or contributor—that dictates access rights and data flow responsibilities. In infrastructure migration workflows, a source schema such as MIGR-0004 may designate a target warehouse as owner while assigning a secondary endpoint the role of observer, thereby establishing a clear chain of custody. Similarly, network attachment policies map a source cgroup to a target service like system.slice/nginx.service or docker/7d8e9f0a1b2c, tagging each linkage with a role that enforces least-privilege segmentation and prevents unauthorized cross-boundary traffic.

**t_schema_migration_subclass__migrates_schema_to**

| id | schema_id | migrates_schema_to_id | role |
| --- | --- | --- | --- |
| MIGR-0001 | MIGR-0004 | MIGR-0001 | owner |
| MIGR-0002 | MIGR-0004 | MIGR-0007 | observer |
| MIGR-0003 | MIGR-0004 | MIGR-0007 | reviewer |
| MIGR-0004 | MIGR-0002 | MIGR-0004 | observer |
| MIGR-0005 | MIGR-0001 | MIGR-0001 | reviewer |
| MIGR-0006 | MIGR-0001 | MIGR-0008 | owner |
| MIGR-0007 | MIGR-0004 | MIGR-0002 | contributor |
| MIGR-0008 | MIGR-0001 | MIGR-0002 | owner |

**t_cgroup_skb_subclass__attaches_to_cgroup**

| id | cgroup_id | attaches_to_cgroup_id | role |
| --- | --- | --- | --- |
| SKB-0001 | SKB-0005 | SKB-0001 | observer |
| SKB-0002 | SKB-0006 | SKB-0002 | contributor |
| SKB-0003 | SKB-0001 | SKB-0005 | owner |
| SKB-0004 | SKB-0006 | SKB-0005 | reviewer |
| SKB-0005 | SKB-0002 | SKB-0004 | owner |
| SKB-0006 | SKB-0003 | SKB-0005 | owner |
| SKB-0007 | SKB-0001 | SKB-0001 | reviewer |
| SKB-0008 | SKB-0003 | SKB-0003 | observer |

Together, these constructs form a cohesive governance layer that transforms raw connectivity into a policy-enforced, auditable fabric. The explicit separation of identity, metadata, values, and relationships ensures that every cross-system dependency carries a complete provenance chain, from the initial identifier assignment through type-validated attribute instantiation to role-scoped target attachment. This architecture supports rigorous compliance frameworks by making every data lineage traceable, every attribute constraint verifiable, and every relationship permission explicit. When regulatory submissions reference production_schema or machine learning pipelines consume feature_store_metrics, the underlying model guarantees that access is granted only through documented roles, that values conform to declared types, and that every modification can be traced back to its originating entity without ambiguity.

**t_reference_within_dataset_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | checksum_algo | xsd:string |
| DATA-0002 | code | xsd:string |
| DATA-0003 | format | xsd:string |
| DATA-0004 | issued_date | xsd:date |
| DATA-0005 | namespace | xsd:string |
| DATA-0006 | encoding | xsd:string |
| DATA-0007 | label_text | xsd:string |
| DATA-0008 | language | xsd:string |

**t_reference_within_dataset_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | 2024-10-25 |
| DATA-0002 | DATA-0002 | DATA-0004 | 2024-06-06 |
| DATA-0003 | DATA-0003 | DATA-0004 | 2023-04-24 |
| DATA-0004 | DATA-0004 | DATA-0004 | 2023-10-13 |
| DATA-0005 | DATA-0005 | DATA-0004 | 2023-04-15 |
| DATA-0006 | DATA-0006 | DATA-0004 | 2024-06-08 |

**t_reference_within_dataset_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | Checksum Algo 01 |
| DATA-0002 | DATA-0001 | DATA-0002 | A-01 |
| DATA-0003 | DATA-0001 | DATA-0006 | Encoding 03 |
| DATA-0004 | DATA-0001 | DATA-0003 | RFC-3339 |
| DATA-0005 | DATA-0001 | DATA-0007 | intake form |
| DATA-0006 | DATA-0001 | DATA-0008 | en |
| DATA-0007 | DATA-0001 | DATA-0005 | Namespace 07 |
| DATA-0008 | DATA-0002 | DATA-0001 | Checksum Algo 08 |