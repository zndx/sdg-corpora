---
chapter_id: ch_live_evidence_refutes_claim_d85004
topic_id: 97
family: 06_belief_structure
cited_terms: ['evidence_refutes_claim', 'lift_with_support_count', 'control_implements']
model: engine-refine
---

**Governance Metadata and Evidence Linkage**

A compliance framework rests on the ability to trace a control back to the claim it addresses, and the claim back to the evidence that either supports or refutes it. The `t_control_implements` table encodes this linkage: each row identifies a control—such as the Change Advisory Board, the Access Review Cycle, or the Data Retention Schedule—and records which claim it implements, at what priority, and across which scope. Priorities range from 1 to 5, with the Access Review Cycle carrying priority 1 across a team scope, while the Change Advisory Board sits at priority 5 with regional reach. The Data Retention Schedule appears twice, once at priority 3 with global scope and again at priority 3 with team scope, illustrating how the same control can be deployed across different organizational boundaries without losing its identity. The `t_evidence_refutes_claim` table performs the inverse operation, mapping discrete pieces of evidence—Benchmark result v2.1, Audit report FY2023, Sensor drift calibration, Data lineage snapshot—to the claims they contradict, such as IMPL-0003 or IMPL-0002. Each refutation carries a method classification (manual, hybrid, or automated) and a label_text that provides a human-readable descriptor: calibration record, audit excerpt, intake form, pre-release note. Together, these two tables form the backbone of an audit trail, enabling a reviewer to move from a high-level control down through its priority and scope, into the specific claim it governs, and finally to the evidence that validates or undermines it.

**Attribute Typing and Entity-Attribute Modeling**

Beyond the claim-evidence-control chain, the framework captures quantitative and categorical metadata about lift metrics through an entity-attribute-value (EAV) pattern. The `t_lift_with_support_count` table defines the entities themselves—identified by codes such as COUN-0001 through COUN-0004—each carrying a lift descriptor (signal amplification lift, data pipeline lift, sensor drift lift) and a support_count ranging from 2048 to 32768. The `t_lift_with_support_count_attr` table declares the attributes that can be attached to these entities, specifying both an attr_name and an attr_type drawn from an XML Schema vocabulary. Confidence is typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This separation of attribute schema from attribute values allows the system to enforce type discipline without hard-coding property names into the entity table. The EAV decomposition then materializes across three value tables: `t_lift_with_support_count_val_decimal` stores numeric values such as 0.849, 945.35, and 331.44; `t_lift_with_support_count_val_varchar` stores string values like Dimension Kind 01, Encoding 02, nightly summary, and es; and `t_lift_with_support_count_val_datetime` stores timestamps including 2024-12-28T07:07:56 and 2023-08-28T07:06:53. Each value row references its entity through entity_id and its attribute through attr_id, creating a many-to-many relationship that lets any entity carry any number of typed attributes without schema migration.

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |

**Identifier Conventions and Cross-Table Referential Integrity**

The system relies on a consistent identifier convention to maintain referential integrity across its tables. Claim identifiers follow the pattern CLAI-NNNN and appear as the primary key in `t_evidence_refutes_claim` and as the implements target in `t_control_implements`. Control identifiers follow the pattern IMPL-NNNN and serve as the primary key in `t_control_implements` while simultaneously appearing as refutes_claim values in `t_evidence_refutes_claim`, creating a bidirectional link between controls and refuting evidence. Lift metric entities use the pattern COUN-NNNN as both their own primary key and as foreign keys in the three value tables, where they appear as entity_id. Attribute definitions also use COUN-NNNN as their primary key in `t_lift_with_support_count_attr`, and these same identifiers recur as attr_id in the value tables, allowing a single attribute definition to be referenced by multiple entity instances. This dual use of the COUN-NNNN namespace for both entities and attributes is intentional: it reflects the fact that in an EAV model, attributes themselves are first-class entities with their own properties, and the value tables serve as the join mechanism between them.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

**Operational Implications for Audit and Compliance**

The design choices embedded in these tables have direct consequences for how auditors and compliance officers conduct their work. The priority and scope columns in `t_control_implements` enable filtering and aggregation: an auditor can query for all team-scope controls at priority 1, or compare how the Data Retention Schedule is applied differently at global versus team levels. The method column in `t_evidence_refutes_claim` allows evidence to be categorized by its collection process, which matters when assessing the reliability of a refutation—automated evidence may carry different assurance weight than manual evidence. The attr_type declarations in `t_lift_with_support_count_attr` ensure that downstream reporting tools can correctly interpret and aggregate values: a decimal column can be averaged, a dateTime column can be sorted chronologically, and a string column can be grouped categorically. The label_text field provides the human-readable context that bridges the gap between machine-readable identifiers and the natural-language documentation auditors expect to find in their workpapers.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | IMPL-0003 | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | IMPL-0002 | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | IMPL-0007 | automated | intake form |
| CLAI-0004 | Data lineage snapshot | IMPL-0005 | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | IMPL-0006 | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | IMPL-0004 | automated | change rationale |
| CLAI-0007 | Incident summary Aug | IMPL-0006 | inferred | intake form |

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | CLAI-0005 | 5 | regional |
| IMPL-0002 | Data Retention Schedule | CLAI-0001 | 3 | global |
| IMPL-0003 | Access Review Cycle | CLAI-0002 | 1 | team |
| IMPL-0004 | Data Retention Schedule | CLAI-0003 | 3 | team |
| IMPL-0005 | GDPR Data Minimization | CLAI-0003 | 1 | global |
| IMPL-0006 | Incident Response Protocol | CLAI-0007 | 1 | global |
| IMPL-0007 | NIST SP 800-53 | CLAI-0001 | 2 | local |