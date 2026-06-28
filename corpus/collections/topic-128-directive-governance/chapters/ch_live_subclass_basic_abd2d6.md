---
chapter_id: ch_live_subclass_basic_abd2d6
topic_id: 128
family: 01_foundation
cited_terms: ['subclass_basic', 'qualification_process', 'policy_equiv_jurisdiction_and_scope']
model: engine-refine
---

The foundational layer of the classification schema rests on a subclass registry that pairs primary designations with secondary associations through a simple identifier scheme. Each record carries a unique key such as TSUB-0001 through TSUB-0004, anchoring a primary subject—whether ISO 8601 timestamp, Parquet row group, Remote sensing platform, or Query execution engine—to a secondary subject like Query execution engine, Kestrel telemetry probe, Atmospheric instrument, or Edge gateway node. This bidirectional pairing establishes the semantic topology upon which all downstream qualification and governance structures depend, ensuring that every entity can be traced to its conceptual parent and its relational peers.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

**t_qualification_process**

| id | qualification_process | requires_membership | yields_championship_entry |
| --- | --- | --- | --- |
| PROC-0001 | Regional Wildcard Series | FIDE Master Rating | Finals Roster Position |
| PROC-0002 | Continental Draft Combine | FIFA Member Federation | Final Four Invitation |
| PROC-0003 | Regional Wildcard Series | USATF Athletic License | Playoff Wildcard Spot |
| PROC-0004 | North American Open Bracket | USATF Athletic License | Playoff Wildcard Spot |

The qualification pipeline operates as a gated progression mechanism, where each qualification process—Regional Wildcard Series, Continental Draft Combine, North American Open Bracket—demands a specific membership registration before conferring a championship entry. A Regional Wildcard Series requires either a FIDE Master Rating or a USATF Athletic License, and in turn yields either a Finals Roster Position or a Playoff Wildcard Spot. The Continental Draft Combine maps FIFA Member Federation credentials to a Final Four Invitation, while the North American Open Bracket accepts a USATF Athletic License to produce a Playoff Wildcard Spot. Each process is uniquely identified by a code such as PROC-0001 through PROC-0004, and the triad of qualification process, required membership, and resulting championship entry forms a closed transactional unit: entry is neither automatic nor discretionary but strictly contingent upon credential verification.

Governance of policy equivalence across jurisdictions introduces a more complex relational architecture. The policy registry enumerates domains such as AI Model Training, Personal Data Processing, Supply Chain Logistics, and Third Party Vendors, each keyed by an identifier like SCOP-0001 through SCOP-0004. These policies are linked to regulatory jurisdictions—FDA 21 CFR 11, UK Information Commissioner, Industrial Control Systems, CCPA—through a junction table that assigns a role to each policy-jurisdiction pairing. A single policy may assume multiple roles within the same jurisdiction: SCOP-0001 (AI Model Training) appears as contributor, observer, and observer across different jurisdictional pairings, while SCOP-0002 (Personal Data Processing) carries the owner role. The subject column in this junction table references the policy identifier, and the target column references the jurisdiction identifier, with the role column encoding the nature of the policy's engagement with that regulatory body.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | AI Model Training |
| SCOP-0002 | Personal Data Processing |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | Third Party Vendors |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | European Commission |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | FDA 21 CFR 11 |
| SCOP-0002 | UK Information Commissioner |
| SCOP-0003 | Industrial Control Systems |
| SCOP-0004 | CCPA |
| SCOP-0005 | UK Information Commissioner |
| SCOP-0006 | National Institute of Standards |

**t_policy_equiv_jurisdiction_and_scope__jurisdiction**

| id | policy_id | jurisdiction_id | role |
| --- | --- | --- | --- |
| SCOP-0001 | SCOP-0001 | SCOP-0002 | contributor |
| SCOP-0002 | SCOP-0001 | SCOP-0001 | observer |
| SCOP-0003 | SCOP-0001 | SCOP-0002 | observer |
| SCOP-0004 | SCOP-0002 | SCOP-0006 | owner |
| SCOP-0005 | SCOP-0003 | SCOP-0005 | contributor |
| SCOP-0006 | SCOP-0004 | SCOP-0002 | owner |
| SCOP-0007 | SCOP-0006 | SCOP-0001 | reviewer |
| SCOP-0008 | SCOP-0001 | SCOP-0006 | reviewer |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | CCPA |
| SCOP-0003 | Massachusetts Privacy Board |
| SCOP-0004 | NIST 800-53 |
| SCOP-0005 | EU AI Act |
| SCOP-0006 | EU AI Act |
| SCOP-0007 | Securities Exchange Commission |

A parallel junction table governs the relationship between policies and scope frameworks, introducing the cardinality note as a structural qualifier. Policies such as SCOP-0003 (Supply Chain Logistics) and SCOP-0004 (Third Party Vendors) are mapped to scope definitions including Basel III, CCPA, Massachusetts Privacy Board, and NIST 800-53. Each mapping carries a role—contributor, observer, or reviewer—and a cardinality note ranging from Cardinality Note 01 through Cardinality Note 04. These notes encode multiplicity constraints on the policy-to-scope relationship, specifying whether a policy governs a scope unilaterally or in concert with others, and whether the scope may be governed by multiple policies simultaneously. The subject column again references the policy identifier, the target column references the scope identifier, and together with role and cardinality note, they form a complete specification of how regulatory scope is allocated, shared, and constrained across the policy portfolio.

**t_policy_equiv_jurisdiction_and_scope__governs_scope**

| id | policy_id | governs_scope_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SCOP-0001 | SCOP-0003 | SCOP-0003 | contributor | Cardinality Note 01 |
| SCOP-0002 | SCOP-0004 | SCOP-0007 | contributor | Cardinality Note 02 |
| SCOP-0003 | SCOP-0005 | SCOP-0002 | observer | Cardinality Note 03 |
| SCOP-0004 | SCOP-0002 | SCOP-0002 | reviewer | Cardinality Note 04 |
| SCOP-0005 | SCOP-0002 | SCOP-0002 | owner | Cardinality Note 05 |
| SCOP-0006 | SCOP-0005 | SCOP-0001 | observer | Cardinality Note 06 |
| SCOP-0007 | SCOP-0003 | SCOP-0007 | observer | Cardinality Note 07 |
| SCOP-0008 | SCOP-0006 | SCOP-0006 | contributor | Cardinality Note 08 |