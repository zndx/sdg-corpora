## Relational Modelling of the Migration Domain

The migration domain captures the interplay between people in transit, settled residents, host cities, and the businesses that emerge from these movements. At its core, the model distinguishes five entity types: migration events, migrants, locals, cities, and businesses, with survey responses recording perceptions that bridge the human actors. Each entity materialises as a base table whose primary key anchors a set of descriptive columns, while the relationships between them—many-to-many associations, optional one-to-many links, and cross-entity observations—are expressed through foreign keys and dedicated junction tables. The resulting normalised schema supports a family of twelve views that reconstruct domain facts by joining the appropriate tables, answering questions about which migrants attended which events, how locals and businesses cluster within cities, and what the survey data reveals about integration outcomes.

**Table `migr_migration_events`**

| migration_event_id | event_identifier | arrival_date | departure_country | destination_city | purpose_of_stay | is_transit | city_id |
|---|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | 2023-02-20 | seasonal-departur-23 | pilot-destinat-62 | baseline-purpose-67 | true | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 |
| 1001 | EVE-2707 | 2024-07-04 | regional-departur-24 | extended-destinat-63 | pilot-purpose-68 | false | level-4 |
| 1002 | EVE-2708 | 2025-12-15 | legacy-departur-25 | integrated-destinat-64 | extended-purpose-69 | true | 3012810 |
| 1003 | EVE-2709 | 2022-05-26 | compact-departur-26 | seasonal-destinat-65 | integrated-purpose-70 | false | 8189488 |

The `migr_migration_events` table records discrete migration events, each identified by a surrogate `migration_event_id` (e.g. `1000`, `1001`) and a human-readable `event_identifier` such as `EVE-2706`. The `arrival_date` column stores the date of arrival as a `DATE` value (`2023-02-20`, `2024-07-04`), while `departure_country` and `destination_city` capture the origin and destination labels in a denormalised fashion (`seasonal-departur-23`, `pilot-destinat-62`). The `purpose_of_stay` column encodes the reason for migration (`baseline-purpose-67`, `pilot-purpose-68`), and `is_transit` is a boolean flag indicating whether the event is a transit stop (`true` for event `1000`, `false` for event `1001`). The foreign key `city_id` links each event to a row in `migr_cities`, anchoring the event geographically. For instance, event `1000` references city `e5a1c32e-8fc3-11eb-924d-9cd76263cbd0` (Regional Protocol), while event `1001` references `level-4` (Seasonal Programme D).

**Table `migr_migrants`**

| migrant_id | nationality | residence_status | employment_type | salary_level | language_proficiency | integration_intent | city_id | business_id |
|---|---|---|---|---|---|---|---|---|
| 1 | composite-national-39 | composite-residenc-39 | adaptive-employme-17 | 12.36 | integrated-language-34 | integrated-integrat-22 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 1 |
| 2 | primary-national-40 | primary-residenc-40 | distributed-employme-18 | 33.06 | seasonal-language-35 | seasonal-integrat-23 | level-4 | 2 |
| 3 | adaptive-national-41 | adaptive-residenc-41 | baseline-employme-19 | 35.57 | regional-language-36 | regional-integrat-24 | 3012810 | 3 |
| 4 | distributed-national-42 | distributed-residenc-42 | pilot-employme-20 | 12.72 | legacy-language-37 | legacy-integrat-25 | 8189488 | 4 |

Migrants are described in `migr_migrants`, a table keyed by `migrant_id` (`1`, `2`, `3`, `4`). Each row carries demographic and socioeconomic attributes: `nationality` (`composite-national-39`, `primary-national-40`), `residence_status` (`composite-residenc-39`, `primary-residenc-40`), `employment_type` (`adaptive-employme-17`, `distributed-employme-18`), and `salary_level` as a numeric (`12.36`, `33.06`). The `language_proficiency` column records language skill (`integrated-language-34`, `seasonal-language-35`), and `integration_intent` captures the migrant's stated intent (`integrated-integrat-22`, `seasonal-integrat-23`). Two foreign keys anchor the migrant to the wider schema: `city_id` references `migr_cities.city_id`, and `business_id` references `migr_businesses.id`. Migrant `1` is associated with city `e5a1c32e-8fc3-11eb-924d-9cd76263cbd0` and business `1`; migrant `2` with city `level-4` and business `2`.

**Table `migr_locals`**

| id | local_id | nationality | residence_city | language_proficiency | perception_of_migrants | employment_sector | city_id | business_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5844285 | composite-national-39 | seasonal-residenc-65 | integrated-language-34 | integrated-percepti-10 | baseline-employme-67 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 1 |
| 2 | 10445625 | primary-national-40 | regional-residenc-66 | seasonal-language-35 | seasonal-percepti-11 | pilot-employme-68 | level-4 | 2 |
| 3 | 1336198 | adaptive-national-41 | legacy-residenc-67 | regional-language-36 | regional-percepti-12 | extended-employme-69 | 3012810 | 3 |
| 4 | 4985167 | distributed-national-42 | compact-residenc-68 | legacy-language-37 | legacy-percepti-13 | integrated-employme-70 | 8189488 | 4 |

The `migr_locals` table mirrors the migrant profile with its own surrogate key `id` (`1`, `2`, `3`, `4`) and a secondary `local_id` (`5844285`, `10445625`, `1336198`, `4985167`). Columns include `nationality` (`composite-national-39`, `primary-national-40`), `residence_city` (`seasonal-residenc-65`, `regional-residenc-66`), `language_proficiency` (`integrated-language-34`, `seasonal-language-35`), `perception_of_migrants` (`integrated-percepti-10`, `seasonal-percepti-11`), and `employment_sector` (`baseline-employme-67`, `pilot-employme-68`). Foreign keys `city_id` and `business_id` link each local to a city and a business respectively, establishing the same geographic and economic anchors as the migrant table.

**Table `migr_cities`**

| city_id | city_name | region | population_density | cost_of_living_index |
|---|---|---|---|---|
| e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | Regional Protocol | distributed-region-12 | 18 | 25.36 |
| level-4 | Seasonal Programme D | baseline-region-13 | 24 | 11.94 |
| 3012810 | Integrated Standard | pilot-region-14 | 30 | 10.72 |
| 8189488 | Extended Framework | extended-region-15 | 36 | 55.49 |

`migr_cities` is the geographic master table, keyed by `city_id` (a UUID or string identifier). Columns `city_name` (`Regional Protocol`, `Seasonal Programme D`, `Integrated Standard`, `Extended Framework`), `region` (`distributed-region-12`, `baseline-region-13`), `population_density` (an integer: `18`, `24`, `30`, `36`), and `cost_of_living_index` (a decimal: `25.36`, `11.94`, `10.72`, `55.49`) provide the urban context. This table is referenced by foreign keys in `migr_migration_events`, `migr_migrants`, `migr_locals`, `migr_businesses`, and several junction tables.

**Table `migr_businesses`**

| id | business_id | business_name | business_type | target_clientele | establishment_date | operating_status | migrant_id | city_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3122ef58d8b44fb197236734beef7b29 | Baseline Protocol D | primary-business-46 | regional-target-90 | 2024-07-11 | adaptive-operatin-23 | 1 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 |
| 2 | StasStaStS | Distributed Programme | adaptive-business-47 | legacy-target-91 | 2025-12-22 | distributed-operatin-24 | 2 | level-4 |
| 3 | 3990175 | Adaptive Standard | distributed-business-48 | compact-target-92 | 2022-05-06 | baseline-operatin-25 | 3 | 3012810 |
| 4 | 14484998 | Primary Framework A | baseline-business-49 | composite-target-93 | 2023-10-17 | pilot-operatin-26 | 4 | 8189488 |

Businesses are stored in `migr_businesses`, keyed by `id` (`1`, `2`, `3`, `4`) with a secondary `business_id` (`3122ef58d8b44fb197236734beef7b29`, `StasStaStS`, `3990175`, `14484998`). The `business_name` column holds readable names (`Baseline Protocol D`, `Distributed Programme`, `Adaptive Standard`, `Primary Framework A`), while `business_type` (`primary-business-46`, `adaptive-business-47`), `target_clientele` (`regional-target-90`, `legacy-target-91`), `establishment_date` (`2024-07-11`, `2025-12-22`), and `operating_status` (`adaptive-operatin-23`, `distributed-operatin-24`) describe the enterprise. Foreign keys `migrant_id` and `city_id` link each business to a migrant founder and a host city, respectively.

**Table `migr_survey_responses`**

| id | response_id | survey_date | respondent_type | perception_score | integration_assessment | language_barrier_perception | local_id | migrant_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23 | baseline-responde-49 | 37 | integrated-integrat-40 | false | 1 | 1 |
| 101 | 9736917 | 2025-12-07 | pilot-responde-50 | 43 | seasonal-integrat-41 | true | 2 | 2 |
| 102 | 8189493 | 2022-05-18 | extended-responde-51 | 49 | regional-integrat-42 | false | 3 | 3 |
| 103 | Invoice | 2023-10-02 | integrated-responde-52 | 55 | legacy-integrat-43 | true | 4 | 4 |

Survey responses are captured in `migr_survey_responses`, keyed by `id` (`100`, `101`, `102`, `103`) with a secondary `response_id` (`ChIJr7cItPtt5kcRM6ry7ecIYgw`, `9736917`, `8189493`, `Invoice`). The `survey_date` column records when the survey was conducted (`2024-07-23`, `2025-12-07`), and `respondent_type` (`baseline-responde-49`, `pilot-responde-50`) identifies the respondent category. Quantitative and qualitative measures include `perception_score` (an integer: `37`, `43`, `49`, `55`), `integration_assessment` (`integrated-integrat-40`, `seasonal-integrat-41`), and `language_barrier_perception` (a boolean: `false`, `true`). Foreign keys `local_id` and `migrant_id` tie each response to a local resident and a migrant, enabling cross-actor perception analysis.

The five base tables above form the backbone of the schema, but the domain's many-to-many relationships require junction tables. These tables exist to resolve cardinality-bounded associations that cannot be expressed through a single foreign key column.

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

The `migr_migration_eventsMigrant` junction table links migration events to migrants, resolving the many-to-many relationship between `migr_migration_events` and `migr_migrants`. Each row represents an assignment of a migrant to a migration event, with foreign keys referencing both parent tables.

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

Conversely, `migr_migrantsMigrationEvent` provides the inverse linkage, connecting migrants to the migration events they participated in. This bidirectional junction structure ensures that queries can traverse the relationship from either direction without loss of referential integrity.

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

The `migr_migrantsLocal` table establishes associations between migrants and locals, capturing interpersonal or community-level connections. This junction enables analysis of how migrant populations relate to the local residents they interact with.

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

`migr_localsMigrant` mirrors the migrant-local relationship from the local perspective, providing the symmetric link that allows traversal from locals to their associated migrants.

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

The `migr_citiesMigrant` junction table connects cities to migrants, supplementing the direct `city_id` foreign key in `migr_migrants` with an explicit association table. This supports scenarios where a migrant may be associated with multiple cities beyond their primary residence.

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

Similarly, `migr_citiesLocal` links cities to locals, providing an explicit many-to-many bridge that complements the `city_id` foreign key in `migr_locals`.

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

The `migr_citiesBusiness` junction table associates cities with businesses, reinforcing the geographic anchoring of enterprises beyond the direct `city_id` foreign key in `migr_businesses`.

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

`migr_businessesLocal` connects businesses to locals, capturing employment or patronage relationships between the local population and the businesses operating within the domain.

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

The `migr_survey_responsesMigrant` junction table links survey responses to migrants, providing an explicit association that complements the `migrant_id` foreign key in `migr_survey_responses`. This enables multi-response tracking and more complex survey analysis patterns.

With the base tables and junction tables in place, the schema supports a rich set of views that materialise domain facts through joins. Each view answers a specific analytical question by combining columns from two or more tables.

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

The view `v_migration_event_city` joins `migr_migration_events` with `migr_cities` on `city_id`, producing a flat record that pairs each migration event with its host city's name, region, population density, and cost of living index. For example, event `EVE-2706` (arrival `2023-02-20`, purpose `baseline-purpose-67`) is presented alongside city `Regional Protocol` (region `distributed-region-12`, density `18`, cost index `25.36`). This view answers the question: "What are the geographic and economic conditions at each migration event's destination?"

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

`v_migration_event_migrant_detail` joins `migr_migration_events` with `migr_migrants` through the junction tables, enriching each event row with the migrant's nationality, employment type, salary level, and integration intent. Event `EVE-2706` appears with migrant `1` (nationality `composite-national-39`, employment `adaptive-employme-17`, salary `12.36`, intent `integrated-integrat-22`). This view answers: "Which migrants are associated with each migration event, and what are their socioeconomic profiles?"

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

The inverse view `v_migrant_migration_event_detail` starts from `migr_migrants` and joins to `migr_migration_events`, presenting each migrant alongside their event details. Migrant `1` (nationality `composite-national-39`, salary `12.36`) is paired with event `EVE-2706` (arrival `2023-02-20`, purpose `baseline-purpose-67`, transit `true`). This view answers: "For each migrant, what migration events did they participate in, and what were the event characteristics?"

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

`v_migrant_city` joins `migr_migrants` with `migr_cities` on `city_id`, producing a row per migrant that includes the city's name, region, population density, and cost of living. Migrant `1` (nationality `composite-national-39`, employment `adaptive-employme-17`) is presented with city `Regional Protocol` (region `distributed-region-12`, density `18`, cost index `25.36`). This view answers: "Which city does each migrant reside in, and what are that city's demographic and economic characteristics?"

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

The view `v_migrant_business` joins `migr_migrants` with `migr_businesses` on `business_id`, linking each migrant to their associated business. Migrant `1` (salary `12.36`, integration intent `integrated-integrat-22`) is paired with business `Baseline Protocol D` (type `primary-business-46`, target `regional-target-90`, status `adaptive-operatin-23`). This view answers: "Which business is each migrant associated with, and what are the business's characteristics?"

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

`v_migrant_local_detail` joins `migr_migrants` with `migr_locals` through the junction tables, presenting each migrant alongside their associated local's nationality, residence city, perception of migrants, and employment sector. Migrant `1` (nationality `composite-national-39`, salary `12.36`) is paired with local `5844285` (nationality `composite-national-39`, perception `integrated-percepti-10`, sector `baseline-employme-67`). This view answers: "Which locals are associated with each migrant, and how do those locals perceive migration?"

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

The inverse view `v_local_migrant_detail` starts from `migr_locals` and joins to `migr_migrants`, presenting each local alongside their associated migrant's details. Local `5844285` (perception `integrated-percepti-10`, sector `baseline-employme-67`) is paired with migrant `1` (nationality `composite-national-39`, employment `adaptive-employme-17`, salary `12.36`). This view answers: "For each local, which migrants are they associated with, and what are those migrants' profiles?"

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

`v_local_city` joins `migr_locals` with `migr_cities` on `city_id`, producing a row per local that includes the city's name, region, population density, and cost of living. Local `5844285` (perception `integrated-percepti-10`, sector `baseline-employme-67`) is presented with city `Regional Protocol` (region `distributed-region-12`, density `18`, cost index `25.36`). This view answers: "Which city does each local reside in, and what are that city's characteristics?"

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

The view `v_local_business` joins `migr_locals` with `migr_businesses` on `business_id`, linking each local to their associated business. Local `5844285` (perception `integrated-percepti-10`, sector `baseline-employme-67`) is paired with business `Baseline Protocol D` (type `primary-business-46`, target `regional-target-90`, status `adaptive-operatin-23`). This view answers: "Which business is each local associated with, and what are the business's characteristics?"

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

`v_city_migrant_detail` joins `migr_cities` with `migr_migrants` through the junction tables, presenting each city alongside its associated migrants' nationalities, employment types, and salary levels. City `Regional Protocol` (region `distributed-region-12`, density `18`, cost index `25.36`) is paired with migrant `1` (nationality `composite-national-39`, employment `adaptive-employme-17`, salary `12.36`). This view answers: "For each city, which migrants are associated with it, and what are their profiles?"

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

`v_city_local_detail` joins `migr_cities` with `migr_locals` through the junction tables, presenting each city alongside its associated locals' nationalities, perceptions of migrants, and employment sectors. City `Regional Protocol` (region `distributed-region-12`, density `18`, cost index `25.36`) is paired with local `5844285` (nationality `composite-national-39`, perception `integrated-percepti-10`, sector `baseline-employme-67`). This view answers: "For each city, which locals are associated with it, and what are their characteristics?"

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

`v_city_business_detail` joins `migr_cities` with `migr_businesses` through the junction tables, presenting each city alongside its associated businesses' names, types, target clientèles, and operating statuses. City `Regional Protocol` (region `distributed-region-12`, density `18`, cost index `25.36`) is paired with business `Baseline Protocol D` (type `primary-business-46`, target `regional-target-90`, status `adaptive-operatin-23`). This view answers: "For each city, which businesses operate there, and what are their characteristics?"

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

`v_business_migrant` joins `migr_businesses` with `migr_migrants` on `migrant_id`, linking each business to its associated migrant. Business `Baseline Protocol D` (type `primary-business-46`, target `regional-target-90`, status `adaptive-operatin-23`) is paired with migrant `1` (nationality `composite-national-39`, employment `adaptive-employme-17`, salary `12.36`). This view answers: "Which migrant is associated with each business, and what is that migrant's profile?"

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

`v_business_city` joins `migr_businesses` with `migr_cities` on `city_id`, presenting each business alongside its host city's name, region, population density, and cost of living. Business `Baseline Protocol D` (type `primary-business-46`, target `regional-target-90`, status `adaptive-operatin-23`) is presented with city `Regional Protocol` (region `distributed-region-12`, density `18`, cost index `25.36`). This view answers: "Which city hosts each business, and what are that city's characteristics?"

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

`v_business_local_detail` joins `migr_businesses` with `migr_locals` through the junction tables, presenting each business alongside its associated locals' nationalities, perceptions of migrants, and employment sectors. Business `Baseline Protocol D` (type `primary-business-46`, target `regional-target-90`, status `adaptive-operatin-23`) is paired with local `5844285` (nationality `composite-national-39`, perception `integrated-percepti-10`, sector `baseline-employme-67`). This view answers: "For each business, which locals are associated with it, and what are their characteristics?"

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

`v_survey_response_local` joins `migr_survey_responses` with `migr_locals` on `local_id`, presenting each survey response alongside the local respondent's nationality, residence city, perception of migrants, and employment sector. Response `ChIJr7cItPtt5kcRM6ry7ecIYgw` (date `2024-07-23`, type `baseline-responde-49`, score `37`, integration `integrated-integrat-40`, barrier `false`) is paired with local `1` (nationality `composite-national-39`, perception `integrated-percepti-10`, sector `baseline-employme-67`). This view answers: "For each survey response, what are the local respondent's characteristics?"

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

`v_survey_response_migrant` joins `migr_survey_responses` with `migr_migrants` on `migrant_id`, presenting each survey response alongside the migrant respondent's nationality, employment type, salary level, and integration intent. Response `ChIJr7cItPtt5kcRM6ry7ecIYgw` (date `2024-07-23`, type `baseline-responde-49`, score `37`, integration `integrated-integrat-40`, barrier `false`) is paired with migrant `1` (nationality `composite-national-39`, employment `adaptive-employme-17`, salary `12.36`, intent `integrated-integrat-22`). This view answers: "For each survey response, what are the migrant respondent's characteristics?"

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

`v_survey_response_migrant_detail` joins `migr_survey_responses` with both `migr_locals` and `migr_migrants` through their respective foreign keys, producing a comprehensive row that includes survey metrics alongside both the local and migrant respondent profiles. Response `ChIJr7cItPtt5kcRM6ry7ecIYgw` (date `2024-07-23`, type `baseline-responde-49`, score `37`, integration `integrated-integrat-40`, barrier `false`) is paired with local `1` (nationality `composite-national-39`, perception `integrated-percepti-10`, sector `baseline-employme-67`) and migrant `1` (nationality `composite-national-39`, employment `adaptive-employme-17`, salary `12.36`, intent `integrated-integrat-22`). This view answers: "For each survey response, what are the characteristics of both the local and migrant respondents, enabling cross-actor perception analysis?"

The schema's design reflects a deliberate normalisation strategy: core entities are stored once in their respective base tables, relationships are expressed through explicit foreign keys and junction tables, and analytical convenience is provided through a comprehensive set of views. The junction tables—`migr_migration_eventsMigrant`, `migr_migrantsMigrationEvent`, `migr_migrantsLocal`, `migr_localsMigrant`, `migr_citiesMigrant`, `migr_citiesLocal`, `migr_citiesBusiness`, `migr_businessesLocal`, and `migr_survey_responsesMigrant`—resolve many-to-many associations that cannot be captured by a single column, while the direct foreign keys in `migr_migration_events`, `migr_migrants`, `migr_locals`, and `migr_businesses` handle one-to-many relationships to the city master table. The twelve views then materialise these relationships into flat, query-ready structures, each answering a distinct analytical question about the migration domain. Together, the tables and views form a coherent relational model that faithfully represents the domain's entities, attributes, and relationships while supporting efficient querying of complex cross-entity facts.