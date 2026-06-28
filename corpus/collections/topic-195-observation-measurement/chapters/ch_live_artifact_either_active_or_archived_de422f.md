---
chapter_id: ch_live_artifact_either_active_or_archived_de422f
topic_id: 195
family: 07_long_tail
cited_terms: ['artifact_either_active_or_archived', 'profiling_basic', 'labrun_has_operator']
model: engine-refine
---

In governed artifact registries, every durable object is anchored by an identifier—a stable, designative key that survives lifecycle transitions between active and archived states. The designation ARCH-0001 through ARCH-0004 exemplifies this convention: each identifier binds a composite artifact record whose constituents may include a primary deliverable such as sensor-telemetry-v4, a secondary dependency such as output-sink-delta, and a tertiary association such as test-dataset. Identifiers are not merely surrogate keys for storage convenience; they function as the authoritative handle through which lineage queries, retention policies, and audit attestations resolve to a single logical entity regardless of whether the artifact remains in production circulation or has been relegated to archive.

**t_artifact_either_active_or_archived**

| id | artifact | artifact_2 | artifact_3 |
| --- | --- | --- | --- |
| ARCH-0001 | sensor-telemetry-v4 | output-sink-delta | test-dataset |
| ARCH-0002 | config-repo-main | schema-registry | deployment-target |
| ARCH-0003 | data-catalog-index | upstream-source-beta | test-dataset |
| ARCH-0004 | event-stream-kafka | checksum-validator | compliance-tier |
| ARCH-0005 | config-repo-main | checksum-validator | production-cluster |
| ARCH-0006 | ml-feature-store | validation-module | test-dataset |
| ARCH-0007 | sensor-telemetry-v4 | validation-module | deployment-target |
| ARCH-0008 | batch-ingest-queue | validation-module | dev-sandbox |

Attributes—denoted attr in operational schemas—constitute the typed metadata layer through which compliance-relevant facts attach to entities. Each attr carries an attr_type that prescribes validation semantics and storage routing: checksum and license admit xsd:string literals, created_date requires xsd:date with calendar-day precision, and identifier itself may be governed by a domain-specific ontology such as cco:DesignativeICE, signaling that the value participates in a controlled vocabulary rather than free-form text. The separation of attr definition from attr value is deliberate. Definition records establish name and type; value records bind those definitions to specific entities through entity–attr pairing, with the actual payload held in type-appropriate stores. For ARCH-0001, the checksum attr resolves to the misc value 7b14de08, while created_date for the same entity yields 2024-02-12; license on ARCH-0001 records BSD-3-Clause, and a designative identifier attr may surface ref-8842 or regional placement markers such as ap-south-2 depending on governance scope. Integer-valued attrs—here yielding 356 and 2 on ARCH-0001, 77 and 4 on ARCH-0002—typically encode quantitative policy parameters: retention windows, replication factors, or tier ordinals whose magnitudes must be interpreted against documented thresholds rather than read as opaque counters.

The entity column names the subject to which an attr binding applies, and in well-formed registries entity_id aligns with the artifact identifier unless a deliberate sub-entity decomposition is in force. Misc, in this architecture, denotes the polymorphic value field itself—the concrete datum whose interpretation is entirely determined by the paired attr and attr_type. Treating misc as untyped storage would defeat the schema; auditors therefore require that every misc entry be recoverable to its attr definition before semantic evaluation. A date misc of 2023-06-04 attached to ARCH-0002 under created_date carries different compliance implications than the same calendar string mis-typed under a string attr; attr_type is the contract that prevents such category errors from propagating undetected into downstream controls.

**t_artifact_either_active_or_archived_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0002 | 2024-02-12 |
| ARCH-0002 | ARCH-0002 | ARCH-0002 | 2023-06-04 |
| ARCH-0003 | ARCH-0003 | ARCH-0002 | 2025-05-16 |
| ARCH-0004 | ARCH-0004 | ARCH-0002 | 2024-07-03 |
| ARCH-0005 | ARCH-0005 | ARCH-0002 | 2024-07-21 |
| ARCH-0006 | ARCH-0006 | ARCH-0002 | 2024-03-16 |
| ARCH-0007 | ARCH-0007 | ARCH-0002 | 2025-02-16 |
| ARCH-0008 | ARCH-0008 | ARCH-0002 | 2024-07-02 |

Profiling and operator dimensions extend the same evidentiary discipline to execution telemetry. Profiling records—keyed by identifiers such as PROF-0001 and cross-referenced through profiling_key to dimension rows labeled Profiling Label 01 through Profiling Label 04—capture how automated assessment jobs behave in production. Duration_seconds quantifies wall-clock expenditure: a profiling run may persist for 6716.87 seconds while a sibling invocation under the same profiling_key PROF-0006 completes in 1113.38, 2546.61, or 2074.93 seconds, variance that demands category-aware interpretation rather than naive averaging. Category supplies that interpretive frame: dim_profiling_category entries from Category Name 01 through Category Name 04, linked via category_id such as PROF-0008 or PROF-0007, classify profiling workloads so that duration and failure statistics are compared only within commensurate operational classes. Exit—materialized as exit_code—reports process termination status; non-zero exits including 725, 809, 348, and 827 signal that profiling did not complete under success criteria, and must be triaged against category-specific tolerances rather than a universal zero threshold. Retry_count documents resilience behavior: values of 209, 186, 303, and 264 on profiling facts indicate aggressive re-attempt patterns whose cumulative cost compounds with duration_seconds and may themselves constitute a governance finding when retries mask systemic instability.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

Operator-tracked lab runs mirror this telemetry structure under the operator_key, binding fact rows such as OPER-0001 through OPER-0004 to dimension labels Operator Label 01 through Operator Label 04 and operator_category classifications from Operator Category 01 through Operator Category 04. Duration_seconds on lab runs—4856.18, 4308.22, 4764.89, 5155.73—establish baseline human-orchestrated execution cost against which automated profiling may be benchmarked. Exit codes on operator facts span 122, 691, 566, and notably 3, where a low numeric exit may denote success in one toolchain convention and failure in another, reinforcing that exit interpretation is always operator-category-dependent. Retry_count on operator runs exhibits wider dispersion—265 and 244 versus 106 and 12—suggesting that operator-mediated procedures sometimes converge quickly and sometimes exhaust retry budgets comparable to automated profiling, a disparity that compliance reviews should correlate with operator_category and with the artifacts those runs touched.

Taken together, identifier, entity, attr, attr_type, and misc form the static compliance graph; category, profiling, operator, duration_seconds, exit, and retry_count form the dynamic execution graph; and governance effectiveness depends on maintaining referential integrity across both. An archived artifact bearing ARCH-0003 with attr bindings to 2025-05-16 and integer misc values 77 cannot be assessed in isolation: its profiling history under PROF-0006, its operator interventions keyed to OPER-0002 or OPER-0007, and its categorical placement within Profiling Category 03 or Operator Category 03 jointly determine whether observed exit codes and retry counts represent acceptable operational variance or evidence of control failure. Dense, evidence-anchored reference practice therefore treats each term not as an isolated column label but as a contractual role in an auditable system of named entities, typed attributes, classified executions, and measurable outcomes.

**t_artifact_either_active_or_archived_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARCH-0001 | checksum | xsd:string |
| ARCH-0002 | created_date | xsd:date |
| ARCH-0003 | identifier | cco:DesignativeICE |
| ARCH-0004 | license | xsd:string |
| ARCH-0005 | mime_type | xsd:string |
| ARCH-0006 | size_bytes | xsd:long |
| ARCH-0007 | uri | xsd:string |
| ARCH-0008 | version | xsd:integer |

**t_artifact_either_active_or_archived_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0006 | 356 |
| ARCH-0002 | ARCH-0001 | ARCH-0008 | 2 |
| ARCH-0003 | ARCH-0002 | ARCH-0006 | 77 |
| ARCH-0004 | ARCH-0002 | ARCH-0008 | 4 |
| ARCH-0005 | ARCH-0003 | ARCH-0006 | 218 |
| ARCH-0006 | ARCH-0003 | ARCH-0008 | 10 |
| ARCH-0007 | ARCH-0004 | ARCH-0006 | 431 |
| ARCH-0008 | ARCH-0004 | ARCH-0008 | 2 |

**t_artifact_either_active_or_archived_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0001 | 7b14de08 |
| ARCH-0002 | ARCH-0001 | ARCH-0003 | ref-8842 |
| ARCH-0003 | ARCH-0001 | ARCH-0004 | BSD-3-Clause |
| ARCH-0004 | ARCH-0001 | ARCH-0009 | ap-south-2 |
| ARCH-0005 | ARCH-0001 | ARCH-0005 | text/csv |
| ARCH-0006 | ARCH-0001 | ARCH-0010 | Name 06 |
| ARCH-0007 | ARCH-0001 | ARCH-0011 | analytics |
| ARCH-0008 | ARCH-0001 | ARCH-0012 | Tags 08 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |