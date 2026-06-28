---
chapter_id: ch_live_policy_only_governs_artifacts_a036a2
topic_id: 26
family: 03_directive_governance
cited_terms: ['policy_only_governs_artifacts', 'schema_revision_of', 'existential_with_has_part']
model: engine-refine
---

Enforcement mechanisms define how governance policies are applied to artifacts within an operational environment, establishing the boundary between recommended practice and mandatory compliance. Policies such as the Data Retention Policy, Access Control Policy, Privacy Compliance Policy, and Immutable Audit Policy each carry an enforcement classification that determines their operational weight: blocking, advisory, or deprecated. A blocking enforcement, as applied to the Data Retention Policy (ARTI-0001), means the system actively prevents violations at runtime, whereas advisory enforcement (as seen with the Access Control Policy, ARTI-0002, and the Privacy Compliance Policy, ARTI-0003) signals requirements that should be followed but cannot be technically enforced. Deprecated enforcement, assigned to the Immutable Audit Policy (ARTI-0004), indicates a policy that has been superseded and is no longer actively maintained. These classifications ensure that operators can distinguish between hard controls and soft guidance when designing compliant systems.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

Priority levels further refine enforcement by establishing a hierarchy among competing or overlapping policies. Within the artifact governance framework, policies are assigned integer priorities ranging from 1 through 5, where ARTI-0003 (Privacy Compliance Policy) carries priority 1, making it the highest-priority directive, while ARTI-0004 (Immutable Audit Policy) sits at priority 5, the lowest. This ordering resolves conflicts when multiple policies apply to the same artifact or operational context, ensuring that the most critical governance requirements take precedence. The priority scheme operates independently of enforcement type—a deprecated policy may still hold high priority for historical reference, while a blocking policy at a lower priority may be overridden by a higher-priority advisory directive in specific contexts.

Identifiers serve as the immutable anchors of traceability across all governance artifacts and schema revisions. Each artifact receives a unique identifier in the ARTI-NNNN format, such as ARTI-0001 through ARTI-0004, while schema revisions use the REVI-NNNN convention, including REVI-0001 through REVI-0004. These identifiers are not merely labels; they form the backbone of referential integrity across the governance data model. Schema revisions reference specific data structures they govern—REVI-0001 and REVI-0003 both govern the network_flow_record schema, while REVI-0002 covers product_inventory_catalog and REVI-0004 addresses clinical_trial_protocol—enabling auditors to trace any schema change back to its governing revision and, through that revision, to the policies that constrain it.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

The subject-target-role relationship model captures the multidimensional governance relationships between schema revisions, providing a structured way to express who is accountable for what and in what capacity. In the relationship table linking schema revisions, each record identifies a subject (the schema_id), a target (the schema_revision_of_id), and a role that defines the nature of the connection. For instance, REVI-0001 appears as the subject in three distinct relationships: it acts as a reviewer of REVI-0006, as a contributor to REVI-0001 itself, and as a reviewer of REVI-0003. Meanwhile, REVI-0007 serves as the subject in a relationship where it holds the owner role over REVI-0003. The role dimension—reviewer, contributor, or owner—distinguishes between oversight, collaborative authorship, and full accountability, enabling granular access control and audit trails.

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |

These governance constructs operate within a broader compositional hierarchy where existential entities contain artifacts as parts. The BatchIngestionPipeline (PART-0001) incorporates ARTI-0001 as a component, the GlobalMetadataCatalog (PART-0002) includes ARTI-0002, the AuditLogArchive (PART-0003) contains ARTI-0006, and the CoreControlSubsystem (PART-0004) embeds ARTI-0001. This part-whole relationship means that enforcement of ARTI-0001 applies not only in isolation but propagates through every existential entity that references it, creating a cascading compliance effect. Similarly, schema revisions form their own lineage through the schema_revision_of relationship, where REVI-0001, REVI-0002, REVI-0003, and REVI-0004 all trace back to legacy_compliance_log, while REVI-0004 additionally references legacy_network_record, establishing a clear audit trail from current schema definitions through their historical predecessors.

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | ARTI-0001 |
| PART-0002 | GlobalMetadataCatalog | ARTI-0002 |
| PART-0003 | AuditLogArchive | ARTI-0006 |
| PART-0004 | CoreControlSubsystem | ARTI-0001 |
| PART-0005 | ComputeNodePool | ARTI-0005 |
| PART-0006 | GlobalMetadataCatalog | ARTI-0005 |