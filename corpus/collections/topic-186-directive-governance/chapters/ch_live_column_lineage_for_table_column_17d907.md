---
chapter_id: ch_live_column_lineage_for_table_column_17d907
topic_id: 186
family: 05_provo_lineage
cited_terms: ['column_lineage_for_table_column', 'requirement_satisfies', 'allocation_with_output_facets']
model: engine-refine
---

Governance and operational control depend on a shared vocabulary of record identity, classification, measured belief, and runtime placement. At the center sits the identifier: a durable, system-agnostic key that lets facts, dimensions, and traceability links refer to the same entity without ambiguity. Identifiers such as `COLU-0001`, `SATI-0003`, and `FACE-0002` are not display names; they are the contractual handles through which audits reconcile lineage, joins survive schema evolution, and automation resolves “which row” when labels change or hosts are replaced. In practice, identifier discipline means every downstream assertion—whether a compliance mapping or an allocation record—must cite the canonical key rather than a human-readable string that may be renamed, duplicated, or localized.

Classification and structural reference travel on parallel tracks. Category assigns entities to governed buckets that drive policy routing, reporting rollups, and exception handling; labels like “Column 2 Category 03” sit alongside friendlier misc attributes such as “Column 2 Label 03,” which carry presentation or operational detail without redefining the entity’s type. The column concept, in this domain, functions as a relational pointer: a fact may reference another column record (`column_2_key` pointing at `COLU-0003` while the fact’s own id remains `COLU-0001`), encoding dependency, derivation, or crosswalk rather than storing redundant descriptive text. When a reference points outside the maintained dimension set—for example, a key of `COLU-0006` where only `COLU-0001` through `COLU-0004` are defined—governance surfaces a referential integrity gap that must be remediated before the value can be trusted in compliance or allocation workflows.

Confidence and uncertainty quantify how firmly an observed or inferred value should be treated as ground truth. Confidence expresses belief on a bounded scale (here, from `0.068` to `0.354`), suitable for ranking candidates, triggering human review, or gating automated remediation. Uncertainty, recorded in commensurate units (`404.01` through `984.09` in the sample), often reflects dispersion, error budget, or model variance and may move inversely with confidence depending on measurement design. A fact pairing low confidence (`0.068`) with high uncertainty (`744.10`) signals that the associated misc value (`571.55`) should be displayed as provisional—usable for trending or triage, but not for attestations without corroboration. Conversely, the strongest confidence in the set (`0.354` for the row keyed `COLU-0004`) still falls short of categorical certainty, which is why mature programs treat these fields as control inputs: thresholds in runbooks, not decorative metadata.

Priority and scope translate abstract requirements into actionable work queues bounded by organizational authority. Priority orders competing obligations when capacity is finite; assigning priority `1` to “Encryption Standard AES-256” while “Data Retention Policy” carries priority `2` encodes that cryptographic baseline precedes retention mechanics in execution planning, even when both are mandatory. Scope delimits who must implement and who may audit: mappings marked `team` apply to a single owning group, whereas a `regional` scope on “ISO 27001 Annex A” versus “FIPS 140-2 Module” indicates cross-site control frameworks that cannot be satisfied solely within one squad’s toolchain. Together, requirement-to-satisfaction links (such as “Audit Trail Mandate” satisfied by “Data Masking Engine”) form a traceability graph auditors use to prove coverage without re-deriving architecture from host inventories.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | Data Masking Engine | 5 | team |
| SATI-0002 | Data Retention Policy | Container Image Scan | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | FIPS 140-2 Module | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | WAF Rule Set | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | Backup Encryption Routine | 2 | team |
| SATI-0006 | Data Retention Policy | Vault Key Rotation | 1 | local |

Runtime governance closes the loop between policy intent and deployed reality through hostname and status. Hostname anchors allocations to concrete infrastructure: `node-a01` appears on multiple output facets while `node-b14` hosts a distinct workload, making colocation, blast-radius analysis, and capacity planning observable at the machine level. Status records operational truth at decision time—`running` versus `pending` distinguishes live telemetry and storage metrics from allocations still awaiting provisioning, such as a “Kubernetes pod allocation” or “API rate limit tier” that has been approved on paper but not yet active. When status lags hostname assignment, operators inherit a classic hazard: resources named on a node that is not yet executing, which breaks SLO dashboards and confuses incident routing unless status is synchronized with orchestration events.

**t_allocation_with_output_facets**

| id | allocation | output_facet | host_name | status |
| --- | --- | --- | --- | --- |
| FACE-0001 | Telemetry buffer lease | Storage usage metric | node-a01 | running |
| FACE-0002 | Cloud VM instance pool | Data quality score | node-b14 | pending |
| FACE-0003 | Kubernetes pod allocation | Telemetry timestamp stream | node-a01 | running |
| FACE-0004 | API rate limit tier | Lab sample ID registry | node-a01 | pending |
| FACE-0005 | Batch ingest pipeline | Lab sample ID registry | edge-03 | failed |
| FACE-0006 | Cloud VM instance pool | API response latency | gw-12 | pending |
| FACE-0007 | Data lake partition write | Network throughput counter | gw-12 | failed |

Taken together, these elements implement a layered assurance model. Identifiers stabilize reference; category and column structure normalize meaning; confidence and uncertainty govern how misc values may be consumed; priority and scope sequence and bound compliance work; hostname and status ground allocations in the live estate. Mature operations treat mismatches—orphan column keys, sub-threshold confidence, pending hosts carrying production-facing facets—as first-class exceptions with defined escalation, because each field is a control surface: weaken one, and traceability from mandate to running system becomes narrative rather than evidence.

**fact_column**

| id | column_2_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0003 | 0.164 | 560.21 | 257.80 |
| COLU-0002 | COLU-0004 | 0.068 | 744.10 | 571.55 |
| COLU-0003 | COLU-0006 | 0.107 | 984.09 | 140.18 |
| COLU-0004 | COLU-0002 | 0.354 | 404.01 | 131.27 |
| COLU-0005 | COLU-0003 | 0.790 | 109.97 | 235.19 |
| COLU-0006 | COLU-0003 | 0.934 | 653.09 | 813.74 |
| COLU-0007 | COLU-0005 | 0.938 | 827.04 | 409.13 |
| COLU-0008 | COLU-0003 | 0.734 | 419.22 | 492.32 |

**dim_column_2**

| id | column_2_label | column_2_category |
| --- | --- | --- |
| COLU-0001 | Column 2 Label 01 | Column 2 Category 01 |
| COLU-0002 | Column 2 Label 02 | Column 2 Category 02 |
| COLU-0003 | Column 2 Label 03 | Column 2 Category 03 |
| COLU-0004 | Column 2 Label 04 | Column 2 Category 04 |
| COLU-0005 | Column 2 Label 05 | Column 2 Category 05 |
| COLU-0006 | Column 2 Label 06 | Column 2 Category 06 |
| COLU-0007 | Column 2 Label 07 | Column 2 Category 07 |
| COLU-0008 | Column 2 Label 08 | Column 2 Category 08 |