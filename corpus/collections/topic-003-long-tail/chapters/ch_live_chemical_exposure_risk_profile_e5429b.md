---
chapter_id: ch_live_chemical_exposure_risk_profile_e5429b
topic_id: 3
family: 08_derived
cited_terms: ['chemical_exposure_risk_profile', 'agent_identified_by_uri', 'aggregation_aggregates_measurement']
model: engine-refine
---

Chemical exposure risk profiles constitute the primary classification mechanism for quantifying occupational and environmental hazards, linking specific toxic industrial chemicals to measurable human health outcomes. A profile such as PROF-0001 characterizes pulmonary edema resulting from soil deposition exposure, with the resultant impact manifesting as a vapor cloud event, while PROF-0002 addresses waterborne route transmission of sulfur mustard, estimating dermal contact as the principal exposure pathway. The profile PROF-0003 documents dermatological burns from dermal contact scenarios, and PROF-0004 captures hydrogen sulfide exposure with hepatic toxicity as the assessed chemical agent and renal dysfunction as the estimated health outcome. Each profile record carries an encoding designation—unicode, ascii, utf8, or latin1—and a language tag (en, es, de) that governs how the profile metadata is serialized and interpreted across multilingual regulatory jurisdictions. This dual metadata layer ensures that risk assessments remain machine-parseable while preserving the linguistic context required for compliance documentation in regions such as Spanish-speaking industrial zones or German-language regulatory frameworks.

**t_chemical_exposure_risk_profile**

| id | chemical_exposure_risk_profile | assesses_exposure_to | estimates_impact_on | encoding | language |
| --- | --- | --- | --- | --- | --- |
| PROF-0001 | PulmonaryEdema | SoilDeposition | VaporCloud | unicode | en |
| PROF-0002 | WaterborneRoute | SulfurMustard | DermalContact | ascii | es |
| PROF-0003 | DermatologicalBurns | DermalContact | RenalDysfunction | utf8 | de |
| PROF-0004 | HydrogenSulfide | HepaticToxicity | DermalContact | latin1 | es |
| PROF-0005 | Ammonia | IngestionPathway | RespiratoryFailure | ascii | en |

The governance of these risk profiles is anchored in a URI-based agent identification system that assigns persistent, resolvable identifiers to the entities responsible for data provenance. Agents such as weather-station-alpha and compliance-audit-bot are each mapped to canonical URIs—ark:/13030/n8yy3r for the former, and urn:isbn:978316148 for the latter—with supplementary local identifiers (ref-8842, ARN:res/41, urn:uuid:9f2a) enabling cross-referencing within internal systems. Ownership is explicitly declared: the data-engineering team retains stewardship over weather-station-alpha, while the ml-infra team owns compliance-audit-bot, genomics-lab-director, and edge-device-gateway. This ownership model establishes clear accountability chains for risk profile data, ensuring that any query regarding the provenance of a chemical exposure assessment can be traced to a specific agent and its responsible organizational unit.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |

Aggregated measurement data forms the quantitative backbone of exposure risk assessment, with each fact record capturing a measured value alongside its confidence and uncertainty metrics. A measurement such as MEAS-0001 records a value of 835.01 with a confidence of 0.857 and an uncertainty of 811.48, indicating a relatively reliable observation. By contrast, MEAS-0004 presents a value of 996.14 but carries a confidence of only 0.024 and an uncertainty of 527.80, signaling a measurement of negligible reliability that nonetheless must be retained for audit completeness. The aggregates_key column establishes self-referential aggregation hierarchies—MEAS-0003 aggregates into MEAS-0003 itself, while MEAS-0004 and MEAS-0006 feed into their respective parent aggregates—enabling roll-up computations across nested measurement tiers.

**fact_aggregation**

| id | aggregates_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0003 | 0.857 | 811.48 | 835.01 |
| MEAS-0002 | MEAS-0004 | 0.688 | 850.83 | 952.80 |
| MEAS-0003 | MEAS-0006 | 0.639 | 844.56 | 52.67 |
| MEAS-0004 | MEAS-0003 | 0.024 | 527.80 | 996.14 |
| MEAS-0005 | MEAS-0004 | 0.062 | 315.40 | 941.21 |

The dimensional structure supporting these aggregates is organized through a category taxonomy that provides semantic grouping for measurement records. The dimension table dim_aggregates assigns each aggregate a human-readable label (Aggregates Label 01 through 04) and a category reference (Aggregates Category 01 through 04), with the category_id column pointing to the canonical category definition. The category dimension itself enumerates four distinct categories (Category Name 01 through Category Name 04), each serving as a classification bucket for aggregating measurements by their underlying hazard type or exposure modality. This two-tier categorization—labels for display and category_ids for relational integrity—allows reporting systems to present risk data in domain-appropriate groupings while preserving the referential consistency required for cross-table joins and analytical roll-ups.

**dim_aggregates_category**

| id | category_name |
| --- | --- |
| MEAS-0001 | Category Name 01 |
| MEAS-0002 | Category Name 02 |
| MEAS-0003 | Category Name 03 |
| MEAS-0004 | Category Name 04 |
| MEAS-0005 | Category Name 05 |
| MEAS-0006 | Category Name 06 |

**dim_aggregates**

| id | aggregates_label | aggregates_category | category_id |
| --- | --- | --- | --- |
| MEAS-0001 | Aggregates Label 01 | Aggregates Category 01 | MEAS-0002 |
| MEAS-0002 | Aggregates Label 02 | Aggregates Category 02 | MEAS-0003 |
| MEAS-0003 | Aggregates Label 03 | Aggregates Category 03 | MEAS-0003 |
| MEAS-0004 | Aggregates Label 04 | Aggregates Category 04 | MEAS-0005 |
| MEAS-0005 | Aggregates Label 05 | Aggregates Category 05 | MEAS-0001 |
| MEAS-0006 | Aggregates Label 06 | Aggregates Category 06 | MEAS-0001 |
| MEAS-0007 | Aggregates Label 07 | Aggregates Category 07 | MEAS-0003 |