## The Architecture of Clinical Trial Management

Clinical trial management systems organize the complex logistics of medical research into structured records that track every intervention, site, outcome, and control mechanism across a study's lifecycle. At the center of this architecture sits the clinical trial itself—a bounded experiment with a unique identifier, a defined phase, and a set of measurable outcomes. Each trial is anchored to a start and end date, assigned a current status ranging from planning through completed, and allocated a sample size that determines its statistical power. The domain captures trials across all four regulatory phases, from early safety assessments in Phase 1 through post-marketing surveillance in Phase 4, ensuring that every stage of evidence generation is systematically documented.

**Table `clinical_trials`**

| clinical_trial_id | trial_identifier | title | start_date | end_date | status | phase | primary_outcome | sample_size | control_group_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | TRI-2078 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | Phase 1 | extended-primary-63 | 31 | 4060641 |
| 1001 | TRI-2080 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | recruiting | Phase 2 | integrated-primary-64 | 38 | IVC10I |
| 1002 | TRI-2082 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | active | Phase 3 | seasonal-primary-65 | 45 | 1250208 |
| 1003 | TRI-2084 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | completed | Phase 4 | regional-primary-66 | 52 | 5006455 |

The trial records reveal a progression of study maturity. The Compact Initiative (TRI-2078) remains in planning with thirty-one participants and a Phase 1 designation, while the Legacy Model (TRI-2080) has begun recruiting thirty-eight subjects under Phase 2 protocols. The Regional Cluster A study, active with forty-five participants, represents a Phase 3 efficacy assessment, and the Seasonal Review trial has completed its Phase 4 evaluation of fifty-two subjects. Each trial carries a primary outcome identifier—extended-primary-63 through regional-primary-66—that serves as the anchor for subsequent outcome measure definitions. The control group linkage, visible in the control_group_id column, connects each trial to its designated comparison arm, establishing the foundation for controlled study design.

### Interventions and Dosing Regimens

Every clinical trial requires one or more interventions—specific treatments, dosages, or procedures administered to participants. The interventions table records the granular details of each treatment: a descriptive name, a numeric dosage value, the unit of measurement, the frequency schedule, the route of administration, and the trial to which it belongs. Timestamps for creation and last update provide an audit trail for protocol modifications.

**Table `interventions`**

| intervention_id | name | dosage | unit | frequency | route | clinical_trial_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | Extended Review | 7.20 | distributed-unit-18 | regional-frequenc-36 | baseline-route-19 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Pilot Initiative A | 11.40 | baseline-unit-19 | legacy-frequenc-37 | pilot-route-20 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Baseline Model | 15.60 | pilot-unit-20 | compact-frequenc-38 | extended-route-21 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Distributed Cluster | 19.80 | extended-unit-21 | composite-frequenc-39 | integrated-route-22 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The Extended Review intervention, assigned to trial 1000, specifies a dosage of 7.20 in distributed-unit-18 administered via baseline-route-19 on a regional-frequenc-36 schedule. Pilot Initiative A (trial 1001) calls for 11.40 units delivered through pilot-route-20 using legacy-frequenc-37 timing. The Baseline Model intervention for trial 1002 prescribes 15.60 units via extended-route-21 at compact-frequenc-38 intervals, while Distributed Cluster (trial 1003) requires 19.80 units through integrated-route-22 on a composite-frequenc-39 cadence. The dosage values increase across the trial sequence, reflecting the escalating intensity typical of progressive clinical phases.

### Control Groups and Comparator Interventions

Controlled trials require a comparison arm against which the primary intervention's effects are measured. The control_groups table defines these comparator arms, specifying the group type—placebo, standardCare, or noTreatment—the group size, the parent trial, and the control_intervention_id that links to the specific comparator treatment.

**Table `control_groups`**

| control_group_id | type | size | clinical_trial_id | control_intervention_id |
|---|---|---|---|---|
| 4060641 | placebo | 17 | 1000 | 1000 |
| IVC10I | standardCare | 21 | 1001 | 1001 |
| 1250208 | noTreatment | 25 | 1002 | 1002 |
| 5006455 | placebo | 29 | 1003 | 1003 |

Trial 1000 employs a placebo control group (4060641) with seventeen participants, linked to control intervention 1000. Trial 1001 uses a standardCare comparator (IVC10I) with twenty-one subjects and control intervention 1001. The noTreatment group (1250208) in trial 1002 contains twenty-five participants with control intervention 1002, while trial 1003's placebo group (5006455) comprises twenty-nine subjects with control intervention 1003. The control group sizes range from seventeen to twenty-nine, providing a meaningful comparison cohort relative to the primary trial sample sizes.

The control_interventions table details the specific treatments administered to control group members, mirroring the structure of the primary interventions table but scoped to the comparator context.

**Table `control_interventions`**

| control_intervention_id | name | dosage | unit | control_group_id |
|---|---|---|---|---|
| 1000 | Extended Review | 7.20 | distributed-unit-18 | 4060641 |
| 1001 | Pilot Initiative A | 11.40 | baseline-unit-19 | IVC10I |
| 1002 | Baseline Model | 15.60 | pilot-unit-20 | 1250208 |
| 1003 | Distributed Cluster | 19.80 | extended-unit-21 | 5006455 |

Notably, the control intervention names and dosages correspond directly to their parent trial's primary intervention—Extended Review at 7.20 units, Pilot Initiative A at 11.40 units, and so on—suggesting a double-blind design where control and treatment groups receive identically described interventions with different active compositions.

### Outcome Measures and Data Collection

The success of a clinical trial is determined by its outcome measures—specific, predefined endpoints that are measured at specified intervals throughout the study. Each outcome measure carries a unique identifier, a name, a type classification (primary, secondary, or exploratory), a unit of measurement, a collection method, and the trial to which it belongs.

**Table `outcome_measures`**

| id | measure_id | name | type | unit | collection_method | clinical_trial_id |
|---|---|---|---|---|---|---|
| 1 | invoice | Extended Review | primary | distributed-unit-18 | composite-collecti-81 | 1000 |
| 2 | 4180944 | Pilot Initiative A | secondary | baseline-unit-19 | primary-collecti-82 | 1001 |
| 3 | 6969441 | Baseline Model | exploratory | pilot-unit-20 | adaptive-collecti-83 | 1002 |
| 4 | 21280358 | Distributed Cluster | primary | extended-unit-21 | distributed-collecti-84 | 1003 |

The Extended Review outcome (invoice) is classified as primary and collected via composite-collecti-81 methodology in distributed-unit-18 units. Pilot Initiative A's outcome (4180944) is secondary, gathered through primary-collecti-82 procedures. The Baseline Model outcome (6969441) is exploratory, using adaptive-collecti-83 collection methods, while Distributed Cluster's outcome (21280358) is primary, measured via distributed-collecti-84. The diversity of collection methods—composite, primary, adaptive, and distributed—reflects the varying data acquisition strategies appropriate to different trial phases and outcome types.

### Clinical Sites and Geographic Distribution

Clinical trials are conducted across multiple research sites, each managed by a principal investigator and located at a specific address. The clinical_sites table records the site identifier, name, full address, city, state, country, and the responsible investigator.

**Table `clinical_sites`**

| id | site_id | name | address | city | state | country | principal_investigator |
|---|---|---|---|---|---|---|---|
| 1 | 102 | Extended Review | distributed-address-72 | integrated-city-34 | distributed-state-84 | compact-country-26 | compact-principa-80 |
| 2 | 1336166 | Pilot Initiative A | baseline-address-73 | seasonal-city-35 | baseline-state-85 | composite-country-27 | composite-principa-81 |
| 3 | 726040 | Baseline Model | pilot-address-74 | regional-city-36 | pilot-state-86 | primary-country-28 | primary-principa-82 |
| 4 | Bjornfant | Distributed Cluster | extended-address-75 | legacy-city-37 | extended-state-87 | adaptive-country-29 | adaptive-principa-83 |

Site 102, named Extended Review, is located in integrated-city-34 within distributed-state-84, under the direction of compact-principa-80. Site 1336166 (Pilot Initiative A) operates from seasonal-city-35 in baseline-state-84, led by composite-principa-81. Site 726040 (Baseline Model) is based in regional-city-36, pilot-state-86, with primary-principa-82 as investigator. Site Bjornfant (Distributed Cluster) functions from legacy-city-37 in extended-state-87, directed by adaptive-principa-83. The geographic spread across distinct administrative regions ensures broad demographic representation and regulatory compliance across jurisdictions.

### Relational Linkages

The domain employs junction tables to manage the many-to-many relationships between trials, interventions, outcome measures, and clinical sites. The trials_interventions table links trials to their associated interventions, enabling a single trial to reference multiple treatment protocols.

**Table `trials_interventions`**

| clinical_trial_id | intervention_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

Similarly, trials_measures establishes the relationship between trials and their outcome measures, allowing flexible assignment of primary, secondary, and exploratory endpoints to individual studies.

**Table `trials_measures`**

| clinical_trial_id | outcome_measure_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The trials_sites and sites_trials tables provide bidirectional linkage between trials and clinical sites, ensuring that each site can participate in multiple trials and each trial can be conducted across multiple locations.

**Table `trials_sites`**

| clinical_trial_id | clinical_site_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `sites_trials`**

| clinical_site_id | clinical_trial_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The sites_measures table further connects clinical sites to outcome measures, enabling granular tracking of which site is responsible for collecting which type of data.

**Table `sites_measures`**

| clinical_site_id | outcome_measure_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

### View-Based Perspectives

The domain provides a set of materialized views that join these base tables into coherent, query-ready perspectives. Each view answers a specific analytical question by assembling related records into a single result set.

The v_clinical_trial_intervention_detail view joins trial metadata with its associated interventions, answering which treatments are assigned to which trials and with what dosing parameters.

**View `v_clinical_trial_intervention_detail`**

```sql
CREATE VIEW v_clinical_trial_intervention_detail AS
SELECT a.clinical_trial_id, a.trial_identifier, a.title, b.intervention_id AS intervention_intervention_id, b.name AS intervention_name, b.dosage AS intervention_dosage
FROM clinical_trials a
  JOIN trials_interventions j ON j.clinical_trial_id = a.clinical_trial_id
  JOIN interventions b ON b.intervention_id = j.intervention_id;
```

| clinical_trial_id | trial_identifier | title | intervention_intervention_id | intervention_name | intervention_dosage |
|---|---|---|---|---|---|
| 1000 | TRI-2078 | Compact Initiative | 1000 | Extended Review | 7.20 |
| 1000 | TRI-2078 | Compact Initiative | 1001 | Pilot Initiative A | 11.40 |
| 1001 | TRI-2080 | Legacy Model | 1001 | Pilot Initiative A | 11.40 |
| 1001 | TRI-2080 | Legacy Model | 1002 | Baseline Model | 15.60 |
| 1002 | TRI-2082 | Regional Cluster A | 1002 | Baseline Model | 15.60 |
| 1002 | TRI-2082 | Regional Cluster A | 1003 | Distributed Cluster | 19.80 |
| 1003 | TRI-2084 | Seasonal Review | 1003 | Distributed Cluster | 19.80 |
| 1003 | TRI-2084 | Seasonal Review | 1000 | Extended Review | 7.20 |

Reading the first row of this view reveals that trial TRI-2078 (Compact Initiative) is associated with the Extended Review intervention at a dosage of 7.20 distributed-unit-18, administered via baseline-route-19 on a regional-frequenc-36 schedule. The second row shows TRI-2080 (Legacy Model) paired with Pilot Initiative A at 11.40 units through pilot-route-20, confirming the one-to-one mapping between trials and their primary interventions in this dataset.

The v_clinical_trial_control_group view combines trial information with its control group details, enabling researchers to compare primary and control arm configurations side by side.

**View `v_clinical_trial_control_group`**

```sql
CREATE VIEW v_clinical_trial_control_group AS
SELECT a.clinical_trial_id, a.trial_identifier, a.title, a.start_date, b.control_group_id AS group_control_group_id, b.type AS group_type, b.size AS group_size
FROM clinical_trials a JOIN control_groups b ON a.control_group_id = b.control_group_id;
```

| clinical_trial_id | trial_identifier | title | start_date | group_control_group_id | group_type | group_size |
|---|---|---|---|---|---|---|
| 1000 | TRI-2078 | Compact Initiative | 2022-09-05T20:24:00 | 4060641 | placebo | 17 |
| 1001 | TRI-2080 | Legacy Model | 2023-02-16T03:41:00 | IVC10I | standardCare | 21 |
| 1002 | TRI-2082 | Regional Cluster A | 2024-07-27T10:58:00 | 1250208 | noTreatment | 25 |
| 1003 | TRI-2084 | Seasonal Review | 2025-12-11T17:15:00 | 5006455 | placebo | 29 |

The first row demonstrates that trial TRI-2078 uses a placebo control group of seventeen participants (4060641), while the second row shows TRI-2080 employing a standardCare group of twenty-one participants (IVC10I). This view makes it straightforward to assess whether control group sizes are proportionally balanced across trials.

The v_clinical_trial_outcome_measure_detail view assembles trial records with their outcome measures, providing a complete picture of what each trial intends to measure and how.

**View `v_clinical_trial_outcome_measure_detail`**

```sql
CREATE VIEW v_clinical_trial_outcome_measure_detail AS
SELECT a.clinical_trial_id, a.trial_identifier, a.title, b.id AS measure_id, b.measure_id AS measure_measure_id, b.name AS measure_name
FROM clinical_trials a
  JOIN trials_measures j ON j.clinical_trial_id = a.clinical_trial_id
  JOIN outcome_measures b ON b.id = j.outcome_measure_id;
```

| clinical_trial_id | trial_identifier | title | measure_id | measure_measure_id | measure_name |
|---|---|---|---|---|---|
| 1000 | TRI-2078 | Compact Initiative | 1 | invoice | Extended Review |
| 1000 | TRI-2078 | Compact Initiative | 2 | 4180944 | Pilot Initiative A |
| 1001 | TRI-2080 | Legacy Model | 2 | 4180944 | Pilot Initiative A |
| 1001 | TRI-2080 | Legacy Model | 3 | 6969441 | Baseline Model |
| 1002 | TRI-2082 | Regional Cluster A | 3 | 6969441 | Baseline Model |
| 1002 | TRI-2082 | Regional Cluster A | 4 | 21280358 | Distributed Cluster |
| 1003 | TRI-2084 | Seasonal Review | 4 | 21280358 | Distributed Cluster |
| 1003 | TRI-2084 | Seasonal Review | 1 | invoice | Extended Review |

In the first row, TRI-2078's primary outcome is the Extended Review measure collected via composite-collecti-81 in distributed-unit-18 units. The second row shows TRI-2080 tracking the Pilot Initiative A outcome (type: secondary) through primary-collecti-82 methods, illustrating how primary and secondary endpoints are distinguished within the same analytical view.

The v_clinical_trial_clinical_site_detail view links trials to their conducting sites, answering which locations are responsible for which studies.

**View `v_clinical_trial_clinical_site_detail`**

```sql
CREATE VIEW v_clinical_trial_clinical_site_detail AS
SELECT a.clinical_trial_id, a.trial_identifier, a.title, b.id AS site_id, b.site_id AS site_site_id, b.name AS site_name
FROM clinical_trials a
  JOIN trials_sites j ON j.clinical_trial_id = a.clinical_trial_id
  JOIN clinical_sites b ON b.id = j.clinical_site_id;
```

| clinical_trial_id | trial_identifier | title | site_id | site_site_id | site_name |
|---|---|---|---|---|---|
| 1000 | TRI-2078 | Compact Initiative | 1 | 102 | Extended Review |
| 1000 | TRI-2078 | Compact Initiative | 2 | 1336166 | Pilot Initiative A |
| 1001 | TRI-2080 | Legacy Model | 2 | 1336166 | Pilot Initiative A |
| 1001 | TRI-2080 | Legacy Model | 3 | 726040 | Baseline Model |
| 1002 | TRI-2082 | Regional Cluster A | 3 | 726040 | Baseline Model |
| 1002 | TRI-2082 | Regional Cluster A | 4 | Bjornfant | Distributed Cluster |
| 1003 | TRI-2084 | Seasonal Review | 4 | Bjornfant | Distributed Cluster |
| 1003 | TRI-2084 | Seasonal Review | 1 | 102 | Extended Review |

The first row indicates that TRI-2078 is conducted at site 102 (Extended Review) in integrated-city-34 under investigator compact-principa-80. The second row shows TRI-2080 operating at site 1336166 (Pilot Initiative A) in seasonal-city-35, directed by composite-principa-81. This view supports operational coordination by making site-trial assignments immediately visible.

The v_intervention_clinical_trial view inverts the perspective, presenting interventions as the primary entity with their associated trial details attached.

**View `v_intervention_clinical_trial`**

```sql
CREATE VIEW v_intervention_clinical_trial AS
SELECT a.intervention_id, a.name, a.dosage, a.unit, b.clinical_trial_id AS trial_clinical_trial_id, b.trial_identifier AS trial_trial_identifier, b.title AS trial_title
FROM interventions a JOIN clinical_trials b ON a.clinical_trial_id = b.clinical_trial_id;
```

| intervention_id | name | dosage | unit | trial_clinical_trial_id | trial_trial_identifier | trial_title |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | 7.20 | distributed-unit-18 | 1000 | TRI-2078 | Compact Initiative |
| 1001 | Pilot Initiative A | 11.40 | baseline-unit-19 | 1001 | TRI-2080 | Legacy Model |
| 1002 | Baseline Model | 15.60 | pilot-unit-20 | 1002 | TRI-2082 | Regional Cluster A |
| 1003 | Distributed Cluster | 19.80 | extended-unit-21 | 1003 | TRI-2084 | Seasonal Review |

The first row shows the Extended Review intervention (dosage 7.20) belonging to trial TRI-2078, a Phase 1 study with thirty-one participants. The second row places Pilot Initiative A (11.40 units) within TRI-2080, a Phase 2 recruiting study of thirty-eight subjects, demonstrating how intervention-level queries can surface trial context.

The v_control_group_clinical_trial view presents control groups as the primary entity, enriched with their parent trial's metadata.

**View `v_control_group_clinical_trial`**

```sql
CREATE VIEW v_control_group_clinical_trial AS
SELECT a.control_group_id, a.type, a.size, a.control_intervention_id, b.clinical_trial_id AS trial_clinical_trial_id, b.trial_identifier AS trial_trial_identifier, b.title AS trial_title
FROM control_groups a JOIN clinical_trials b ON a.clinical_trial_id = b.clinical_trial_id;
```

| control_group_id | type | size | control_intervention_id | trial_clinical_trial_id | trial_trial_identifier | trial_title |
|---|---|---|---|---|---|---|
| 4060641 | placebo | 17 | 1000 | 1000 | TRI-2078 | Compact Initiative |
| IVC10I | standardCare | 21 | 1001 | 1001 | TRI-2080 | Legacy Model |
| 1250208 | noTreatment | 25 | 1002 | 1002 | TRI-2082 | Regional Cluster A |
| 5006455 | placebo | 29 | 1003 | 1003 | TRI-2084 | Seasonal Review |

The first row reveals that control group 4060641 (placebo, size 17) belongs to TRI-2078, a Phase 1 planning study. The second row shows control group IVC10I (standardCare, size 21) associated with TRI-2080, a Phase 2 recruiting trial, enabling control-arm-focused analysis.

The v_control_group_control_intervention view joins control groups with their specific comparator interventions, answering what treatment control group members receive.

**View `v_control_group_control_intervention`**

```sql
CREATE VIEW v_control_group_control_intervention AS
SELECT a.control_group_id, a.type, a.size, a.clinical_trial_id, b.control_intervention_id AS intervention_control_intervention_id, b.name AS intervention_name, b.dosage AS intervention_dosage
FROM control_groups a JOIN control_interventions b ON a.control_intervention_id = b.control_intervention_id;
```

| control_group_id | type | size | clinical_trial_id | intervention_control_intervention_id | intervention_name | intervention_dosage |
|---|---|---|---|---|---|---|
| 4060641 | placebo | 17 | 1000 | 1000 | Extended Review | 7.20 |
| IVC10I | standardCare | 21 | 1001 | 1001 | Pilot Initiative A | 11.40 |
| 1250208 | noTreatment | 25 | 1002 | 1002 | Baseline Model | 15.60 |
| 5006455 | placebo | 29 | 1003 | 1003 | Distributed Cluster | 19.80 |

The first row shows control group 4060641 receiving the Extended Review intervention at 7.20 units, while the second row indicates group IVC10I receives Pilot Initiative A at 11.40 units. This view is essential for verifying that control interventions are properly matched to their parent trials.

The v_control_intervention_control_group view reverses this relationship, presenting control interventions as the primary entity with their group context.

**View `v_control_intervention_control_group`**

```sql
CREATE VIEW v_control_intervention_control_group AS
SELECT a.control_intervention_id, a.name, a.dosage, a.unit, b.control_group_id AS group_control_group_id, b.type AS group_type, b.size AS group_size
FROM control_interventions a JOIN control_groups b ON a.control_group_id = b.control_group_id;
```

| control_intervention_id | name | dosage | unit | group_control_group_id | group_type | group_size |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | 7.20 | distributed-unit-18 | 4060641 | placebo | 17 |
| 1001 | Pilot Initiative A | 11.40 | baseline-unit-19 | IVC10I | standardCare | 21 |
| 1002 | Baseline Model | 15.60 | pilot-unit-20 | 1250208 | noTreatment | 25 |
| 1003 | Distributed Cluster | 19.80 | extended-unit-21 | 5006455 | placebo | 29 |

The first row shows the Extended Review control intervention (7.20 units) assigned to control group 4060641 (placebo, size 17) within trial TRI-2078. The second row places Pilot Initiative A (11.40 units) in group IVC10I (standardCare, size 21) for trial TRI-2080, providing an intervention-centric lens on control arm design.

The v_outcome_measure_clinical_trial view presents outcome measures as the primary entity, enriched with their trial context.

**View `v_outcome_measure_clinical_trial`**

```sql
CREATE VIEW v_outcome_measure_clinical_trial AS
SELECT a.id, a.measure_id, a.name, a.type, b.clinical_trial_id AS trial_clinical_trial_id, b.trial_identifier AS trial_trial_identifier, b.title AS trial_title
FROM outcome_measures a JOIN clinical_trials b ON a.clinical_trial_id = b.clinical_trial_id;
```

| id | measure_id | name | type | trial_clinical_trial_id | trial_trial_identifier | trial_title |
|---|---|---|---|---|---|---|
| 1 | invoice | Extended Review | primary | 1000 | TRI-2078 | Compact Initiative |
| 2 | 4180944 | Pilot Initiative A | secondary | 1001 | TRI-2080 | Legacy Model |
| 3 | 6969441 | Baseline Model | exploratory | 1002 | TRI-2082 | Regional Cluster A |
| 4 | 21280358 | Distributed Cluster | primary | 1003 | TRI-2084 | Seasonal Review |

The first row shows the Extended Review outcome (primary type, distributed-unit-18) belonging to TRI-2078, a Phase 1 planning study with thirty-one participants. The second row places the Pilot Initiative A outcome (secondary type) within TRI-2080, a Phase 2 recruiting trial, enabling outcome-focused queries that surface trial metadata.

The v_clinical_site_clinical_trial_detail view joins clinical sites with their associated trials, providing a site-centric operational view.

**View `v_clinical_site_clinical_trial_detail`**

```sql
CREATE VIEW v_clinical_site_clinical_trial_detail AS
SELECT a.id, a.site_id, a.name, b.clinical_trial_id AS trial_clinical_trial_id, b.trial_identifier AS trial_trial_identifier, b.title AS trial_title
FROM clinical_sites a
  JOIN sites_trials j ON j.clinical_site_id = a.id
  JOIN clinical_trials b ON b.clinical_trial_id = j.clinical_trial_id;
```

| id | site_id | name | trial_clinical_trial_id | trial_trial_identifier | trial_title |
|---|---|---|---|---|---|
| 1 | 102 | Extended Review | 1000 | TRI-2078 | Compact Initiative |
| 1 | 102 | Extended Review | 1001 | TRI-2080 | Legacy Model |
| 2 | 1336166 | Pilot Initiative A | 1001 | TRI-2080 | Legacy Model |
| 2 | 1336166 | Pilot Initiative A | 1002 | TRI-2082 | Regional Cluster A |
| 3 | 726040 | Baseline Model | 1002 | TRI-2082 | Regional Cluster A |
| 3 | 726040 | Baseline Model | 1003 | TRI-2084 | Seasonal Review |
| 4 | Bjornfant | Distributed Cluster | 1003 | TRI-2084 | Seasonal Review |
| 4 | Bjornfant | Distributed Cluster | 1000 | TRI-2078 | Compact Initiative |

The first row shows site 102 (Extended Review, integrated-city-34) conducting TRI-2078, a Phase 1 planning study. The second row places site 1336166 (Pilot Initiative A, seasonal-city-35) within TRI-2080, a Phase 2 recruiting trial, supporting site capacity planning and investigator workload assessment.

The v_clinical_site_outcome_measure_detail view connects clinical sites to outcome measures, answering which sites are responsible for collecting which types of data.

**View `v_clinical_site_outcome_measure_detail`**

```sql
CREATE VIEW v_clinical_site_outcome_measure_detail AS
SELECT a.id, a.site_id, a.name, b.id AS measure_id, b.measure_id AS measure_measure_id, b.name AS measure_name
FROM clinical_sites a
  JOIN sites_measures j ON j.clinical_site_id = a.id
  JOIN outcome_measures b ON b.id = j.outcome_measure_id;
```

| id | site_id | name | measure_id | measure_measure_id | measure_name |
|---|---|---|---|---|---|
| 1 | 102 | Extended Review | 1 | invoice | Extended Review |
| 1 | 102 | Extended Review | 2 | 4180944 | Pilot Initiative A |
| 2 | 1336166 | Pilot Initiative A | 2 | 4180944 | Pilot Initiative A |
| 2 | 1336166 | Pilot Initiative A | 3 | 6969441 | Baseline Model |
| 3 | 726040 | Baseline Model | 3 | 6969441 | Baseline Model |
| 3 | 726040 | Baseline Model | 4 | 21280358 | Distributed Cluster |
| 4 | Bjornfant | Distributed Cluster | 4 | 21280358 | Distributed Cluster |
| 4 | Bjornfant | Distributed Cluster | 1 | invoice | Extended Review |

The first row indicates that site 102 (Extended Review) is responsible for the Extended Review outcome measure (primary type, composite-collecti-81). The second row shows site 1336166 (Pilot Initiative A) handling the Pilot Initiative A outcome (secondary type, primary-collecti-82), enabling data quality audits by tracing each measurement back to its collecting site.

### Synthesis

The clinical trial management domain organizes research operations into a coherent network of trials, interventions, controls, outcomes, and sites. Each entity carries specific attributes—dosages, dates, phases, types—that enable precise tracking of study progress and compliance. The junction tables and materialized views provide multiple analytical perspectives, allowing researchers to query from the trial level down to individual outcome measures or from the site level up to the trials they conduct. The data structure supports the full lifecycle of a clinical study, from initial planning through completed analysis, with every intervention, control arm, and measurement point documented and traceable to its parent study.