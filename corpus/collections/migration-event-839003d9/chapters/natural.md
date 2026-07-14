# Migration Systems and Integration Tracking

The study of human mobility requires a structured approach to recording movement, settlement, and integration. Migration data systems capture the full lifecycle of a person's journey—from departure through arrival, employment, and community engagement—alongside the perspectives of those already established in destination regions. This chapter examines the architecture of such a system, where migration events, migrant profiles, local residents, cities, businesses, and survey responses form an interconnected record of cross-border movement and socioeconomic integration. Each entity carries measurable attributes, from salary levels and language proficiency to perception scores and cost-of-living indices, enabling analysts to trace patterns across geography, employment, and social cohesion.

## Migration Events and Their Records

**Table `migr_migration_events`**

| migration_event_id | event_identifier | arrival_date | departure_country | destination_city | purpose_of_stay | is_transit | city_id |
|---|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2023-02-20 | seasonal-departur-23 | pilot-destinat-62 | baseline-purpose-67 | true | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 |
| 1001 | EVE-2707 | 2024-07-04 | regional-departur-24 | extended-destinat-63 | pilot-purpose-68 | false | level-4 |
| 1002 | EVE-2708 | 2025-12-15 | legacy-departur-25 | integrated-destinat-64 | extended-purpose-69 | true | 3012810 |
| 1003 | EVE-2709 | 2022-05-26 | compact-departur-26 | seasonal-destinat-65 | integrated-purpose-70 | false | 8189488 |

Migration events form the temporal backbone of the system, each representing a discrete instance of cross-border movement. The table `migr_migration_events` stores these occurrences with a unique `migration_event_id`, an `event_identifier` such as EVE-2706 through EVE-2709, and an `arrival_date` spanning from 2022 through 2025. The `departure_country` field uses coded identifiers like seasonal-departur-23 and legacy-departur-25 to classify the origin region, while `destination_city` similarly encodes the receiving area with values such as pilot-destinat-62 and seasonal-destinat-65. The `purpose_of_stay` column captures the stated reason for relocation—baseline-purpose-67, pilot-purpose-68, extended-purpose-69, and integrated-purpose-70 appear across the four recorded events. A boolean `is_transit` flag distinguishes through-movers from those settling permanently; events EVE-2706 and EVE-2708 are marked as transit, whereas EVE-2707 and EVE-2709 indicate direct settlement. Each event is linked to a destination city via `city_id`, connecting the temporal record to geographic context.

## Migrant Profiles and Socioeconomic Attributes

**Table `migr_migrants`**

| migrant_id | nationality | residence_status | employment_type | salary_level | language_proficiency | integration_intent | city_id | business_id |
|---|---|---|---|---|---|---|---|---|
| 1 | composite-national-39 | composite-residenc-39 | adaptive-employme-17 | 12.36 | integrated-language-34 | integrated-integrat-22 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 1 |
| 2 | primary-national-40 | primary-residenc-40 | distributed-employme-18 | 33.06 | seasonal-language-35 | seasonal-integrat-23 | level-4 | 2 |
| 3 | adaptive-national-41 | adaptive-residenc-41 | baseline-employme-19 | 35.57 | regional-language-36 | regional-integrat-24 | 3012810 | 3 |
| 4 | distributed-national-42 | distributed-residenc-42 | pilot-employme-20 | 12.72 | legacy-language-37 | legacy-integrat-25 | 8189488 | 4 |

The `migr_migrants` table documents individual migrants with a rich set of socioeconomic and integration-related attributes. Each migrant carries a numeric `migrant_id` (1 through 4 in the sample), a `nationality` code such as composite-national-39 and primary-national-40, and a `residence_status` like composite-residenc-39 and primary-residenc-40. Employment characteristics include `employment_type` (adaptive-employme-17, distributed-employme-18, baseline-employme-19, pilot-employme-20) and `salary_level`, which ranges from 12.36 to 35.57 across the four records. Language integration is captured through `language_proficiency` with values like integrated-language-34 and seasonal-language-35, while `integration_intent` uses codes such as integrated-integrat-22 and seasonal-integrat-23 to express the migrant's stated commitment to settling. Each migrant is associated with a `city_id` for geographic anchoring and a `business_id` indicating any business affiliation.

## Local Residents and Community Perspectives

**Table `migr_locals`**

| id | local_id | nationality | residence_city | language_proficiency | perception_of_migrants | employment_sector | city_id | business_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844285 | composite-national-39 | seasonal-residenc-65 | integrated-language-34 | integrated-percepti-10 | baseline-employme-67 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 1 |
| 2 | 10445625 | primary-national-40 | regional-residenc-66 | seasonal-language-35 | seasonal-percepti-11 | pilot-employme-68 | level-4 | 2 |
| 3 | 1336198 | adaptive-national-41 | legacy-residenc-67 | regional-language-36 | regional-percepti-12 | extended-employme-69 | 3012810 | 3 |
| 4 | 4985167 | distributed-national-42 | compact-residenc-68 | legacy-language-37 | legacy-percepti-13 | integrated-employme-70 | 8189488 | 4 |

Local residents are recorded in `migr_locals`, providing the community-side perspective on migration dynamics. The table uses a surrogate `id` (1 through 4) alongside a distinct `local_id` (5844285, 10445625, 1336198, 4985167) for each resident. Nationality codes mirror those in the migrant table—composite-national-39 through distributed-national-42—allowing direct comparison between newcomers and established residents. The `residence_city` field uses codes like seasonal-residenc-65 and regional-residenc-66 to denote where each local lives. Language proficiency follows the same coding scheme as migrants (integrated-language-34 through legacy-language-37), and `perception_of_migrants` captures community sentiment with values ranging from integrated-percepti-10 to legacy-percepti-13. Employment sector is recorded as `employment_sector` with codes such as baseline-employme-67 and pilot-employme-68. Each local is linked to a `city_id` and `business_id`, situating them within the broader economic and geographic framework.

## Cities as Destinations

**Table `migr_cities`**

| city_id | city_name | region | population_density | cost_of_living_index |
|---|---|---|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 18 | 25.36 |
| level-4 | Seasonal Programme D | baseline-region-13 | 24 | 11.94 |
| 3012810 | Integrated Standard | pilot-region-14 | 30 | 10.72 |
| 8189488 | Extended Framework | extended-region-15 | 36 | 55.49 |

Cities serve as the geographic anchors for all migration activity. The `migr_cities` table defines four destination locations, each with a `city_id` that appears as a foreign key across multiple tables. The city named Regional Protocol (e5a1c32e-8fc3-11eb-924d-9cd76263cbd0) belongs to distributed-region-12, has a population density of 18, and a cost-of-living index of 25.36. Seasonal Programme D (level-4) sits in baseline-region-13 with a density of 24 and a notably lower cost-of-living index of 11.94. Integrated Standard (3012810) in pilot-region-14 shows a density of 30 and the lowest cost-of-living at 10.72. Extended Framework (8189488) in extended-region-15 has the highest density at 36 and the highest cost-of-living index at 55.49, suggesting a premium urban environment. These indices provide essential context for interpreting migrant salary levels and integration outcomes.

## Businesses and Economic Integration

**Table `migr_businesses`**

| id | business_id | business_name | business_type | target_clientele | establishment_date | operating_status | migrant_id | city_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D | primary-business-46 | regional-target-90 | 2024-07-11 | adaptive-operatin-23 | 1 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 |
| 2 | StasStaStS | Distributed Programme | adaptive-business-47 | legacy-target-91 | 2025-12-22 | distributed-operatin-24 | 2 | level-4 |
| 3 | 3990175 | Adaptive Standard | distributed-business-48 | compact-target-92 | 2022-05-06 | baseline-operatin-25 | 3 | 3012810 |
| 4 | 14484998 | Primary Framework A | baseline-business-49 | composite-target-93 | 2023-10-17 | pilot-operatin-26 | 4 | 8189488 |

Businesses represent the economic dimension of migration, often serving as points of employment and entrepreneurial activity for newcomers. The `migr_businesses` table records each enterprise with a surrogate `id`, a `business_id` (such as 3122ef58d8b44fb197236734beef7b29 and StasStaStS), and a `business_name` like Baseline Protocol D and Distributed Programme. Business types are coded as primary-business-46, adaptive-business-47, distributed-business-48, and baseline-business-49, while `target_clientele` uses regional-target-90 through composite-target-93 to describe the intended market. Establishment dates range from 2022-05-06 to 2025-12-22, and `operating_status` codes include adaptive-operatin-23, distributed-operatin-24, baseline-operatin-25, and pilot-operatin-26. Each business is linked to a `migrant_id`, indicating migrant ownership or primary employment, and a `city_id` for geographic placement.

## Survey Responses and Measurement

**Table `migr_survey_responses`**

| id | response_id | survey_date | respondent_type | perception_score | integration_assessment | language_barrier_perception | local_id | migrant_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23 | baseline-responde-49 | 37 | integrated-integrat-40 | false | 1 | 1 |
| 101 | 9736917 | 2025-12-07 | pilot-responde-50 | 43 | seasonal-integrat-41 | true | 2 | 2 |
| 102 | 8189493 | 2022-05-18 | extended-responde-51 | 49 | regional-integrat-42 | false | 3 | 3 |
| 103 | Invoice | 2023-10-02 | integrated-responde-52 | 55 | legacy-integrat-43 | true | 4 | 4 |

Survey responses provide quantitative and qualitative measurements of integration outcomes. The `migr_survey_responses` table stores each response with a surrogate `id` (100 through 103), a `response_id` that includes identifiers like ChIJr7cItPtt5kcRM6ry7ecIYgw and 9736917, and a `survey_date` spanning 2022 through 2025. The `respondent_type` field distinguishes between baseline-responde-49, pilot-responde-50, extended-responde-51, and integrated-responde-52. The `perception_score` is a numeric measure ranging from 37 to 55, offering a quantifiable indicator of community sentiment. Integration assessment uses codes such as integrated-integrat-40 and seasonal-integrat-41, while `language_barrier_perception` is a boolean flag—false for responses 100 and 102, true for 101 and 103. Each survey response is linked to both a `local_id` and a `migrant_id`, enabling paired analysis of community and migrant perspectives.

## Relational Tables and Cross-References

The system employs dedicated junction tables to manage the many-to-many and one-to-many relationships between core entities. The `migr_migration_eventsMigrant` and `migr_migrantsMigrationEvent` tables establish the linkage between migration events and individual migrants, allowing a single event to be associated with multiple migrants and vice versa. These dual tables support bidirectional queries: one can trace which migrants participated in a given event, or identify all events associated with a particular migrant.

**Table `migr_migration_eventsMigrant`**

| migration_event_id | migrant_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `migr_migrantsMigrationEvent`**

| migrant_id | migration_event_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `migr_migrantsLocal` and `migr_localsMigrant` tables connect migrants with local residents, facilitating analysis of community-migrant interactions. These tables enable researchers to examine how specific locals relate to specific migrants, supporting paired survey analysis and social network studies.

**Table `migr_migrantsLocal`**

| migrant_id | local_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `migr_localsMigrant`**

| local_id | migrant_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

City-to-migrant and city-to-local relationships are managed through `migr_citiesMigrant` and `migr_citiesLocal`, which record which migrants and locals are associated with each destination city. These tables support geographic aggregation and regional comparison.

**Table `migr_citiesMigrant`**

| city_id | migrant_id |
|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 1 |
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2 |
| level-4 | 2 |
| level-4 | 3 |
| 3012810 | 3 |
| 3012810 | 4 |
| 8189488 | 4 |
| 8189488 | 1 |

**Table `migr_citiesLocal`**

| city_id | local_id |
|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 1 |
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2 |
| level-4 | 2 |
| level-4 | 3 |
| 3012810 | 3 |
| 3012810 | 4 |
| 8189488 | 4 |
| 8189488 | 1 |

The `migr_citiesBusiness` table links businesses to cities, providing the geographic dimension for economic analysis. Meanwhile, `migr_businessesLocal` connects local residents to businesses, capturing employment and commercial relationships within the community.

**Table `migr_citiesBusiness`**

| city_id | business_id |
|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 1 |
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2 |
| level-4 | 2 |
| level-4 | 3 |
| 3012810 | 3 |
| 3012810 | 4 |
| 8189488 | 4 |
| 8189488 | 1 |

**Table `migr_businessesLocal`**

| business_id | local_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Finally, `migr_survey_responsesMigrant` ties survey responses to migrants, completing the measurement loop by connecting community assessments to individual migrant profiles.

**Table `migr_survey_responsesMigrant`**

| survey_response_id | migrant_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

## Migration Event Views

The view `v_migration_event_city` answers the question of which cities serve as destinations for migration events, joining event records with city metadata to produce a geographic summary. A row from this view might show event EVE-2706 arriving at Regional Protocol in distributed-region-12, with a cost-of-living index of 25.36 and population density of 18.

**View `v_migration_event_city`**

```sql
CREATE VIEW v_migration_event_city AS
SELECT a.migration_event_id, a.event_identifier, a.arrival_date, a.departure_country, b.city_id AS city_city_id, b.city_name AS city_city_name, b.region AS city_region
FROM migr_migration_events a JOIN migr_cities b ON a.city_id = b.city_id;
```

| migration_event_id | event_identifier | arrival_date | departure_country | city_city_id | city_city_name | city_region |
|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2023-02-20 | seasonal-departur-23 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 |
| 1001 | EVE-2707 | 2024-07-04 | regional-departur-24 | level-4 | Seasonal Programme D | baseline-region-13 |
| 1002 | EVE-2708 | 2025-12-15 | legacy-departur-25 | 3012810 | Integrated Standard | pilot-region-14 |
| 1003 | EVE-2709 | 2022-05-26 | compact-departur-26 | 8189488 | Extended Framework | extended-region-15 |

The view `v_migration_event_migrant_detail` enriches migration events with migrant-level information, answering which individuals participated in each recorded event. A representative row could pair event EVE-2707 with a migrant holding primary-residenc-40 status, employed in distributed-employme-18 with a salary level of 33.06.

**View `v_migration_event_migrant_detail`**

```sql
CREATE VIEW v_migration_event_migrant_detail AS
SELECT a.migration_event_id, a.event_identifier, a.arrival_date, b.migrant_id AS migrant_migrant_id, b.nationality AS migrant_nationality, b.residence_status AS migrant_residence_status
FROM migr_migration_events a
  JOIN migr_migration_eventsMigrant j ON j.migration_event_id = a.migration_event_id
  JOIN migr_migrants b ON b.migrant_id = j.migrant_id;
```

| migration_event_id | event_identifier | arrival_date | migrant_migrant_id | migrant_nationality | migrant_residence_status |
|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2023-02-20 | 1 | composite-national-39 | composite-residenc-39 |
| 1000 | EVE-2706 | 2023-02-20 | 2 | primary-national-40 | primary-residenc-40 |
| 1001 | EVE-2707 | 2024-07-04 | 2 | primary-national-40 | primary-residenc-40 |
| 1001 | EVE-2707 | 2024-07-04 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 1002 | EVE-2708 | 2025-12-15 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 1002 | EVE-2708 | 2025-12-15 | 4 | distributed-national-42 | distributed-residenc-42 |
| 1003 | EVE-2709 | 2022-05-26 | 4 | distributed-national-42 | distributed-residenc-42 |
| 1003 | EVE-2709 | 2022-05-26 | 1 | composite-national-39 | composite-residenc-39 |

Conversely, `v_migrant_migration_event_detail` presents the same joined data from the migrant's perspective, showing each migrant's associated events. A row might display migrant 2 (primary-national-40) alongside event EVE-2707, revealing the bidirectional nature of the relationship.

**View `v_migrant_migration_event_detail`**

```sql
CREATE VIEW v_migrant_migration_event_detail AS
SELECT a.migrant_id, a.nationality, a.residence_status, b.migration_event_id AS event_migration_event_id, b.event_identifier AS event_event_identifier, b.arrival_date AS event_arrival_date
FROM migr_migrants a
  JOIN migr_migrantsMigrationEvent j ON j.migrant_id = a.migrant_id
  JOIN migr_migration_events b ON b.migration_event_id = j.migration_event_id;
```

| migrant_id | nationality | residence_status | event_migration_event_id | event_event_identifier | event_arrival_date |
|---|---|---|---|---|---|
| 1 | composite-national-39 | composite-residenc-39 | 1000 | EVE-2706 | 2023-02-20 |
| 1 | composite-national-39 | composite-residenc-39 | 1001 | EVE-2707 | 2024-07-04 |
| 2 | primary-national-40 | primary-residenc-40 | 1001 | EVE-2707 | 2024-07-04 |
| 2 | primary-national-40 | primary-residenc-40 | 1002 | EVE-2708 | 2025-12-15 |
| 3 | adaptive-national-41 | adaptive-residenc-41 | 1002 | EVE-2708 | 2025-12-15 |
| 3 | adaptive-national-41 | adaptive-residenc-41 | 1003 | EVE-2709 | 2022-05-26 |
| 4 | distributed-national-42 | distributed-residenc-42 | 1003 | EVE-2709 | 2022-05-26 |
| 4 | distributed-national-42 | distributed-residenc-42 | 1000 | EVE-2706 | 2023-02-20 |

## Migrant-Centric Views

The view `v_migrant_city` provides a geographic profile of each migrant, joining migrant records with their destination city's attributes. A row could show migrant 3 (adaptive-national-41) residing in Integrated Standard (3012810), a city in pilot-region-14 with a cost-of-living index of 10.72.

**View `v_migrant_city`**

```sql
CREATE VIEW v_migrant_city AS
SELECT a.migrant_id, a.nationality, a.residence_status, a.employment_type, b.city_id AS city_city_id, b.city_name AS city_city_name, b.region AS city_region
FROM migr_migrants a JOIN migr_cities b ON a.city_id = b.city_id;
```

| migrant_id | nationality | residence_status | employment_type | city_city_id | city_city_name | city_region |
|---|---|---|---|---|---|---|
| 1 | composite-national-39 | composite-residenc-39 | adaptive-employme-17 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 |
| 2 | primary-national-40 | primary-residenc-40 | distributed-employme-18 | level-4 | Seasonal Programme D | baseline-region-13 |
| 3 | adaptive-national-41 | adaptive-residenc-41 | baseline-employme-19 | 3012810 | Integrated Standard | pilot-region-14 |
| 4 | distributed-national-42 | distributed-residenc-42 | pilot-employme-20 | 8189488 | Extended Framework | extended-region-15 |

The view `v_migrant_business` links migrants to their associated businesses, answering which enterprises are connected to each migrant profile. A row might pair migrant 1 with Baseline Protocol D (3122ef58d8b44fb197236734beef7b29), a primary-business-46 type targeting regional-target-90 clientele.

**View `v_migrant_business`**

```sql
CREATE VIEW v_migrant_business AS
SELECT a.migrant_id, a.nationality, a.residence_status, a.employment_type, b.id AS business_id, b.business_id AS business_business_id, b.business_name AS business_business_name
FROM migr_migrants a JOIN migr_businesses b ON a.business_id = b.id;
```

| migrant_id | nationality | residence_status | employment_type | business_id | business_business_id | business_business_name |
|---|---|---|---|---|---|---|
| 1 | composite-national-39 | composite-residenc-39 | adaptive-employme-17 | 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D |
| 2 | primary-national-40 | primary-residenc-40 | distributed-employme-18 | 2 | StasStaStS | Distributed Programme |
| 3 | adaptive-national-41 | adaptive-residenc-41 | baseline-employme-19 | 3 | 3990175 | Adaptive Standard |
| 4 | distributed-national-42 | distributed-residenc-42 | pilot-employme-20 | 4 | 14484998 | Primary Framework A |

The view `v_migrant_local_detail` connects migrants with local residents, enabling analysis of community-migrant pairings. A row could show migrant 4 (distributed-national-42) alongside local 4985167 (distributed-national-42), both sharing the same nationality code and residing in the same city (8189488).

**View `v_migrant_local_detail`**

```sql
CREATE VIEW v_migrant_local_detail AS
SELECT a.migrant_id, a.nationality, a.residence_status, b.id AS local_id, b.local_id AS local_local_id, b.nationality AS local_nationality
FROM migr_migrants a
  JOIN migr_migrantsLocal j ON j.migrant_id = a.migrant_id
  JOIN migr_locals b ON b.id = j.local_id;
```

| migrant_id | nationality | residence_status | local_id | local_local_id | local_nationality |
|---|---|---|---|---|---|
| 1 | composite-national-39 | composite-residenc-39 | 1 | 5844285 | composite-national-39 |
| 1 | composite-national-39 | composite-residenc-39 | 2 | 10445625 | primary-national-40 |
| 2 | primary-national-40 | primary-residenc-40 | 2 | 10445625 | primary-national-40 |
| 2 | primary-national-40 | primary-residenc-40 | 3 | 1336198 | adaptive-national-41 |
| 3 | adaptive-national-41 | adaptive-residenc-41 | 3 | 1336198 | adaptive-national-41 |
| 3 | adaptive-national-41 | adaptive-residenc-41 | 4 | 4985167 | distributed-national-42 |
| 4 | distributed-national-42 | distributed-residenc-42 | 4 | 4985167 | distributed-national-42 |
| 4 | distributed-national-42 | distributed-residenc-42 | 1 | 5844285 | composite-national-39 |

## Local-Centric Views

The view `v_local_migrant_detail` presents the local perspective on migrant relationships, joining local resident records with their associated migrant profiles. A row might display local 5844285 (composite-national-39) alongside migrant 1, both sharing the same nationality and residence city (e5a1c32e-8fc3-11eb-924d-9cd76263cbd0).

**View `v_local_migrant_detail`**

```sql
CREATE VIEW v_local_migrant_detail AS
SELECT a.id, a.local_id, a.nationality, b.migrant_id AS migrant_migrant_id, b.nationality AS migrant_nationality, b.residence_status AS migrant_residence_status
FROM migr_locals a
  JOIN migr_localsMigrant j ON j.local_id = a.id
  JOIN migr_migrants b ON b.migrant_id = j.migrant_id;
```

| id | local_id | nationality | migrant_migrant_id | migrant_nationality | migrant_residence_status |
|---|---|---|---|---|---|
| 1 | 5844285 | composite-national-39 | 1 | composite-national-39 | composite-residenc-39 |
| 1 | 5844285 | composite-national-39 | 2 | primary-national-40 | primary-residenc-40 |
| 2 | 10445625 | primary-national-40 | 2 | primary-national-40 | primary-residenc-40 |
| 2 | 10445625 | primary-national-40 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 3 | 1336198 | adaptive-national-41 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 3 | 1336198 | adaptive-national-41 | 4 | distributed-national-42 | distributed-residenc-42 |
| 4 | 4985167 | distributed-national-42 | 4 | distributed-national-42 | distributed-residenc-42 |
| 4 | 4985167 | distributed-national-42 | 1 | composite-national-39 | composite-residenc-39 |

The view `v_local_city` provides geographic context for local residents, joining their records with destination city data. A row could show local 2 (10445625) residing in Seasonal Programme D (level-4), a baseline-region-13 location with a cost-of-living index of 11.94.

**View `v_local_city`**

```sql
CREATE VIEW v_local_city AS
SELECT a.id, a.local_id, a.nationality, a.residence_city, b.city_id AS city_city_id, b.city_name AS city_city_name, b.region AS city_region
FROM migr_locals a JOIN migr_cities b ON a.city_id = b.city_id;
```

| id | local_id | nationality | residence_city | city_city_id | city_city_name | city_region |
|---|---|---|---|---|---|---|
| 1 | 5844285 | composite-national-39 | seasonal-residenc-65 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 |
| 2 | 10445625 | primary-national-40 | regional-residenc-66 | level-4 | Seasonal Programme D | baseline-region-13 |
| 3 | 1336198 | adaptive-national-41 | legacy-residenc-67 | 3012810 | Integrated Standard | pilot-region-14 |
| 4 | 4985167 | distributed-national-42 | compact-residenc-68 | 8189488 | Extended Framework | extended-region-15 |

The view `v_local_business` links local residents to businesses, capturing employment and commercial relationships. A row might pair local 3 (1336198) with business 3 (3990175), an adaptive-standard enterprise of type distributed-business-48.

**View `v_local_business`**

```sql
CREATE VIEW v_local_business AS
SELECT a.id, a.local_id, a.nationality, a.residence_city, b.id AS business_id, b.business_id AS business_business_id, b.business_name AS business_business_name
FROM migr_locals a JOIN migr_businesses b ON a.business_id = b.id;
```

| id | local_id | nationality | residence_city | business_id | business_business_id | business_business_name |
|---|---|---|---|---|---|---|
| 1 | 5844285 | composite-national-39 | seasonal-residenc-65 | 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D |
| 2 | 10445625 | primary-national-40 | regional-residenc-66 | 2 | StasStaStS | Distributed Programme |
| 3 | 1336198 | adaptive-national-41 | legacy-residenc-67 | 3 | 3990175 | Adaptive Standard |
| 4 | 4985167 | distributed-national-42 | compact-residenc-68 | 4 | 14484998 | Primary Framework A |

## City-Centric Views

The view `v_city_migrant_detail` aggregates migrant information by destination city, answering which migrants are associated with each location. A row could show city e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 (Regional Protocol) alongside migrant 1 (composite-national-39), providing a city-level summary of migrant composition.

**View `v_city_migrant_detail`**

```sql
CREATE VIEW v_city_migrant_detail AS
SELECT a.city_id, a.city_name, a.region, b.migrant_id AS migrant_migrant_id, b.nationality AS migrant_nationality, b.residence_status AS migrant_residence_status
FROM migr_cities a
  JOIN migr_citiesMigrant j ON j.city_id = a.city_id
  JOIN migr_migrants b ON b.migrant_id = j.migrant_id;
```

| city_id | city_name | region | migrant_migrant_id | migrant_nationality | migrant_residence_status |
|---|---|---|---|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 1 | composite-national-39 | composite-residenc-39 |
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 2 | primary-national-40 | primary-residenc-40 |
| level-4 | Seasonal Programme D | baseline-region-13 | 2 | primary-national-40 | primary-residenc-40 |
| level-4 | Seasonal Programme D | baseline-region-13 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 3012810 | Integrated Standard | pilot-region-14 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 3012810 | Integrated Standard | pilot-region-14 | 4 | distributed-national-42 | distributed-residenc-42 |
| 8189488 | Extended Framework | extended-region-15 | 4 | distributed-national-42 | distributed-residenc-42 |
| 8189488 | Extended Framework | extended-region-15 | 1 | composite-national-39 | composite-residenc-39 |

The view `v_city_local_detail` performs the same aggregation for local residents, showing which locals are associated with each city. A row might display city level-4 (Seasonal Programme D) alongside local 2 (10445625), revealing the local population profile of that destination.

**View `v_city_local_detail`**

```sql
CREATE VIEW v_city_local_detail AS
SELECT a.city_id, a.city_name, a.region, b.id AS local_id, b.local_id AS local_local_id, b.nationality AS local_nationality
FROM migr_cities a
  JOIN migr_citiesLocal j ON j.city_id = a.city_id
  JOIN migr_locals b ON b.id = j.local_id;
```

| city_id | city_name | region | local_id | local_local_id | local_nationality |
|---|---|---|---|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 1 | 5844285 | composite-national-39 |
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 2 | 10445625 | primary-national-40 |
| level-4 | Seasonal Programme D | baseline-region-13 | 2 | 10445625 | primary-national-40 |
| level-4 | Seasonal Programme D | baseline-region-13 | 3 | 1336198 | adaptive-national-41 |
| 3012810 | Integrated Standard | pilot-region-14 | 3 | 1336198 | adaptive-national-41 |
| 3012810 | Integrated Standard | pilot-region-14 | 4 | 4985167 | distributed-national-42 |
| 8189488 | Extended Framework | extended-region-15 | 4 | 4985167 | distributed-national-42 |
| 8189488 | Extended Framework | extended-region-15 | 1 | 5844285 | composite-national-39 |

The view `v_city_business_detail` links cities to their associated businesses, providing an economic profile of each destination. A row could show city 8189488 (Extended Framework) alongside business 4 (14484998), a primary-framework enterprise of type baseline-business-49.

**View `v_city_business_detail`**

```sql
CREATE VIEW v_city_business_detail AS
SELECT a.city_id, a.city_name, a.region, b.id AS business_id, b.business_id AS business_business_id, b.business_name AS business_business_name
FROM migr_cities a
  JOIN migr_citiesBusiness j ON j.city_id = a.city_id
  JOIN migr_businesses b ON b.id = j.business_id;
```

| city_id | city_name | region | business_id | business_business_id | business_business_name |
|---|---|---|---|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D |
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 2 | StasStaStS | Distributed Programme |
| level-4 | Seasonal Programme D | baseline-region-13 | 2 | StasStaStS | Distributed Programme |
| level-4 | Seasonal Programme D | baseline-region-13 | 3 | 3990175 | Adaptive Standard |
| 3012810 | Integrated Standard | pilot-region-14 | 3 | 3990175 | Adaptive Standard |
| 3012810 | Integrated Standard | pilot-region-14 | 4 | 14484998 | Primary Framework A |
| 8189488 | Extended Framework | extended-region-15 | 4 | 14484998 | Primary Framework A |
| 8189488 | Extended Framework | extended-region-15 | 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D |

## Business-Centric Views

The view `v_business_migrant` connects businesses to their associated migrants, answering which migrants are linked to each enterprise. A row might pair business StasStaStS (id 2) with migrant 2 (primary-national-40), showing the migrant-business relationship from the enterprise's perspective.

**View `v_business_migrant`**

```sql
CREATE VIEW v_business_migrant AS
SELECT a.id, a.business_id, a.business_name, a.business_type, b.migrant_id AS migrant_migrant_id, b.nationality AS migrant_nationality, b.residence_status AS migrant_residence_status
FROM migr_businesses a JOIN migr_migrants b ON a.migrant_id = b.migrant_id;
```

| id | business_id | business_name | business_type | migrant_migrant_id | migrant_nationality | migrant_residence_status |
|---|---|---|---|---|---|---|
| 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D | primary-business-46 | 1 | composite-national-39 | composite-residenc-39 |
| 2 | StasStaStS | Distributed Programme | adaptive-business-47 | 2 | primary-national-40 | primary-residenc-40 |
| 3 | 3990175 | Adaptive Standard | distributed-business-48 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 4 | 14484998 | Primary Framework A | baseline-business-49 | 4 | distributed-national-42 | distributed-residenc-42 |

The view `v_business_city` provides geographic context for businesses, joining business records with their destination city data. A row could show business 3122ef58d8b44fb197236734beef7b29 (Baseline Protocol D) located in city e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 (Regional Protocol), a distributed-region-12 location.

**View `v_business_city`**

```sql
CREATE VIEW v_business_city AS
SELECT a.id, a.business_id, a.business_name, a.business_type, b.city_id AS city_city_id, b.city_name AS city_city_name, b.region AS city_region
FROM migr_businesses a JOIN migr_cities b ON a.city_id = b.city_id;
```

| id | business_id | business_name | business_type | city_city_id | city_city_name | city_region |
|---|---|---|---|---|---|---|
| 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D | primary-business-46 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 |
| 2 | StasStaStS | Distributed Programme | adaptive-business-47 | level-4 | Seasonal Programme D | baseline-region-13 |
| 3 | 3990175 | Adaptive Standard | distributed-business-48 | 3012810 | Integrated Standard | pilot-region-14 |
| 4 | 14484998 | Primary Framework A | baseline-business-49 | 8189488 | Extended Framework | extended-region-15 |

The view `v_business_local_detail` links businesses to local residents, capturing the employment and commercial relationships within each enterprise. A row might pair business 3 (3990175) with local 3 (1336198), both associated with city 3012810 (Integrated Standard).

**View `v_business_local_detail`**

```sql
CREATE VIEW v_business_local_detail AS
SELECT a.id, a.business_id, a.business_name, b.id AS local_id, b.local_id AS local_local_id, b.nationality AS local_nationality
FROM migr_businesses a
  JOIN migr_businessesLocal j ON j.business_id = a.id
  JOIN migr_locals b ON b.id = j.local_id;
```

| id | business_id | business_name | local_id | local_local_id | local_nationality |
|---|---|---|---|---|---|
| 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D | 1 | 5844285 | composite-national-39 |
| 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D | 2 | 10445625 | primary-national-40 |
| 2 | StasStaStS | Distributed Programme | 2 | 10445625 | primary-national-40 |
| 2 | StasStaStS | Distributed Programme | 3 | 1336198 | adaptive-national-41 |
| 3 | 3990175 | Adaptive Standard | 3 | 1336198 | adaptive-national-41 |
| 3 | 3990175 | Adaptive Standard | 4 | 4985167 | distributed-national-42 |
| 4 | 14484998 | Primary Framework A | 4 | 4985167 | distributed-national-42 |
| 4 | 14484998 | Primary Framework A | 1 | 5844285 | composite-national-39 |

## Survey Response Views

The view `v_survey_response_local` joins survey responses with local resident data, answering which locals provided each response and what their demographic profile is. A row could show response ChIJr7cItPtt5kcRM6ry7ecIYgw (id 100) from local 5844285, a composite-national-39 resident with perception score 37.

**View `v_survey_response_local`**

```sql
CREATE VIEW v_survey_response_local AS
SELECT a.id, a.response_id, a.survey_date, a.respondent_type, b.id AS local_id, b.local_id AS local_local_id, b.nationality AS local_nationality
FROM migr_survey_responses a JOIN migr_locals b ON a.local_id = b.id;
```

| id | response_id | survey_date | respondent_type | local_id | local_local_id | local_nationality |
|---|---|---|---|---|---|---|
| 100 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23 | baseline-responde-49 | 1 | 5844285 | composite-national-39 |
| 101 | 9736917 | 2025-12-07 | pilot-responde-50 | 2 | 10445625 | primary-national-40 |
| 102 | 8189493 | 2022-05-18 | extended-responde-51 | 3 | 1336198 | adaptive-national-41 |
| 103 | Invoice | 2023-10-02 | integrated-responde-52 | 4 | 4985167 | distributed-national-42 |

The view `v_survey_response_migrant` connects survey responses to migrant profiles, enabling analysis of how migrant characteristics relate to survey outcomes. A row might pair response 9736917 (id 101) with migrant 2 (primary-national-40), showing the migrant's employment type (distributed-employme-18) alongside the survey's perception score of 43.

**View `v_survey_response_migrant`**

```sql
CREATE VIEW v_survey_response_migrant AS
SELECT a.id, a.response_id, a.survey_date, a.respondent_type, b.migrant_id AS migrant_migrant_id, b.nationality AS migrant_nationality, b.residence_status AS migrant_residence_status
FROM migr_survey_responses a JOIN migr_migrants b ON a.migrant_id = b.migrant_id;
```

| id | response_id | survey_date | respondent_type | migrant_migrant_id | migrant_nationality | migrant_residence_status |
|---|---|---|---|---|---|---|
| 100 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23 | baseline-responde-49 | 1 | composite-national-39 | composite-residenc-39 |
| 101 | 9736917 | 2025-12-07 | pilot-responde-50 | 2 | primary-national-40 | primary-residenc-40 |
| 102 | 8189493 | 2022-05-18 | extended-responde-51 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 103 | Invoice | 2023-10-02 | integrated-responde-52 | 4 | distributed-national-42 | distributed-residenc-42 |

The view `v_survey_response_migrant_detail` provides the most comprehensive survey analysis, joining survey responses with both local and migrant data. A representative row could display response 8189493 (id 102) from local 1336198 (adaptive-national-41) alongside migrant 3 (adaptive-national-41), both sharing the same nationality code, with a perception score of 49 and integration assessment of regional-integrat-42.

**View `v_survey_response_migrant_detail`**

```sql
CREATE VIEW v_survey_response_migrant_detail AS
SELECT a.id, a.response_id, a.survey_date, b.migrant_id AS migrant_migrant_id, b.nationality AS migrant_nationality, b.residence_status AS migrant_residence_status
FROM migr_survey_responses a
  JOIN migr_survey_responsesMigrant j ON j.survey_response_id = a.id
  JOIN migr_migrants b ON b.migrant_id = j.migrant_id;
```

| id | response_id | survey_date | migrant_migrant_id | migrant_nationality | migrant_residence_status |
|---|---|---|---|---|---|
| 100 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23 | 1 | composite-national-39 | composite-residenc-39 |
| 100 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23 | 2 | primary-national-40 | primary-residenc-40 |
| 101 | 9736917 | 2025-12-07 | 2 | primary-national-40 | primary-residenc-40 |
| 101 | 9736917 | 2025-12-07 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 102 | 8189493 | 2022-05-18 | 3 | adaptive-national-41 | adaptive-residenc-41 |
| 102 | 8189493 | 2022-05-18 | 4 | distributed-national-42 | distributed-residenc-42 |
| 103 | Invoice | 2023-10-02 | 4 | distributed-national-42 | distributed-residenc-42 |
| 103 | Invoice | 2023-10-02 | 1 | composite-national-39 | composite-residenc-39 |

## Synthesis

The migration data system presents a multidimensional view of human mobility, where migration events anchor the temporal record, migrants and locals provide the human dimension, cities offer geographic context, businesses capture economic integration, and survey responses deliver measurable outcomes. The junction tables ensure that relationships between these entities are explicit and queryable, while the views provide pre-joined perspectives that answer specific analytical questions—from which cities attract the most migrants to how perception scores vary by respondent type. Together, these tables and views form a coherent framework for studying migration patterns, integration outcomes, and community dynamics, enabling practitioners to trace the full arc of migration from departure through settlement and beyond.