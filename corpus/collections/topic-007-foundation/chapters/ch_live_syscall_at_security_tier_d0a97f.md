---
chapter_id: ch_live_syscall_at_security_tier_d0a97f
topic_id: 7
family: 04_ebpf_kernel
cited_terms: ['syscall_at_security_tier', 'reference_subclass', 'profile_has_null_rate']
model: engine-refine
---

Security tier classifications form the backbone of an auditable event taxonomy, anchoring operational telemetry to a structured hierarchy of protection levels. The fact table for system call events records each invocation alongside a foreign key pointing to a security tier dimension, thereby binding raw event counts—such as 238 calls at one tier, 52 at another, and 382 at a fourth—to their respective classification labels. Each tier carries a human-readable designation, for instance *At Security Tier Label 01*, and a categorical grouping like *At Security Tier Category 01*, enabling analysts to aggregate and filter events by both granular label and broader category. This two-tier labeling scheme—label for display, category for grouping—mirrors the practice of conference proceedings that pair precise venue identifiers with broader thematic classifications, ensuring that event data remains both machine-readable and interpretable by human reviewers.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

Reference subclass records extend this taxonomy by documenting the provenance and lineage of policy artifacts that govern security tier assignments. Each reference carries a unique identifier—*REFE-0001* through *REFE-0004*—alongside a human-readable reference name, a target it points to (*Points To 01*, *Points To 02*), an issuance date spanning from September 2023 through May 2025, and a namespace that situates the reference within a governance domain such as *provenance*, *lineage*, or *governance*. The namespace field is particularly critical: it disambiguates references that might otherwise collide, ensuring that a policy document issued under the *governance* namespace is distinguishable from one sharing a similar title under *lineage*. This namespace-based partitioning is a standard pattern in regulatory frameworks where multiple authoritative bodies produce overlapping documentation.

**t_reference_subclass**

| id | reference | points_to | issued_date | namespace |
| --- | --- | --- | --- | --- |
| REFE-0001 | Reference 01 | Points To 01 | 2024-02-21 | provenance |
| REFE-0002 | Reference 02 | Points To 02 | 2024-12-07 | lineage |
| REFE-0003 | Reference 03 | Points To 03 | 2025-05-30 | governance |
| REFE-0004 | Reference 04 | Points To 04 | 2023-09-26 | lineage |
| REFE-0005 | Reference 05 | Points To 05 | 2024-10-25 | provenance |
| REFE-0006 | Reference 06 | Points To 06 | 2023-04-21 | catalog |

Null rate definitions and their association with quality profiles constitute a parallel tracking mechanism for data completeness and measurement gaps. Profiles such as *QualityGateConfig*, *ObservationProtocolAlpha*, and *SensorTelemetryV2* are each assigned a null rate identifier—*dropRate*, *absentMetric*, or *missingBaseline*—that quantifies the nature and severity of data absence within that profile's scope. The null rate itself is a categorical descriptor rather than a numeric value; it signals whether a metric is being dropped during collection, entirely absent from the pipeline, or lacking a baseline against which deviations can be measured. This categorical approach allows governance teams to reason about data quality issues at a policy level before drilling into the specific numerical thresholds that trigger remediation.

**t_profile_has_null_rate**

| id | profile |
| --- | --- |
| RATE-0001 | QualityGateConfig |
| RATE-0002 | QualityGateConfig |
| RATE-0003 | ObservationProtocolAlpha |
| RATE-0004 | SensorTelemetryV2 |
| RATE-0005 | TelemetryStreamSchema |
| RATE-0006 | TelemetryStreamSchema |
| RATE-0007 | QualityGateConfig |

**t_profile_has_null_rate_null_rate**

| id | null_rate |
| --- | --- |
| RATE-0001 | dropRate |
| RATE-0002 | absentMetric |
| RATE-0003 | missingBaseline |
| RATE-0004 | absentMetric |
| RATE-0005 | absentMetric |
| RATE-0006 | zeroPointTwo |

The associative junction between profiles and null rates introduces a role-based dimension to data quality governance. Each association record links a profile identifier to a null rate identifier through a subject-target relationship, while simultaneously assigning a role—*owner*, *contributor*, or *reviewer*—that defines the stakeholder's responsibility for that particular pairing. For example, the profile *ObservationProtocolAlpha* may be owned by a stakeholder responsible for the *missingBaseline* null rate, while a separate association under the same profile designates a different stakeholder as a *contributor* to the *absentMetric* rate. This role-based mapping ensures accountability: the owner is responsible for defining acceptance criteria, the contributor for implementing collection logic, and the reviewer for validating that null rates remain within acceptable bounds.

**t_profile_has_null_rate__null_rate**

| id | profile_id | null_rate_id | role |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0003 | RATE-0005 | owner |
| RATE-0002 | RATE-0007 | RATE-0002 | contributor |
| RATE-0003 | RATE-0004 | RATE-0006 | reviewer |
| RATE-0004 | RATE-0004 | RATE-0001 | contributor |
| RATE-0005 | RATE-0007 | RATE-0003 | observer |
| RATE-0006 | RATE-0007 | RATE-0006 | owner |
| RATE-0007 | RATE-0001 | RATE-0001 | contributor |
| RATE-0008 | RATE-0004 | RATE-0001 | contributor |

Together, these tables form a cohesive governance fabric in which security tier classifications, reference provenance, and data quality roles are interlocked through explicit foreign-key relationships. The identifier columns serve as the primary keys that bind the entire structure, while the subject and target columns in the associative table create a many-to-many mapping that supports flexible role assignment. Event counts flow from the fact table into analytical dashboards, enriched by the category and label metadata from the dimension table, while the namespace and issued date fields on reference records provide the temporal and jurisdictional context needed for compliance audits. This architecture ensures that every event can be traced back to its security tier, its governing reference, and the quality profile that monitors its data integrity—a chain of custody that is essential for regulatory reporting and incident response.