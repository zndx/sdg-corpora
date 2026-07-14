Clinical trials research organizations manage a complex web of interrelated entities: trials that test interventions, control groups that provide baselines, outcome measures that capture results, and clinical sites that execute the protocols on the ground. The relational schema presented here models this domain through a combination of normalized base tables, many-to-many junction tables, and materialized views that reconstruct domain facts for reporting. Each table corresponds to a distinct entity type in the ontology, and every foreign key encodes a referential constraint that preserves the integrity of the trial–intervention–site graph.

## The Core Entity Tables

The anchor of the schema is the `clinical_trials` table, which stores one row per trial. Its primary key `clinical_trial_id` is an integer surrogate; the business identifier `trial_identifier` carries human-readable codes such as `TRI-2078` and `TRI-2080`. The `title` column holds descriptive names like *Compact Initiative* and *Legacy Model*, while `start_date` and `end_date` are ISO-8601 timestamps that record the trial's planned window. The `status` column enumerates lifecycle states—`planning`, `recruiting`, `active`, and `completed`—and `phase` captures the regulatory stage (`Phase 1` through `Phase 4`). A `primary_outcome` column references a measure by a string key such as `extended-primary-63`, and `sample_size` is an integer indicating the number of enrolled participants. A foreign key `control_group_id` links each trial to its associated control group in the `control_groups` table.

**Table `clinical_trials`**

| clinical_trial_id | trial_identifier | title | start_date | end_date | status | phase | primary_outcome | sample_size | control_group_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | TRI-2078 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | Phase 1 | extended-primary-63 | 31 | 4060641 |
| 1001 | TRI-2080 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | recruiting | Phase 2 | integrated-primary-64 | 38 | IVC10I |
| 1002 | TRI-2082 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | active | Phase 3 | seasonal-primary-65 | 45 | 1250208 |
| 1003 | TRI-2084 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | completed | Phase 4 | regional-primary-66 | 52 | 5006455 |

Interventions—the treatments or exposures under investigation—are stored in the `interventions` table. Each row carries an `intervention_id` (integer), a `name` (e.g., *Extended Review*, *Pilot Initiative A*), and dosage metadata: a numeric `dosage` value like `7.20` or `19.80`, a `unit` column referencing controlled vocabularies such as `distributed-unit-18`, a `frequency` term like `regional-frequenc-36`, and a `route` such as `baseline-route-19`. The foreign key `clinical_trial_id` binds each intervention to exactly one trial, enforcing a one-to-many relationship: a single trial may sponsor multiple interventions, but each intervention belongs to one trial. Audit columns `created_at` and `updated_at` record timestamps of insertion and last modification.

**Table `interventions`**

| intervention_id | name | dosage | unit | frequency | route | clinical_trial_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | Extended Review | 7.20 | distributed-unit-18 | regional-frequenc-36 | baseline-route-19 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Pilot Initiative A | 11.40 | baseline-unit-19 | legacy-frequenc-37 | pilot-route-20 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Baseline Model | 15.60 | pilot-unit-20 | compact-frequenc-38 | extended-route-21 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Distributed Cluster | 19.80 | extended-unit-21 | composite-frequenc-39 | integrated-route-22 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Control groups represent the comparator arms of a trial. The `control_groups` table uses a composite primary key `control_group_id` that mixes integer and string formats—`4060641`, `IVC10I`, `1250208`, and `5006455` appear in the data. The `type` column classifies the arm as `placebo`, `standardCare`, or `noTreatment`. A `size` column records the number of subjects assigned to the group, and a foreign key `clinical_trial_id` ties the group to its parent trial. A second foreign key, `control_intervention_id`, links the group to a specific control intervention in the `control_interventions` table, forming a one-to-one pairing between a control group and its intervention.

**Table `control_groups`**

| control_group_id | type | size | clinical_trial_id | control_intervention_id |
|---|---|---|---|---|
| 4060641 | placebo | 17 | 1000 | 1000 |
| IVC10I | standardCare | 21 | 1001 | 1001 |
| 1250208 | noTreatment | 25 | 1002 | 1002 |
| 5006455 | placebo | 29 | 1003 | 1003 |

The `control_interventions` table mirrors the structure of `interventions` but is scoped to control arms. Its primary key `control_intervention_id` is an integer, and its columns `name`, `dosage`, and `unit` store the same kind of metadata. The foreign key `control_group_id` references `control_groups.control_group_id`, creating a one-to-one relationship: each control intervention belongs to exactly one control group, and each control group references exactly one control intervention.

**Table `control_interventions`**

| control_intervention_id | name | dosage | unit | control_group_id |
|---|---|---|---|---|
| 1000 | Extended Review | 7.20 | distributed-unit-18 | 4060641 |
| 1001 | Pilot Initiative A | 11.40 | baseline-unit-19 | IVC10I |
| 1002 | Baseline Model | 15.60 | pilot-unit-20 | 1250208 |
| 1003 | Distributed Cluster | 19.80 | extended-unit-21 | 5006455 |

Outcome measures capture what the trial intends to measure. The `outcome_measures` table uses a surrogate primary key `id` and a separate `measure_id` column that carries domain identifiers such as `invoice`, `4180944`, `6969441`, and `21280358`. The `name` column repeats the intervention-like names (*Extended Review*, *Pilot Initiative A*, etc.), while `type` classifies the measure as `primary`, `secondary`, or `exploratory`. The `unit` column stores controlled vocabulary values like `distributed-unit-18`, and `collection_method` references a controlled list such as `composite-collecti-81`. A foreign key `clinical_trial_id` binds each outcome measure to its trial.

**Table `outcome_measures`**

| id | measure_id | name | type | unit | collection_method | clinical_trial_id |
|---|---|---|---|---|---|---|
| 1 | invoice | Extended Review | primary | distributed-unit-18 | composite-collecti-81 | 1000 |
| 2 | 4180944 | Pilot Initiative A | secondary | baseline-unit-19 | primary-collecti-82 | 1001 |
| 3 | 6969441 | Baseline Model | exploratory | pilot-unit-20 | adaptive-collecti-83 | 1002 |
| 4 | 21280358 | Distributed Cluster | primary | extended-unit-21 | distributed-collecti-84 | 1003 |

Clinical sites are the physical or organizational locations where trial activities occur. The `clinical_sites` table uses a surrogate primary key `id` and a `site_id` column carrying identifiers such as `102`, `1336166`, `726040`, and `Bjornfant`. The `name` column stores site names that coincide with intervention names in the data (*Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*). Address fields (`address`, `city`, `state`, `country`) hold controlled vocabulary strings like `distributed-address-72` and `compact-country-26`. The `principal_investigator` column stores a coded identifier such as `compact-principa-80`.

**Table `clinical_sites`**

| id | site_id | name | address | city | state | country | principal_investigator |
|---|---|---|---|---|---|---|---|
| 1 | 102 | Extended Review | distributed-address-72 | integrated-city-34 | distributed-state-84 | compact-country-26 | compact-principa-80 |
| 2 | 1336166 | Pilot Initiative A | baseline-address-73 | seasonal-city-35 | baseline-state-85 | composite-country-27 | composite-principa-81 |
| 3 | 726040 | Baseline Model | pilot-address-74 | regional-city-36 | pilot-state-86 | primary-country-28 | primary-principa-82 |
| 4 | Bjornfant | Distributed Cluster | extended-address-75 | legacy-city-37 | extended-state-87 | adaptive-country-29 | adaptive-principa-83 |

## Junction Tables for Many-to-Many Relationships

The schema employs five junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `trials_interventions` table links `clinical_trials` to `interventions`, allowing a trial to be associated with multiple interventions and an intervention to participate in multiple trials. The `trials_measures` table connects `clinical_trials` to `outcome_measures` in the same fashion. The `trials_sites` table associates trials with clinical sites, while `sites_trials` provides the reverse mapping from sites to trials. Finally, `sites_measures` links clinical sites to outcome measures, enabling site-level outcome tracking.

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

## Materialized Views: Reconstructing Domain Facts

Views in this schema materialize the joins that answer the most common analytical questions. Each view denormalizes a subset of the normalized tables into a flat result set suitable for reporting dashboards and ad-hoc queries.

### Trial–Intervention Detail

The view `v_clinical_trial_intervention_detail` joins `clinical_trials` with `interventions` on `clinical_trial_id`, producing one row per trial–intervention pair. It surfaces the trial's identifier, title, phase, and status alongside the intervention's name, dosage, unit, frequency, and route. A row from this view might read: trial `TRI-2078` (*Compact Initiative*, Phase 1, `planning`) paired with intervention *Extended Review* at dosage `7.20` in `distributed-unit-18`, administered via `baseline-route-19` at frequency `regional-frequenc-36`. This view answers the question: *Which interventions are assigned to which trials, and what are their dosing parameters?*

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

### Trial–Control Group Detail

The view `v_clinical_trial_control_group` joins `clinical_trials` with `control_groups` on `clinical_trial_id`, yielding one row per trial–control group pair. It exposes the trial's metadata alongside the control group's `type` (`placebo`, `standardCare`, `noTreatment`), `size`, and the foreign key `control_intervention_id`. For example, trial `TRI-2078` is linked to control group `4060641` of type `placebo` with `17` subjects and control intervention `1000`. This view answers: *What control arm does each trial use, and how many subjects are assigned?*

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

### Trial–Outcome Measure Detail

The view `v_clinical_trial_outcome_measure_detail` joins `clinical_trials` with `outcome_measures` on `clinical_trial_id`. It presents the trial's title and phase alongside the outcome measure's `measure_id`, `name`, `type` (`primary`, `secondary`, `exploratory`), `unit`, and `collection_method`. A representative row shows trial `TRI-2078` (*Compact Initiative*) with outcome measure `invoice` (*Extended Review*, type `primary`, unit `distributed-unit-18`, collected via `composite-collecti-81`). This view answers: *What outcomes is each trial measuring, and how are they classified?*

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

### Trial–Clinical Site Detail

The view `v_clinical_trial_clinical_site_detail` joins `clinical_trials` with `clinical_sites` on their shared identifiers, producing rows that pair each trial with its participating sites. It surfaces the trial's `trial_identifier` and `title` alongside the site's `site_id`, `name`, address fields, and `principal_investigator`. A row might read: trial `TRI-2078` (*Compact Initiative*) conducted at site `102` (*Extended Review*, located at `distributed-address-72` in `integrated-city-34`, `distributed-state-84`, `compact-country-26`, under investigator `compact-principa-80`). This view answers: *Where is each trial being conducted, and who leads the site?*

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

### Intervention–Trial Perspective

The view `v_intervention_clinical_trial` inverts the trial–intervention relationship, presenting one row per intervention with its parent trial's metadata. It answers: *For a given intervention, which trial sponsors it, and what is the trial's phase and status?* A row shows intervention *Extended Review* (dosage `7.20`, unit `distributed-unit-18`) belonging to trial `TRI-2078` (*Compact Initiative*, Phase 1, `planning`).

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

### Control Group–Trial Perspective

The view `v_control_group_clinical_trial` joins `control_groups` with `clinical_trials`, presenting each control group alongside its parent trial's details. It answers: *Which trial does this control group belong to, and what is the trial's overall status?* A row shows control group `4060641` (type `placebo`, size `17`) associated with trial `TRI-2078` (*Compact Initiative*, Phase 1).

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

### Control Group–Control Intervention Pairing

The view `v_control_group_control_intervention` joins `control_groups` with `control_interventions` on `control_group_id`, producing one row per control group–intervention pair. It surfaces the group's `type` and `size` alongside the intervention's `name`, `dosage`, and `unit`. A representative row shows control group `4060641` (type `placebo`, size `17`) paired with control intervention *Extended Review* (dosage `7.20`, unit `distributed-unit-18`). This view answers: *What intervention is assigned to each control group?*

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

### Control Intervention–Group Perspective

The view `v_control_intervention_control_group` inverts the previous relationship, presenting each control intervention alongside its parent control group's metadata. It answers: *For a given control intervention, which control group uses it, and what is the group's type and size?* A row shows control intervention *Extended Review* (dosage `7.20`) belonging to control group `4060641` (type `placebo`, size `17`).

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

### Outcome Measure–Trial Perspective

The view `v_outcome_measure_clinical_trial` joins `outcome_measures` with `clinical_trials`, presenting each outcome measure alongside its parent trial's details. It answers: *Which trial measures this outcome, and what is the trial's phase?* A row shows outcome measure `invoice` (*Extended Review*, type `primary`) belonging to trial `TRI-2078` (*Compact Initiative*, Phase 1).

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

### Clinical Site–Trial Perspective

The view `v_clinical_site_clinical_trial_detail` joins `clinical_sites` with `clinical_trials`, presenting each site alongside its participating trial's metadata. It answers: *For a given clinical site, which trial is it conducting, and what is the trial's status?* A row shows site `102` (*Extended Review*, located in `compact-country-26`) participating in trial `TRI-2078` (*Compact Initiative*, Phase 1, `planning`).

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

### Clinical Site–Outcome Measure Perspective

The view `v_clinical_site_outcome_measure_detail` joins `clinical_sites` with `outcome_measures`, producing rows that pair each site with the outcome measures it tracks. It answers: *Which outcome measures are collected at a given clinical site?* A row shows site `102` (*Extended Review*, `compact-country-26`) tracking outcome measure `invoice` (*Extended Review*, type `primary`, unit `distributed-unit-18`, collected via `composite-collecti-81`).

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

## Synthesis

The schema models the clinical trials domain through a layered architecture: six core entity tables capture the fundamental concepts (trials, interventions, control groups, control interventions, outcome measures, and clinical sites); five junction tables resolve the many-to-many relationships between trials, interventions, measures, and sites; and eleven materialized views denormalize these relationships into flat, query-ready result sets. Every foreign key—from `interventions.clinical_trial_id` through `control_groups.control_intervention_id` to the junction table pairs—preserves referential integrity across the graph. The views collectively answer the principal analytical questions of the domain: which interventions belong to which trials, what control arms are used, which outcomes are measured, and where the trials are conducted. Together, the base tables and views form a complete, ontology-grounded relational model of clinical trial management.