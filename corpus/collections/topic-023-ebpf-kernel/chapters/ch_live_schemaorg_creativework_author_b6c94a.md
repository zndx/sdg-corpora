---
chapter_id: ch_live_schemaorg_creativework_author_b6c94a
topic_id: 23
family: 07_long_tail
cited_terms: ['schemaorg_creativework_author', 'policy_attests_artifact', 'profiling_targets_dataset']
model: engine-refine
---

Governed information systems treat every recordable fact as a typed assertion bound to a stable identifier and anchored to an entity whose lifecycle must remain auditable across compliance, provenance, and operational telemetry domains. The identifier—whether AUTH-0001 for a Schema.org CreativeWork author binding or ARTI-0003 for a policy attestation artifact—functions not merely as a surrogate key but as the durable coordinate by which downstream reconciliation, crosswalk, and evidentiary citation occur; without it, a checksum such as 7b14de08 or a license value GPL-3.0 could not be attributed unambiguously to the API_Reference_Guide maintained by WorkflowEngineer rather than to the Provenance_Trace_Report authored by APIMaintainer. Entity linkage completes this contract: each value row carries an entity reference that specifies which governed object owns the assertion, so that created_date 2023-12-01 for AUTH-0001 and 2024-12-04 for AUTH-0002 remain distinct provenance events even when both rows share the same attr identifier AUTH-0002 and the same attr_type xsd:date.

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | WorkflowEngineer |
| AUTH-0002 | Provenance_Trace_Report | APIMaintainer |
| AUTH-0003 | API_Reference_Guide | SensorArchitect |
| AUTH-0004 | Provenance_Trace_Report | ModelReviewer |
| AUTH-0005 | Sensor_Network_Spec | ModelReviewer |
| AUTH-0006 | Catalog_Metadata_Index | ModelReviewer |
| AUTH-0007 | Telemetry_Config_Spec | CatalogAdmin |
| AUTH-0008 | Catalog_Metadata_Index | CatalogAdmin |

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

**t_policy_attests_artifact**

| id | policy |
| --- | --- |
| ARTI-0001 | FedRAMP Storage Mandate |
| ARTI-0002 | Zero Trust Access Policy |
| ARTI-0003 | NIST Encryption Protocol |
| ARTI-0004 | HIPAA Data Minimization Rule |
| ARTI-0005 | ISO Privacy Guideline |
| ARTI-0006 | Zero Trust Access Policy |

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

Attribute semantics are declared separately from their stored values through attr and attr_type, a separation that enforces validation discipline and permits heterogeneous storage without collapsing type safety. An attr name such as checksum, identifier, license, effective_date, enforcement, mandatory, or priority denotes the compliance or metadata role of the field, while attr_type—xsd:string, xsd:date, xsd:boolean, xsd:integer, or a domain-specific construct such as cco:DesignativeICE for designative identity-bearing identifiers—prescribes the interpretive grammar under which misc values must be parsed, compared, and enforced. Thus gid://svc/77 is admissible only where identifier is typed as cco:DesignativeICE, whereas on-prem-dc1 and intake form remain varchar misc under xsd:string enforcement rules; boolean mandatory=true for FedRAMP Storage Mandate, Zero Trust Access Policy, and NIST Encryption Protocol contrasts with mandatory=false for HIPAA Data Minimization Rule, transforming a single attr into a gate that determines whether attestation failure blocks release. Integer misc under priority—values 2 and 49 for ARTI-0001, 2 and 915 for ARTI-0002—further illustrates how attr_type routes assertions into type-specialized value planes so that lexical, temporal, numeric, and logical comparisons remain well defined at query and policy-evaluation time.

**t_policy_attests_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | true |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | false |

The misc column, in this architecture, denotes the payload of an assertion once entity, attr, and attr_type have fixed its meaning: it is the evidentiary content, not an undifferentiated catch-all. For creative-work lineage, misc carries checksum digests, calendar dates, service-global identifiers, license tokens, and deployment locality markers; for policy artifacts, it carries effective_date thresholds ranging from 2023-10-01 through 2025-04-17, enforcement descriptors such as Encoding 01 and Enforcement 02, and locale codes like en. Profiling dimensions reuse misc at the descriptive layer—Profiling Label 01 through Profiling Label 04—while reserving quantitative telemetry for fact tables. This partitioning matters because governance reviewers must distinguish declarative metadata, which misc predominantly holds in the entity–attribute model, from executional measurements, which are captured under duration_seconds, exit, and retry_count.

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

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 6716.87 | 725 | 209 |
| DATA-0002 | DATA-0006 | 1113.38 | 809 | 186 |
| DATA-0003 | DATA-0006 | 2546.61 | 348 | 303 |
| DATA-0004 | DATA-0006 | 2074.93 | 827 | 264 |

Operational profiling closes the loop between static attestation and runtime behavior by recording how long governed processes endure, how they terminate, and how persistently they are retried before success or abandonment. Each fact row binds a profiling key—DATA-0003 for a 6716.87-second run, DATA-0006 for repeated observations at 1113.38, 2546.61, and 2074.93 seconds—to duration_seconds as the primary latency evidence, exit as the terminal status code (725, 809, 348, 827 in the sampled corpus), and retry_count as the resilience counter (209, 186, 303, 264 attempts respectively). High retry_count paired with non-zero exit codes signals brittle integration or policy friction worth correlating back to entity-level assertions: a workflow that retries 303 times before exiting 348 may be contending with a mandatory policy whose effective_date has not yet propagated, or with an identifier mismatch between gid://svc/77 and the enforcement regime labeled Enforcement 02.

Category stratifies profiling observations for aggregate reporting without collapsing individual identifiers. dim_profiling assigns each profiling_label to a profiling_category—Profiling Category 01 through Profiling Category 04—so that duration_seconds and retry_count may be summarized by operational class while preserving row-level traceability through DATA-0001, DATA-0002, DATA-0003, and DATA-0004. In practice, category enables compliance officers to ask whether a given class of data-ingestion or attestation job systematically exceeds latency budgets or exhibits elevated exit codes, whereas identifier-level facts support incident reconstruction. The pairing of category with profiling_key further allows multiple executions under the same key—three distinct runs referencing DATA-0006—to be interpreted as repeated samples of a single instrumented pathway rather than unrelated events.

Taken together, identifier, entity, attr, attr_type, and misc constitute the declarative spine of a governance framework in which creative works, policy artifacts, and their attributes remain human- and machine-readable across Schema.org and regulatory vocabularies, while category, profiling, duration_seconds, exit, and retry_count supply the behavioral evidence required to demonstrate that declared controls operate under load. A reviewer examining AUTH-0003—SensorArchitect on Provenance_Trace_Report with created_date 2023-05-29, integer misc values 393 and 3, and license-adjacent varchar assertions—can align that static portrait against profiling telemetry to determine whether the systems that mint and attest such records honor the same temporal, mandatory, and priority constraints encoded for ARTI-0001 through ARTI-0004. The architecture succeeds when identifiers remain stable, attr_types are honored at write time, misc values are interpretable under their declared types, and profiling facts report exit and retry behavior with sufficient duration_seconds granularity to distinguish transient contention from structural noncompliance.

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

**dim_profiling**

| id | profiling_label | profiling_category |
| --- | --- | --- |
| DATA-0001 | Profiling Label 01 | Profiling Category 01 |
| DATA-0002 | Profiling Label 02 | Profiling Category 02 |
| DATA-0003 | Profiling Label 03 | Profiling Category 03 |
| DATA-0004 | Profiling Label 04 | Profiling Category 04 |
| DATA-0005 | Profiling Label 05 | Profiling Category 05 |
| DATA-0006 | Profiling Label 06 | Profiling Category 06 |