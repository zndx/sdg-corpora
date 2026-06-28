---
chapter_id: ch_live_artifact_with_universal_a4d346
topic_id: 109
family: 01_foundation
cited_terms: ['artifact_with_universal', 'belief_interval_with_upper_bound', 'policy_effective_period']
model: engine-refine
---

The identifier column serves as the universal primary key across the artifact and belief-interval registries, anchoring every record with a stable, human-readable handle. In the artifact registry, identifiers such as `UNIV-0001` through `UNIV-0004` uniquely name concrete deliverables—`Audit_Reporter`, `Feature_Vector_Store`, `Schema_Definition`, and `Container_Image_Release`—while the belief-interval table employs the parallel `BOUN-0001` through `BOUN-0004` scheme to tag abstract uncertainty bounds associated with observations like `Model feature shift`, `Batch ingestion failure`, `Sensor calibration drift`, and `Storage quota warning`. The policy effective-period table extends this convention with `PERI-0001` through `PERI-0004`, each row binding a regulatory regime—`HIPAA Privacy Rule`, `GDPR Compliance`, `PCI DSS v4.0`, `NIST SP 800-53`—to a temporal window. This consistent naming discipline ensures that cross-referencing between tables remains unambiguous and auditable.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | BOUN-0006 | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | BOUN-0004 | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | BOUN-0002 | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | BOUN-0003 | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | BOUN-0005 | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | BOUN-0005 | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | BOUN-0006 | 2023-11-17 | on-prem-dc1 |

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | UNIV-0005 |
| BOUN-0002 | Batch ingestion failure | UNIV-0006 |
| BOUN-0003 | Sensor calibration drift | UNIV-0003 |
| BOUN-0004 | Storage quota warning | UNIV-0001 |
| BOUN-0005 | Latency SLA breach | UNIV-0007 |
| BOUN-0006 | Model feature shift | UNIV-0006 |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

The entity column functions as the foreign-key pointer that attaches attribute values back to their parent belief-interval record. In the value tables—segregated by type into datetime, decimal, and varchar variants—the entity column consistently references `BOUN-0001` or `BOUN-0002`, establishing a many-to-one relationship where a single belief interval accumulates multiple typed attributes. For instance, belief interval `BOUN-0001` carries a decimal confidence value of `0.680`, a dimension kind labeled `Dimension Kind 01`, and a recorded-at timestamp of `2024-12-10T20:43:33`, all linked through the same entity identifier. This normalization pattern preserves type safety while allowing heterogeneous attributes to coexist under a single parent record.

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

The attr column completes the entity–attr–value triple by pointing to the attribute definition stored in the metadata table, where each attribute is described by its name and its XML Schema type. The attribute registry declares `confidence` as `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`; the value tables then enforce these types at insert time, routing decimal values into the decimal store, strings into the varchar store, and timestamps into the datetime store. The attr_id column in each value table—taking values such as `BOUN-0001`, `BOUN-0004`, `BOUN-0007`—resolves to the corresponding definition row, ensuring that every stored value can be semantically interpreted against its declared type. The misc column, used as the value carrier across all three value tables, holds the actual data—whether `0.680`, `Encoding 02`, or `2024-02-10T17:59:05`—and its name signals that the column is a generic container whose meaning is derived entirely from the linked attribute definition.

The createddate column in the artifact table records the provenance timestamp for each deliverable, providing an immutable audit trail of when artifacts entered the system. Entries such as `2024-12-09` for `Audit_Reporter` and `2024-10-11` for `Schema_Definition` enable chronological ordering, SLA tracking, and retention-policy enforcement without requiring a separate audit log. The location column, similarly, captures the deployment or storage context of each artifact, distinguishing cloud-hosted instances in `us-east-1` from on-premises deployments in `on-prem-dc1`, a distinction that matters for data-residency compliance and incident response routing.

The scope and language columns in the policy effective-period table govern the applicability and linguistic context of regulatory requirements. Scope values of `local`, `global`, and `team` delineate the organizational reach of each policy—`HIPAA Privacy Rule` and `GDPR Compliance` both carry a `local` scope, while `NIST SP 800-53` is scoped to `team` and `PCI DSS v4.0` to `global`—allowing downstream systems to filter or escalate obligations based on the consumer's jurisdictional boundary. Language values such as `es` and `fr` indicate the locale of the policy text, ensuring that the correct version is served to stakeholders in their preferred language. Together, scope and language transform a static policy definition into a context-aware directive that can be evaluated against the organizational and linguistic profile of the consuming entity.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | BOUN-0003 | local | es |
| PERI-0002 | GDPR Compliance | BOUN-0006 | local | es |
| PERI-0003 | PCI DSS v4.0 | BOUN-0001 | global | fr |
| PERI-0004 | NIST SP 800-53 | BOUN-0005 | team | es |
| PERI-0005 | CCPA Data Rights | BOUN-0004 | team | es |