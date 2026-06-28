---
chapter_id: ch_live_indoor_air_quality_action_plan_fa168d
topic_id: 4
family: 08_derived
cited_terms: ['indoor_air_quality_action_plan', 'labrun_observed_at_site', 'labrun_subclass']
model: engine-refine
---

Indoor air quality management and laboratory operations both rely on a flexible attribute-value architecture that decouples entity definitions from their descriptive properties. At the core of this model, each entity—whether an action plan identified as PLAN-0001 or a laboratory run observed at SITE-0001—is described through a set of named attributes whose types are declared independently. Attribute definitions, such as effective_date typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer, are stored in a central attribute registry. This separation allows the system to accommodate heterogeneous data without schema migrations: boolean flags like mandatory=true for the Dust Suppression Procedure (PLAN-0003) coexist alongside date values such as 2024-08-22 for the HVAC Filter Upgrade Protocol (PLAN-0001) and integer priorities like 5 or 345, all within the same structural framework.

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

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | FIELD-STATION-9 |
| SITE-0002 | RUN-2023-A4 | CLEAN-ROOM-A |
| SITE-0003 | WET-LAB-44 | SECURE-VAULT-3 |
| SITE-0004 | PLATE-A12 | BUILDING-C |
| SITE-0005 | BATCH-8812 | LAB-WING-D |
| SITE-0006 | NEXTRA-GEN-03 | BENCH-12 |
| SITE-0007 | BATCH-8812 | CORE-FACILITY |

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

Indoor air quality action plans represent the operational instruments through which organizations address specific contaminants. Each plan targets a defined pollution source—Carbon Monoxide, Asbestos Fibers, Particulate Matter 2.5, or Nitrogen Dioxide—and is validated against a health outcome metric, typically Respiratory Infection Incidence or Asthma Symptom Frequency. The HVAC Filter Upgrade Protocol (PLAN-0001 and PLAN-0002) targets Carbon Monoxide and is verified by Respiratory Infection Incidence, while the Dust Suppression Procedure (PLAN-0003) addresses Particulate Matter 2.5 and uses the same health metric. The Air Purifier Deployment Plan (PLAN-0004) targets Nitrogen Dioxide and is validated through Asthma Symptom Frequency. Enforcement metadata, captured as varchar values such as "Enforcement 02" or "Encoding 01," and audit documentation like "audit excerpt" provide the traceability required for regulatory compliance.

Laboratory operations follow an analogous pattern, where experiments are tracked across physical locations and characterized by execution attributes. A lab run such as PCR-ALPHA occurs in FIELD-STATION-9, while RUN-2023-A4 takes place in CLEAN-ROOM-A, WET-LAB-44 in SECURE-VAULT-3, and PLATE-A12 in BUILDING-C. Each site observation carries typed attributes: duration_seconds as xsd:decimal (values ranging from 2622.63 to 5434.21 seconds), exit_code as xsd:integer (observed values include 263, 199, 302, and 29), host_name as xsd:string (such as "ingest-21"), and end_time as xsd:dateTime (for example, 2024-11-18T14:57:47). The exit_code and log-level varchar values—closeout, failed, pending—serve as operational status indicators that determine whether a run completed successfully or requires investigation.

Subclassification of laboratory runs adds another layer of provenance tracking. Experiments are categorized by their input samples: PlasmaCitrate-Lot4 feeds into CellCulture-Exp12, HumanSerum-A7 into FlowCyt-Panel9, RNAExtract-Brain into ELISA-Plate88, and PlantRoot-Extract into PCR-Run-Alpha7. These subclass records carry the same attribute structure as site observations, with decimal durations (7187.70, 5360.85, 3249.87, 649.77), integer exit codes (241, 320, 688, 479), host identifiers like node-b14, and status values including pending and closeout. The parallel attribute schema between site-level and subclass-level observations ensures consistent data collection regardless of the granularity at which an experiment is recorded.

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | PlasmaCitrate-Lot4 |
| LABR-0002 | FlowCyt-Panel9 | HumanSerum-A7 |
| LABR-0003 | ELISA-Plate88 | RNAExtract-Brain |
| LABR-0004 | PCR-Run-Alpha7 | PlantRoot-Extract |
| LABR-0005 | MassSpec-MS19 | DNAFragment-450bp |
| LABR-0006 | NMR-Stand-04A | RNAExtract-Brain |
| LABR-0007 | FlowCyt-Panel9 | DNAFragment-450bp |
| LABR-0008 | RNASeq-Lib15 | HumanSerum-A7 |

The identifier system provides the connective tissue across all entity types. Plan identifiers (PLAN-0001 through PLAN-0004) link action plans to their attributes, site identifiers (SITE-0001 through SITE-0004) anchor laboratory observations to their measured properties, and lab run subclass identifiers (LABR-0001 through LABR-0004) tie experimental records to their execution metadata. Each value column—whether storing boolean, date, integer, decimal, or varchar data—references its entity through a foreign key, ensuring that every attribute value can be traced back to the specific plan, site, or experiment it describes. This design supports auditability: a regulator can follow the chain from a health outcome metric like Respiratory Infection Incidence, through the action plan that targets it, to the enforcement and priority attributes that govern its implementation, without ambiguity or data loss.

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |