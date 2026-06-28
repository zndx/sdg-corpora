---
chapter_id: ch_live_radicalization_process_4c1d21
topic_id: 186
family: 08_derived
cited_terms: ['radicalization_process', 'gauge_metric_subclass', 'requirement_satisfies']
model: engine-refine
---

Identifier serves as the foundational anchor across all tracked entities, providing a stable reference point that enables cross-referencing and auditability regardless of the domain. In radicalization process registries, identifiers such as PROC-0001 through PROC-0004 uniquely distinguish distinct operational phases, while metric gauge records carry identifiers like METR-0001 through METR-0004 to track measurement definitions. Compliance mappings similarly employ identifiers—SATI-0001 through SATI-0004—to link requirements to their satisfying controls. This consistent use of structured identifiers ensures that every record, whether describing a Militia Formation Phase or an Encryption Standard AES-256 requirement, can be unambiguously referenced, queried, and traced through downstream dependencies.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

Affiliated organization and radicalization process capture the relationship between entities and the activities they engage in or facilitate. An affiliated organization—such as Sympathizer Network Alpha, Al-Shabaab Recruitment Cell, or Regional Coordination Cell—may participate in one or more radicalization processes, including the Network Recruit Wave or the Radicalization Vector Delta. The same organization can appear across multiple process records, reflecting the reality that entities are rarely confined to a single operational vector. This many-to-many relationship structure allows analysts to map organizational involvement comprehensively, identifying which groups are associated with which phases and detecting patterns of repeated participation that may indicate escalation or coordination.

Metric kind classification, its associated category, and the misc label together form a taxonomy for organizing and filtering measurement definitions. Each metric kind carries a categorical designation—Metric Kind Category 01 through Metric Kind Category 04—and a descriptive label such as Metric Kind Label 01, enabling both programmatic grouping and human-readable identification. These classifications are critical for governance frameworks that require metrics to be organized by domain, function, or regulatory obligation. The fact_gauge table links individual metric instances to their kind definitions through a foreign key relationship, meaning that METR-0001, METR-0002, METR-0003, and METR-0004 each resolve to their respective metric kind records, inheriting the category and label attributes that define their analytical context.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

Size bytes and version provide operational metadata that tracks the state and scale of metric definitions over time. Size values such as 944,581,501 bytes for METR-0001 and 15,628,556 bytes for METR-0004 indicate the storage footprint of each metric record, information that matters for capacity planning, data governance, and compliance with data minimization principles. Version numbers—ranging from 4 for METR-0004 to 11 for METR-0003—enable change tracking and reproducibility, ensuring that analyses can be tied to a specific iteration of a metric definition. Together, these fields support audit trails that demonstrate when and how measurement definitions evolved.

Priority and scope govern the enforcement and applicability of compliance requirements. Priority levels, expressed as integer values from 1 to 5, establish a hierarchy of urgency and resource allocation—FIPS 140-2 Module satisfies the Encryption Standard AES-256 requirement at priority 1, while Audit Trail Mandate and ISO 27001 Annex A both carry priority 5, indicating lower urgency. Scope defines the boundary within which a requirement-satisfier relationship holds, with values such as team and regional indicating whether a control like Data Masking Engine or WAF Rule Set applies organization-wide, within a specific team, or across a geographic region. This two-dimensional classification ensures that compliance efforts are neither over-applied nor under-addressed, directing resources to the right controls at the right level of organizational granularity.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | Data Masking Engine | 5 | team |
| SATI-0002 | Data Retention Policy | Container Image Scan | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | FIPS 140-2 Module | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | WAF Rule Set | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | Backup Encryption Routine | 2 | team |
| SATI-0006 | Data Retention Policy | Vault Key Rotation | 1 | local |