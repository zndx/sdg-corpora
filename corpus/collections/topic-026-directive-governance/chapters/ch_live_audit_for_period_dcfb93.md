---
chapter_id: ch_live_audit_for_period_dcfb93
topic_id: 26
family: 03_directive_governance
cited_terms: ['audit_for_period', 'measurement_subclass', 'existential_with_has_part']
model: engine-refine
---

In governance and operational metadata, the four relational primitives—identifier, role, subject, and target—establish how controlled entities are named, how they enter into accountable associations, and how those associations are qualified for compliance review. An identifier is the durable surrogate key that permits the same logical entity to be referenced consistently across registries, junction records, and composition hierarchies without ambiguity. Values such as PERI-0001 through PERI-0004 denote audit-for-period records whose descriptive attributes vary—Data Privacy Impact Assessment appears twice under PERI-0001 and PERI-0002, while PERI-0003 carries Annual-2022 and PERI-0004 carries GDPR Compliance Review—yet each identifier remains the authoritative handle by which downstream linkages resolve. The same pattern holds in the measurement domain, where MEAS-0001 through MEAS-0004 identify subclasses ranging from Heart rate and Seismic magnitude to duplicated Soil moisture entries, and in the existential-part registry, where PART-0001 through PART-0004 name composite structures including BatchIngestionPipeline, GlobalMetadataCatalog, AuditLogArchive, and CoreControlSubsystem. Identifiers therefore matter not because they encode meaning in themselves, but because they anchor traceability: every audit finding, dimensional attribution, or part-whole assertion can be tied to a single, auditable key.

**t_audit_for_period**

| id | audit |
| --- | --- |
| PERI-0001 | Data Privacy Impact Assessment |
| PERI-0002 | Data Privacy Impact Assessment |
| PERI-0003 | Annual-2022 |
| PERI-0004 | GDPR Compliance Review |
| PERI-0005 | FINRA Rule 4511 Examination |
| PERI-0006 | Q4-2023 |
| PERI-0007 | FINRA Rule 4511 Examination |
| PERI-0008 | ISO 27001 Certification |

**t_audit_for_period_for_audit_period**

| id | for_audit_period |
| --- | --- |
| PERI-0001 | HIPAA Security Audit |
| PERI-0002 | SOC2 Type II |
| PERI-0003 | HIPAA Security Audit |
| PERI-0004 | ITIL Service Audit |
| PERI-0005 | HIPAA Security Audit |
| PERI-0006 | Q4-2023 |

**t_audit_for_period__for_audit_period**

| id | audit_id | for_audit_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0001 | PERI-0003 | observer |
| PERI-0002 | PERI-0002 | PERI-0005 | reviewer |
| PERI-0003 | PERI-0001 | PERI-0003 | observer |
| PERI-0004 | PERI-0005 | PERI-0003 | reviewer |
| PERI-0005 | PERI-0007 | PERI-0004 | reviewer |
| PERI-0006 | PERI-0001 | PERI-0001 | owner |
| PERI-0007 | PERI-0003 | PERI-0001 | reviewer |
| PERI-0008 | PERI-0008 | PERI-0002 | observer |

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | PERI-0003 |
| PART-0002 | GlobalMetadataCatalog | PERI-0004 |
| PART-0003 | AuditLogArchive | PERI-0002 |
| PART-0004 | CoreControlSubsystem | PERI-0001 |
| PART-0005 | ComputeNodePool | PERI-0001 |
| PART-0006 | GlobalMetadataCatalog | PERI-0001 |

Subject and target partition directed relationships into an originating entity and an entity acted upon or referenced, a distinction essential whenever obligations, observations, or measurements must be attributed asymmetrically. In audit-period associations, the subject is the audit engagement identified by audit_id—PERI-0001, PERI-0002, PERI-0001 again, and PERI-0005—while the target is the period or framework under review, identified by for_audit_period_id as PERI-0003, PERI-0005, PERI-0003, and PERI-0003 respectively. Thus PERI-0001 as subject relates to PERI-0003 as target in one record and recurs in another pairing, demonstrating that subjects and targets are positional roles within a linkage, not intrinsic properties of the identifier itself. The measurement-subclass dimension junction exhibits the same structure: measurement_id MEAS-0004, MEAS-0004, MEAS-0006, and MEAS-0005 serve as subjects bound to dimension_id targets MEAS-0003, MEAS-0005, MEAS-0005, and MEAS-0001, associating Soil moisture and related subclasses with dimensions such as Electric current, Power, Energy, and Mass. Where subject identifiers appear in junction rows but not in their nominal entity tables—as with PERI-0005 and MEAS-0005, MEAS-0006—the model nonetheless preserves referential intent, signaling that governance workflows may reference entities provisionally enrolled or defined in external registries.

Role qualifies the subject–target bond by specifying how the subject participates relative to the target, converting a bare binary link into an operationally meaningful assignment. Audit linkages assign observer to PERI-0001→PERI-0003 and PERI-0001→PERI-0003 pairings involving Data Privacy Impact Assessment against HIPAA Security Audit, while reviewer attaches to PERI-0002→PERI-0005 and PERI-0005→PERI-0003, the latter connecting an identifier absent from the primary audit roster to a HIPAA Security Audit period already associated with PERI-0003. Measurement linkages parallel this scheme with owner on MEAS-0004→MEAS-0003 and MEAS-0004→MEAS-0005 associations and reviewer on MEAS-0006→MEAS-0005 and MEAS-0005→MEAS-0001, indicating differentiated stewardship over dimensional attribution for Soil moisture and related quantities. Because role is carried on the association record rather than on either endpoint identifier, the same subject–target pair could in principle support multiple roles across revisions; in the present evidence, however, each junction row expresses a single, determinate capacity—observer, reviewer, or owner—sufficient for segregation-of-duties analysis and for demonstrating that GDPR Compliance Review and ITIL Service Audit engagements were not conflated with observer-only standing.

Identifiers also propagate across orthogonal relation types, including hierarchical composition, where an existential entity holds a part identified by another key domain. CoreControlSubsystem holds part PERI-0001, AuditLogArchive holds PERI-0004, GlobalMetadataCatalog holds PERI-0002, and BatchIngestionPipeline holds PERI-0003, weaving period-scoped audit artifacts into larger system boundaries without collapsing the audit identifier namespace into the part registry. PERI-0003 thus simultaneously denotes Annual-2022 in the audit registry, HIPAA Security Audit as a for_audit_period value, a target in multiple observer and reviewer linkages, and a constituent part of BatchIngestionPipeline—a convergence that underscores why identifier, subject, target, and role must be interpreted in context rather than inferred from token syntax alone.

In practice, compliance officers and data stewards employ these primitives to reconstruct accountability chains: locate an entity by identifier, traverse outgoing associations from subject to target, filter by role to distinguish observers from reviewers or owners, and ascend composition edges to determine systemic scope. The audit corpus illustrated here—spanning Data Privacy Impact Assessment, SOC2 Type II, HIPAA Security Audit, and GDPR Compliance Review—shows how a compact keying scheme supports cross-framework attestation without redundant relabeling of engagements, while the measurement corpus shows dimensional governance applied uniformly to heterogeneous quantities. Mastery of identifier, role, subject, and target is therefore prerequisite to any defensible impact assessment, executive audit, or metadata control review in which personally identifiable information handling, service management discipline, or operational measurement integrity must be demonstrated against named periods, named dimensions, and named organizational parts with evidentiary precision.