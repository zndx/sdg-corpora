## Domain Modelling and Relational Materialization

The domain under examination centres on a ceremonial governance system in which sovereign entities issue formal proclamations that define eligibility criteria for individuals, while those individuals navigate a network of encounters across geographic locations and undertake structured journeys. The data model captures three intertwined layers: the declarative layer of proclamations and their issuers, the participatory layer of eligible individuals and their statuses, and the spatial-temporal layer of encounters, locations, and journeys. This chapter explains how the ontology of that domain maps onto a normalized relational schema, how cardinality-bounded relationships materialize as foreign keys and junction tables, and how a suite of materialized views reconstructs domain facts from the denormalized joins.

### The Entity Landscape

The ontology recognises six core entity types. `proclamations` records formal declarations, each identified by a surrogate `id` and a business-level `proclamation_id`. The issuer is captured in the `issuer` column — values such as `primary-issuer-46` and `adaptive-issuer-47` — while the `target_audience` column carries labels like `legacy-target-25` and `compact-target-26`. Each proclamation carries a `date_issued` timestamp, a `status` drawn from the set {`pending`, `active`, `archived`}, a `content_summary` such as `seasonal-content-41`, and a foreign key `monarch_id` pointing to the sovereign who issued it.

**Table `proclamations`**

| id | proclamation_id | issuer | target_audience | date_issued | status | content_summary | monarch_id |
|---|---|---|---|---|---|---|---|
| 1000 | access_extension_0 | primary-issuer-46 | legacy-target-25 | 2023-10-10T09:39:00 | pending | seasonal-content-41 | 1 |
| 1001 | 1562845 | adaptive-issuer-47 | compact-target-26 | 2024-03-21T16:56:00 | active | regional-content-42 | 2 |
| 1002 | 9424922 | distributed-issuer-48 | composite-target-27 | 2025-08-05T23:13:00 | archived | legacy-content-43 | 3 |
| 1003 | 8387557 | baseline-issuer-49 | primary-target-28 | 2022-01-16T06:30:00 | pending | compact-content-44 | 4 |

The `monarches` table defines the sovereign entities. Each row carries a `monarch_id`, a `title` (e.g. `Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), a `reign_start_date` and `reign_end_date`, a numeric `fairness_rating` ranging from 6.70 to 20.80, and a `current_status` of `active`, `deceased`, or `abdicated`. The reign dates are not chronologically ordered in every row — monarch 1, for instance, has a `reign_start_date` of `2024-11-04` that post-dates its `reign_end_date` of `2022-01-23` — reflecting the synthetic provenance of the dataset rather than a modelling constraint.

**Table `monarches`**

| monarch_id | title | reign_start_date | reign_end_date | fairness_rating | current_status |
|---|---|---|---|---|---|
| 1 | Compact Initiative | 2024-11-04 | 2022-01-23 | 6.70 | active |
| 2 | Legacy Model | 2025-04-15 | 2023-06-07 | 11.40 | deceased |
| 3 | Regional Cluster A | 2022-09-26 | 2024-11-18 | 16.10 | abdicated |
| 4 | Seasonal Review | 2023-02-10 | 2025-04-02 | 20.80 | active |

The `eligible_individuals` table stores the participants. Its primary key is `eligible_individual_id`, and each row carries an `individual_id` that may be a numeric identifier such as `4277024`, a synthetic code like `default_chart_a_tax_code_40`, a UUID such as `dce5fe58-8fcd-11eb-924d-9cd76263cbd0`, or a name-like string such as `Saipan International Airport`. The `full_name` column holds human-readable names — `Theodore Mcgrath`, `Norma Fisher` — alongside the same synthetic entries. The `age` column spans 35 to 50, `residence` carries values like `regional-residenc-54` and `composite-residenc-57`, and `eligibility_status` is drawn from {`eligible`, `ineligible`, `pending_review`}. The table also stores `date_of_birth`, a `proclamation_id` linking the individual to a specific proclamation, and a `monarch_id` linking to the sovereign.

**Table `eligible_individuals`**

| eligible_individual_id | individual_id | full_name | age | residence | eligibility_status | date_of_birth | proclamation_id | monarch_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 4277024 | Theodore Mcgrath | 35 | regional-residenc-54 | eligible | 2025-04-02 | 1000 | 1 |
| 2 | default_chart_a_tax_code_40 | Account Name | 40 | legacy-residenc-55 | ineligible | 2022-09-13 | 1001 | 2 |
| 3 | 195368 | Saipan International Airport | 45 | compact-residenc-56 | pending_review | 2023-02-24 | 1002 | 3 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | composite-residenc-57 | eligible | 2024-07-08 | 1003 | 4 |

The spatial-temporal layer comprises `encounters`, `locations`, and `journeys`. The `locations` table defines places with columns `id`, `location_id`, `name` (e.g. `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), `type` (village, forest, clearing, grove), `coordinates`, `description`, and `accessibility` (open, restricted, hidden).

**Table `locations`**

| id | location_id | name | type | coordinates | description | accessibility |
|---|---|---|---|---|---|---|
| 1 | 778556 | Extended Review | village | integrated-coordina-70 | Extended Survey | open |
| 2 | 1250220 | Pilot Initiative A | forest | seasonal-coordina-71 | Pilot Corridor A | restricted |
| 3 | 14511 | Baseline Model | clearing | regional-coordina-72 | Baseline Series | hidden |
| 4 | 611510 | Distributed Cluster | grove | legacy-coordina-73 | Distributed Assessment | open |

The `encounters` table records discrete events. Each encounter has an `encounter_id` (UUIDs, strings, or integers), a `location` label, a `date_time` timestamp, an `outcome` of `successful`, `unsuccessful`, or `pending`, an `advice_given` value, a `participant_role` drawn from {`traveler`, `guide`, `obstacle`}, and foreign keys `eligible_individual_id` and `location_id` linking to the participant and the place.

**Table `encounters`**

| encounter_id | location | date_time | outcome | advice_given | participant_role | eligible_individual_id | location_id |
|---|---|---|---|---|---|---|---|
| 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 | successful | composite-advice-27 | traveler | 1 | 1 |
| state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 | unsuccessful | primary-advice-28 | guide | 2 | 2 |
| 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 | pending | adaptive-advice-29 | obstacle | 3 | 3 |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 | successful | distributed-advice-30 | traveler | 4 | 4 |

The `journeys` table captures multi-step travel. Each row has a `journey_id`, `start_date`, `end_date`, a `purpose` label, a `status` of `planned`, `in_progress`, `completed`, or `abandoned`, a `total_distance` (numeric, ranging from 0.075 to 256.0), and a foreign key `eligible_individual_id`.

**Table `journeys`**

| journey_id | start_date | end_date | purpose | status | total_distance | eligible_individual_id |
|---|---|---|---|---|---|---|
| 1000 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | adaptive-purpose-11 | planned | 249.44281 | 1 |
| 1001 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | distributed-purpose-12 | in_progress | 34.366668701171875 | 2 |
| 1002 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | baseline-purpose-13 | completed | 256.0 | 3 |
| 1003 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | pilot-purpose-14 | abandoned | 0.07499999 | 4 |

### Foreign Keys and Junction Tables

The schema employs two strategies for relationship materialization. Direct foreign keys appear in `proclamations.monarch_id`, `eligible_individuals.proclamation_id` and `eligible_individuals.monarch_id`, `encounters.eligible_individual_id` and `encounters.location_id`, and `journeys.eligible_individual_id`. These enforce referential integrity for relationships that are functionally determined by the child row.

Many-to-many relationships are modelled through junction tables. The `proclamations_individuals` junction links proclamations to eligible individuals, the `monarches_proclamations` junction links monarchs to proclamations, and the `monarches_individuals` junction links monarchs to individuals. The `locations_encounters` junction links locations to encounters, and the `journeys_encounters` junction links journeys to encounters.

**Table `proclamations_individuals`**

| proclamation_id | eligible_individual_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `monarches_proclamations`**

| monarch_id | proclamation_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `monarches_individuals`**

| monarch_id | eligible_individual_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `locations_encounters`**

| location_id | encounter_id |
|---|---|
| 1 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 |
| 1 | state_et_1 |
| 2 | state_et_1 |
| 2 | 3001009030170 |
| 3 | 3001009030170 |
| 3 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 |

**Table `journeys_encounters`**

| journey_id | encounter_id |
|---|---|
| 1000 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 |
| 1000 | state_et_1 |
| 1001 | state_et_1 |
| 1001 | 3001009030170 |
| 1002 | 3001009030170 |
| 1002 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1003 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1003 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 |

These junction tables decompose the many-to-many relationships into two one-to-many relationships, each enforced by a foreign key from the junction row back to the parent table. The design ensures that a single proclamation can be associated with multiple individuals without duplicating proclamation data, and that a single individual can appear in multiple proclamations.

### View-Based Fact Reconstruction

The relational schema is normalized to third normal form, which means that any single domain fact — such as "which monarch issued a given proclamation" or "what encounters did a specific individual participate in" — is distributed across multiple tables. The view layer reconstructs these facts through declarative joins, presenting denormalized result sets that answer specific analytical questions.

#### vw_proclamation_monarch

This view joins `proclamations` to `monarches` on `proclamations.monarch_id = monarches.monarch_id`, answering the question: "Which sovereign issued each proclamation?" The result pairs each proclamation's `proclamation_id` and `issuer` with the monarch's `title` and `current_status`. For example, the proclamation `access_extension_0` (issued by `primary-issuer-46`) is attributed to the monarch titled `Compact Initiative`, whose `current_status` is `active`. The proclamation `1562845` (issued by `adaptive-issuer-47`) is attributed to `Legacy Model`, whose `current_status` is `deceased`.

**View `vw_proclamation_monarch`**

```sql
CREATE VIEW vw_proclamation_monarch AS
SELECT a.id, a.proclamation_id, a.issuer, a.target_audience, b.monarch_id AS monarch_monarch_id, b.title AS monarch_title, b.reign_start_date AS monarch_reign_start_date
FROM proclamations a JOIN monarches b ON a.monarch_id = b.monarch_id;
```

| id | proclamation_id | issuer | target_audience | monarch_monarch_id | monarch_title | monarch_reign_start_date |
|---|---|---|---|---|---|---|
| 1000 | access_extension_0 | primary-issuer-46 | legacy-target-25 | 1 | Compact Initiative | 2024-11-04 |
| 1001 | 1562845 | adaptive-issuer-47 | compact-target-26 | 2 | Legacy Model | 2025-04-15 |
| 1002 | 9424922 | distributed-issuer-48 | composite-target-27 | 3 | Regional Cluster A | 2022-09-26 |
| 1003 | 8387557 | baseline-issuer-49 | primary-target-28 | 4 | Seasonal Review | 2023-02-10 |

#### vw_proclamation_eligible_individual_detail

This view joins `proclamations` to `eligible_individuals` on `proclamations.id = eligible_individuals.proclamation_id`, answering: "Which eligible individuals are associated with each proclamation?" The result surface the proclamation's `content_summary` and `status` alongside the individual's `full_name`, `age`, `eligibility_status`, and `residence`. A row might pair the proclamation with `content_summary` `seasonal-content-41` and `status` `pending` with the individual `Theodore Mcgrath`, age 35, `eligibility_status` `eligible`, residing in `regional-residenc-54`. Another row pairs the same proclamation with `default_chart_a_tax_code_40` (Account Name), age 40, `ineligible`, in `legacy-residenc-55`.

**View `vw_proclamation_eligible_individual_detail`**

```sql
CREATE VIEW vw_proclamation_eligible_individual_detail AS
SELECT a.id, a.proclamation_id, a.issuer, b.eligible_individual_id AS individual_eligible_individual_id, b.individual_id AS individual_individual_id, b.full_name AS individual_full_name
FROM proclamations a
  JOIN proclamations_individuals j ON j.proclamation_id = a.id
  JOIN eligible_individuals b ON b.eligible_individual_id = j.eligible_individual_id;
```

| id | proclamation_id | issuer | individual_eligible_individual_id | individual_individual_id | individual_full_name |
|---|---|---|---|---|---|
| 1000 | access_extension_0 | primary-issuer-46 | 1 | 4277024 | Theodore Mcgrath |
| 1000 | access_extension_0 | primary-issuer-46 | 2 | default_chart_a_tax_code_40 | Account Name |
| 1001 | 1562845 | adaptive-issuer-47 | 2 | default_chart_a_tax_code_40 | Account Name |
| 1001 | 1562845 | adaptive-issuer-47 | 3 | 195368 | Saipan International Airport |
| 1002 | 9424922 | distributed-issuer-48 | 3 | 195368 | Saipan International Airport |
| 1002 | 9424922 | distributed-issuer-48 | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 1003 | 8387557 | baseline-issuer-49 | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 1003 | 8387557 | baseline-issuer-49 | 1 | 4277024 | Theodore Mcgrath |

#### vw_eligible_individual_proclamation

This view presents the inverse perspective of the previous one: "For each eligible individual, which proclamation governs their eligibility?" It joins `eligible_individuals` to `proclamations` and presents the individual's `full_name` and `eligibility_status` alongside the proclamation's `proclamation_id`, `issuer`, and `date_issued`. The individual `Theodore Mcgrath` appears with `proclamation_id` `1000`, `issuer` `primary-issuer-46`, and `date_issued` `2023-10-10T09:39:00`. The individual `Norma Fisher` appears with `proclamation_id` `1003`, `issuer` `baseline-issuer-49`, and `date_issued` `2022-01-16T06:30:00`.

**View `vw_eligible_individual_proclamation`**

```sql
CREATE VIEW vw_eligible_individual_proclamation AS
SELECT a.eligible_individual_id, a.individual_id, a.full_name, a.age, b.id AS proclamation_id, b.proclamation_id AS proclamation_proclamation_id, b.issuer AS proclamation_issuer
FROM eligible_individuals a JOIN proclamations b ON a.proclamation_id = b.id;
```

| eligible_individual_id | individual_id | full_name | age | proclamation_id | proclamation_proclamation_id | proclamation_issuer |
|---|---|---|---|---|---|---|
| 1 | 4277024 | Theodore Mcgrath | 35 | 1000 | access_extension_0 | primary-issuer-46 |
| 2 | default_chart_a_tax_code_40 | Account Name | 40 | 1001 | 1562845 | adaptive-issuer-47 |
| 3 | 195368 | Saipan International Airport | 45 | 1002 | 9424922 | distributed-issuer-48 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | 1003 | 8387557 | baseline-issuer-49 |

#### vw_eligible_individual_monarch

This view joins `eligible_individuals` to `monarches` on `eligible_individuals.monarch_id = monarches.monarch_id`, answering: "Which monarch is associated with each eligible individual?" The result pairs the individual's `full_name` and `eligibility_status` with the monarch's `title`, `fairness_rating`, and `current_status`. `Theodore Mcgrath` (eligible) is paired with the monarch `Compact Initiative` (fairness 6.70, active). `Norma Fisher` (eligible) is paired with `Seasonal Review` (fairness 20.80, active).

**View `vw_eligible_individual_monarch`**

```sql
CREATE VIEW vw_eligible_individual_monarch AS
SELECT a.eligible_individual_id, a.individual_id, a.full_name, a.age, b.monarch_id AS monarch_monarch_id, b.title AS monarch_title, b.reign_start_date AS monarch_reign_start_date
FROM eligible_individuals a JOIN monarches b ON a.monarch_id = b.monarch_id;
```

| eligible_individual_id | individual_id | full_name | age | monarch_monarch_id | monarch_title | monarch_reign_start_date |
|---|---|---|---|---|---|---|
| 1 | 4277024 | Theodore Mcgrath | 35 | 1 | Compact Initiative | 2024-11-04 |
| 2 | default_chart_a_tax_code_40 | Account Name | 40 | 2 | Legacy Model | 2025-04-15 |
| 3 | 195368 | Saipan International Airport | 45 | 3 | Regional Cluster A | 2022-09-26 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | 4 | Seasonal Review | 2023-02-10 |

#### vw_monarch_proclamation_detail

This view joins `monarches` to `proclamations` on `monarches.monarch_id = proclamations.monarch_id`, answering: "Which proclamations were issued by each monarch?" The result presents the monarch's `title` and `current_status` alongside the proclamation's `proclamation_id`, `issuer`, `target_audience`, and `status`. The monarch `Compact Initiative` (active) appears with proclamation `access_extension_0` (issuer `primary-issuer-46`, audience `legacy-target-25`, status `pending`). The monarch `Legacy Model` (deceased) appears with proclamation `1562845` (issuer `adaptive-issuer-47`, audience `compact-target-26`, status `active`).

**View `vw_monarch_proclamation_detail`**

```sql
CREATE VIEW vw_monarch_proclamation_detail AS
SELECT a.monarch_id, a.title, a.reign_start_date, b.id AS proclamation_id, b.proclamation_id AS proclamation_proclamation_id, b.issuer AS proclamation_issuer
FROM monarches a
  JOIN monarches_proclamations j ON j.monarch_id = a.monarch_id
  JOIN proclamations b ON b.id = j.proclamation_id;
```

| monarch_id | title | reign_start_date | proclamation_id | proclamation_proclamation_id | proclamation_issuer |
|---|---|---|---|---|---|
| 1 | Compact Initiative | 2024-11-04 | 1000 | access_extension_0 | primary-issuer-46 |
| 1 | Compact Initiative | 2024-11-04 | 1001 | 1562845 | adaptive-issuer-47 |
| 2 | Legacy Model | 2025-04-15 | 1001 | 1562845 | adaptive-issuer-47 |
| 2 | Legacy Model | 2025-04-15 | 1002 | 9424922 | distributed-issuer-48 |
| 3 | Regional Cluster A | 2022-09-26 | 1002 | 9424922 | distributed-issuer-48 |
| 3 | Regional Cluster A | 2022-09-26 | 1003 | 8387557 | baseline-issuer-49 |
| 4 | Seasonal Review | 2023-02-10 | 1003 | 8387557 | baseline-issuer-49 |
| 4 | Seasonal Review | 2023-02-10 | 1000 | access_extension_0 | primary-issuer-46 |

#### vw_monarch_eligible_individual_detail

This view joins `monarches` to `eligible_individuals` on `monarches.monarch_id = eligible_individuals.monarch_id`, answering: "Which eligible individuals are associated with each monarch?" The result pairs the monarch's `title` and `fairness_rating` with the individual's `full_name`, `age`, `eligibility_status`, and `residence`. The monarch `Compact Initiative` (fairness 6.70) is paired with `Theodore Mcgrath`, age 35, eligible, in `regional-residenc-54`. The monarch `Seasonal Review` (fairness 20.80) is paired with `Norma Fisher`, age 50, eligible, in `composite-residenc-57`.

**View `vw_monarch_eligible_individual_detail`**

```sql
CREATE VIEW vw_monarch_eligible_individual_detail AS
SELECT a.monarch_id, a.title, a.reign_start_date, b.eligible_individual_id AS individual_eligible_individual_id, b.individual_id AS individual_individual_id, b.full_name AS individual_full_name
FROM monarches a
  JOIN monarches_individuals j ON j.monarch_id = a.monarch_id
  JOIN eligible_individuals b ON b.eligible_individual_id = j.eligible_individual_id;
```

| monarch_id | title | reign_start_date | individual_eligible_individual_id | individual_individual_id | individual_full_name |
|---|---|---|---|---|---|
| 1 | Compact Initiative | 2024-11-04 | 1 | 4277024 | Theodore Mcgrath |
| 1 | Compact Initiative | 2024-11-04 | 2 | default_chart_a_tax_code_40 | Account Name |
| 2 | Legacy Model | 2025-04-15 | 2 | default_chart_a_tax_code_40 | Account Name |
| 2 | Legacy Model | 2025-04-15 | 3 | 195368 | Saipan International Airport |
| 3 | Regional Cluster A | 2022-09-26 | 3 | 195368 | Saipan International Airport |
| 3 | Regional Cluster A | 2022-09-26 | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 4 | Seasonal Review | 2023-02-10 | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 4 | Seasonal Review | 2023-02-10 | 1 | 4277024 | Theodore Mcgrath |

#### vw_encounter_eligible_individual

This view joins `encounters` to `eligible_individuals` on `encounters.eligible_individual_id = eligible_individuals.eligible_individual_id`, answering: "Which eligible individual participated in each encounter?" The result presents the encounter's `location`, `date_time`, `outcome`, and `participant_role` alongside the individual's `full_name` and `eligibility_status`. The encounter at `extended-location-99` on `2025-04-25T15:57:00` with outcome `successful` and role `traveler` is attributed to `Theodore Mcgrath` (eligible). The encounter at `integrated-location-100` on `2022-09-09T22:14:00` with outcome `unsuccessful` and role `guide` is attributed to `default_chart_a_tax_code_40` (Account Name, ineligible).

**View `vw_encounter_eligible_individual`**

```sql
CREATE VIEW vw_encounter_eligible_individual AS
SELECT a.encounter_id, a.location, a.date_time, a.outcome, b.eligible_individual_id AS individual_eligible_individual_id, b.individual_id AS individual_individual_id, b.full_name AS individual_full_name
FROM encounters a JOIN eligible_individuals b ON a.eligible_individual_id = b.eligible_individual_id;
```

| encounter_id | location | date_time | outcome | individual_eligible_individual_id | individual_individual_id | individual_full_name |
|---|---|---|---|---|---|---|
| 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 | successful | 1 | 4277024 | Theodore Mcgrath |
| state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 | unsuccessful | 2 | default_chart_a_tax_code_40 | Account Name |
| 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 | pending | 3 | 195368 | Saipan International Airport |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 | successful | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

#### vw_encounter_location

This view joins `encounters` to `locations` on `encounters.location_id = locations.id`, answering: "At which location did each encounter occur?" The result presents the encounter's `outcome` and `advice_given` alongside the location's `name`, `type`, and `accessibility`. The encounter with outcome `successful` and advice `composite-advice-27` occurred at `Extended Review` (type `village`, accessibility `open`). The encounter with outcome `unsuccessful` and advice `primary-advice-28` occurred at `Pilot Initiative A` (type `forest`, accessibility `restricted`).

**View `vw_encounter_location`**

```sql
CREATE VIEW vw_encounter_location AS
SELECT a.encounter_id, a.location, a.date_time, a.outcome, b.id AS location_id, b.location_id AS location_location_id, b.name AS location_name
FROM encounters a JOIN locations b ON a.location_id = b.id;
```

| encounter_id | location | date_time | outcome | location_id | location_location_id | location_name |
|---|---|---|---|---|---|---|
| 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 | successful | 1 | 778556 | Extended Review |
| state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 | unsuccessful | 2 | 1250220 | Pilot Initiative A |
| 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 | pending | 3 | 14511 | Baseline Model |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 | successful | 4 | 611510 | Distributed Cluster |

#### vw_location_encounter_detail

This view presents the inverse perspective: "Which encounters occurred at each location?" It joins `locations` to `encounters` and presents the location's `name`, `type`, and `accessibility` alongside the encounter's `date_time`, `outcome`, and `participant_role`. The location `Extended Review` (village, open) is paired with an encounter on `2025-04-25T15:57:00` with outcome `successful` and role `traveler`. The location `Baseline Model` (clearing, hidden) is paired with an encounter on `2023-02-20T05:31:00` with outcome `pending` and role `obstacle`.

**View `vw_location_encounter_detail`**

```sql
CREATE VIEW vw_location_encounter_detail AS
SELECT a.id, a.location_id, a.name, b.encounter_id AS encounter_encounter_id, b.location AS encounter_location, b.date_time AS encounter_date_time
FROM locations a
  JOIN locations_encounters j ON j.location_id = a.id
  JOIN encounters b ON b.encounter_id = j.encounter_id;
```

| id | location_id | name | encounter_encounter_id | encounter_location | encounter_date_time |
|---|---|---|---|---|---|
| 1 | 778556 | Extended Review | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 |
| 1 | 778556 | Extended Review | state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 |
| 2 | 1250220 | Pilot Initiative A | state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 |
| 2 | 1250220 | Pilot Initiative A | 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 |
| 3 | 14511 | Baseline Model | 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 |
| 3 | 14511 | Baseline Model | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 |
| 4 | 611510 | Distributed Cluster | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 |
| 4 | 611510 | Distributed Cluster | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 |

#### vw_journey_eligible_individual

This view joins `journeys` to `eligible_individuals` on `journeys.eligible_individual_id = eligible_individuals.eligible_individual_id`, answering: "Which eligible individual undertook each journey?" The result presents the journey's `purpose`, `status`, and `total_distance` alongside the individual's `full_name` and `eligibility_status`. The journey with purpose `adaptive-purpose-11`, status `planned`, and distance 249.44 is attributed to `Theodore Mcgrath` (eligible). The journey with purpose `pilot-purpose-14`, status `abandoned`, and distance 0.075 is attributed to `Norma Fisher` (eligible).

**View `vw_journey_eligible_individual`**

```sql
CREATE VIEW vw_journey_eligible_individual AS
SELECT a.journey_id, a.start_date, a.end_date, a.purpose, b.eligible_individual_id AS individual_eligible_individual_id, b.individual_id AS individual_individual_id, b.full_name AS individual_full_name
FROM journeys a JOIN eligible_individuals b ON a.eligible_individual_id = b.eligible_individual_id;
```

| journey_id | start_date | end_date | purpose | individual_eligible_individual_id | individual_individual_id | individual_full_name |
|---|---|---|---|---|---|---|
| 1000 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | adaptive-purpose-11 | 1 | 4277024 | Theodore Mcgrath |
| 1001 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | distributed-purpose-12 | 2 | default_chart_a_tax_code_40 | Account Name |
| 1002 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | baseline-purpose-13 | 3 | 195368 | Saipan International Airport |
| 1003 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | pilot-purpose-14 | 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

#### vw_journey_encounter_detail

This view joins `journeys` to `encounters` through the `journeys_encounters` junction table, answering: "Which encounters were part of each journey?" The result presents the journey's `purpose`, `status`, and `total_distance` alongside the encounter's `location`, `date_time`, `outcome`, and `participant_role`. A journey with purpose `adaptive-purpose-11` and status `planned` (distance 249.44) is paired with an encounter at `extended-location-99` on `2025-04-25T15:57:00` with outcome `successful` and role `traveler`. A journey with purpose `baseline-purpose-13` and status `completed` (distance 256.0) is paired with an encounter at `seasonal-location-101` on `2023-02-20T05:31:00` with outcome `pending` and role `obstacle`.

**View `vw_journey_encounter_detail`**

```sql
CREATE VIEW vw_journey_encounter_detail AS
SELECT a.journey_id, a.start_date, a.end_date, b.encounter_id AS encounter_encounter_id, b.location AS encounter_location, b.date_time AS encounter_date_time
FROM journeys a
  JOIN journeys_encounters j ON j.journey_id = a.journey_id
  JOIN encounters b ON b.encounter_id = j.encounter_id;
```

| journey_id | start_date | end_date | encounter_encounter_id | encounter_location | encounter_date_time |
|---|---|---|---|---|---|
| 1000 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 |
| 1000 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 |
| 1001 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 |
| 1001 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 |
| 1002 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 |
| 1002 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 |
| 1003 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 |
| 1003 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 |

### Synthesis

The schema decomposes the domain into six base tables and five junction tables, enforcing referential integrity through foreign keys while preserving many-to-many relationships via the junction layer. The eleven views reconstruct the most common analytical queries by joining these normalized tables back together, each view answering a distinct question about the relationships between proclamations, monarchs, eligible individuals, encounters, locations, and journeys. The design separates concerns: the base tables capture atomic facts, the junction tables capture relationships, and the views capture analytical perspectives. This separation allows the underlying data to evolve — adding new proclamations, individuals, or encounters — without requiring changes to the view definitions, while the views provide a stable interface for querying the domain from any analytical angle.