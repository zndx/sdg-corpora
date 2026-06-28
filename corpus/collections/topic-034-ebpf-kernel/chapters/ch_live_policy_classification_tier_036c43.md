---
chapter_id: ch_live_policy_classification_tier_036c43
topic_id: 34
family: 03_directive_governance
cited_terms: ['policy_classification_tier', 'syscall_at_security_tier', 'trace_with_root_span']
model: engine-refine
---

Security tiering and policy classification form the structural backbone of regulatory enforcement within the system, establishing a multi-layered framework that maps abstract compliance obligations to concrete operational controls. The policy tier registry enumerates distinct regulatory domains—each anchored by a unique identifier such as TIER-0001 through TIER-0004—and associates them with their governing directives. The Medical Privacy Directive appears across multiple tiers (TIER-0001 and TIER-0004), reflecting its pervasive applicability, while the Financial SEC Reporting Rule and Environmental EPA Emissions Standard occupy their own singular tier designations, each carrying distinct enforcement requirements. These policy identifiers serve as the primary keys through which all downstream classification and access decisions are resolved.

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Medical Privacy Directive |
| TIER-0002 | Financial SEC Reporting Rule |
| TIER-0003 | Environmental EPA Emissions Standard |
| TIER-0004 | Medical Privacy Directive |
| TIER-0005 | Open Source License Policy |
| TIER-0006 | National Cybersecurity Strategy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |

Classification tiers operationalize the abstract policy requirements into enforceable security postures. The association between policies and classification tiers is mediated through a junction table that not only links a given policy to its assigned classification tier but also assigns a governance role—owner, observer, contributor, or reviewer—to each relationship. For instance, the Financial SEC Reporting Rule (TIER-0002) is linked to the Restricted Access classification tier (TIER-0004) with an owner role, while the same policy also maps to Level 2 Sensitive (TIER-0003) under an observer designation, indicating that a single policy may carry multiple classification obligations depending on the operational context. The classification tier dimension itself carries human-readable labels such as Tier 3 Critical and Restricted Access, alongside categorical groupings that enable aggregation and reporting across the compliance landscape.

Security tier enforcement is tracked through syscall event facts that record the volume of security-relevant operations executed at each tier. The fact table for syscalls references security tier identifiers—TIER-0001 through TIER-0004—and logs event counts that range from 52 operations at TIER-0002 to 382 at TIER-0004, with intermediate values of 238 and 198 at the remaining tiers. These counts are not merely audit artifacts; they represent the actual execution footprint of security controls, enabling operators to detect anomalies in control invocation patterns. The security tier dimension provides the categorical context for these events, with each tier labeled (At Security Tier Label 01 through At Security Tier Label 04) and categorized (At Security Tier Category 01 through At Security Tier Category 04) to support hierarchical rollups and cross-tier comparisons.

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

Distributed tracing data, captured through root span facts, provides a complementary observability layer that records the size and version of trace payloads associated with each span. Trace identifiers such as SPAN-0001 through SPAN-0004 reference root spans via foreign keys, with payload sizes spanning several orders of magnitude—from 70,626,790 bytes at SPAN-0003 to 953,122,943 bytes at SPAN-0004—highlighting the variable resource demands of different trace operations. Versions assigned to these traces (ranging from 4 to 12) enable operators to correlate trace behavior with specific releases of the tracing infrastructure, ensuring that anomalies in payload size or processing latency can be attributed to version-specific changes rather than systemic degradation. The root span dimension table supplies the categorical metadata for these spans, with labels and categories that allow tracing data to be filtered and aggregated alongside security tier and policy classification information.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |