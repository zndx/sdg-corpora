## The Astronomy Observation Domain

Astronomical observatories must track which observer deployed which telescope to observe which celestial body, under what weather conditions, and at what angular separation. The domain captures a single observation event as a fact that simultaneously references four other entities: the target body, the instrument, the observer, and the environmental context. This chapter explains how the ontology of that domain materializes as five base tables and ten denormalized views, each view answering a specific analytical question by joining the normalized tables back together.

### The Base Tables

The observation event is the central entity. It is stored in `observations`, which anchors every fact with a surrogate key `id` and a human-readable `observation_identifier`. The temporal dimension is captured by `observation_date_time`, while the target of the observation is recorded both as a free-text `target_body_name` and as a foreign key `celestial_body_id` that points into the `celestial_bodies` table. The instrument is referenced through `telescope_id`, and the responsible person through `observer_id`. Additional observational metadata includes `angular_separation` (a floating-point measurement in arcminutes), `instrument_used` (a descriptive label), `observer_name` (a free-text role label), and `weather_condition` (a categorical code).

**Table `observations`**

| id | observation_identifier | observation_date_time | target_body_name | target_body_type | angular_separation | instrument_used | observer_name | weather_condition | celestial_body_id | observer_id | telescope_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | OBS-2464 | 2023-02-18T01:03:00 | Extended Corridor | seasonal-target-53 | 5.95 | pilot-instrume-62 | Extended Initiative | primary-weather-94 | 1 | 100 | 1000 |
| 101 | OBS-2468 | 2024-07-02T08:20:00 | Pilot Series A | regional-target-54 | 9.90 | extended-instrume-63 | Pilot Model A | adaptive-weather-95 | 2 | 101 | 1001 |
| 102 | OBS-2472 | 2025-12-13T15:37:00 | Baseline Assessment | legacy-target-55 | 13.85 | integrated-instrume-64 | Baseline Cluster | distributed-weather-96 | 3 | 102 | 1002 |
| 103 | OBS-2476 | 2022-05-24T22:54:00 | Distributed Survey | compact-target-56 | 17.80 | seasonal-instrume-65 | Distributed Review | baseline-weather-97 | 4 | 103 | 1003 |

The first row illustrates the schema in action: observation `OBS-2464` occurred on `2023-02-18T01:03:00`, targeted the body named `Extended Corridor` (type `seasonal-target-53`), was conducted with `pilot-instrume-62` under `primary-weather-94` conditions, at an angular separation of `5.95` arcminutes, by the observer labelled `Extended Initiative`. The foreign keys `celestial_body_id = 1`, `observer_id = 100`, and `telescope_id = 1000` link this row to the corresponding records in the other four base tables.

The `celestial_bodies` table stores the catalogue of objects under observation. Its primary key is `celestial_body_id`, and each row carries a `body_identifier` (e.g. `BOD-2053`), a `body_name` (e.g. `Regional Corridor`), a `body_type` (e.g. `baseline-body-67`), and celestial coordinates `right_ascension` and `declination` (e.g. `19.20` and `7.20` respectively). The apparent brightness is recorded as `magnitude` (e.g. `11.70`), along with `discovery_date` and `discoverer_name`. Audit columns `created_at` and `updated_at` track when the catalogue entry was last modified. The column `observation_id` in this table creates a back-reference from the celestial body to the observation that first catalogued it.

**Table `celestial_bodies`**

| celestial_body_id | body_identifier | body_name | body_type | right_ascension | declination | magnitude | discovery_date | discoverer_name | observation_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | BOD-2053 | Regional Corridor | baseline-body-67 | 19.20 | 7.20 | 11.70 | 2024-03-23 | Distributed Programme | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | BOD-2058 | Seasonal Series D | pilot-body-68 | 22.40 | 9.40 | 14.40 | 2025-08-07 | Adaptive Standard D | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | BOD-2063 | Integrated Assessment | extended-body-69 | 25.60 | 11.60 | 17.10 | 2022-01-18 | Primary Framework | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | BOD-2068 | Extended Survey | integrated-body-70 | 28.80 | 13.80 | 19.80 | 2023-06-02 | Composite Protocol | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Row `celestial_body_id = 1` corresponds to `BOD-2053`, named `Regional Corridor` of type `baseline-body-67`, discovered on `2024-03-23` by `Distributed Programme`. Its coordinates place it at right ascension `19.20` and declination `7.20`, with a magnitude of `11.70`. The `observation_id = 100` back-reference ties this body to observation `OBS-2464`.

The `telescopes` table describes the instruments used. Its primary key is `id`, and each row includes `telescope_identifier` (e.g. `TEL-2748`), `manufacturer` (e.g. `Standard Chartered`), `aperture_inches` (e.g. `9.45`), `mounting_type` (e.g. `integrated-mounting-58`), `year_manufactured` (e.g. `19`), `current_location` (e.g. `baseline-current-43`), `status` (e.g. `regional-status-84`), and `accessories` (e.g. `legacy-accessor-37`). Audit columns `created_at` and `updated_at` are present. The foreign keys `observation_id` and `observer_id` in this table create back-references from the instrument to the observation and the observer who deployed it.

**Table `telescopes`**

| id | telescope_identifier | manufacturer | aperture_inches | mounting_type | year_manufactured | current_location | status | accessories | observation_id | observer_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | TEL-2748 | Standard Chartered | 9.45 | integrated-mounting-58 | 19 | baseline-current-43 | regional-status-84 | legacy-accessor-37 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | TEL-2755 | General Motors | 13.90 | seasonal-mounting-59 | 25 | pilot-current-44 | legacy-status-85 | compact-accessor-38 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | TEL-2762 | Column Name cannot be empty | 18.35 | regional-mounting-60 | 31 | extended-current-45 | compact-status-86 | composite-accessor-39 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | TEL-2769 | Financial Information Service Co. Ltd. | 22.80 | legacy-mounting-61 | 37 | integrated-current-46 | composite-status-87 | primary-accessor-40 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Telescope `TEL-2748` (`id = 1000`) was manufactured by `Standard Chartered` with an aperture of `9.45` inches, uses an `integrated-mounting-58` mount, was built in year `19`, is located at `baseline-current-43`, has status `regional-status-84`, and carries accessory `legacy-accessor-37`. It was deployed for observation `100` by observer `100`.

The `observers` table records the personnel (or organizations) conducting observations. Its primary key is `id`, and each row carries `observer_identifier` (e.g. `OBS-2038`), `full_name` (e.g. `Theodore Mcgrath`), `birth_date` and `death_date`, `location` (e.g. `extended-location-99`), `affiliation` (e.g. `baseline-affiliat-55`), and `role` (e.g. `pilot-role-20`). The columns `observation_id` and `telescope_id` create back-references to the observation and the telescope used.

**Table `observers`**

| id | observer_identifier | full_name | birth_date | death_date | location | affiliation | role | observation_id | telescope_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | OBS-2038 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | extended-location-99 | baseline-affiliat-55 | pilot-role-20 | 100 | 1000 |
| 101 | OBS-2040 | Account Name | 2024-03-02 | 2023-06-23 | integrated-location-100 | pilot-affiliat-56 | extended-role-21 | 101 | 1001 |
| 102 | OBS-2042 | Saipan International Airport | 2025-08-13 | 2024-11-07 | seasonal-location-101 | extended-affiliat-57 | integrated-role-22 | 102 | 1002 |
| 103 | OBS-2044 | Norma Fisher | 2022-01-24 | 2025-04-18 | regional-location-102 | integrated-affiliat-58 | seasonal-role-23 | 103 | 1003 |

Observer `OBS-2038` (`id = 100`) is `Theodore Mcgrath`, born `2023-10-18` and deceased `2022-01-12`, located at `extended-location-99`, affiliated with `baseline-affiliat-55`, and holding role `pilot-role-20`. This observer conducted observation `100` using telescope `1000`.

The `events` table captures scheduled or historical astronomical events. Its primary key is `id`, and each row includes `event_identifier` (e.g. `EVE-2706`), `event_name` (e.g. `Seasonal Standard`), `event_date_time` (e.g. `2022-05-27T04:00:00`), `event_type` (e.g. `distributed-event-24`), `location` (e.g. `extended-location-99`), `participants` (e.g. `baseline-particip-43`), and `description` (e.g. `Extended Survey`). The foreign keys `celestial_body_id` and `observer_id` link each event to the celestial body involved and the observer who participated.

**Table `events`**

| id | event_identifier | event_name | event_date_time | event_type | location | participants | description | celestial_body_id | observer_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | Seasonal Standard | 2022-05-27T04:00:00 | distributed-event-24 | extended-location-99 | baseline-particip-43 | Extended Survey | 1 | 100 |
| 1001 | EVE-2707 | Integrated Framework | 2023-10-11T11:17:00 | baseline-event-25 | integrated-location-100 | pilot-particip-44 | Pilot Corridor A | 2 | 101 |
| 1002 | EVE-2708 | Extended Protocol D | 2024-03-22T18:34:00 | pilot-event-26 | seasonal-location-101 | extended-particip-45 | Baseline Series | 3 | 102 |
| 1003 | EVE-2709 | Pilot Programme | 2025-08-06T01:51:00 | extended-event-27 | regional-location-102 | integrated-particip-46 | Distributed Assessment | 4 | 103 |

Event `EVE-2706` (`id = 1000`), named `Seasonal Standard`, occurred on `2022-05-27T04:00:00` as a `distributed-event-24` at `extended-location-99`, with participants `baseline-particip-43` and description `Extended Survey`. It involved celestial body `1` (`BOD-2053`) and observer `100` (`Theodore Mcgrath`).

### The Materialized Views

Each view materializes a specific join between the base tables, answering a focused analytical question by denormalizing the relevant entities into a single flat result set.

The view `v_observation_celestial_body` joins `observations` to `celestial_bodies` on `celestial_body_id`, answering the question: "What celestial body was targeted in each observation?" It projects the observation's `id`, `observation_identifier`, `observation_date_time`, and `target_body_name` alongside the body's `celestial_body_id`, `body_identifier`, and `body_name`.

**View `v_observation_celestial_body`**

```sql
CREATE VIEW v_observation_celestial_body AS
SELECT a.id, a.observation_identifier, a.observation_date_time, a.target_body_name, b.celestial_body_id AS body_celestial_body_id, b.body_identifier AS body_body_identifier, b.body_name AS body_body_name
FROM observations a JOIN celestial_bodies b ON a.celestial_body_id = b.celestial_body_id;
```

| id | observation_identifier | observation_date_time | target_body_name | body_celestial_body_id | body_body_identifier | body_body_name |
|---|---|---|---|---|---|---|
| 100 | OBS-2464 | 2023-02-18T01:03:00 | Extended Corridor | 1 | BOD-2053 | Regional Corridor |
| 101 | OBS-2468 | 2024-07-02T08:20:00 | Pilot Series A | 2 | BOD-2058 | Seasonal Series D |
| 102 | OBS-2472 | 2025-12-13T15:37:00 | Baseline Assessment | 3 | BOD-2063 | Integrated Assessment |
| 103 | OBS-2476 | 2022-05-24T22:54:00 | Distributed Survey | 4 | BOD-2068 | Extended Survey |

Row `id = 100` shows that observation `OBS-2464` targeted body `BOD-2053` (`Regional Corridor`). Row `id = 101` links `OBS-2468` to body `BOD-2058` (`Seasonal Series D`). The view makes it possible to query all observations of a given body by filtering on `body_body_name` without needing to write a join.

The view `v_observation_observer` joins `observations` to `observers` on `observer_id`, answering: "Which observer conducted each observation?" It projects the observation's identifying columns alongside the observer's `id`, `observer_identifier`, `full_name`, `birth_date`, `death_date`, `location`, `affiliation`, and `role`.

**View `v_observation_observer`**

```sql
CREATE VIEW v_observation_observer AS
SELECT a.id, a.observation_identifier, a.observation_date_time, a.target_body_name, b.id AS observer_id, b.observer_identifier AS observer_observer_identifier, b.full_name AS observer_full_name
FROM observations a JOIN observers b ON a.observer_id = b.id;
```

| id | observation_identifier | observation_date_time | target_body_name | observer_id | observer_observer_identifier | observer_full_name |
|---|---|---|---|---|---|---|
| 100 | OBS-2464 | 2023-02-18T01:03:00 | Extended Corridor | 100 | OBS-2038 | Theodore Mcgrath |
| 101 | OBS-2468 | 2024-07-02T08:20:00 | Pilot Series A | 101 | OBS-2040 | Account Name |
| 102 | OBS-2472 | 2025-12-13T15:37:00 | Baseline Assessment | 102 | OBS-2042 | Saipan International Airport |
| 103 | OBS-2476 | 2022-05-24T22:54:00 | Distributed Survey | 103 | OBS-2044 | Norma Fisher |

Row `id = 100` reveals that observation `OBS-2464` was conducted by `Theodore Mcgrath` (`OBS-2038`), born `2023-10-18`, affiliated with `baseline-affiliat-55`, and holding role `pilot-role-20`. This view supports queries such as "list all observations by a given observer" or "find the birth date of the observer for observation OBS-2468."

The view `v_observation_telescope` joins `observations` to `telescopes` on `telescope_id`, answering: "Which telescope was used for each observation?" It projects the observation's columns alongside the telescope's `id`, `telescope_identifier`, `manufacturer`, `aperture_inches`, `mounting_type`, `year_manufactured`, `current_location`, `status`, and `accessories`.

**View `v_observation_telescope`**

```sql
CREATE VIEW v_observation_telescope AS
SELECT a.id, a.observation_identifier, a.observation_date_time, a.target_body_name, b.id AS telescope_id, b.telescope_identifier AS telescope_telescope_identifier, b.manufacturer AS telescope_manufacturer
FROM observations a JOIN telescopes b ON a.telescope_id = b.id;
```

| id | observation_identifier | observation_date_time | target_body_name | telescope_id | telescope_telescope_identifier | telescope_manufacturer |
|---|---|---|---|---|---|---|
| 100 | OBS-2464 | 2023-02-18T01:03:00 | Extended Corridor | 1000 | TEL-2748 | Standard Chartered |
| 101 | OBS-2468 | 2024-07-02T08:20:00 | Pilot Series A | 1001 | TEL-2755 | General Motors |
| 102 | OBS-2472 | 2025-12-13T15:37:00 | Baseline Assessment | 1002 | TEL-2762 | Column Name cannot be empty |
| 103 | OBS-2476 | 2022-05-24T22:54:00 | Distributed Survey | 1003 | TEL-2769 | Financial Information Service Co. Ltd. |

Row `id = 100` shows that observation `OBS-2464` used telescope `TEL-2748` (`id = 1000`), manufactured by `Standard Chartered` with a `9.45`-inch aperture and `integrated-mounting-58` mount. This view enables queries like "find all observations made with telescopes from a specific manufacturer" or "list the aperture of the instrument used for observation OBS-2472."

The view `v_celestial_body_observation` joins `celestial_bodies` to `observations` on `celestial_body_id`, answering the inverse question: "For each celestial body, what observation targeted it?" It projects the body's `celestial_body_id`, `body_identifier`, `body_name`, `body_type`, `right_ascension`, `declination`, `magnitude`, `discovery_date`, and `discoverer_name` alongside the observation's `id`, `observation_identifier`, `observation_date_time`, `target_body_name`, `angular_separation`, `instrument_used`, `observer_name`, and `weather_condition`.

**View `v_celestial_body_observation`**

```sql
CREATE VIEW v_celestial_body_observation AS
SELECT a.celestial_body_id, a.body_identifier, a.body_name, a.body_type, b.id AS observation_id, b.observation_identifier AS observation_observation_identifier, b.observation_date_time AS observation_observation_date_time
FROM celestial_bodies a JOIN observations b ON a.observation_id = b.id;
```

| celestial_body_id | body_identifier | body_name | body_type | observation_id | observation_observation_identifier | observation_observation_date_time |
|---|---|---|---|---|---|---|
| 1 | BOD-2053 | Regional Corridor | baseline-body-67 | 100 | OBS-2464 | 2023-02-18T01:03:00 |
| 2 | BOD-2058 | Seasonal Series D | pilot-body-68 | 101 | OBS-2468 | 2024-07-02T08:20:00 |
| 3 | BOD-2063 | Integrated Assessment | extended-body-69 | 102 | OBS-2472 | 2025-12-13T15:37:00 |
| 4 | BOD-2068 | Extended Survey | integrated-body-70 | 103 | OBS-2476 | 2022-05-24T22:54:00 |

Row `celestial_body_id = 1` shows that body `BOD-2053` (`Regional Corridor`, magnitude `11.70`, discovered `2024-03-23` by `Distributed Programme`) was targeted by observation `OBS-2464` on `2023-02-18T01:03:00` at angular separation `5.95` with instrument `pilot-instrume-62` under `primary-weather-94` conditions. This view is useful for catalogue-style queries: "retrieve all observational metadata for a given celestial body."

The view `v_telescope_observation` joins `telescopes` to `observations` on `id = telescope_id`, answering: "For each telescope, what observation did it support?" It projects the telescope's `id`, `telescope_identifier`, `manufacturer`, `aperture_inches`, `mounting_type`, `year_manufactured`, `current_location`, `status`, and `accessories` alongside the observation's `id`, `observation_identifier`, `observation_date_time`, `target_body_name`, `angular_separation`, `instrument_used`, `observer_name`, and `weather_condition`.

**View `v_telescope_observation`**

```sql
CREATE VIEW v_telescope_observation AS
SELECT a.id, a.telescope_identifier, a.manufacturer, a.aperture_inches, b.id AS observation_id, b.observation_identifier AS observation_observation_identifier, b.observation_date_time AS observation_observation_date_time
FROM telescopes a JOIN observations b ON a.observation_id = b.id;
```

| id | telescope_identifier | manufacturer | aperture_inches | observation_id | observation_observation_identifier | observation_observation_date_time |
|---|---|---|---|---|---|---|
| 1000 | TEL-2748 | Standard Chartered | 9.45 | 100 | OBS-2464 | 2023-02-18T01:03:00 |
| 1001 | TEL-2755 | General Motors | 13.90 | 101 | OBS-2468 | 2024-07-02T08:20:00 |
| 1002 | TEL-2762 | Column Name cannot be empty | 18.35 | 102 | OBS-2472 | 2025-12-13T15:37:00 |
| 1003 | TEL-2769 | Financial Information Service Co. Ltd. | 22.80 | 103 | OBS-2476 | 2022-05-24T22:54:00 |

Row `id = 1000` shows that telescope `TEL-2748` (`Standard Chartered`, `9.45`-inch aperture, `integrated-mounting-58`) supported observation `OBS-2464` (`Extended Corridor`, angular separation `5.95`, instrument `pilot-instrume-62`, weather `primary-weather-94`). This view supports instrument utilization analysis: "list all observations for a given telescope model" or "find the weather conditions during the observation supported by telescope TEL-2769."

The view `v_telescope_observer` joins `telescopes` to `observers` on `id = telescope_id` and `id = observer_id` (both referencing the same `id` column in their respective tables through the back-reference columns), answering: "Which observer is associated with each telescope?" It projects the telescope's `id`, `telescope_identifier`, `manufacturer`, `aperture_inches`, `mounting_type`, `year_manufactured`, `current_location`, `status`, and `accessories` alongside the observer's `id`, `observer_identifier`, `full_name`, `birth_date`, `death_date`, `location`, `affiliation`, and `role`.

**View `v_telescope_observer`**

```sql
CREATE VIEW v_telescope_observer AS
SELECT a.id, a.telescope_identifier, a.manufacturer, a.aperture_inches, b.id AS observer_id, b.observer_identifier AS observer_observer_identifier, b.full_name AS observer_full_name
FROM telescopes a JOIN observers b ON a.observer_id = b.id;
```

| id | telescope_identifier | manufacturer | aperture_inches | observer_id | observer_observer_identifier | observer_full_name |
|---|---|---|---|---|---|---|
| 1000 | TEL-2748 | Standard Chartered | 9.45 | 100 | OBS-2038 | Theodore Mcgrath |
| 1001 | TEL-2755 | General Motors | 13.90 | 101 | OBS-2040 | Account Name |
| 1002 | TEL-2762 | Column Name cannot be empty | 18.35 | 102 | OBS-2042 | Saipan International Airport |
| 1003 | TEL-2769 | Financial Information Service Co. Ltd. | 22.80 | 103 | OBS-2044 | Norma Fisher |

Row `id = 1000` links telescope `TEL-2748` (`Standard Chartered`, `9.45` inches) to observer `OBS-2038` (`Theodore Mcgrath`, born `2023-10-18`, affiliated with `baseline-affiliat-55`). This view answers equipment-assignment questions: "find the observer assigned to telescope TEL-2762" or "list the full name and role of the observer for each telescope."

The view `v_observer_observation` joins `observers` to `observations` on `id = observer_id`, answering: "For each observer, what observation did they conduct?" It projects the observer's `id`, `observer_identifier`, `full_name`, `birth_date`, `death_date`, `location`, `affiliation`, and `role` alongside the observation's `id`, `observation_identifier`, `observation_date_time`, `target_body_name`, `angular_separation`, `instrument_used`, `observer_name`, and `weather_condition`.

**View `v_observer_observation`**

```sql
CREATE VIEW v_observer_observation AS
SELECT a.id, a.observer_identifier, a.full_name, a.birth_date, b.id AS observation_id, b.observation_identifier AS observation_observation_identifier, b.observation_date_time AS observation_observation_date_time
FROM observers a JOIN observations b ON a.observation_id = b.id;
```

| id | observer_identifier | full_name | birth_date | observation_id | observation_observation_identifier | observation_observation_date_time |
|---|---|---|---|---|---|---|
| 100 | OBS-2038 | Theodore Mcgrath | 2023-10-18 | 100 | OBS-2464 | 2023-02-18T01:03:00 |
| 101 | OBS-2040 | Account Name | 2024-03-02 | 101 | OBS-2468 | 2024-07-02T08:20:00 |
| 102 | OBS-2042 | Saipan International Airport | 2025-08-13 | 102 | OBS-2472 | 2025-12-13T15:37:00 |
| 103 | OBS-2044 | Norma Fisher | 2022-01-24 | 103 | OBS-2476 | 2022-05-24T22:54:00 |

Row `id = 100` shows that observer `OBS-2038` (`Theodore Mcgrath`, `baseline-affiliat-55`, role `pilot-role-20`) conducted observation `OBS-2464` on `2023-02-18T01:03:00`, targeting `Extended Corridor` at angular separation `5.95` with instrument `pilot-instrume-62` under `primary-weather-94` conditions. This view supports personnel performance queries: "list all observations by an observer born after a given date" or "find the angular separations recorded by observer OBS-2044."

The view `v_observer_telescope` joins `observers` to `telescopes` on `id = observer_id` and `id = telescope_id` (via the back-reference columns), answering: "Which telescope is associated with each observer?" It projects the observer's `id`, `observer_identifier`, `full_name`, `birth_date`, `death_date`, `location`, `affiliation`, and `role` alongside the telescope's `id`, `telescope_identifier`, `manufacturer`, `aperture_inches`, `mounting_type`, `year_manufactured`, `current_location`, `status`, and `accessories`.

**View `v_observer_telescope`**

```sql
CREATE VIEW v_observer_telescope AS
SELECT a.id, a.observer_identifier, a.full_name, a.birth_date, b.id AS telescope_id, b.telescope_identifier AS telescope_telescope_identifier, b.manufacturer AS telescope_manufacturer
FROM observers a JOIN telescopes b ON a.telescope_id = b.id;
```

| id | observer_identifier | full_name | birth_date | telescope_id | telescope_telescope_identifier | telescope_manufacturer |
|---|---|---|---|---|---|---|
| 100 | OBS-2038 | Theodore Mcgrath | 2023-10-18 | 1000 | TEL-2748 | Standard Chartered |
| 101 | OBS-2040 | Account Name | 2024-03-02 | 1001 | TEL-2755 | General Motors |
| 102 | OBS-2042 | Saipan International Airport | 2025-08-13 | 1002 | TEL-2762 | Column Name cannot be empty |
| 103 | OBS-2044 | Norma Fisher | 2022-01-24 | 1003 | TEL-2769 | Financial Information Service Co. Ltd. |

Row `id = 100` links observer `OBS-2038` (`Theodore Mcgrath`, `extended-location-99`, role `pilot-role-20`) to telescope `TEL-2748` (`Standard Chartered`, `9.45` inches, `integrated-mounting-58`, status `regional-status-84`). This view answers resource-allocation questions: "find the telescope assigned to observer OBS-2042" or "list the manufacturer and aperture of the telescope used by each observer."

The view `v_event_celestial_body` joins `events` to `celestial_bodies` on `celestial_body_id`, answering: "For each event, which celestial body was involved?" It projects the event's `id`, `event_identifier`, `event_name`, `event_date_time`, `event_type`, `location`, `participants`, and `description` alongside the body's `celestial_body_id`, `body_identifier`, `body_name`, `body_type`, `right_ascension`, `declination`, `magnitude`, `discovery_date`, and `discoverer_name`.

**View `v_event_celestial_body`**

```sql
CREATE VIEW v_event_celestial_body AS
SELECT a.id, a.event_identifier, a.event_name, a.event_date_time, b.celestial_body_id AS body_celestial_body_id, b.body_identifier AS body_body_identifier, b.body_name AS body_body_name
FROM events a JOIN celestial_bodies b ON a.celestial_body_id = b.celestial_body_id;
```

| id | event_identifier | event_name | event_date_time | body_celestial_body_id | body_body_identifier | body_body_name |
|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | Seasonal Standard | 2022-05-27T04:00:00 | 1 | BOD-2053 | Regional Corridor |
| 1001 | EVE-2707 | Integrated Framework | 2023-10-11T11:17:00 | 2 | BOD-2058 | Seasonal Series D |
| 1002 | EVE-2708 | Extended Protocol D | 2024-03-22T18:34:00 | 3 | BOD-2063 | Integrated Assessment |
| 1003 | EVE-2709 | Pilot Programme | 2025-08-06T01:51:00 | 4 | BOD-2068 | Extended Survey |

Row `id = 1000` shows that event `EVE-2706` (`Seasonal Standard`, `distributed-event-24`, `2022-05-27T04:00:00`, description `Extended Survey`) involved celestial body `BOD-2053` (`Regional Corridor`, `baseline-body-67`, magnitude `11.70`, discovered `2024-03-23` by `Distributed Programme`). This view supports event-catalogue queries: "list all events involving a celestial body discovered before a given date."

The view `v_event_observer` joins `events` to `observers` on `observer_id`, answering: "For each event, which observer participated?" It projects the event's `id`, `event_identifier`, `event_name`, `event_date_time`, `event_type`, `location`, `participants`, and `description` alongside the observer's `id`, `observer_identifier`, `full_name`, `birth_date`, `death_date`, `location`, `affiliation`, and `role`.

**View `v_event_observer`**

```sql
CREATE VIEW v_event_observer AS
SELECT a.id, a.event_identifier, a.event_name, a.event_date_time, b.id AS observer_id, b.observer_identifier AS observer_observer_identifier, b.full_name AS observer_full_name
FROM events a JOIN observers b ON a.observer_id = b.id;
```

| id | event_identifier | event_name | event_date_time | observer_id | observer_observer_identifier | observer_full_name |
|---|---|---|---|---|---|---|
| 1000 | EVE-2706 | Seasonal Standard | 2022-05-27T04:00:00 | 100 | OBS-2038 | Theodore Mcgrath |
| 1001 | EVE-2707 | Integrated Framework | 2023-10-11T11:17:00 | 101 | OBS-2040 | Account Name |
| 1002 | EVE-2708 | Extended Protocol D | 2024-03-22T18:34:00 | 102 | OBS-2042 | Saipan International Airport |
| 1003 | EVE-2709 | Pilot Programme | 2025-08-06T01:51:00 | 103 | OBS-2044 | Norma Fisher |

Row `id = 1000` shows that event `EVE-2706` (`Seasonal Standard`, `distributed-event-24`, `2022-05-27T04:00:00`) involved observer `OBS-2038` (`Theodore Mcgrath`, born `2023-10-18`, affiliated with `baseline-affiliat-55`, role `pilot-role-20`). This view answers personnel-event queries: "list all events participated in by a given observer" or "find the event type and description for each observer's participation."

### Synthesis

The five base tables—`observations`, `celestial_bodies`, `telescopes`, `observers`, and `events`—form a normalized schema where the observation event sits at the centre, linked by foreign keys to the three supporting entities (body, instrument, observer), while the events table independently links celestial bodies and observers to scheduled activities. Each of the ten views denormalizes a specific pair of tables, projecting the relevant columns under aliased names to avoid ambiguity. The views answer six distinct analytical questions: observation-to-body, observation-to-observer, observation-to-telescope, body-to-observation, telescope-to-observation, telescope-to-observer, observer-to-observation, observer-to-telescope, event-to-body, and event-to-observer. Together, the base tables and views provide both a compact storage model and a set of ready-made analytical lenses over the astronomy observation domain.