---
chapter_id: ch_live_constraint_with_severity_classification_b1897c
topic_id: 26
family: 03_directive_governance
cited_terms: ['constraint_with_severity_classification', 'lineage_edge_at_run_time', 'agent_with_role']
model: engine-refine
---

In modern data governance frameworks, agent role management and data lineage tracking form the backbone of operational accountability. The agent dimension establishes a taxonomy of roles through categorical labels—such as Agent Role Category 01 through Agent Role Category 04—each associated with a descriptive label like Agent Role Label 01. These categorical distinctions enable organizations to classify agents by function, scope, or responsibility tier, creating a structured vocabulary for role-based access and audit. The corresponding fact table materializes these classifications by linking individual agent instances to their role definitions via a foreign key relationship, while also recording operational metadata such as version number and size in bytes. An agent instance might carry version 7 and occupy 211,345,771 bytes, while another instance of the same role could be at version 1 with a footprint of 458,577,289 bytes, reflecting iterative updates and varying deployment configurations across the agent lifecycle.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |

Data lineage at runtime provides the operational traceability needed to understand how data flows through processing pipelines. The lineage edge dimension captures abstract pipeline relationships—batch-revenue-aggregation, customer-churn-pipeline, climate-data-ingest, and genomic-sequence-align—each representing a distinct data transformation or processing chain. These lineage definitions are then materialized at execution time through a junction table that associates each lineage edge with specific runtime contexts, such as worker-node-12, job-run-8842, or batch-queue-primary. This two-step modeling separates the declarative definition of a pipeline from its concrete execution, enabling organizations to query lineage relationships at the logical level while preserving the ability to audit which specific worker nodes or job runs participated in each pipeline's execution.

**t_lineage_edge_at_run_time**

| id | lineage |
| --- | --- |
| TIME-0001 | batch-revenue-aggregation |
| TIME-0002 | customer-churn-pipeline |
| TIME-0003 | climate-data-ingest |
| TIME-0004 | genomic-sequence-align |
| TIME-0005 | model-training-workflow |
| TIME-0006 | user-behavior-trace |

**t_lineage_edge_at_run_time_at_run_time**

| id | at_run_time |
| --- | --- |
| TIME-0001 | worker-node-12 |
| TIME-0002 | job-run-8842 |
| TIME-0003 | worker-node-12 |
| TIME-0004 | batch-queue-primary |
| TIME-0005 | job-run-8842 |
| TIME-0006 | execution-window-4 |

The junction table between lineage edges and runtime contexts introduces a role dimension that assigns accountability to each lineage-to-runtime association. Roles such as owner, observer, and reviewer designate the nature of each entity's relationship to a given pipeline execution. For instance, the genomic-sequence-align lineage might be owned by one runtime context while being reviewed by another, establishing a separation of duties that supports compliance auditing. The subject column identifies the lineage edge being executed, the target column identifies the runtime context, and the role column specifies the relationship type—creating a ternary relationship that captures who is responsible for what, and in what capacity, during each pipeline execution.

**t_lineage_edge_at_run_time__at_run_time**

| id | lineage_id | at_run_time_id | role |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0004 | TIME-0005 | owner |
| TIME-0002 | TIME-0006 | TIME-0003 | observer |
| TIME-0003 | TIME-0004 | TIME-0005 | owner |
| TIME-0004 | TIME-0004 | TIME-0001 | reviewer |
| TIME-0005 | TIME-0002 | TIME-0006 | contributor |
| TIME-0006 | TIME-0004 | TIME-0006 | owner |
| TIME-0007 | TIME-0005 | TIME-0004 | contributor |
| TIME-0008 | TIME-0005 | TIME-0003 | observer |

Compliance constraints are managed through a separate classification framework that assigns severity levels, priority scores, and language designations to policy requirements. Access control policies and PII encryption mandates carry severity ratings such as Low exposure or Warning threshold, with priority values ranging from 3 to 5 to indicate enforcement urgency. The language column—populated with values like es, en, and fr—supports multilingual policy documentation, ensuring that regulatory requirements can be communicated and enforced across geographically distributed operations. This classification system operates independently of the agent and lineage models but provides the regulatory context against which agent permissions and pipeline executions are evaluated, creating a governance layer that ties operational data to compliance obligations.

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | Low exposure | 3 | es |
| CLAS-0002 | PII encryption mandate | Warning threshold | 5 | en |
| CLAS-0003 | Sensor calibration interval | Tolerable variance | 3 | es |
| CLAS-0004 | Log retention period | Warning threshold | 3 | fr |
| CLAS-0005 | Lab containment level | Tolerable variance | 3 | ja |
| CLAS-0006 | Lab containment level | Standard baseline | 2 | fr |