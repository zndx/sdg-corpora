---
chapter_id: ch_live_policy_effective_period_cdf4bf
topic_id: 26
family: 01_foundation
cited_terms: ['policy_effective_period', 'allocation_at_run_id', 'marketing_director_role']
model: engine-refine
---

Operational governance frameworks rely on a network of unique identifiers to anchor every policy, allocation, and activity record across the system. Each entity receives a stable key—PERI-0001 through PERI-0004 for policy periods, RUN-0001 through RUN-0004 for run allocations—that serves as the primary linkage point between tables. These identifiers are not merely internal bookkeeping; they enable precise cross-referencing between policy definitions, execution contexts, and the activities that realize compliance obligations. For instance, the policy period PERI-0001 anchors the HIPAA Privacy Rule, while RUN-0001 identifies the batch-etl-override allocation, and ROLE-0001 through ROLE-0004 serve as the keys for both role holders and realized activities in the fact table.

**t_allocation_at_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | batch-etl-override |
| RUN-0002 | model-training-v3 |
| RUN-0003 | data-sync-nightly |
| RUN-0004 | ml-inference-run |
| RUN-0005 | ml-inference-run |
| RUN-0006 | batch-etl-override |
| RUN-0007 | ml-inference-run |

**t_allocation_at_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | exec-token-4491 |
| RUN-0002 | job-context-99a |
| RUN-0003 | tx-id-7721b |
| RUN-0004 | run-7a2b4c1d |
| RUN-0005 | run-hash-66d |
| RUN-0006 | epoch-tag-8812 |
| RUN-0007 | pipeline-run-zeta |
| RUN-0008 | job-context-99a |

**t_allocation_at_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0001 | RUN-0003 | observer |
| RUN-0002 | RUN-0004 | RUN-0007 | reviewer |
| RUN-0003 | RUN-0003 | RUN-0004 | observer |
| RUN-0004 | RUN-0005 | RUN-0001 | observer |
| RUN-0005 | RUN-0007 | RUN-0002 | contributor |
| RUN-0006 | RUN-0007 | RUN-0001 | reviewer |
| RUN-0007 | RUN-0003 | RUN-0005 | owner |
| RUN-0008 | RUN-0007 | RUN-0004 | contributor |

Policy effectiveness is governed by a multi-dimensional model that captures when a regulation applies, to whom, and in what language. The policy effective period table records the regulation name—such as GDPR Compliance, PCI DSS v4.0, or NIST SP 800-53—alongside the time window during which it is enforceable, ranging from Q4 2022 to Q1 2025. Scope defines the geographic or organizational reach of each policy, with values including local, global, and team, while language specifies the working language of the policy documentation, with entries such as es and fr appearing across the dataset. A single policy like the HIPAA Privacy Rule (PERI-0001) is scoped to local operations and documented in Spanish, whereas PCI DSS v4.0 (PERI-0003) carries a global scope and is rendered in French, reflecting the multilingual, multi-jurisdictional nature of compliance programs.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | Q4 2022 | local | es |
| PERI-0002 | GDPR Compliance | Q3 2023 | local | es |
| PERI-0003 | PCI DSS v4.0 | Q1 2025 | global | fr |
| PERI-0004 | NIST SP 800-53 | Q4 2022 | team | es |
| PERI-0005 | CCPA Data Rights | Q4 2025 | team | es |

Execution context is tracked through a layered allocation model that connects run identifiers to their operational tokens and assigns roles to each linkage. The allocation table maps RUN-0001 through RUN-0004 to concrete run names like model-training-v3 and ml-inference-run, while a parallel table binds each run to an at_run_identifier such as exec-token-4491, job-context-99a, or tx-id-7721b. A junction table then establishes the relationship between allocations and run identifiers, designating a role—observer or reviewer—for each connection. For example, allocation RUN-0001 is linked to run identifier RUN-0003 with the role of observer, while RUN-0004 connects to RUN-0007 as a reviewer, creating an auditable chain from policy period through execution context to the specific operational token.

Activity realization is quantified through a fact table that records event counts and links role holders to the activities in which they participate. Each fact record carries an identifier (ROLE-0001 through ROLE-0004), a foreign key to a role holder, a foreign key to a realized activity, and an event count that measures the volume of activity—values ranging from 18 for ROLE-0001 to 421 for ROLE-0003. The role holder dimension table provides descriptive labels (misc) and classification categories for each holder, with entries such as Role Holder Label 01 mapped to Role Holder Category 01. Similarly, the realized activity dimension table assigns labels like Realized In Activity Label 01 and categories such as Realized In Activity Category 01 to each activity key. This dimensional structure allows the system to answer questions about which role holders are most active, which categories of activity generate the highest event volumes, and how compliance obligations are distributed across the organization.

**fact_marketing**

| id | role_holder_key | realized_in_activity_key | event_count |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0002 | ROLE-0002 | 18 |
| ROLE-0002 | ROLE-0005 | ROLE-0006 | 204 |
| ROLE-0003 | ROLE-0001 | ROLE-0006 | 421 |
| ROLE-0004 | ROLE-0003 | ROLE-0001 | 153 |
| ROLE-0005 | ROLE-0006 | ROLE-0003 | 434 |
| ROLE-0006 | ROLE-0003 | ROLE-0004 | 256 |
| ROLE-0007 | ROLE-0005 | ROLE-0005 | 457 |

**dim_role_holder**

| id | role_holder_label | role_holder_category |
| --- | --- | --- |
| ROLE-0001 | Role Holder Label 01 | Role Holder Category 01 |
| ROLE-0002 | Role Holder Label 02 | Role Holder Category 02 |
| ROLE-0003 | Role Holder Label 03 | Role Holder Category 03 |
| ROLE-0004 | Role Holder Label 04 | Role Holder Category 04 |
| ROLE-0005 | Role Holder Label 05 | Role Holder Category 05 |
| ROLE-0006 | Role Holder Label 06 | Role Holder Category 06 |

**dim_realized_in_activity**

| id | realized_in_activity_label | realized_in_activity_category |
| --- | --- | --- |
| ROLE-0001 | Realized In Activity Label 01 | Realized In Activity Category 01 |
| ROLE-0002 | Realized In Activity Label 02 | Realized In Activity Category 02 |
| ROLE-0003 | Realized In Activity Label 03 | Realized In Activity Category 03 |
| ROLE-0004 | Realized In Activity Label 04 | Realized In Activity Category 04 |
| ROLE-0005 | Realized In Activity Label 05 | Realized In Activity Category 05 |
| ROLE-0006 | Realized In Activity Label 06 | Realized In Activity Category 06 |