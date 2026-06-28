---
chapter_id: ch_live_policy_equiv_jurisdiction_and_scope_10c026
topic_id: 23
family: 03_directive_governance
cited_terms: ['policy_equiv_jurisdiction_and_scope', 'policy_attests_artifact', 'profiling_targets_dataset']
model: engine-refine
---

Policy artifacts serve as the primary anchors for compliance metadata, each identified by a scoped identifier such as ARTI-0001 or ARTI-0002, and associated with a policy designation like EU AI Act, NIST Encryption Protocol, GDPR, or Patient Health Records. The attributes attached to these artifacts—effective_date, enforcement, mandatory, priority—carry explicit type annotations (xsd:date, xsd:string, xsd:boolean, xsd:integer) that govern how their values are stored, validated, and queried. This type discipline is enforced through a value-dispatch architecture: boolean attributes resolve to a dedicated value table where entries like ARTI-0003 yield true or false depending on the entity; date attributes map to a separate store with values such as 2023-10-01, 2024-11-14, 2024-03-16, and 2025-04-17; integer attributes hold magnitudes ranging from 2 to 915; and string attributes carry free-form content including intake form, en, Encoding 01, and Enforcement 02. The entity column in each value table ties the concrete value back to its parent artifact, while the attr_id column disambiguates which attribute the value belongs to, ensuring that a single artifact can carry multiple typed attributes without type collision.

**t_policy_attests_artifact**

| id | policy |
| --- | --- |
| ARTI-0001 | EU AI Act |
| ARTI-0002 | NIST Encryption Protocol |
| ARTI-0003 | GDPR |
| ARTI-0004 | Patient Health Records |
| ARTI-0005 | Zero Trust Access Policy |
| ARTI-0006 | CCPA |

**t_policy_attests_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_policy_attests_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | true |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | false |

**t_policy_attests_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-10-01 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2024-11-14 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-16 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2025-04-17 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2025-02-23 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-06-05 |

**t_policy_attests_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 49 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 2 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 915 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 3 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 439 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 5 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 254 |

**t_policy_attests_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | calibration record |

The governance layer extends beyond individual artifacts into a network of policy-to-jurisdiction and policy-to-scope relationships, each mediated by a role that specifies the nature of the association. In the jurisdiction mapping, a policy such as Third Party Vendors (SCOP-0001) may assume the role of contributor to the NIST 800-53 jurisdiction (SCOP-0001), while simultaneously acting as observer to Cloud Infrastructure (SCOP-0002), or as owner to a jurisdiction identified as SCOP-0006. The governing-scope relationship introduces an additional dimension: cardinality notes that qualify the multiplicity of the association. A policy like Supply Chain Logistics (SCOP-0003) may contribute to the Securities Exchange Commission scope (SCOP-0003) under Cardinality Note 01, while US Federal Trade Commission (SCOP-0004) contributes to PCI DSS (SCOP-0002) under Cardinality Note 04, and an observer role attaches to the same scope under Cardinality Note 03. These cardinality annotations, paired with role designations such as contributor, observer, owner, and reviewer, provide a structured vocabulary for expressing the strength and direction of compliance obligations across regulatory boundaries.

**t_policy_equiv_jurisdiction_and_scope__governs_scope**

| id | policy_id | governs_scope_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SCOP-0001 | SCOP-0003 | SCOP-0003 | contributor | Cardinality Note 01 |
| SCOP-0002 | SCOP-0004 | SCOP-0007 | contributor | Cardinality Note 02 |
| SCOP-0003 | SCOP-0005 | SCOP-0002 | observer | Cardinality Note 03 |
| SCOP-0004 | SCOP-0002 | SCOP-0002 | reviewer | Cardinality Note 04 |
| SCOP-0005 | SCOP-0002 | SCOP-0002 | owner | Cardinality Note 05 |
| SCOP-0006 | SCOP-0005 | SCOP-0001 | observer | Cardinality Note 06 |
| SCOP-0007 | SCOP-0003 | SCOP-0007 | observer | Cardinality Note 07 |
| SCOP-0008 | SCOP-0006 | SCOP-0006 | contributor | Cardinality Note 08 |

Profiling data constitutes a parallel analytical layer, capturing the execution characteristics of compliance-related processes. Each profiling record carries a profiling key that references a specific run—DATA-0003 or DATA-0006 being representative—and is annotated with a profiling label (Profiling Label 01 through Profiling Label 04) and a profiling category (Profiling Category 01 through Profiling Category 04) that classify the nature of the work. The duration_seconds column records wall-clock execution time with sub-second precision, yielding values such as 6716.87, 1113.38, 2546.61, and 2074.93, while the exit_code column captures the termination status of each run—725, 809, 348, 827—enabling post-hoc diagnosis of failures or unexpected completions. The retry_count column, with values ranging from 186 to 303, quantifies the number of recovery attempts before a run stabilized or was abandoned, providing a direct signal of process reliability. Together, these metrics form a profiling telemetry suite that supports capacity planning, anomaly detection, and service-level agreement verification.

**dim_profiling**

| id | profiling_label | profiling_category |
| --- | --- | --- |
| DATA-0001 | Profiling Label 01 | Profiling Category 01 |
| DATA-0002 | Profiling Label 02 | Profiling Category 02 |
| DATA-0003 | Profiling Label 03 | Profiling Category 03 |
| DATA-0004 | Profiling Label 04 | Profiling Category 04 |
| DATA-0005 | Profiling Label 05 | Profiling Category 05 |
| DATA-0006 | Profiling Label 06 | Profiling Category 06 |

The identifier convention—SCOP- prefixed for scope and jurisdiction records, ARTI- prefixed for artifact and attribute records, DATA- prefixed for profiling records—provides a namespace discipline that prevents cross-domain collisions and makes foreign-key relationships immediately legible. A policy_id of SCOP-0001 in the jurisdiction join table unambiguously references the scope record SCOP-0001, while an entity_id of ARTI-0001 in the boolean value table points to the artifact ARTI-0001. This naming convention, combined with the typed value tables and the role-cardinality framework, creates a schema that is both machine-queryable and human-auditable: an analyst can trace a compliance obligation from its originating policy through its jurisdictional mappings, its governed regulatory scopes, and its attribute-level specifications, while a monitoring system can correlate profiling durations, exit codes, and retry counts against the same identifiers to assess operational health.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | Third Party Vendors |
| SCOP-0002 | NIST Encryption Protocol |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | US Federal Trade Commission |
| SCOP-0005 | Securities Exchange Commission |
| SCOP-0006 | Swiss Data Protection |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | Cloud Infrastructure |
| SCOP-0002 | NIST 800-53 |
| SCOP-0003 | US Federal Trade Commission |
| SCOP-0004 | European Commission |
| SCOP-0005 | NIST 800-53 |
| SCOP-0006 | Basel III |

**t_policy_equiv_jurisdiction_and_scope__jurisdiction**

| id | policy_id | jurisdiction_id | role |
| --- | --- | --- | --- |
| SCOP-0001 | SCOP-0001 | SCOP-0002 | contributor |
| SCOP-0002 | SCOP-0001 | SCOP-0001 | observer |
| SCOP-0003 | SCOP-0001 | SCOP-0002 | observer |
| SCOP-0004 | SCOP-0002 | SCOP-0006 | owner |
| SCOP-0005 | SCOP-0003 | SCOP-0005 | contributor |
| SCOP-0006 | SCOP-0004 | SCOP-0002 | owner |
| SCOP-0007 | SCOP-0006 | SCOP-0001 | reviewer |
| SCOP-0008 | SCOP-0001 | SCOP-0006 | reviewer |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Securities Exchange Commission |
| SCOP-0002 | CCPA |
| SCOP-0003 | Swiss Data Protection |
| SCOP-0004 | PCI DSS |
| SCOP-0005 | Data Classification Standard |
| SCOP-0006 | Data Classification Standard |
| SCOP-0007 | NIST 800-53 |

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 6716.87 | 725 | 209 |
| DATA-0002 | DATA-0006 | 1113.38 | 809 | 186 |
| DATA-0003 | DATA-0006 | 2546.61 | 348 | 303 |
| DATA-0004 | DATA-0006 | 2074.93 | 827 | 264 |