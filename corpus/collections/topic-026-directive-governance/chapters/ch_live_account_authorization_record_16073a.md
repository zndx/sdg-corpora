---
chapter_id: ch_live_account_authorization_record_16073a
topic_id: 26
family: 08_derived
cited_terms: ['account_authorization_record', 'state_of_system_block', 'lineage_edge_at_run_time']
model: engine-refine
---

Account authorization records serve as the foundational audit artifact for tracking which administrator holds authority over which application within the platform. Each record carries a unique identifier—such as RECO-0001 through RECO-0004—and a human-readable authorization code like REC-ACC-5591, PERM-ACC-6609, or AUTH-LOG-3381 that distinguishes between recurring authorizations, permanent grants, and logged authorization events. The record binds a social networking application, whether SnapchatV2, BlueskyClient, or LinkedInPro, to a designated staff administrator such as security_lee, admin_jchen, platform_mgr_wu, or sysadmin_klee. This one-to-one mapping between application and administrator is the primary control point for access governance, ensuring that every privileged account is traceable to a named individual and a specific system.

**t_account_authorization_record**

| id | account_authorization_record | registers_application | assigns_administrator |
| --- | --- | --- | --- |
| RECO-0001 | REC-ACC-5591 | SnapchatV2 | security_lee |
| RECO-0002 | PERM-ACC-6609 | SnapchatV2 | admin_jchen |
| RECO-0003 | REC-ACC-5591 | BlueskyClient | platform_mgr_wu |
| RECO-0004 | AUTH-LOG-3381 | LinkedInPro | sysadmin_klee |
| RECO-0005 | AUTH-LOG-1192 | DiscordMain | platform_mgr_wu |
| RECO-0006 | AUTH-REC-2215 | LinkedInPro | sysadmin_klee |

**t_account_authorization_record_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RECO-0001 | encoding | xsd:string |
| RECO-0002 | label_text | xsd:string |
| RECO-0003 | language | xsd:string |

**t_account_authorization_record_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0001 | Encoding 01 |
| RECO-0002 | RECO-0001 | RECO-0002 | nightly summary |
| RECO-0003 | RECO-0001 | RECO-0003 | es |
| RECO-0004 | RECO-0002 | RECO-0001 | Encoding 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | audit excerpt |
| RECO-0006 | RECO-0002 | RECO-0003 | fr |
| RECO-0007 | RECO-0003 | RECO-0001 | Encoding 07 |
| RECO-0008 | RECO-0003 | RECO-0002 | audit excerpt |

Authorization records carry structured metadata through an attribute-value model that separates definition from instantiation. The attribute definition table stores each attribute's name—encoding, label_text, language—and its type, all of which in the observed data are xsd:string, indicating that the system currently constrains attribute values to plain text. The value table then materializes these attributes against individual records: for entity RECO-0001, the encoding attribute holds the value Encoding 01, the label_text reads nightly summary, and the language is set to es; entity RECO-0002 carries encoding with value Encoding 04. This three-table pattern—definition, entity, value—allows the authorization framework to evolve its metadata schema without schema migrations, while still enforcing type discipline through the attr_type column.

State tracking provides a probabilistic overlay on authorization and operational data, capturing measured conditions alongside their confidence and uncertainty. The fact_state table records a numeric value—195.86, 143.04, 237.15, or 619.50—against a state key such as BLOC-0001 or BLOC-0004, paired with a confidence score ranging from 0.012 to 0.523 and an uncertainty magnitude from 366.30 to 951.90. Low-confidence readings like 0.012 for BLOC-0002 signal conditions that should be treated as highly provisional, while the higher confidence of 0.523 for BLOC-0003 suggests a more reliable measurement. These state facts are classified through the dimension tables: dim_state assigns each state a label like State Label 01 and maps it to a category via category_id, while dim_state_category provides the category_name taxonomy—Category Name 01 through Category Name 04—that groups related states for reporting and threshold analysis.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BLOC-0001 | BLOC-0001 | 0.422 | 951.90 | 195.86 |
| BLOC-0002 | BLOC-0004 | 0.012 | 416.12 | 143.04 |
| BLOC-0003 | BLOC-0005 | 0.075 | 421.79 | 237.15 |
| BLOC-0004 | BLOC-0003 | 0.523 | 366.30 | 619.50 |

**dim_state_category**

| id | category_name |
| --- | --- |
| BLOC-0001 | Category Name 01 |
| BLOC-0002 | Category Name 02 |
| BLOC-0003 | Category Name 03 |
| BLOC-0004 | Category Name 04 |
| BLOC-0005 | Category Name 05 |
| BLOC-0006 | Category Name 06 |

**dim_state**

| id | state_label | state_category | category_id |
| --- | --- | --- | --- |
| BLOC-0001 | State Label 01 | State Category 01 | BLOC-0001 |
| BLOC-0002 | State Label 02 | State Category 02 | BLOC-0003 |
| BLOC-0003 | State Label 03 | State Category 03 | BLOC-0004 |
| BLOC-0004 | State Label 04 | State Category 04 | BLOC-0003 |
| BLOC-0005 | State Label 05 | State Category 05 | BLOC-0006 |
| BLOC-0006 | State Label 06 | State Category 06 | BLOC-0006 |
| BLOC-0007 | State Label 07 | State Category 07 | BLOC-0002 |
| BLOC-0008 | State Label 08 | State Category 08 | BLOC-0003 |

Runtime lineage connects data processing pipelines to the infrastructure that executes them, with the role column defining the nature of each connection. The lineage table identifies the pipeline itself—batch-revenue-aggregation, customer-churn-pipeline, climate-data-ingest, or genomic-sequence-align—while the runtime target table names the execution context, such as worker-node-12, job-run-8842, or batch-queue-primary. The join table t_lineage_edge_at_run_time__at_run_time binds them together, assigning each edge a role: owner, observer, or reviewer. For example, lineage TIME-0004 (genomic-sequence-align) connects to runtime target TIME-0005 with role owner, meaning that pipeline has primary responsibility for that execution context, while TIME-0001 (batch-queue-primary) is linked as a reviewer, indicating a supervisory or audit relationship rather than direct ownership. This role-based lineage model enables precise attribution of data flow responsibilities across distributed processing environments.

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