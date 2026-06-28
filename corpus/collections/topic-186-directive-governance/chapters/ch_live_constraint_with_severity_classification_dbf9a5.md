---
chapter_id: ch_live_constraint_with_severity_classification_dbf9a5
topic_id: 186
family: 03_directive_governance
cited_terms: ['constraint_with_severity_classification', 'schemaorg_person_affiliation', 'qualification_process']
model: engine-refine
---

Affiliation is the organizational anchor that ties compliance obligations, data assets, and competitive eligibility to a single accountable entity. In operational governance, every affiliation receives a durable identifier—such as AFFI-0001 through AFFI-0004—that survives relabeling, category reassignment, and version upgrades. The identifier is not merely a database key; it is the cross-system correlation token that lets auditors, data stewards, and qualification administrators refer to the same party whether they are reviewing a constraint catalog, a Schema.org fact record, or a championship pathway. Affiliation labels and categories supply the human-facing and analytical dimensions that identifiers alone cannot carry. A label such as "Affiliation Label 01" functions as the operational display name—the misc field that operators encounter in dashboards and exception queues—while category partitions the population into governance tiers or business segments ("Affiliation Category 01" versus "Affiliation Category 04") so that policy bundles, retention rules, and qualification menus can be scoped without redefining the underlying entity.

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |

Constraint governance depends on the same identifier discipline, extended by severity classification, priority, and language. Each classified constraint—whether an access control policy, a PII encryption mandate, a sensor calibration interval, or a log retention period—receives a stable classification identifier (CLAS-0001 through CLAS-0004) that binds the rule text to a severity band and a remediation urgency. Severity expresses exposure posture: "Low exposure" signals acceptable residual risk under documented controls, whereas "Warning threshold" marks conditions that demand escalation before they become violations. Priority numerically orders competing obligations when resources are finite; a PII encryption mandate carrying priority 5 outranks calibration and retention rules at priority 3, directing incident response and audit sampling toward the highest-consequence gaps first. Language localizes the constraint surface without duplicating the rule logic: the same underlying control may be published in Spanish (es), English (en), or French (fr) so that regional operators enforce identical requirements in the idiom of their jurisdiction.

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | Low exposure | 3 | es |
| CLAS-0002 | PII encryption mandate | Warning threshold | 5 | en |
| CLAS-0003 | Sensor calibration interval | Tolerable variance | 3 | es |
| CLAS-0004 | Log retention period | Warning threshold | 3 | fr |
| CLAS-0005 | Lab containment level | Tolerable variance | 3 | ja |
| CLAS-0006 | Lab containment level | Standard baseline | 2 | fr |

Affiliation facts accumulate over time as versioned, measurable artifacts. The size_bytes attribute quantifies the storage footprint of each affiliation's published or ingested dataset—ranging from roughly 114 million bytes for a lean federation record to nearly one gigabyte for a mature, multi-entity profile—so capacity planners and data-governance councils can reason about replication cost, backup windows, and right-to-erasure scope. Version increments (3, 5, 4, 8 across the sample set) record lineage: when an affiliation's Schema.org representation changes, downstream consumers must know whether they are bound to a superseded snapshot or the current canonical release. Affiliation_key in fact tables preserves the join semantics even when fact rows and dimension rows are maintained on different cadences, ensuring that a constraint violation attributed to AFFI-0004 still resolves to the correct category and label regardless of when the fact was materialized.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

Qualification processes translate membership standing into championship entry rights through explicit, auditable gates. A qualification process—Regional Wildcard Series, Continental Draft Combine, or North American Open Bracket—is not an informal pathway but a registered procedure (PROC-0001 through PROC-0004) with declared prerequisites and declared yields. Membership registration requirements state what an entrant must already hold: a FIDE Master Rating for chess-adjacent series, FIFA Member Federation status for continental combine eligibility, or a USATF Athletic License for track-and-field brackets. Championship entry names the concrete prize of successful qualification—Finals Roster Position, Final Four Invitation, or Playoff Wildcard Spot—so that compliance officers can verify not only that the entrant was licensed but that the correct slot type was awarded. When the same process name appears twice (two Regional Wildcard Series records) with different membership and yield pairings, the identifier disambiguates otherwise identical labels and prevents roster contamination across sport or region.

**t_qualification_process**

| id | qualification_process | requires_membership | yields_championship_entry |
| --- | --- | --- | --- |
| PROC-0001 | Regional Wildcard Series | FIDE Master Rating | Finals Roster Position |
| PROC-0002 | Continental Draft Combine | FIFA Member Federation | Final Four Invitation |
| PROC-0003 | Regional Wildcard Series | USATF Athletic License | Playoff Wildcard Spot |
| PROC-0004 | North American Open Bracket | USATF Athletic License | Playoff Wildcard Spot |

In practice, these elements interlock across the compliance lifecycle. An auditor tracing a log-retention warning for AFFI-0002 begins with the affiliation identifier, confirms category and label context, checks which constraint classification applies in the operator's language, and weighs priority against concurrent PII findings. A data steward evaluating AFFI-0003's 339-million-byte footprint at version 4 coordinates retention policy with the affiliation's active qualification processes—ensuring that historical performance data needed for a Playoff Wildcard Spot claim is retained while superseded versions are defensibly purged. Championship administrators cross-reference membership registration records against process requirements before issuing entry credentials, because yielding a Final Four Invitation without verified FIFA Member Federation standing would constitute both competitive injustice and a governance breach. Identifier stability, categorical scoping, versioned facts, localized constraints, prioritized severities, and explicit qualification chains together form the operational grammar through which multi-affiliation programs remain legible, enforceable, and fair under scrutiny.