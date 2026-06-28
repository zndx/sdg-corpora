---
chapter_id: ch_live_constraint_check_subclass_7bc270
topic_id: 46
family: 03_directive_governance
cited_terms: ['constraint_check_subclass', 'allocation_with_input_facets', 'artifact_min_one_owner']
model: engine-refine
---

Governance frameworks rely on stable identifiers to anchor every artifact, constraint, and allocation across distributed systems. Each record carries a unique identifier—such as CHEC-0001 for a batch-window constraint or FACE-0001 for a data allocation—that serves as the immutable reference point for audits, lineage tracing, and access control. These identifiers appear not only as primary keys in their own records but also as foreign references in relationship tables, where they link allocations to input facets and artifacts to their responsible parties. The identifier is the single thread that survives schema migrations, system decommissions, and organizational restructurings, making it the foundational element of any traceable data-management practice.

**t_allocation_with_input_facets**

| id | allocation |
| --- | --- |
| FACE-0001 | Batch size limit |
| FACE-0002 | Max latency threshold |
| FACE-0003 | Telemetry Shard Alpha |
| FACE-0004 | Batch size limit |
| FACE-0005 | Null field rejection |
| FACE-0006 | Batch size limit |
| FACE-0007 | Max latency threshold |
| FACE-0008 | Null field rejection |

**t_allocation_with_input_facets_input_facet**

| id | input_facet |
| --- | --- |
| FACE-0001 | PostgreSQL Snapshot |
| FACE-0002 | GraphQL Query Results |
| FACE-0003 | PostgreSQL Snapshot |
| FACE-0004 | Raw JSON Logs |
| FACE-0005 | GraphQL Query Results |
| FACE-0006 | User Event Stream |
| FACE-0007 | User Event Stream |

Ownership and categorization form the human layer of governance. Every artifact carries an owner reference—fact_artifact.owner_key points to a specific owner record—that establishes accountability for data quality, retention, and access decisions. Owner records themselves are classified by category, such as Owner Category 01 or Owner Category 03, enabling bulk policy application and reporting by functional group. A misc label, like Owner Label 01, provides a human-readable designation that appears in dashboards and approval workflows without affecting machine-readable policy evaluation. Together, category, owner, and misc create a three-tier classification: machine-evaluable grouping, accountable individual or team, and display-friendly name.

**dim_owner**

| id | owner_label | owner_category |
| --- | --- | --- |
| OWNE-0001 | Owner Label 01 | Owner Category 01 |
| OWNE-0002 | Owner Label 02 | Owner Category 02 |
| OWNE-0003 | Owner Label 03 | Owner Category 03 |
| OWNE-0004 | Owner Label 04 | Owner Category 04 |
| OWNE-0005 | Owner Label 05 | Owner Category 05 |
| OWNE-0006 | Owner Label 06 | Owner Category 06 |

Constraint checks enforce operational discipline through a combination of mandatory flags and priority levels. A constraint such as "Null field rejection" paired with a "Schema registry linter" check is marked mandatory with priority 1, meaning it must pass before any downstream process proceeds and it takes precedence over lower-priority checks. By contrast, "Telemetry Shard Alpha" with an "Audit log parser" check carries a mandatory flag of false and priority 4, indicating it is advisory and can be deferred during system stress. The priority scale—ranging from 1 for critical checks like "Batch Window Night" to 5 for lower-impact validations—allows operators to triage failures during incidents, ensuring that the most consequential constraints are addressed first.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Batch Window Night | Great Expectations validator | true | 1 |
| CHEC-0002 | Null field rejection | Schema registry linter | true | 5 |
| CHEC-0003 | Quota Project Alpha | Great Expectations validator | true | 4 |
| CHEC-0004 | Telemetry Shard Alpha | Audit log parser | false | 1 |
| CHEC-0005 | Sampling rate limit | Prometheus alertmanager | false | 4 |

Allocation relationships model how data resources connect to their sources through a subject-to-target pattern. An allocation record, such as one labeled "Batch size limit," links to an input facet like "PostgreSQL Snapshot" through a junction table that records both the subject (the allocation identifier) and the target (the input facet identifier). The role column on this relationship—owner, reviewer, or contributor—defines the permission model for each connection: an owner has full control, a reviewer can validate but not modify, and a contributor can add data but not change the allocation parameters. This role-based linkage ensures that access rights are granular enough to support cross-functional teams while remaining auditable through a single relationship record.

**t_allocation_with_input_facets__input_facet**

| id | allocation_id | input_facet_id | role |
| --- | --- | --- | --- |
| FACE-0001 | FACE-0007 | FACE-0005 | owner |
| FACE-0002 | FACE-0005 | FACE-0003 | reviewer |
| FACE-0003 | FACE-0003 | FACE-0002 | contributor |
| FACE-0004 | FACE-0001 | FACE-0007 | reviewer |
| FACE-0005 | FACE-0002 | FACE-0003 | reviewer |
| FACE-0006 | FACE-0001 | FACE-0001 | observer |
| FACE-0007 | FACE-0002 | FACE-0006 | observer |
| FACE-0008 | FACE-0007 | FACE-0006 | observer |

Versioning and sizing provide the operational telemetry needed for capacity planning and change management. Each artifact carries a version number—ranging from 5 to 10 in the observed data—that tracks the evolution of the underlying data product, and a size_bytes field that records its current footprint, from approximately 43 MB to nearly 1 GB. These two fields together enable operators to answer practical questions: which artifacts are growing fastest, which versions consume the most storage, and whether a version bump correlates with a significant size increase that might trigger downstream pipeline failures. When combined with owner and category metadata, version and size data form the basis for cost allocation, retention policy enforcement, and capacity forecasting.

**fact_artifact**

| id | owner_key | size_bytes | version |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0003 | 123155790 | 6 |
| OWNE-0002 | OWNE-0003 | 42978804 | 5 |
| OWNE-0003 | OWNE-0003 | 996080316 | 5 |
| OWNE-0004 | OWNE-0005 | 597369362 | 10 |
| OWNE-0005 | OWNE-0006 | 12061913 | 9 |
| OWNE-0006 | OWNE-0004 | 792675668 | 5 |