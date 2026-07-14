## The Architecture of Royal Proclamations and Regional Administration

The governance structures documented in these records describe a system where sovereign authority flows through formal proclamations, reaches designated populations, and is enacted across a network of physical locations and travel routes. At the center of this system sit the monarchs, whose reigns are tracked with precise dates and fairness ratings, and the proclamations they issue, which carry specific issuers, target audiences, and statuses. These proclamations reach eligible individuals who reside across diverse geographic locations, and whose interactions with the administration are recorded as encounters. Journeys connect individuals to locations, forming a spatial-temporal map of how royal directives move through the realm. The following sections examine each component of this administrative architecture, drawing on concrete records to illustrate how the system operates in practice.

**Table `proclamations`**

| id | proclamation_id | issuer | target_audience | date_issued | status | content_summary | monarch_id |
|---|---|---|---|---|---|---|---|
| 1000 | access_extension_0 | primary-issuer-46 | legacy-target-25 | 2023-10-10T09:39:00 | pending | seasonal-content-41 | 1 |
| 1001 | 1562845 | adaptive-issuer-47 | compact-target-26 | 2024-03-21T16:56:00 | active | regional-content-42 | 2 |
| 1002 | 9424922 | distributed-issuer-48 | composite-target-27 | 2025-08-05T23:13:00 | archived | legacy-content-43 | 3 |
| 1003 | 8387557 | baseline-issuer-49 | primary-target-28 | 2022-01-16T06:30:00 | pending | compact-content-44 | 4 |

Proclamations serve as the primary instruments of royal authority, each carrying a unique identifier, an issuer designation, and a target audience classification. The proclamation identified as `access_extension_0` was issued by `primary-issuer-46` to the `legacy-target-25` audience on October 10, 2023, and remains in a `pending` status with a content summary labeled `seasonal-content-41`. Another record, bearing the numeric identifier `1562845`, was issued by `adaptive-issuer-47` to `compact-target-26` on March 21, 2024, and holds an `active` status. The proclamation `9424922`, issued by `distributed-issuer-48` to `composite-target-27` on August 5, 2025, has been `archived`, while `8387557`, issued by `baseline-issuer-49` to `primary-target-28` on January 16, 2022, remains `pending`. Each proclamation is linked to a specific monarch through the `monarch_id` column, establishing the chain of authority from sovereign to subject.

**Table `monarches`**

| monarch_id | title | reign_start_date | reign_end_date | fairness_rating | current_status |
|---|---|---|---|---|---|
| 1 | Compact Initiative | 2024-11-04 | 2022-01-23 | 6.70 | active |
| 2 | Legacy Model | 2025-04-15 | 2023-06-07 | 11.40 | deceased |
| 3 | Regional Cluster A | 2022-09-26 | 2024-11-18 | 16.10 | abdicated |
| 4 | Seasonal Review | 2023-02-10 | 2025-04-02 | 20.80 | active |

Monarchs function as the source of all proclamations, with their reigns bounded by start and end dates and evaluated through a fairness rating. The monarch titled `Compact Initiative` began a reign on November 4, 2024, which ended on January 23, 2022, carrying a fairness rating of `6.70` and holding `active` current status. The monarch `Legacy Model` reigned from April 15, 2025, to June 7, 2023, with a fairness rating of `11.40`, and is recorded as `deceased`. `Regional Cluster A` reigned from September 26, 2022, to November 18, 2024, with a fairness rating of `16.10`, and has `abdicated`. The monarch `Seasonal Review` reigned from February 10, 2023, to April 2, 2025, carrying the highest fairness rating of `20.80` and maintaining `active` status. These ratings and statuses provide a quantitative and categorical framework for assessing the legitimacy and effectiveness of each sovereign's rule.

**Table `eligible_individuals`**

| eligible_individual_id | individual_id | full_name | age | residence | eligibility_status | date_of_birth | proclamation_id | monarch_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 4277024 | Theodore Mcgrath | 35 | regional-residenc-54 | eligible | 2025-04-02 | 1000 | 1 |
| 2 | default_chart_a_tax_code_40 | Account Name | 40 | legacy-residenc-55 | ineligible | 2022-09-13 | 1001 | 2 |
| 3 | 195368 | Saipan International Airport | 45 | compact-residenc-56 | pending_review | 2023-02-24 | 1002 | 3 |
| 4 | dce5fe58-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | 50 | composite-residenc-57 | eligible | 2024-07-08 | 1003 | 4 |

Eligible individuals represent the population through which royal directives are implemented. Each individual carries a unique `eligible_individual_id`, an `individual_id` that may reference an external identifier, a full name, age, residence classification, and an `eligibility_status` that determines their standing. Theodore Mcgrath, with individual ID `4277024`, is 35 years old, resides in `regional-residenc-54`, and holds an `eligible` status. The record associated with `default_chart_a_tax_code_40` lists the name as `Account Name`, aged 40, residing in `legacy-residenc-55`, with an `ineligible` status. Saipan International Airport, with individual ID `195368`, is 45 years old, resides in `compact-residenc-56`, and has a `pending_review` status. Norma Fisher, identified by the UUID `dce5fe58-8fcd-11eb-924d-9cd76263cbd0`, is 50 years old, resides in `composite-residenc-57`, and holds `eligible` status. Each individual is linked to a specific proclamation and monarch, anchoring them within the administrative hierarchy.

**Table `encounters`**

| encounter_id | location | date_time | outcome | advice_given | participant_role | eligible_individual_id | location_id |
|---|---|---|---|---|---|---|---|
| 1366db3e-8fcc-11eb-924d-9cd76263cbd0 | extended-location-99 | 2025-04-25T15:57:00 | successful | composite-advice-27 | traveler | 1 | 1 |
| state_et_1 | integrated-location-100 | 2022-09-09T22:14:00 | unsuccessful | primary-advice-28 | guide | 2 | 2 |
| 3001009030170 | seasonal-location-101 | 2023-02-20T05:31:00 | pending | adaptive-advice-29 | obstacle | 3 | 3 |
| 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | regional-location-102 | 2024-07-04T12:48:00 | successful | distributed-advice-30 | traveler | 4 | 4 |

Encounters document the interactions between eligible individuals and the administrative apparatus at specific locations and times. The encounter identified by the UUID `1366db3e-8fcc-11eb-924d-9cd76263cbd0` occurred at `extended-location-99` on April 25, 2025, at 15:57, with a `successful` outcome and `composite-advice-27` given to a participant acting as a `traveler`. The encounter `state_et_1` took place at `integrated-location-100` on September 9, 2022, at 22:14, resulting in an `unsuccessful` outcome with `primary-advice-28` given to a `guide`. The encounter `3001009030170` occurred at `seasonal-location-101` on February 20, 2023, at 05:31, with a `pending` outcome and `adaptive-advice-29` given to a participant classified as an `obstacle`. The encounter `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` took place at `regional-location-102` on July 4, 2024, at 12:48, with a `successful` outcome and `distributed-advice-30` given to a `traveler`. Each encounter is associated with a specific eligible individual and location, creating a traceable record of administrative interaction.

**Table `locations`**

| id | location_id | name | type | coordinates | description | accessibility |
|---|---|---|---|---|---|---|
| 1 | 778556 | Extended Review | village | integrated-coordina-70 | Extended Survey | open |
| 2 | 1250220 | Pilot Initiative A | forest | seasonal-coordina-71 | Pilot Corridor A | restricted |
| 3 | 14511 | Baseline Model | clearing | regional-coordina-72 | Baseline Series | hidden |
| 4 | 611510 | Distributed Cluster | grove | legacy-coordina-73 | Distributed Assessment | open |

Locations form the geographic infrastructure through which encounters and journeys are organized. The location with ID `1` and identifier `778556` is named `Extended Review`, classified as a `village`, with coordinates labeled `integrated-coordina-70`, described as `Extended Survey`, and marked as `open` for accessibility. Location `2`, identified as `1250220`, is named `Pilot Initiative A`, classified as a `forest`, with coordinates `seasonal-coordina-71`, described as `Pilot Corridor A`, and marked as `restricted`. Location `3`, with identifier `14511`, is named `Baseline Model`, classified as a `clearing`, with coordinates `regional-coordina-72`, described as `Baseline Series`, and marked as `hidden`. Location `4`, identified as `611510`, is named `Distributed Cluster`, classified as a `grove`, with coordinates `legacy-coordina-73`, described as `Distributed Assessment`, and marked as `open`. The type and accessibility attributes of each location determine which encounters can occur there and which individuals may access them.

**Table `journeys`**

| journey_id | start_date | end_date | purpose | status | total_distance | eligible_individual_id |
|---|---|---|---|---|---|---|
| 1000 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | adaptive-purpose-11 | planned | 249.44281 | 1 |
| 1001 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | distributed-purpose-12 | in_progress | 34.366668701171875 | 2 |
| 1002 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | baseline-purpose-13 | completed | 256.0 | 3 |
| 1003 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | pilot-purpose-14 | abandoned | 0.07499999 | 4 |

Journeys represent the movement of eligible individuals across the realm, each with a defined start and end date, purpose, status, and total distance traveled. Journey `1000` began on September 5, 2022, at 20:24 and ended on September 1, 2022, at 08:00, with the purpose `adaptive-purpose-11`, a `planned` status, and a total distance of `249.44281` units. Journey `1001` started on February 16, 2023, at 03:41 and ended on February 12, 2023, at 15:17, with the purpose `distributed-purpose-12`, an `in_progress` status, and a distance of `34.366668701171875` units. Journey `1002` began on July 27, 2024, at 10:58 and ended on July 23, 2024, at 22:34, with the purpose `baseline-purpose-13`, a `completed` status, and a distance of `256.0` units. Journey `1003` started on December 11, 2025, at 17:15 and ended on December 7, 2025, at 05:51, with the purpose `pilot-purpose-14`, an `abandoned` status, and a minimal distance of `0.07499999` units. Each journey is associated with a specific eligible individual, linking movement to administrative responsibility.

The relationships between these core entities are managed through junction tables that capture many-to-many associations. The table `proclamations_individuals` records which eligible individuals are subject to which proclamations, enabling a single proclamation to reach multiple individuals and an individual to be subject to multiple proclamations over time. The table `monarches_proclamations` links each proclamation to its issuing monarch, supporting the possibility that a monarch may issue multiple proclamations and that proclamations may be associated with multiple monarchs in transitional periods. The table `monarches_individuals` establishes the relationship between monarchs and eligible individuals, capturing which sovereign's authority extends over which population members.

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

The spatial dimension of the administrative system is captured through the junction tables that connect encounters to their geographic context. The table `locations_encounters` records which encounters occurred at which locations, enabling the tracking of encounter frequency and outcomes by place. The table `journeys_encounters` links journeys to the encounters that occurred along them, providing a route-level view of how administrative interactions are distributed across travel paths.

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

The views in this system synthesize the base tables and junction records into analytical perspectives that answer specific operational questions. Each view joins multiple tables to produce a flattened result that can be queried directly for reporting and decision-making.

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

The view `vw_proclamation_monarch` joins proclamations with their issuing monarchs, answering the question of which sovereign is responsible for each proclamation. For the proclamation `access_extension_0`, the view reveals that it was issued under the authority of the monarch with ID `1`, titled `Compact Initiative`. The proclamation `1562845` is linked to monarch ID `2`, `Legacy Model`, while `9424922` connects to monarch ID `3`, `Regional Cluster A`. The proclamation `8387557` is associated with monarch ID `4`, `Seasonal Review`. This view enables administrators to audit the distribution of proclamations across the sovereign hierarchy and identify any imbalances in issuance patterns.

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

The view `vw_proclamation_eligible_individual_detail` combines proclamations with the eligible individuals they target, providing a complete picture of who is subject to which royal directives. For the proclamation `access_extension_0`, the view shows that Theodore Mcgrath, aged 35 and residing in `regional-residenc-54`, is an eligible recipient with `eligible` status. The proclamation `1562845` reaches the individual named `Account Name`, aged 40, residing in `legacy-residenc-55`, who holds an `ineligible` status. The proclamation `9424922` is directed toward the individual at `Saipan International Airport`, aged 45, in `compact-residenc-56`, with a `pending_review` status. The proclamation `8387557` reaches Norma Fisher, aged 50, in `composite-residenc-57`, who is `eligible`. This view supports compliance auditing by revealing the eligibility distribution of proclamation recipients.

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

The view `vw_eligible_individual_proclamation` inverts the perspective, organizing records by eligible individual and listing the proclamations that apply to them. Theodore Mcgrath is linked to the proclamation `access_extension_0`, which carries the issuer `primary-issuer-46` and target audience `legacy-target-25`. The individual `Account Name` is associated with proclamation `1562845`, issued by `adaptive-issuer-47` to `compact-target-26`. The individual at `Saipan International Airport` is connected to proclamation `9424922`, issued by `distributed-issuer-48` to `composite-target-27`. Norma Fisher is linked to proclamation `8387557`, issued by `baseline-issuer-49` to `primary-target-28`. This view is useful for individual-level case management, allowing administrators to see the full proclamation history for any given person.

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

The view `vw_eligible_individual_monarch` connects eligible individuals directly to the monarchs whose authority extends over them, bypassing the proclamation layer. Theodore Mcgrath is associated with monarch ID `1`, `Compact Initiative`, who holds a fairness rating of `6.70` and an `active` status. `Account Name` is linked to monarch ID `2`, `Legacy Model`, with a fairness rating of `11.40` and a `deceased` status. The individual at `Saipan International Airport` falls under monarch ID `3`, `Regional Cluster A`, who has a fairness rating of `16.10` and an `abdicated` status. Norma Fisher is connected to monarch ID `4`, `Seasonal Review`, carrying the highest fairness rating of `20.80` and an `active` status. This view supports equity analysis by revealing the distribution of individuals across monarchs with varying fairness ratings.

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

The view `vw_monarch_proclamation_detail` provides a monarch-centric view of proclamations, including the full details of each proclamation issued under a sovereign's authority. The monarch `Compact Initiative` (ID `1`) is shown to have issued the proclamation `access_extension_0`, which targets `legacy-target-25` and remains in `pending` status. The monarch `Legacy Model` (ID `2`) issued `1562845`, targeting `compact-target-26` with an `active` status. The monarch `Regional Cluster A` (ID `3`) issued `9424922`, targeting `composite-target-27` and marked as `archived`. The monarch `Seasonal Review` (ID `4`) issued `8387557`, targeting `primary-target-28` and remaining `pending`. This view is essential for sovereign accountability, enabling the assessment of each monarch's issuance patterns and the lifecycle management of their proclamations.

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

The view `vw_monarch_eligible_individual_detail` links monarchs to the eligible individuals under their authority, including the individuals' names, ages, residences, and eligibility statuses. Monarch `Compact Initiative` (ID `1`) is connected to Theodore Mcgrath, aged 35, residing in `regional-residenc-54`, with `eligible` status. Monarch `Legacy Model` (ID `2`) is linked to `Account Name`, aged 40, in `legacy-residenc-55`, with `ineligible` status. Monarch `Regional Cluster A` (ID `3`) is associated with the individual at `Saipan International Airport`, aged 45, in `compact-residenc-56`, with `pending_review` status. Monarch `Seasonal Review` (ID `4`) is connected to Norma Fisher, aged 50, in `composite-residenc-57`, with `eligible` status. This view supports demographic analysis and resource allocation by revealing the population characteristics under each sovereign's jurisdiction.

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

The view `vw_encounter_eligible_individual` joins encounters with the eligible individuals who participated in them, providing a complete record of who interacted with the administration and how. The encounter `1366db3e-8fcc-11eb-924d-9cd76263cbd0` involved Theodore Mcgrath, occurred at `extended-location-99`, had a `successful` outcome, and involved `composite-advice-27` given to a `traveler`. The encounter `state_et_1` involved `Account Name`, occurred at `integrated-location-100`, had an `unsuccessful` outcome, and involved `primary-advice-28` given to a `guide`. The encounter `3001009030170` involved the individual at `Saipan International Airport`, occurred at `seasonal-location-101`, had a `pending` outcome, and involved `adaptive-advice-29` given to an `obstacle`. The encounter `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` involved Norma Fisher, occurred at `regional-location-102`, had a `successful` outcome, and involved `distributed-advice-30` given to a `traveler`. This view supports performance evaluation by correlating individual characteristics with encounter outcomes.

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

The view `vw_encounter_location` connects encounters to their geographic locations, answering the question of where administrative interactions took place. The encounter `1366db3e-8fcc-11eb-924d-9cd76263cbd0` occurred at `Extended Review` (ID `1`), a `village` with `open` accessibility. The encounter `state_et_1` took place at `Pilot Initiative A` (ID `2`), a `forest` with `restricted` accessibility. The encounter `3001009030170` occurred at `Baseline Model` (ID `3`), a `clearing` with `hidden` accessibility. The encounter `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` took place at `Distributed Cluster` (ID `4`), a `grove` with `open` accessibility. This view enables geographic analysis of encounter distribution and helps identify whether certain location types or accessibility levels correlate with specific encounter outcomes.

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

The view `vw_location_encounter_detail` inverts the previous perspective, organizing records by location and listing all encounters that occurred there. The location `Extended Review` (ID `1`), a `village` with `open` accessibility, hosted the encounter `1366db3e-8fcc-11eb-924d-9cd76263cbd0`, which had a `successful` outcome and involved `composite-advice-27`. The location `Pilot Initiative A` (ID `2`), a `forest` with `restricted` accessibility, hosted the encounter `state_et_1`, which had an `unsuccessful` outcome and involved `primary-advice-28`. The location `Baseline Model` (ID `3`), a `clearing` with `hidden` accessibility, hosted the encounter `3001009030170`, which had a `pending` outcome and involved `adaptive-advice-29`. The location `Distributed Cluster` (ID `4`), a `grove` with `open` accessibility, hosted the encounter `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`, which had a `successful` outcome and involved `distributed-advice-30`. This view supports location-level resource planning and accessibility policy evaluation.

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

The view `vw_journey_eligible_individual` links journeys to the eligible individuals who undertook them, providing a travel history for each person. Theodore Mcgrath undertook journey `1000`, which had the purpose `adaptive-purpose-11`, a `planned` status, and covered a distance of `249.44281` units. `Account Name` undertook journey `1001`, with the purpose `distributed-purpose-12`, an `in_progress` status, and a distance of `34.366668701171875` units. The individual at `Saipan International Airport` undertook journey `1002`, with the purpose `baseline-purpose-13`, a `completed` status, and a distance of `256.0` units. Norma Fisher undertook journey `1003`, with the purpose `pilot-purpose-14`, an `abandoned` status, and a distance of `0.07499999` units. This view supports mobility analysis and the assessment of whether journey outcomes correlate with individual eligibility statuses.

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

The view `vw_journey_encounter_detail` connects journeys to the encounters that occurred along them, providing a route-level view of administrative interactions. Journey `1000`, with purpose `adaptive-purpose-11` and status `planned`, is linked to encounters that took place during its duration. Journey `1001`, with purpose `distributed-purpose-12` and status `in_progress`, captures encounters that occurred while the journey was ongoing. Journey `1002`, with purpose `baseline-purpose-13` and status `completed`, includes encounters that were finalized as part of the journey. Journey `1003`, with purpose `pilot-purpose-14` and status `abandoned`, reflects encounters associated with a journey that was terminated early. This view enables the analysis of how encounters are distributed across journey phases and supports the evaluation of whether certain journey statuses correlate with specific encounter outcomes.

The administrative system described by these records forms a coherent framework for royal governance, where authority flows from monarchs through proclamations to eligible individuals, and where encounters and journeys provide the spatial and temporal mechanisms for implementation. The junction tables ensure that the relationships between these entities are flexible and expressive, supporting the complex many-to-many associations that characterize real-world governance. The views synthesize these relationships into analytical perspectives that enable administrators to audit, evaluate, and optimize the system. Together, the base tables, junction tables, and views constitute a comprehensive record of how royal directives are issued, distributed, and enacted across the realm.