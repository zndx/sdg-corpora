---
chapter_id: ch_live_outlier_claim_against_baseline_ee030c
topic_id: 105
family: 02_observation_measurement
cited_terms: ['outlier_claim_against_baseline', 'classification_subclass', 'verification_basic']
model: engine-refine
---

Outlier claims in a compliance environment are not asserted in isolation; they are structured as directed relationships between a deviation and the standard against which it is measured, with each participant carrying a defined role. An identifier such as BASE-0001 anchors a claim that a telemetry log error 404 violates the policy rule governance, while BASE-0002 records a pH reading 11.2 deviation against the SLA latency threshold. The association table binds these pairs—linking outlier_id to against_id—and assigns a role to the relationship: reviewer, contributor, or observer. This triad of subject, target, and role is the fundamental unit of accountability. A reviewer role on BASE-0001 signals that the entity identified by BASE-0001 is being evaluated against the standard BASE-0005, whereas a contributor role on BASE-0003 indicates that BASE-0005 is actively shaping the baseline BASE-0001. The distinction between subject and target is not semantic decoration; it determines audit trails, escalation paths, and the direction of remediation obligations.

**t_outlier_claim_against_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | telemetry_log_error_404 |
| BASE-0002 | pH_reading_11_2_deviation |
| BASE-0003 | telemetry_log_error_404 |
| BASE-0004 | schema_drift_column_count |
| BASE-0005 | metric_latency_p99_exceed |
| BASE-0006 | pH_reading_11_2_deviation |

**t_outlier_claim_against_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | policy_rule_governance |
| BASE-0002 | sla_latency_threshold |
| BASE-0003 | regulatory_limit_max |
| BASE-0004 | policy_rule_governance |
| BASE-0005 | policy_rule_governance |
| BASE-0006 | baseline_model_v4 |

**t_outlier_claim_against_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | reviewer |
| BASE-0002 | BASE-0001 | BASE-0006 | reviewer |
| BASE-0003 | BASE-0005 | BASE-0001 | contributor |
| BASE-0004 | BASE-0005 | BASE-0001 | observer |
| BASE-0005 | BASE-0003 | BASE-0002 | observer |
| BASE-0006 | BASE-0001 | BASE-0003 | observer |
| BASE-0007 | BASE-0002 | BASE-0006 | observer |
| BASE-0008 | BASE-0001 | BASE-0002 | observer |

Verification activities are captured as entities with typed attributes, each attribute carrying a name and an XSD type that constrains the shape of the value. The attribute duration_seconds is declared as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This type discipline is enforced not by a single denormalized column but by a family of value tables—t_verification_basic_val_decimal, t_verification_basic_val_datetime, t_verification_basic_val_int, and t_verification_basic_val_varchar—each storing the misc value for a given entity_id and attr_id pair. A verification record VERI-0001, for instance, carries a duration of 500.97 decimal seconds, an end_time of 2023-02-01T08:41:13, an exit_code of 182, and a host_name of ingest-21. The same entity may also carry a Log Level 02 string and an execution status of complete, each value routed to the correct type-specific table by the attr_id foreign key. This schema design ensures that a decimal value of 4488.38 attached to VERI-0002 is never conflated with a datetime value of 2023-06-06T17:03:25 attached to the same entity, even though both are misc values in the generic sense.

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

The exit_code and status fields provide a parallel, coarser-grained view of verification outcomes. A classification record CLAS-0001 carries an OWASP Risk Rating classification with exit_code 493 and status failed; CLAS-0003 carries a GDPR Data Category classification with exit_code 581 and status complete. The exit_code is itself an attribute—xsd:integer—stored in the integer value table alongside other numeric attributes such as the 65 and 828 values associated with VERI-0001 and VERI-0002 respectively. The status field, a varchar, records the lifecycle state of the classification or verification: failed, pending, or complete. These two fields together form a quick-lookup summary that complements the richer attribute-level data. A status of complete does not guarantee correctness; it only indicates that the verification process reached a terminal state. The exit_code, by contrast, encodes the specific reason for that terminal state—whether the compliance snapshot test returned 493, the calibration certificate review returned 301, or the pipeline integrity check returned 581.

The outlier classification domain operates under a similar principle of structured relationships. Outliers such as schema_drift_column_count (BASE-0004) and telemetry_log_error_404 (BASE-0003) are each measured against a regulatory_limit_max or a policy_rule_governance, and the association between them is mediated by the junction table that assigns roles. The same identifier can appear in multiple association rows with different roles: BASE-0001 appears as a subject with reviewer role against BASE-0005, and BASE-0005 appears as a subject with contributor role against BASE-0001. This bidirectional referencing captures the fact that compliance is not a one-way assertion but a negotiated relationship between the observed deviation and the governing standard. The identifiers BASE-0001 through BASE-0004 serve as stable keys across all three outlier tables, enabling joins that reconstruct the full claim: which outlier, against which baseline, and in what capacity.

In practice, the interplay of identifier, attr, attr_type, entity, exitcode, misc, role, status, subject, and target forms a queryable model of compliance evidence. A compliance engineer can trace from a verification entity through its typed attributes to the specific misc values that substantiate a claim, then follow the outlier associations to identify which policy rules or regulatory limits were violated and by whom. The exit_code and status fields provide immediate triage signals, while the role field determines who is accountable for remediation. The type discipline enforced by the attr_type declarations ensures that the misc values are semantically coherent across the value tables, preventing the kind of type confusion that undermines audit integrity. This is not a schema for its own sake; it is a formalization of how compliance evidence is structured, stored, and retrieved in an operational environment where the cost of misinterpretation is measured in regulatory penalties and operational failures.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |