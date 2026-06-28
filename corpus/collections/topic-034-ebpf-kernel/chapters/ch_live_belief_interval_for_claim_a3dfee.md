---
chapter_id: ch_live_belief_interval_for_claim_a3dfee
topic_id: 34
family: 06_belief_structure
cited_terms: ['belief_interval_for_claim', 'syscall_at_security_tier', 'iso27001_clause_subclass']
model: engine-refine
---

The security monitoring architecture is organized around a tiered classification of system operations, where each security tier is catalogued with a descriptive label and an associated category identifier. The dimension table for security tiers provides the reference framework—entries such as At Security Tier Label 01 through At Security Tier Label 04 are each assigned a corresponding category, ranging from At Security Tier Category 01 to At Security Tier Category 04. This categorical structure enables the aggregation and cross-referencing of operational events across distinct security boundaries. Syscall facts are recorded against these tier identifiers, with event counts varying substantially across tiers: tier TIER-0001 recorded 238 events, TIER-0002 recorded 52, TIER-0003 recorded 198, and TIER-0004 recorded 382. The fact table for system calls references the security tier dimension through a foreign key, ensuring that every observed event is attributable to a precisely defined security boundary.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

Compliance obligations under ISO 27001 are modelled through a three-table structure that captures the relationship between clause subclasses and their parent clauses. The clause subclass table enumerates individual subclasses—CLAU-0001 through CLAU-0004—each associated with an ISO reference designation such as Iso 01 or Iso 02. A companion table maps these subclasses to their governing ISO 27001 clauses, with clause descriptions including Risk treatment, Performance evaluation, Improvement, and Leadership. The junction table that links subclasses to clauses carries a role attribute, which distinguishes the nature of the relationship: entries are classified as reviewer, contributor, or owner. For instance, subclass CLAU-0004 assumes the role of reviewer against ISO clause CLAU-0001, while CLAU-0001 and CLAU-0003 both act as contributors to their respective target clauses.

**t_iso27001_clause_subclass__iso27001_clause**

| id | iso_id | iso27001_clause_id | role |
| --- | --- | --- | --- |
| CLAU-0001 | CLAU-0004 | CLAU-0001 | reviewer |
| CLAU-0002 | CLAU-0001 | CLAU-0003 | contributor |
| CLAU-0003 | CLAU-0004 | CLAU-0006 | contributor |
| CLAU-0004 | CLAU-0005 | CLAU-0006 | owner |
| CLAU-0005 | CLAU-0005 | CLAU-0004 | owner |
| CLAU-0006 | CLAU-0006 | CLAU-0006 | owner |
| CLAU-0007 | CLAU-0001 | CLAU-0006 | reviewer |
| CLAU-0008 | CLAU-0005 | CLAU-0003 | contributor |

Evidence of compliance is captured through belief intervals that are tied to specific ISO 27001 clause subclasses. The belief interval table records observations—such as Network packet loss, CPU utilization rate, Checksum mismatch found, and Pipeline latency elevated—each linked to a clause subclass identifier like CLAU-0005 or CLAU-0006. These beliefs are measured along distinct dimension kinds, including time, length, count, and mass, with associated numeric values that quantify the observed state: 547.06, 866.46, 659.49, and 457.08 respectively. The foreign key from belief interval to clause subclass creates a direct evidentiary chain, allowing auditors to trace a specific operational observation back to the compliance requirement it is intended to satisfy.

**t_belief_interval_for_claim**

| id | belief | for_claim | dimension_kind | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Network packet loss | CLAU-0005 | time | 547.06 |
| CLAI-0002 | CPU utilization rate | CLAU-0004 | length | 866.46 |
| CLAI-0003 | Checksum mismatch found | CLAU-0005 | count | 659.49 |
| CLAI-0004 | Pipeline latency elevated | CLAU-0006 | mass | 457.08 |

**t_iso27001_clause_subclass**

| id | iso |
| --- | --- |
| CLAU-0001 | Iso 01 |
| CLAU-0002 | Iso 02 |
| CLAU-0003 | Iso 03 |
| CLAU-0004 | Iso 04 |
| CLAU-0005 | Iso 05 |
| CLAU-0006 | Iso 06 |

**t_iso27001_clause_subclass_iso27001_clause**

| id | iso27001_clause |
| --- | --- |
| CLAU-0001 | Risk treatment |
| CLAU-0002 | Performance evaluation |
| CLAU-0003 | Improvement |
| CLAU-0004 | Leadership |
| CLAU-0005 | Risk treatment |
| CLAU-0006 | Risk treatment |

The integration of these structures produces a coherent audit trail. Security tier events are classified and counted within the tier dimension, while compliance claims are anchored to ISO 27001 clauses through the subclass hierarchy. Belief intervals then provide the measurable evidence that either supports or challenges each claim, with the dimension kind and value fields supplying the quantitative basis for assessment. This design ensures that every operational event, every compliance obligation, and every piece of evidence is linked through explicit foreign-key relationships, forming a navigable graph of security posture that can be queried, aggregated, and reported without ambiguity.