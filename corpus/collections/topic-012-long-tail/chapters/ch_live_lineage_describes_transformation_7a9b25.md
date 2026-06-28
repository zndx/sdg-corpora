---
chapter_id: ch_live_lineage_describes_transformation_7a9b25
topic_id: 12
family: 07_long_tail
cited_terms: ['lineage_describes_transformation', 'board_membership', 'agent_acts_on_behalf_of']
model: engine-refine
---

Provenance and governance frameworks require a disciplined vocabulary for expressing who acted, on what authority, and with what degree of reliability. At the foundation of such systems lies the identifier—a stable, machine-readable key that anchors every record across disparate tables and time. Identifiers such as TRAN-0001, MEMB-0001, and BEHA-0001 serve as the immutable handles by which lineage events, board participations, and agent relationships are referenced, joined, and audited. These keys do not merely label; they enable referential integrity across fact and dimension tables, ensuring that a confidence score of 0.645 attached to TRAN-0001 in the lineage fact table can be unambiguously resolved to Lineage Label 01 and Lineage Category 01 in the corresponding dimension. Without such keys, the provenance chain fractures into isolated observations with no mechanism for cross-referencing or aggregation.

**fact_lineage**

| id | lineage_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | 0.645 | 612.22 | 903.86 |
| TRAN-0002 | TRAN-0003 | 0.071 | 133.03 | 832.18 |
| TRAN-0003 | TRAN-0005 | 0.404 | 76.69 | 862.00 |
| TRAN-0004 | TRAN-0003 | 0.779 | 708.23 | 259.55 |
| TRAN-0005 | TRAN-0003 | 0.376 | 801.99 | 986.33 |
| TRAN-0006 | TRAN-0008 | 0.744 | 956.79 | 34.40 |

**dim_lineage**

| id | lineage_label | lineage_category |
| --- | --- | --- |
| TRAN-0001 | Lineage Label 01 | Lineage Category 01 |
| TRAN-0002 | Lineage Label 02 | Lineage Category 02 |
| TRAN-0003 | Lineage Label 03 | Lineage Category 03 |
| TRAN-0004 | Lineage Label 04 | Lineage Category 04 |
| TRAN-0005 | Lineage Label 05 | Lineage Category 05 |
| TRAN-0006 | Lineage Label 06 | Lineage Category 06 |
| TRAN-0007 | Lineage Label 07 | Lineage Category 07 |
| TRAN-0008 | Lineage Label 08 | Lineage Category 08 |

Lineage itself constitutes the backbone of traceability, capturing how one entity relates to another through a directed, versioned relationship. In the lineage fact table, each record carries a lineage_key that points to a predecessor or successor entity—TRAN-0001 references TRAN-0001 (self-referential, perhaps indicating a root or anchor), while TRAN-0003 and TRAN-0004 both reference TRAN-0003, suggesting a convergence or branching pattern. The lineage dimension enriches these relationships with human-readable labels and categorical classifications, enabling analysts to filter by Lineage Category 01 through Lineage Category 04 without parsing raw keys. This two-table pattern—fact for quantitative measures, dimension for descriptive context—is repeated throughout the schema and reflects a deliberate separation between what happened and what it means.

Confidence and uncertainty form the quantitative heart of any provenance system, providing numerical assessments of trustworthiness that can be compared, aggregated, and thresholded. Confidence values such as 0.645, 0.071, 0.404, and 0.779 represent a probability-like measure of how reliably a lineage event has been captured or verified; a score of 0.071 for TRAN-0002 signals a record of very low assurance, while 0.779 for TRAN-0004 indicates relatively high confidence. Uncertainty, measured in absolute units such as 612.22, 133.03, 76.69, and 708.23, complements confidence by expressing the magnitude of error or variance associated with each event. The value column—holding figures like 903.86, 832.18, 862.00, and 259.55—provides the raw quantitative observation to which these quality metrics attach. Together, confidence, uncertainty, and value allow downstream systems to weight provenance records appropriately, flagging low-confidence entries for manual review while trusting high-confidence records in automated pipelines.

Board participation and event tracking follow a parallel structure, where the fact_board table records how many events—236, 403, 359, or as few as 26—are associated with a given identifier, each linked to a participant through the has_participant_key column. References such as MEMB-0005 appearing as the participant for both MEMB-0001 and MEMB-0004 indicate that a single participant is involved in multiple board events, a pattern that the has_participant dimension table elaborates with labels like Has Participant Label 01 and categories such as Has Participant Category 01. This separation of event counts from participant metadata mirrors the lineage pattern and supports efficient querying: one can count total events per category or identify the most active participants without joining descriptive attributes into the fact table.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |

Agent relationships introduce a third relational dimension, capturing not just what happened but who acted and on whose behalf. The agent table enumerates system actors—AuditLogger, LogAggregator, ProvenanceTracker, and ETLBatchScheduler—each assigned a stable identifier. A bridging table maps these agents to the entities they represent, such as DataGovernanceBoard or AnalyticsDivision, while a junction table resolves the full triad of subject, target, and role. Here, the subject column identifies the acting agent (BEHA-0005, BEHA-0001, BEHA-0003, BEHA-0006), the target column identifies the acted-upon entity (BEHA-0003, BEHA-0006, BEHA-0001, BEHA-0005), and the role column assigns a functional position—observer, contributor, owner, or reviewer—to the relationship. This three-way decomposition enables fine-grained access control, audit trail reconstruction, and accountability mapping: one can determine that the ProvenanceTracker (BEHA-0003) acted as an owner on behalf of the AnalyticsDivision (BEHA-0001), while the AuditLogger (BEHA-0001) served as a reviewer in a separate capacity. The role field, in particular, is critical for governance frameworks that distinguish between passive observation and active responsibility.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |

**t_agent_acts_on_behalf_of_acted_on_behalf_of**

| id | acted_on_behalf_of |
| --- | --- |
| BEHA-0001 | DataGovernanceBoard |
| BEHA-0002 | DataGovernanceBoard |
| BEHA-0003 | AnalyticsDivision |
| BEHA-0004 | SecurityOperations |
| BEHA-0005 | ComplianceAudit |
| BEHA-0006 | SecurityOperations |

**t_agent_acts_on_behalf_of__acted_on_behalf_of**

| id | agent_id | acted_on_behalf_of_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0005 | BEHA-0003 | observer |
| BEHA-0002 | BEHA-0001 | BEHA-0006 | contributor |
| BEHA-0003 | BEHA-0003 | BEHA-0001 | owner |
| BEHA-0004 | BEHA-0006 | BEHA-0005 | reviewer |
| BEHA-0005 | BEHA-0003 | BEHA-0002 | observer |
| BEHA-0006 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0007 | BEHA-0005 | BEHA-0001 | contributor |
| BEHA-0008 | BEHA-0006 | BEHA-0006 | owner |