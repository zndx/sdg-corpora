---
chapter_id: ch_live_dataset_revision_of_2f0e3f
topic_id: 14
family: 05_provo_lineage
cited_terms: ['dataset_revision_of', 'audit_with_findings', 'schemaorg_person_roleat']
model: engine-refine
---

The governance of data assets rests upon a disciplined architecture of identifiers, ownership, and typed attributes that together render every revision, audit, and role assignment traceable and enforceable. Each entity within the system receives a stable identifier—REVI-0001 through REVI-0004 for dataset revisions, FIND-0001 through FIND-0004 for audit findings, and ROLE-0001 through ROLE-0004 for organizational role assignments—providing the immutable anchor points across all relational tables. These identifiers do not merely label records; they serve as the foreign-key conduits through which metadata flows. A dataset revision such as sensor-fusion-calibration, recorded under identifier REVI-0001, carries an owner designation of ml-infra and a MIME type of application/xml, while its predecessor, grid-load-forecast-base, is captured in the was_revision_of column, establishing lineage. Similarly, the HIPAA Security Assessment audit (FIND-0001) is linked to the SANS Institute (ROLE-0001) through the role_at relationship, binding institutional accountability to a specific compliance event.

**t_dataset_revision_of**

| id | dataset | was_revision_of | mime_type | owner |
| --- | --- | --- | --- | --- |
| REVI-0001 | sensor-fusion-calibration | grid-load-forecast-base | application/xml | ml-infra |
| REVI-0002 | customer-churn-features | market-index-initial | application/octet-stream | governance |
| REVI-0003 | satellite-telemetry-v2 | proteomics-mass-spec-v1 | application/octet-stream | ml-infra |
| REVI-0004 | genomics-raw-reads-q3 | baseline-genomics-q2 | application/parquet | ml-infra |

**t_audit_with_findings**

| id | audit | findings | duration_seconds | host_name |
| --- | --- | --- | --- | --- |
| FIND-0001 | HIPAA Security Assessment | ROLE-0004 | 5564.74 | worker-07 |
| FIND-0002 | Data Lake Governance Review | ROLE-0003 | 1140.43 | node-a01 |
| FIND-0003 | SOC 2 Type II Review | ROLE-0002 | 7105.34 | node-b14 |
| FIND-0004 | ISO 27001 Certification | ROLE-0001 | 2350.00 | edge-03 |
| FIND-0005 | Third-Party Vendor Review | ROLE-0001 | 2041.65 | worker-07 |
| FIND-0006 | Data Lake Governance Review | ROLE-0007 | 3303.91 | ingest-21 |
| FIND-0007 | ML Model Drift Audit | ROLE-0007 | 5489.56 | ingest-21 |

**t_schemaorg_person_roleat**

| id | schemaorg | role_at |
| --- | --- | --- |
| ROLE-0001 | SANS Institute | FIND-0001 |
| ROLE-0002 | WHO Cyber Health | FIND-0007 |
| ROLE-0003 | NASA Ames Research | FIND-0007 |
| ROLE-0004 | DARPA InfoTech | FIND-0003 |
| ROLE-0005 | Red Hat OpenShift | FIND-0005 |
| ROLE-0006 | IEEE Standards | FIND-0003 |
| ROLE-0007 | DARPA InfoTech | FIND-0007 |

**t_schemaorg_person_roleat_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ROLE-0001 | checksum | xsd:string |
| ROLE-0002 | created_date | xsd:date |
| ROLE-0003 | identifier | cco:DesignativeICE |
| ROLE-0004 | license | xsd:string |
| ROLE-0005 | mime_type | xsd:string |
| ROLE-0006 | size_bytes | xsd:long |
| ROLE-0007 | uri | xsd:string |
| ROLE-0008 | version | xsd:integer |

**t_schemaorg_person_roleat_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0006 | 325 |
| ROLE-0002 | ROLE-0001 | ROLE-0008 | 7 |
| ROLE-0003 | ROLE-0002 | ROLE-0006 | 319 |
| ROLE-0004 | ROLE-0002 | ROLE-0008 | 10 |
| ROLE-0005 | ROLE-0003 | ROLE-0006 | 407 |
| ROLE-0006 | ROLE-0003 | ROLE-0008 | 6 |
| ROLE-0007 | ROLE-0004 | ROLE-0006 | 258 |
| ROLE-0008 | ROLE-0004 | ROLE-0008 | 6 |

The attribute system itself operates as a schema-on-read layer, decoupling the definition of metadata properties from their storage. The attribute catalog—represented by attr_name and attr_type columns—declares properties such as checksum typed as xsd:string, created_date as xsd:date, identifier as cco:DesignativeICE, and license as xsd:string. These type declarations are not arbitrary; they enforce semantic discipline across heterogeneous value stores. Date attributes materialize in a dedicated value table carrying entity_id references like ROLE-0001 and ROLE-0002, with temporal values ranging from 2023-01-21 to 2025-01-23, while integer-valued attributes such as ROLE-0006 and ROLE-0008 hold numeric measures including 325, 7, 319, and 10. String-valued attributes populate a third value table, storing identifiers like c0ffee42, URNs such as urn:uuid:9f2a, license designations including CC-BY-4.0, and zone assignments like zone-b. This tripartite value architecture—date, integer, varchar—allows the system to accommodate diverse metadata without imposing a rigid columnar schema on every entity.

**t_schemaorg_person_roleat_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0002 | 2025-01-23 |
| ROLE-0002 | ROLE-0002 | ROLE-0002 | 2024-08-11 |
| ROLE-0003 | ROLE-0003 | ROLE-0002 | 2023-01-21 |
| ROLE-0004 | ROLE-0004 | ROLE-0002 | 2023-10-22 |
| ROLE-0005 | ROLE-0005 | ROLE-0002 | 2023-09-13 |
| ROLE-0006 | ROLE-0006 | ROLE-0002 | 2023-05-29 |
| ROLE-0007 | ROLE-0007 | ROLE-0002 | 2024-03-07 |

**t_schemaorg_person_roleat_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0001 | ROLE-0001 | c0ffee42 |
| ROLE-0002 | ROLE-0001 | ROLE-0003 | urn:uuid:9f2a |
| ROLE-0003 | ROLE-0001 | ROLE-0004 | CC-BY-4.0 |
| ROLE-0004 | ROLE-0001 | ROLE-0009 | zone-b |
| ROLE-0005 | ROLE-0001 | ROLE-0005 | text/plain |
| ROLE-0006 | ROLE-0001 | ROLE-0010 | Name 06 |
| ROLE-0007 | ROLE-0001 | ROLE-0011 | platform-team |
| ROLE-0008 | ROLE-0001 | ROLE-0012 | Tags 08 |

Audit duration and host placement form a second dimension of operational observability. The duration_seconds column records the elapsed time of compliance assessments with fractional precision: the HIPAA Security Assessment consumed 5564.74 seconds, the Data Lake Governance Review 1140.43 seconds, the SOC 2 Type II Review 7105.34 seconds, and the ISO 27001 Certification 2350.00 seconds. These figures are not abstract metrics; they are bound to specific execution hosts—worker-07, node-a01, node-b14, and edge-03—creating a spatial-temporal map of where governance workloads executed and how long they persisted. The hostname column thus functions as a deployment topology indicator, enabling operators to correlate audit performance with infrastructure characteristics and to detect anomalies in execution environments.

Ownership and MIME type complete the provenance chain for dataset revisions, anchoring each artifact to a responsible team and a concrete serialization format. The owner column distinguishes between ml-infra, which governs sensor-fusion-calibration, satellite-telemetry-v2, and genomics-raw-reads-q3, and governance, which owns customer-churn-features. MIME types—application/xml, application/octet-stream, and application/parquet—signal the encoding of the revision payload, informing downstream consumers about how to deserialize and validate the artifact. Together, these fields ensure that every dataset revision carries not only its own identity and lineage but also the institutional and technical context required for auditability, access control, and format-aware processing.