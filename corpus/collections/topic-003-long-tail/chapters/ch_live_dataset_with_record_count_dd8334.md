---
chapter_id: ch_live_dataset_with_record_count_dd8334
topic_id: 3
family: 01_foundation
cited_terms: ['dataset_with_record_count', 'policy_supersedes', 'constraint_check_subclass']
model: engine-refine
---

Identifier, ismandatory, language, priority, reviewcycledays, sizebytes, and version constitute the foundational attributes by which data assets, policy obligations, and constraint checks are catalogued, governed, and enforced within a structured compliance framework. Each entity—whether a dataset, a superseding policy, or a validation constraint—is assigned a unique identifier that anchors its lineage and enables cross-referential integrity. Identifiers such as COUN-0001 through COUN-0004 designate datasets including customer_profile_db and financial_transactions_q3, while SUPE-0001 through SUPE-0004 enumerate policies like Privacy Impact Assessment and Incident Response Protocol that actively supersede prior controls, and CHEC-0001 through CHEC-0004 enumerate constraint checks ranging from Null field rejection to Anomaly detection threshold. These identifiers are not merely labels; they form the join keys that bind datasets to their governing policies and the constraints that validate their contents, ensuring that every data asset can be traced to its regulatory provenance.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Privacy Impact Assessment | COUN-0003 | 262 | es |
| SUPE-0002 | Incident Response Protocol | COUN-0003 | 131 | es |
| SUPE-0003 | Data Residency Rule | COUN-0002 | 716 | es |
| SUPE-0004 | Incident Response Protocol | COUN-0004 | 336 | es |
| SUPE-0005 | Incident Response Protocol | COUN-0007 | 151 | de |
| SUPE-0006 | Audit Logging Requirement | COUN-0002 | 866 | en |

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | COUN-0006 | true | 1 |
| CHEC-0002 | Null field rejection | COUN-0003 | true | 5 |
| CHEC-0003 | Anomaly detection threshold | COUN-0006 | true | 4 |
| CHEC-0004 | Header presence check | COUN-0001 | false | 1 |
| CHEC-0005 | Batch size limit | COUN-0002 | false | 4 |

Version and sizebytes provide the temporal and volumetric context necessary for lifecycle management and capacity planning. A dataset such as financial_transactions_q3 may exist in multiple versions—version 3 and version 12 respectively—reflecting iterative updates as the underlying data evolves, while its sizebytes attribute records the storage footprint at each revision, with values ranging from 177,784,075 bytes for customer_profile_db to 973,314,714 bytes for the larger financial_transactions_q3 instance. These metrics enable auditors and data stewards to assess growth trajectories, estimate storage requirements, and correlate version changes with policy revisions. The record column further links each dataset to a specific policy identifier—SUPE-0003, SUPE-0006, SUPE-0001—establishing which governance rule governs the dataset's handling and retention.

**t_dataset_with_record_count**

| id | dataset | record | size_bytes | version |
| --- | --- | --- | --- | --- |
| COUN-0001 | customer_profile_db | SUPE-0003 | 177784075 | 3 |
| COUN-0002 | network_packet_capture | SUPE-0006 | 723832596 | 8 |
| COUN-0003 | financial_transactions_q3 | SUPE-0001 | 973314714 | 3 |
| COUN-0004 | financial_transactions_q3 | SUPE-0003 | 658168246 | 12 |
| COUN-0005 | compliance_audit_trail | SUPE-0003 | 780581245 | 4 |
| COUN-0006 | clinical_trials_arm_b | SUPE-0002 | 519122574 | 10 |
| COUN-0007 | user_session_logs | SUPE-0003 | 692732003 | 3 |

Reviewcycledays and language define the temporal cadence and linguistic scope of policy enforcement. The review_cycle_days attribute specifies the interval at which a policy must be re-evaluated for continued relevance and compliance, with values spanning from 131 days for the Incident Response Protocol (SUPE-0002) to 716 days for the Data Residency Rule (SUPE-0003), reflecting the varying risk profiles and regulatory urgency of each policy domain. The language attribute, observed uniformly as es across the policy register, indicates the jurisdictional or operational language in which each policy is authored and enforced, ensuring that all stakeholders interpret obligations within a consistent linguistic framework. Together, these attributes establish a governance rhythm: policies are not static documents but living instruments subject to periodic review, with their review frequency calibrated to the severity and volatility of the risks they address.

Mandatory and priority govern the enforcement posture and risk ranking of constraint checks. The ismandatory flag distinguishes between checks that are strictly enforced and those that are advisory; Null field rejection (CHEC-0001 and CHEC-0002) and Anomaly detection threshold (CHEC-0003) are all marked mandatory, meaning violations constitute compliance failures, whereas Header presence check (CHEC-0004) is non-mandatory, indicating a recommended but not required validation. The priority attribute assigns a numerical rank to each constraint, with values of 1, 4, and 5 denoting relative severity—Null field rejection and Header presence check both carry priority 1, the highest urgency, while Anomaly detection threshold carries priority 4, reflecting a lower but still significant risk tier. These attributes collectively determine which checks block data ingestion, which trigger warnings, and which are logged for informational review, thereby operationalizing the compliance framework's risk-based approach to data quality enforcement.