---
chapter_id: ch_live_policy_min_one_enforcer_a68154
topic_id: 34
family: 03_directive_governance
cited_terms: ['policy_min_one_enforcer', 'policy_only_applies_to', 'policy_only_for_high_impact']
model: engine-refine
---

NIST impact levels serve as the foundational classification mechanism for determining the rigor of security controls applied to information systems and the policies that govern them. Rather than treating all systems equally, organizations assign each policy to an impact level—such as IMPA-0001 through IMPA-0004—that reflects the potential adverse effects of compromise on organizational operations, organizational assets, individuals, other organizations, and the Nation. Each impact level maps to a category, like At NIST Impact Level Category 01 or At NIST Impact Level Category 04, and carries a descriptive label such as At NIST Impact Level Label 02, which together form a structured taxonomy that compliance teams use to calibrate their security posture. The dimension table that stores these classifications acts as the reference point against which every policy is evaluated, ensuring that the stringency of controls scales proportionally with the severity of potential harm.

**dim_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level_label | at_n_i_s_t_impact_level_category |
| --- | --- | --- |
| IMPA-0001 | At N I S T Impact Level Label 01 | At N I S T Impact Level Category 01 |
| IMPA-0002 | At N I S T Impact Level Label 02 | At N I S T Impact Level Category 02 |
| IMPA-0003 | At N I S T Impact Level Label 03 | At N I S T Impact Level Category 03 |
| IMPA-0004 | At N I S T Impact Level Label 04 | At N I S T Impact Level Category 04 |
| IMPA-0005 | At N I S T Impact Level Label 05 | At N I S T Impact Level Category 05 |
| IMPA-0006 | At N I S T Impact Level Label 06 | At N I S T Impact Level Category 06 |
| IMPA-0007 | At N I S T Impact Level Label 07 | At N I S T Impact Level Category 07 |
| IMPA-0008 | At N I S T Impact Level Label 08 | At N I S T Impact Level Category 08 |

Once a policy is classified by impact level, the governance framework establishes concrete operational parameters that dictate how frequently the policy must be reviewed and how urgently it must be addressed. The fact table linking policies to their impact levels captures two critical attributes: priority, which ranges from 2 to 5 in the observed data, and review cycle days, which span from 258 days to 866 days depending on the assigned impact level. A policy tied to IMPA-0001 carries a priority of 2 and a review cycle of 258 days, reflecting a lower-risk classification that permits longer intervals between reassessments. By contrast, policies associated with IMPA-0002 carry a priority of 3 and review cycles of 710 or 866 days, while IMPA-0004 policies reach a priority of 5 with a 950-day review cycle. These intervals are not arbitrary; they encode the organization's risk tolerance and regulatory obligations, ensuring that higher-impact policies receive more frequent scrutiny even as the numerical cycle days may appear counterintuitive without the full context of the underlying risk model.

**fact_policy**

| id | at_n_i_s_t_impact_level_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | 2 | 258 |
| IMPA-0002 | IMPA-0002 | 3 | 710 |
| IMPA-0003 | IMPA-0002 | 3 | 866 |
| IMPA-0004 | IMPA-0004 | 5 | 950 |
| IMPA-0005 | IMPA-0001 | 1 | 305 |
| IMPA-0006 | IMPA-0002 | 2 | 729 |

The enforcement architecture translates these classifications into organizational accountability by binding policies to specific enforcers and defining their roles within the governance structure. Policies such as the GDPR Compliance Framework, NIST SP 800-53 Access Control, Access Control Framework, and ISO 13485 QMS are each assigned to enforcer identifiers like ENFO-0001 through ENFO-0004, which correspond to organizational units including the Regulatory Affairs Division, Compliance Audit Board, Privacy Officer, and Data Stewardship Council. The junction table that mediates the relationship between policies and enforcers introduces a role dimension—contributor, owner, or observer—that clarifies whether an enforcer is directly responsible for implementation, holds ultimate accountability, or maintains a monitoring posture. For instance, the policy identified as ENFO-0005 is enforced by ENFO-0002 in a contributor capacity, by ENFO-0004 as an observer, and by ENFO-0003 as a contributor, demonstrating how a single policy can engage multiple enforcers with distinct responsibilities.

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | GDPR Compliance Framework |
| ENFO-0002 | NIST SP 800-53 Access Control |
| ENFO-0003 | Access Control Framework |
| ENFO-0004 | ISO 13485 QMS |
| ENFO-0005 | NIST SP 800-53 Access Control |
| ENFO-0006 | HIPAA Safe Harbor |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |

Policy applicability extends beyond enforcement relationships to specify which systems, processes, or organizational boundaries a given policy governs, along with the date it takes effect and its operational priority within the broader compliance portfolio. The EU AI Act Risk Management policy, for example, applies to ENFO-0003 with an effective date of 2023-08-29 and a priority of 5, while the Network Segmentation Rule targets ENFO-0005 effective 2023-11-05 at the same priority tier. The Audit Logging Directive appears twice in the applicability records—once applied to ENFO-0006 with a priority of 3 and effective date of 2023-08-21, and again applied to ENFO-0003 with the same priority but a later effective date of 2023-12-18—illustrating how the same policy can be deployed across different enforcers at different times. These applicability records, combined with the priority and effective date fields, enable compliance teams to construct a temporal and structural map of governance obligations, ensuring that policies are activated in the correct sequence and assigned the appropriate level of organizational attention.

**t_policy_only_applies_to**

| id | policy | applies_to | effective_date | priority |
| --- | --- | --- | --- | --- |
| APPL-0001 | EU AI Act Risk Management | ENFO-0003 | 2023-08-29 | 5 |
| APPL-0002 | Network Segmentation Rule | ENFO-0005 | 2023-11-05 | 5 |
| APPL-0003 | Audit Logging Directive | ENFO-0006 | 2023-08-21 | 3 |
| APPL-0004 | Audit Logging Directive | ENFO-0003 | 2023-12-18 | 3 |
| APPL-0005 | Data Classification Guideline | ENFO-0006 | 2024-11-09 | 4 |
| APPL-0006 | ISO 27001 Data Handling | ENFO-0003 | 2023-01-13 | 2 |
| APPL-0007 | Vendor Risk Assessment | ENFO-0001 | 2025-03-17 | 2 |
| APPL-0008 | Data Retention Standard | ENFO-0002 | 2024-05-19 | 2 |