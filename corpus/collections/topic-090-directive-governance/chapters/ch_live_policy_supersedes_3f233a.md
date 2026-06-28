---
chapter_id: ch_live_policy_supersedes_3f233a
topic_id: 90
family: 03_directive_governance
cited_terms: ['policy_supersedes', 'crop_parasitism_impact', 'dempster_combines_audit_evidences']
model: engine-refine
---

Institutional policy governance relies on precise supersession tracking to maintain regulatory continuity across evolving compliance frameworks. Each directive is assigned a unique identifier, such as SUPE-0001 or SUPE-0004, which anchors a hierarchical chain linking current mandates to their predecessor documents, including Legacy Vendor Checklist or Draft Audit Logging variants. The operational cadence of these directives is governed by a reviewcycledays parameter, where intervals range from 131 days for incident response protocols to 716 days for data residency rules, ensuring that obsolescence is systematically flagged before enforcement gaps emerge. Localization is uniformly applied across these records, with the language designation es standardizing documentation for regional administrative units, thereby eliminating translation latency during audit cycles and cross-jurisdictional compliance reviews.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Privacy Impact Assessment | Legacy Vendor Checklist | 262 | es |
| SUPE-0002 | Incident Response Protocol | Legacy Data Handling | 131 | es |
| SUPE-0003 | Data Residency Rule | Legacy Vendor Checklist | 716 | es |
| SUPE-0004 | Incident Response Protocol | Draft Audit Logging | 336 | es |

Agricultural risk assessment models cropparasitismimpact as a multidimensional construct that propagates through ecological and socioeconomic networks. The core impact entity, designated by identifiers like IMPA-0001 through IMPA-0004, serves as the central node linking biological host interactions to cultivation practices and household-level outcomes. Parasitic weed associations are explicitly cataloged under parasiticweed host designations such as Parasitises Host 01, establishing trophic dependencies that dictate management interventions. These biological pressures directly intersect with ricecultivationsystem classifications, where impact records map to specific agronomic regimes like Affects Cultivation System 01, enabling precision targeting of resistant cultivars and irrigation adjustments. The relational architecture ensures that ecological stressors are not treated in isolation but are contextualized within the operational realities of field management.

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

**t_crop_parasitism_impact_affects_cultivation_system**

| id | affects_cultivation_system |
| --- | --- |
| IMPA-0001 | Affects Cultivation System 01 |
| IMPA-0002 | Affects Cultivation System 02 |
| IMPA-0003 | Affects Cultivation System 03 |
| IMPA-0004 | Affects Cultivation System 04 |
| IMPA-0005 | Affects Cultivation System 05 |
| IMPA-0006 | Affects Cultivation System 06 |
| IMPA-0007 | Affects Cultivation System 07 |
| IMPA-0008 | Affects Cultivation System 08 |

**t_crop_parasitism_impact__affects_cultivation_system**

| id | crop_id | affects_cultivation_system_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0006 | owner |
| IMPA-0002 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0003 | IMPA-0002 | IMPA-0002 | owner |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0005 | IMPA-0001 | IMPA-0001 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0007 | contributor |
| IMPA-0007 | IMPA-0002 | IMPA-0003 | observer |
| IMPA-0008 | IMPA-0002 | IMPA-0003 | reviewer |

**t_crop_parasitism_impact_parasitises_host**

| id | parasitises_host |
| --- | --- |
| IMPA-0001 | Parasitises Host 01 |
| IMPA-0002 | Parasitises Host 02 |
| IMPA-0003 | Parasitises Host 03 |
| IMPA-0004 | Parasitises Host 04 |
| IMPA-0005 | Parasitises Host 05 |
| IMPA-0006 | Parasitises Host 06 |
| IMPA-0007 | Parasitises Host 07 |

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

The semantic precision of these ecological linkages is enforced through associative junction tables that encode relationship topology, ownership semantics, and temporal onset. Each connection between a crop parasitism impact record and its target—whether a parasitic weed host or an agriculturalhousehold—is mediated by a role designation such as contributor, observer, reviewer, or owner, which clarifies institutional responsibility and data provenance. Cardinality constraints are explicitly documented through cardinality note fields (e.g., Cardinality Note 01 through Cardinality Note 04), preventing ambiguous many-to-many proliferation and preserving the integrity of impact propagation paths. Temporal validity is anchored by since dates, with relationship activations recorded as early as 2023-03-28 and extending through 2024-06-04, allowing longitudinal tracking of infestation patterns and household vulnerability shifts across growing seasons.

**t_crop_parasitism_impact__parasitises_host**

| id | crop_id | parasitises_host_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0004 | IMPA-0003 | contributor | Cardinality Note 01 |
| IMPA-0002 | IMPA-0006 | IMPA-0001 | observer | Cardinality Note 02 |
| IMPA-0003 | IMPA-0005 | IMPA-0004 | contributor | Cardinality Note 03 |
| IMPA-0004 | IMPA-0001 | IMPA-0007 | observer | Cardinality Note 04 |
| IMPA-0005 | IMPA-0001 | IMPA-0003 | reviewer | Cardinality Note 05 |
| IMPA-0006 | IMPA-0006 | IMPA-0002 | contributor | Cardinality Note 06 |
| IMPA-0007 | IMPA-0004 | IMPA-0005 | observer | Cardinality Note 07 |
| IMPA-0008 | IMPA-0004 | IMPA-0002 | reviewer | Cardinality Note 08 |

**t_crop_parasitism_impact__impacts_target**

| id | crop_id | impacts_target_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 01 | 2024-06-04 |
| IMPA-0002 | IMPA-0006 | IMPA-0004 | reviewer | Cardinality Note 02 | 2023-03-28 |
| IMPA-0003 | IMPA-0003 | IMPA-0002 | observer | Cardinality Note 03 | 2023-09-02 |
| IMPA-0004 | IMPA-0003 | IMPA-0002 | owner | Cardinality Note 04 | 2023-10-26 |
| IMPA-0005 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 05 | 2023-11-01 |
| IMPA-0006 | IMPA-0002 | IMPA-0001 | observer | Cardinality Note 06 | 2023-08-27 |
| IMPA-0007 | IMPA-0001 | IMPA-0005 | contributor | Cardinality Note 07 | 2025-05-05 |
| IMPA-0008 | IMPA-0003 | IMPA-0001 | contributor | Cardinality Note 08 | 2024-10-30 |

Quantitative validation of these ecological and administrative models depends on a Dempster-Shafer evidence framework that separates belief assignment from probabilistic certainty. Each evidentiary record, keyed by identifiers such as EVID-0001, carries a confidence coefficient that ranges from 0.014 for low-certainty field observations to 0.728 for high-confidence laboratory measurements, directly modulating the weight applied to downstream risk calculations. Uncertainty bounds are explicitly quantified alongside these coefficients, with variance values spanning from 9.49 for tightly controlled assays to 687.80 for highly variable environmental readings, ensuring that decision thresholds account for measurement noise. The underlying evidence is categorized under Dempster category classifications (e.g., Dempster Category 01 through Dempster Category 04) and paired with misc value fields ranging from 137.18 to 846.10, providing a structured taxonomy for aggregating heterogeneous data sources into unified compliance and agronomic decision matrices.

**fact_dempster**

| id | dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVID-0001 | EVID-0007 | 0.153 | 9.49 | 520.46 |
| EVID-0002 | EVID-0003 | 0.014 | 392.06 | 137.18 |
| EVID-0003 | EVID-0004 | 0.025 | 687.80 | 197.61 |
| EVID-0004 | EVID-0007 | 0.728 | 479.57 | 846.10 |
| EVID-0005 | EVID-0005 | 0.918 | 172.36 | 296.96 |
| EVID-0006 | EVID-0006 | 0.755 | 608.06 | 341.51 |

**dim_dempster**

| id | dempster_label | dempster_category |
| --- | --- | --- |
| EVID-0001 | Dempster Label 01 | Dempster Category 01 |
| EVID-0002 | Dempster Label 02 | Dempster Category 02 |
| EVID-0003 | Dempster Label 03 | Dempster Category 03 |
| EVID-0004 | Dempster Label 04 | Dempster Category 04 |
| EVID-0005 | Dempster Label 05 | Dempster Category 05 |
| EVID-0006 | Dempster Label 06 | Dempster Category 06 |
| EVID-0007 | Dempster Label 07 | Dempster Category 07 |
| EVID-0008 | Dempster Label 08 | Dempster Category 08 |