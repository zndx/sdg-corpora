---
chapter_id: ch_live_evidence_at_quality_tier_8c58b2
topic_id: 51
family: 06_belief_structure
cited_terms: ['evidence_at_quality_tier', 'histogram_metric_subclass', 'soc2_confidentiality_subclass']
model: engine-refine
---

In a SOC 2–aligned evidence and configuration model, every governed object is first made addressable through a stable identifier. Identifiers such as TIER-0001 through TIER-0004, METR-0001 through METR-0004, and CONF-0001 through CONF-0004 function as durable keys across ingestion, review, and audit: they do not merely label rows but anchor cross-table joins, lineage, and control attestations. An entity extends that addressability to the thing being described—here, evidence quality tiers keyed as TIER-0001, TIER-0002, and so on—so that heterogeneous facts (confidence scores, dimension labels, timestamps) can attach to a single logical record without collapsing distinct evidence types into one undifferentiated blob. The practical consequence is traceability: when an auditor asks why network packets at TIER-0001 carry a qualified designation while inspection photos at TIER-0004 carry accredited status, the entity identifier is the pivot that binds descriptive metadata, typed values, and downstream control mappings into one defensible narrative.

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | network packets | qualified |
| TIER-0002 | audit trails | silver-tier |
| TIER-0003 | network packets | gold-tier |
| TIER-0004 | inspection photos | accredited |
| TIER-0005 | telemetry streams | platinum-tier |
| TIER-0006 | field measurements | certified |
| TIER-0007 | device firmware | archival |
| TIER-0008 | audit trails | validated |

Attributes and attribute types supply the vocabulary and typing discipline through which entities acquire measurable, reviewable properties. Attribute definitions—confidence, dimension_kind, method, recorded_at—are paired with attr_type declarations (xsd:decimal, xsd:string, xsd:dateTime) so that values land in the correct semantic channel rather than in a single overloaded text field. Confidence on TIER-0001 is stored as 0.731 under decimal typing, while recorded_at for the same tier resolves to 2024-11-19T18:15:43 in the datetime channel; dimension_kind appears as “Dimension Kind 01” under varchar typing. This separation matters in operations because validation rules, aggregation, and alerting follow type: decimals support thresholds and statistical rollups, datetimes support freshness and retention logic, and strings carry categorical or procedural labels such as “Encoding 02” or a change rationale. Misc, in this corpus, is the catch-all value or label slot—metric_kind_label, for_s_o_c2_domain_label, or the literal contents of a varchar value—that carries human-readable or domain-specific text without forcing premature normalization; it is evidence of meaning, not merely a schema artifact.

Category complements identifier and entity by grouping records into reviewable families without erasing individual keys. Metric kinds distribute across Metric Kind Category 01 through Metric Kind Category 04, while SOC 2 configuration domains align to For S O C2 Domain Category 01 through For S O C2 Domain Category 04. Category is what lets governance scale: dashboards, policy packs, and sampling plans can target a class—say, all configurations mapped to a given for_s_o_c2_domain_key—while still preserving row-level specificity. The for_s_o_c2_domain dimension itself names the SOC 2 scope to which a configuration fact applies; facts reference keys such as CONF-0002, CONF-0003, and CONF-0005, tying operational controls to labeled domains (For S O C2 Domain Label 01 through Label 04) and their categorical placement. In practice, an assessor reads category as the control taxonomy, for_s_o_c2_domain as the trust-services boundary, and identifier as the exact control instance under examination.

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

**dim_for_s_o_c2_domain**

| id | for_s_o_c2_domain_label | for_s_o_c2_domain_category |
| --- | --- | --- |
| CONF-0001 | For S O C2 Domain Label 01 | For S O C2 Domain Category 01 |
| CONF-0002 | For S O C2 Domain Label 02 | For S O C2 Domain Category 02 |
| CONF-0003 | For S O C2 Domain Label 03 | For S O C2 Domain Category 03 |
| CONF-0004 | For S O C2 Domain Label 04 | For S O C2 Domain Category 04 |
| CONF-0005 | For S O C2 Domain Label 05 | For S O C2 Domain Category 05 |
| CONF-0006 | For S O C2 Domain Label 06 | For S O C2 Domain Category 06 |

Metric kind, size_bytes, and version describe the quantitative footprint and evolution of telemetry artifacts that often substantiate control effectiveness. Histogram facts associate METR-0001 through METR-0004 with metric_kind_key references (including repeated METR-0005 and METR-0003), recording artifact bulk in size_bytes—239999637, 652318299, 823666310, and 194252236—and generational state in version (3, 9, 5, and 3). Size_bytes signals storage, transfer, and retention cost as well as evidentiary richness: a histogram nearing 824 million bytes is not interchangeable with one at 194 million bytes when proving completeness of monitoring coverage. Version encodes change over time—version 9 on one histogram versus version 3 on another implies divergent refresh or recomputation histories—so that compliance reviewers can distinguish stale analytics from current baselines. Metric_kind_label and metric_kind_category then translate those keys into operator-facing language, closing the loop between raw telemetry products and the control narratives they support.

Priority and review_cycle_days operationalize how SOC 2 configuration facts enter the governance calendar. Priorities on CONF-0001 through CONF-0004 range from 1 to 5, with CONF-0003 at priority 1 indicating the most urgent attention and CONF-0004 at priority 5 deferring relative immediacy; review_cycle_days assign concrete cadence—494, 767, 890, and 372 days—so that each for_s_o_c2_domain linkage carries an explicit re-attestation horizon rather than an open-ended “periodic” promise. Together, priority and review cycle convert abstract domain membership into workload: a lower-priority control with a 890-day cycle may tolerate longer evidence drift, whereas a priority-1 mapping demands earlier revalidation even if its calendar span is long. Operators use these fields to sequence audits, automate reminders, and justify resource allocation when multiple domains—CONF-0002, CONF-0003, CONF-0005—compete for the same review window.

Taken as a whole, the evidence tiering pattern—network packets qualified at TIER-0001, audit trails at silver-tier TIER-0002, network packets again at gold-tier TIER-0003, inspection photos accredited at TIER-0004—shows how identifier, entity, attr, attr_type, and misc interoperate under SOC 2 scrutiny. Typed values (0.358 confidence on TIER-0002, timestamps spanning 2023-02-10 through 2024-11-19, affirmative varchar markers such as “ja”) become admissible only when bound to the correct entity and attribute contract; categories and for_s_o_c2_domain labels place those artifacts inside control families; metric_kind histograms with version and size_bytes quantify the monitoring substrate; and priority with review_cycle_days schedules the human proof that the system still matches its claims. The domain is therefore not a flat dictionary of field names but a composable compliance grammar: keys identify, entities embody, types constrain, categories organize, domains scope, metrics measure, and review metadata governs time—each element necessary so that evidence quality tiers and SOC 2 configurations remain simultaneously machine-checkable and auditor-legible.

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

**fact_soc**

| id | for_s_o_c2_domain_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0002 | 3 | 494 |
| CONF-0002 | CONF-0005 | 2 | 767 |
| CONF-0003 | CONF-0003 | 1 | 890 |
| CONF-0004 | CONF-0005 | 5 | 372 |