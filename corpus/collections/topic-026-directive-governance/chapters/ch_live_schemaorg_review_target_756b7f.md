---
chapter_id: ch_live_schemaorg_review_target_756b7f
topic_id: 26
family: 07_long_tail
cited_terms: ['schemaorg_review_target', 'nist80053_high_impact', 'attribute_set_supports_outlier_claim']
model: engine-refine
---

In governance and compliance systems, every auditable fact must be anchored to stable, machine-resolvable identities before it can be compared, inherited, or enforced across policy boundaries. An identifier is that anchor: a durable handle that survives renaming, reclassification, and cross-system federation. When a Schema.org–typed review program registers `SoftwareApplication`, `Person`, and `Service` entities under codes such as `TARG-0001` through `TARG-0004`, it is not merely labeling records—it is creating referential currency that downstream review workflows, evidence collectors, and attestation engines can cite without ambiguity. The same principle holds for high-impact control frameworks keyed as `IMPA-0001`–`IMPA-0004`, where publications like NIST SP 800-171 and Zero Trust Architecture must remain traceable even as impact tiers or organizational scope change. Identifiers therefore function as the non-negotiable spine of accountability: without them, roles cannot be assigned, subjects cannot be bound to targets, and compliance narratives collapse into anecdote.

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_nist80053_high_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | NIST SP 800-171 |
| IMPA-0002 | NIST SP 800-61 |
| IMPA-0003 | Zero Trust Architecture |
| IMPA-0004 | NIST SP 800-161 |
| IMPA-0005 | Zero Trust Architecture |
| IMPA-0006 | NIST SP 800-171 |

**t_nist80053_high_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate |
| IMPA-0002 | Tier-4 |
| IMPA-0003 | Severity-Medium |
| IMPA-0004 | Compliance-Low |
| IMPA-0005 | Essential |
| IMPA-0006 | Controlled-High |

**t_nist80053_high_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | IMPA-0002 | contributor |
| IMPA-0002 | IMPA-0003 | IMPA-0003 | contributor |
| IMPA-0003 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0004 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0005 | IMPA-0005 | IMPA-0002 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0006 | contributor |
| IMPA-0007 | IMPA-0003 | IMPA-0003 | reviewer |
| IMPA-0008 | IMPA-0001 | IMPA-0001 | reviewer |

Subject and target name the two poles of a directed relationship, and the distinction is operational rather than cosmetic. The subject is the entity whose posture, obligation, or claim is being characterized; the target is the context, artifact, or dependency against which that characterization is made. In a Schema.org review lineage, a `Service` subject may be evaluated against a `PostgreSQLTable` review target, while a `Person` subject may be assessed through `AzureBlobStorage`—the subject carries the governance question, and the target supplies the evidentiary surface. Parallel structure appears in NIST high-impact modeling, where a control publication (the subject) is associated with an impact designation such as `Moderate`, `Tier-4`, or `Compliance-Low` (the target), and in outlier-claim support, where attributes like `validation rule` or `sensor calibration` (subjects) are linked to supporting systems such as an API gateway or ontology registry (targets). Treating these poles consistently prevents category errors: one does not “own” an impact tier; one occupies a role relative to it.

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |

Role qualifies the subject–target edge and is often where legal and operational meaning actually lives. The same subject–target pair can appear in multiple governance graphs, but role determines authority, duty, and evidential weight. Where a Schema.org review binding lists `owner` for one `Service`–`PostgreSQLTable` pairing and `contributor` for another, the distinction governs who may approve exceptions, who must supply artifacts, and whose attestation satisfies an auditor. NIST impact associations sharpen this further: a framework element may be a `contributor` at one impact stratum, a `reviewer` at another, or merely an `observer` where the organization accepts risk without operational custody. In outlier-claim support, `owner` on `geolocation accuracy` signals custodial responsibility for the evidentiary chain, whereas `contributor` on `source system ID` or `validation rule` marks participants who strengthen but do not singularly warrant the claim. Roles are therefore not decorative metadata; they encode enforceable partitions of responsibility.

Identifiers, subjects, targets, and roles interlock through association records that make relationships first-class citizens rather than implicit joins. A review program might reuse the same infrastructure target—`AzureBlobStorage` appears under more than one Schema.org review registration—while binding different subjects and roles, illustrating that targets are shared resources whose meaning depends on the subject–role tuple. Likewise, `Ontology registry` supports multiple attribute subjects, but only one pairing carries `owner`, showing how role disambiguates otherwise similar edges. NIST mappings demonstrate asymmetry by design: the subject identifier on an association row need not equal the association’s own identifier, because the association is its own governed object with its own lifecycle, while still pointing to canonical subject and target keys. This pattern enables historical replay—auditors can reconstruct who reviewed what, against which control surface, under which impact classification, at the time a decision was recorded.

In practice, these four constructs convert abstract policy into operable control graphs. Compliance officers use identifiers to scope assessments; architects use subject–target bindings to trace which technical surfaces substantiate which semantic or control claims; security operators use roles to route remediation and approval workflows. When a `GraphQLEndpoint` serves as the review target for a `SoftwareApplication`, the organization can demand API contract evidence, change logs, and access reviews without conflating the application identity with the endpoint identity. When Zero Trust Architecture is tied to `Severity-Medium` under a `reviewer` role rather than `contributor`, review cadence and escalation paths change accordingly. When `sensor calibration` is supported by registry infrastructure with explicit ownership, outlier investigations know where to begin and whom to hold answerable. The domain’s value lies in this composability: identifiers stabilize entities, subjects and targets orient relationships, and roles distribute authority—together yielding a governance fabric that remains legible under audit, resilient to organizational churn, and precise enough to automate enforcement without erasing human accountability.

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |