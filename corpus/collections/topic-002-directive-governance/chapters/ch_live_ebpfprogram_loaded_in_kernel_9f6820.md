---
chapter_id: ch_live_ebpfprogram_loaded_in_kernel_9f6820
topic_id: 2
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_loaded_in_kernel', 'constraint_evaluated_during', 'audit_with_findings']
model: engine-refine
---

Governance frameworks for infrastructure telemetry rely on a rigorous identification schema to anchor every deployed artifact to its operational lineage. Each program receives a unique identifier—such as KERN-0001 or KERN-0004—that serves as the immutable reference point across all audit and compliance registries. These identifiers are cross-referenced against a loading context registry, where the loaded_in attribute maps each artifact to its deployment environment, while supplementary dimensional attributes capture the loaded_in_category and loaded_in_label to classify the ingestion pathway. The technical footprint of each deployment is simultaneously recorded through size_bytes and version fields, ensuring that baseline telemetry remains traceable; for instance, a program recorded at 784,335,640 bytes under version 12 can be instantly correlated with its category classification and deployment label, establishing a complete chain of custody from compilation to runtime execution.

**fact_ebpfprogram**

| id | loaded_in_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0003 | 784335640 | 12 |
| KERN-0002 | KERN-0002 | 641704069 | 9 |
| KERN-0003 | KERN-0006 | 113209263 | 11 |
| KERN-0004 | KERN-0004 | 161013093 | 12 |
| KERN-0005 | KERN-0004 | 352203820 | 12 |
| KERN-0006 | KERN-0001 | 167519051 | 1 |

**dim_loaded_in**

| id | loaded_in_label | loaded_in_category |
| --- | --- | --- |
| KERN-0001 | Loaded In Label 01 | Loaded In Category 01 |
| KERN-0002 | Loaded In Label 02 | Loaded In Category 02 |
| KERN-0003 | Loaded In Label 03 | Loaded In Category 03 |
| KERN-0004 | Loaded In Label 04 | Loaded In Category 04 |
| KERN-0005 | Loaded In Label 05 | Loaded In Category 05 |
| KERN-0006 | Loaded In Label 06 | Loaded In Category 06 |

Compliance validation extends beyond static artifact tracking into dynamic constraint evaluation, where each policy rule is decomposed into discrete attributes with strictly enforced data types. The attr column defines the semantic property under review—such as effective_date, enforcement, mandatory, or priority—while the attr_type column enforces schema discipline by assigning standardized XML Schema definitions like xsd:date, xsd:string, xsd:boolean, or xsd:integer. This typed attribute model allows the evaluation engine to resolve heterogeneous policy requirements without type coercion errors. Boolean constraints, for example, are persisted as discrete true or false flags tied to specific entity identifiers, whereas date-based attributes anchor compliance windows to precise calendar boundaries like 2024-01-04 or 2025-03-02. Numeric thresholds and textual enforcement directives follow the same pattern, with integer values capturing priority rankings and variable-length strings recording operational notes such as pre-release note or Encoding 01, ensuring that every evaluation criterion remains machine-readable and auditable.

The execution of compliance audits is similarly governed by precise operational telemetry, where each assessment is assigned a distinct identifier and routed to specific compute nodes for evaluation. The durationseconds metric quantifies the computational overhead of each audit cycle, capturing execution times that range from 1,140.43 seconds for a Data Lake Governance Review to 7,105.34 seconds for a CI-CD Pipeline Compliance check. These temporal measurements are always paired with the hostname attribute, which pinpoints the exact infrastructure node—such as worker-07, node-a01, or edge-03—where the evaluation occurred. By correlating execution duration with host topology, governance teams can isolate performance bottlenecks, validate resource allocation against policy requirements, and ensure that time-sensitive checks like Real Time Streaming or ML Model Drift Audit complete within mandated service-level windows.

**t_audit_with_findings**

| id | audit | findings | duration_seconds | host_name |
| --- | --- | --- | --- | --- |
| FIND-0001 | ML Model Drift Audit | Expired TLS Certificate | 5564.74 | worker-07 |
| FIND-0002 | Data Lake Governance Review | Missing MFA Enforcement | 1140.43 | node-a01 |
| FIND-0003 | CI-CD Pipeline Compliance | Overprivileged Service Account | 7105.34 | node-b14 |
| FIND-0004 | Data Ingestion | Inadequate Data Retention | 2350.00 | edge-03 |
| FIND-0005 | User Authentication | Unpatched OS Kernel | 2041.65 | worker-07 |
| FIND-0006 | Data Lake Governance Review | Unpatched OS Kernel | 3303.91 | ingest-21 |
| FIND-0007 | Batch Processing | Unmonitored API Endpoint | 5489.56 | ingest-21 |

Together, these structured fields form a cohesive compliance telemetry architecture that transforms raw operational data into enforceable governance records. The identifier serves as the central pivot, linking program metadata, constraint definitions, evaluation results, and audit execution logs into a single queryable fabric. Relational integrity is maintained through explicit foreign-key mappings: the entity column in the value tables references the primary keys of the constraint definition table, ensuring that every evaluated datum is bound to its originating policy rule, while the loaded_in_key in the program fact table joins to the dimension registry to resolve deployment categories and labels. The attr_id column similarly bridges the typed attribute definitions to their corresponding boolean, date, integer, and string value stores, preventing data fragmentation. When an audit uncovers a finding such as Missing MFA Enforcement or Inadequate Data Retention, the system can instantly trace the violation back through the evaluation graph, verify the applicable attribute types, and confirm the exact deployment version and loading category responsible. This end-to-end traceability eliminates ambiguity in incident response, standardizes cross-environment compliance checks, and provides auditors with an immutable, timestamped record of every policy decision and infrastructure change.

**t_constraint_evaluated_during**

| id | constraint | evaluated_during |
| --- | --- | --- |
| DURI-0001 | Field Length Constraint | Real Time Streaming |
| DURI-0002 | Data Retention Policy | ML Model Drift Audit |
| DURI-0003 | Audit Log Requirement | Data Ingestion |
| DURI-0004 | Null Value Limit | CI-CD Pipeline Compliance |
| DURI-0005 | Data Retention Policy | Data Ingestion |
| DURI-0006 | Data Retention Policy | Third-Party Vendor Review |

**t_constraint_evaluated_during_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DURI-0001 | effective_date | xsd:date |
| DURI-0002 | enforcement | xsd:string |
| DURI-0003 | mandatory | xsd:boolean |
| DURI-0004 | priority | xsd:integer |
| DURI-0005 | review_cycle_days | xsd:integer |
| DURI-0006 | scope | xsd:string |
| DURI-0007 | encoding | xsd:string |
| DURI-0008 | label_text | xsd:string |

**t_constraint_evaluated_during_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0003 | false |
| DURI-0002 | DURI-0002 | DURI-0003 | false |
| DURI-0003 | DURI-0003 | DURI-0003 | false |
| DURI-0004 | DURI-0004 | DURI-0003 | true |
| DURI-0005 | DURI-0005 | DURI-0003 | true |
| DURI-0006 | DURI-0006 | DURI-0003 | true |

**t_constraint_evaluated_during_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0001 | 2024-01-04 |
| DURI-0002 | DURI-0002 | DURI-0001 | 2025-03-02 |
| DURI-0003 | DURI-0003 | DURI-0001 | 2023-10-02 |
| DURI-0004 | DURI-0004 | DURI-0001 | 2023-03-04 |
| DURI-0005 | DURI-0005 | DURI-0001 | 2023-08-27 |
| DURI-0006 | DURI-0006 | DURI-0001 | 2023-09-26 |

**t_constraint_evaluated_during_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0004 | 2 |
| DURI-0002 | DURI-0001 | DURI-0005 | 590 |
| DURI-0003 | DURI-0002 | DURI-0004 | 2 |
| DURI-0004 | DURI-0002 | DURI-0005 | 52 |
| DURI-0005 | DURI-0003 | DURI-0004 | 1 |
| DURI-0006 | DURI-0003 | DURI-0005 | 88 |
| DURI-0007 | DURI-0004 | DURI-0004 | 5 |
| DURI-0008 | DURI-0004 | DURI-0005 | 829 |

**t_constraint_evaluated_during_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0007 | Encoding 01 |
| DURI-0002 | DURI-0001 | DURI-0002 | Enforcement 02 |
| DURI-0003 | DURI-0001 | DURI-0008 | pre-release note |
| DURI-0004 | DURI-0001 | DURI-0009 | en |
| DURI-0005 | DURI-0001 | DURI-0006 | Scope 05 |
| DURI-0006 | DURI-0002 | DURI-0007 | Encoding 06 |
| DURI-0007 | DURI-0002 | DURI-0002 | Enforcement 07 |
| DURI-0008 | DURI-0002 | DURI-0008 | audit excerpt |