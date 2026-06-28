---
chapter_id: ch_live_ice_subclass_with_part_eaaea7
topic_id: 4
family: 01_foundation
cited_terms: ['ice_subclass_with_part', 'measurement_aggregated_into', 'indoor_air_quality_action_plan']
model: engine-refine
---

Indoor air quality governance rests on the ability to name things unambiguously, classify them consistently, and trace how raw observations become defensible conclusions. Stable identifiers such as PART-0001 through PART-0004 anchor that traceability across heterogeneous artifacts—from sensor calibration records and observatory metadata to event stream formats and model feature catalogs—so that a calibration record referenced in one system is the same object referenced in audit, enforcement, and reporting workflows. Human-readable label text complements those keys: where PART-0003 is tied to a calibration record and PART-0004 to a nightly summary, operators can navigate operational reality without memorizing opaque codes, while machines retain joinable, immutable references. Encoding choices matter at this boundary because interoperability fails silently when text is misinterpreted; ascii suffices for constrained intake forms and pre-release notes, whereas unicode is required when observatory metadata or calibration narratives carry characters outside the ASCII repertoire. Treating encoding as a first-class property of each subclass prevents downstream normalization errors that would otherwise corrupt labels, timestamps, and pollutant names in cross-system exchanges.

**t_ice_subclass_with_part**

| id | ice | encoding | label_text |
| --- | --- | --- | --- |
| PART-0001 | sensor_calibration_record | ascii | intake form |
| PART-0002 | observatory_metadata | unicode | pre-release note |
| PART-0003 | event_stream_format | unicode | calibration record |
| PART-0004 | model_feature_catalog | ascii | nightly summary |
| PART-0005 | compliance_audit_report | utf8 | pre-release note |
| PART-0006 | customer_transaction_log | latin1 | audit excerpt |

Measurement programs generate facts that rarely stand alone. Each observation carries a confidence score and an uncertainty band that together express how much weight a decision-maker should assign it. A reading with confidence 0.945 and uncertainty near 279 units warrants different treatment than one at 0.307 with uncertainty exceeding 364—particularly when values themselves span orders of magnitude, from roughly 64 to nearly 879 in the same aggregation family. The aggregated_into relationship models this roll-up explicitly: multiple fact rows may point to the same parent key, as when two measurements both aggregate into INTO-0005, while others chain through intermediate nodes such as INTO-0004 before reaching a higher-level summary at INTO-0006. Category labels on the aggregation dimension—Aggregated Into Category 01 through 04—give policy owners a vocabulary for grouping roll-ups by reporting obligation, exposure pathway, or intervention type without collapsing distinct measurement lineages. In practice, auditors expect to walk from a disputed aggregate back to contributing facts, inspect confidence at each hop, and confirm that category assignment was intentional rather than a default import artifact.

**fact_measurement**

| id | aggregated_into_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| INTO-0001 | INTO-0005 | 0.496 | 306.26 | 353.34 |
| INTO-0002 | INTO-0005 | 0.945 | 279.24 | 660.64 |
| INTO-0003 | INTO-0004 | 0.506 | 120.70 | 878.99 |
| INTO-0004 | INTO-0006 | 0.307 | 364.07 | 64.10 |
| INTO-0005 | INTO-0006 | 0.923 | 642.96 | 897.70 |

**dim_aggregated_into**

| id | aggregated_into_label | aggregated_into_category |
| --- | --- | --- |
| INTO-0001 | Aggregated Into Label 01 | Aggregated Into Category 01 |
| INTO-0002 | Aggregated Into Label 02 | Aggregated Into Category 02 |
| INTO-0003 | Aggregated Into Label 03 | Aggregated Into Category 03 |
| INTO-0004 | Aggregated Into Label 04 | Aggregated Into Category 04 |
| INTO-0005 | Aggregated Into Label 05 | Aggregated Into Category 05 |
| INTO-0006 | Aggregated Into Label 06 | Aggregated Into Category 06 |

Indoor air quality action plans translate that measurement architecture into enforceable operational intent. A plan such as the HVAC Filter Upgrade Protocol or Dust Suppression Procedure is not merely prose; it is a governed entity that names a targeted indoor air pollution agent—carbon monoxide, asbestos fibers, particulate matter 2.5, or nitrogen dioxide—and declares how success will be verified through a health outcome metric like respiratory infection incidence or asthma symptom frequency. That tripartite linkage matters because compliance is demonstrated at the intersection of exposure control and population health signal, not by filter invoices alone. When two plans share the same protocol name but target different pollutants and verification metrics, identifier discipline prevents them from being merged in dashboards or incorrectly treated as duplicate policy. Health outcome metrics function as the evidentiary bridge between engineering interventions and outcomes regulators care about; without them, action plans devolve into maintenance checklists detached from the harm they are meant to reduce.

**t_indoor_air_quality_action_plan**

| id | indoor_air_quality_action_plan | targets_pollution | verified_by_metric |
| --- | --- | --- | --- |
| PLAN-0001 | HVAC Filter Upgrade Protocol | Carbon Monoxide | Respiratory Infection Incidence |
| PLAN-0002 | HVAC Filter Upgrade Protocol | Asbestos Fibers | Asthma Symptom Frequency |
| PLAN-0003 | Dust Suppression Procedure | Particulate Matter 2.5 | Respiratory Infection Incidence |
| PLAN-0004 | Air Purifier Deployment Plan | Nitrogen Dioxide | Asthma Symptom Frequency |
| PLAN-0005 | HVAC Filter Upgrade Protocol | Particulate Matter 2.5 | FEV1 Improvement Rate |
| PLAN-0006 | Mold Remediation Directive | Formaldehyde | Pulmonary Function Test Delta |
| PLAN-0007 | CO2 Ventilation Schedule | Radon Gas | Sleep Quality Score |

**t_indoor_air_quality_action_plan_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0003 | false |
| PLAN-0002 | PLAN-0002 | PLAN-0003 | false |
| PLAN-0003 | PLAN-0003 | PLAN-0003 | true |
| PLAN-0004 | PLAN-0004 | PLAN-0003 | false |
| PLAN-0005 | PLAN-0005 | PLAN-0003 | true |
| PLAN-0006 | PLAN-0006 | PLAN-0003 | false |
| PLAN-0007 | PLAN-0007 | PLAN-0003 | true |

**t_indoor_air_quality_action_plan_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0004 | 5 |
| PLAN-0002 | PLAN-0001 | PLAN-0005 | 345 |
| PLAN-0003 | PLAN-0002 | PLAN-0004 | 4 |
| PLAN-0004 | PLAN-0002 | PLAN-0005 | 346 |
| PLAN-0005 | PLAN-0003 | PLAN-0004 | 3 |
| PLAN-0006 | PLAN-0003 | PLAN-0005 | 243 |
| PLAN-0007 | PLAN-0004 | PLAN-0004 | 1 |
| PLAN-0008 | PLAN-0004 | PLAN-0005 | 453 |

**t_indoor_air_quality_action_plan_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0007 | Encoding 01 |
| PLAN-0002 | PLAN-0001 | PLAN-0002 | Enforcement 02 |
| PLAN-0003 | PLAN-0001 | PLAN-0008 | audit excerpt |
| PLAN-0004 | PLAN-0001 | PLAN-0009 | en |
| PLAN-0005 | PLAN-0001 | PLAN-0006 | Scope 05 |
| PLAN-0006 | PLAN-0002 | PLAN-0007 | Encoding 06 |
| PLAN-0007 | PLAN-0002 | PLAN-0002 | Enforcement 07 |
| PLAN-0008 | PLAN-0002 | PLAN-0008 | audit excerpt |

Flexible attribute modeling allows each plan entity to carry typed metadata without forcing a wide, sparse table for every possible property. Attributes are declared once with a name and an attr_type—effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, priority as xsd:integer—and values are stored in type-appropriate stores keyed by entity and attr. A single plan may therefore record that it became effective on 2024-08-22, carries priority 5, and is not mandatory, while another effective 2025-02-08 may be mandatory with priority 4. Boolean enforcement of the mandatory flag appears uniformly across plans when attr_id PLAN-0003 is queried, revealing that only the dust suppression procedure is marked mandatory—a distinction material to inspection scheduling and escalation paths. Integer-valued attributes support ordinal prioritization across a portfolio of interventions, so planners can rank an air purifier deployment plan against filter upgrades when resources are constrained. String-valued enforcement metadata and short audit excerpts preserve qualitative accountability text that does not fit neatly into scalar types but must remain attributable to the same entity identifier.

Taken together, these constructs implement a compliance handbook’s core promise: every claim is anchored, every aggregation is explainable, and every intervention is typed, dated, and verifiable. Identifiers knit subclass registries, fact lineages, and plan registries into one auditable graph. Confidence and uncertainty discipline how aggregates may be cited in enforcement narratives. Categories and label text keep human governance aligned with machine joins. Indoor air pollution targets and health outcome metrics ensure that action plans remain outcome-oriented rather than equipment-oriented. Entity-attribute-value separation keeps policy metadata evolvable as new reporting fields emerge—new xsd types, new enforcement vocabularies—without rewriting historical records. Organizations that operationalize this pattern can answer, with evidence rather than assertion, which plan was in force on a given date, which pollutant it addressed, which metric proved efficacy, which raw measurements fed the summary a regulator questioned, and how strongly each link in that chain should be trusted.

**t_indoor_air_quality_action_plan_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PLAN-0001 | effective_date | xsd:date |
| PLAN-0002 | enforcement | xsd:string |
| PLAN-0003 | mandatory | xsd:boolean |
| PLAN-0004 | priority | xsd:integer |
| PLAN-0005 | review_cycle_days | xsd:integer |
| PLAN-0006 | scope | xsd:string |
| PLAN-0007 | encoding | xsd:string |
| PLAN-0008 | label_text | xsd:string |

**t_indoor_air_quality_action_plan_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PLAN-0001 | PLAN-0001 | PLAN-0001 | 2024-08-22 |
| PLAN-0002 | PLAN-0002 | PLAN-0001 | 2025-02-08 |
| PLAN-0003 | PLAN-0003 | PLAN-0001 | 2024-12-25 |
| PLAN-0004 | PLAN-0004 | PLAN-0001 | 2025-01-11 |
| PLAN-0005 | PLAN-0005 | PLAN-0001 | 2023-11-11 |
| PLAN-0006 | PLAN-0006 | PLAN-0001 | 2024-01-21 |
| PLAN-0007 | PLAN-0007 | PLAN-0001 | 2024-08-19 |