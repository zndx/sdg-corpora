## Domain Modelling and Relational Materialization

The household energy management domain captures the lifecycle of residential energy consumption, from the physical infrastructure of meters and appliances through the temporal record of consumption events, the commercial framework of tariffs, and the organizational layer of reduction programs and consultants. At its core, the model distinguishes between persistent entities—households, meters, appliances, tariffs, programs, and consultants—and transient events that bind them together in time. The relational schema materializes this distinction by separating stable entity tables from a rich set of junction tables that encode many-to-many associations, and by providing materialized views that reconstruct domain facts across the normalized structure.

### Entity Tables and Their Attributes

The foundation of the schema consists of seven entity tables, each representing a distinct concept in the energy management domain. The `households` table anchors the model with residential units identified by surrogate `id` values such as `1000` and `1001`, each carrying a `household_id` like `726044` or `16605652` that serves as the business key. The `address` column stores location strings such as `distributed-address-72` and `baseline-address-73`, while `occupancy_status` distinguishes between `occupied` and `vacant` dwellings. Physical characteristics are captured through `construction_year` (values like `14` and `21`) and `floor_area` measured in some unit (values ranging from `5.95` to `17.80`). Two foreign keys, `electricity_meter_id` and `program_id`, link each household to its meter and its assigned reduction program respectively.

**Table `households`**

| id | household_id | address | occupancy_status | construction_year | floor_area | electricity_meter_id | program_id |
|---|---|---|---|---|---|---|---|
| 1000 | 726044 | distributed-address-72 | occupied | 14 | 5.95 | 1 | 103176 |
| 1001 | 16605652 | baseline-address-73 | vacant | 21 | 9.90 | 2 | 2986219 |
| 1002 | 8928495 | pilot-address-74 | occupied | 28 | 13.85 | 3 | 1186079 |
| 1003 | 5844284 | extended-address-75 | vacant | 35 | 17.80 | 4 | 1562855 |

The `electricity_meters` table records the physical measurement infrastructure. Each row carries a surrogate `electricity_meter_id` (`1`, `2`, `3`, `4`), a `meter_id` that is a globally unique identifier such as `ChIJs86LmnZu5kcRmKAuH61gkZk` or `d9da0c5a-8fcc-11eb-924d-9cd76263cbd0`, and an `installation_date` spanning from `2022-01-10` to `2025-04-16`. The `meter_type` column classifies devices as `analog`, `digital`, or `smart`, while `current_reading` holds the latest consumption measurement (e.g., `11.20`, `13.40`). A `last_calibration_date` such as `2025-12-01` tracks maintenance, and the `household_id` foreign key establishes the one-to-one or one-to-many relationship between meters and households.

**Table `electricity_meters`**

| electricity_meter_id | meter_id | installation_date | meter_type | current_reading | last_calibration_date | household_id |
|---|---|---|---|---|---|---|
| 1 | ChIJs86LmnZu5kcRmKAuH61gkZk | 2022-01-10 | analog | 11.20 | 2025-12-01 | 1000 |
| 2 | d9da0c5a-8fcc-11eb-924d-9cd76263cbd0 | 2023-06-21 | digital | 13.40 | 2022-05-12 | 1001 |
| 3 | 5082989 | 2024-11-05 | smart | 15.60 | 2023-10-23 | 1002 |
| 4 | 937744 | 2025-04-16 | analog | 17.80 | 2024-03-07 | 1003 |

Energy consumption is recorded in the `energy_consumption_events` table, which captures discrete measurement snapshots. Each event has a surrogate `id` (`100` through `103`), an `event_timestamp` like `2025-04-17T15:57:00`, and a `consumption_kwh` value (e.g., `19.20`, `21.40`). The `interval_duration` column (values `36`, `42`, `48`, `54`) records the measurement window, while `measurement_quality` classifies data as `verified`, `estimated`, or `flagged`. The `tariff_band` column (e.g., `adaptive-tariff-89`, `distributed-tariff-90`) provides a categorical tariff classification, and the `tariff_code` column (e.g., `lu_tax_code_template_m41`, `209229`) links to the tariff definition. Foreign keys `electricity_meter_id` and `household_id` tie each event to its source meter and the consuming household.

**Table `energy_consumption_events`**

| id | event_timestamp | consumption_kwh | interval_duration | measurement_quality | tariff_band | electricity_meter_id | household_id | tariff_code |
|---|---|---|---|---|---|---|---|---|
| 100 | 2025-04-17T15:57:00 | 19.20 | 36 | verified | adaptive-tariff-89 | 1 | 1000 | lu_tax_code_template_m41 |
| 101 | 2022-09-01T22:14:00 | 21.40 | 42 | estimated | distributed-tariff-90 | 2 | 1001 | lu_tax_code_template_m14 |
| 102 | 2023-02-12T05:31:00 | 23.60 | 48 | flagged | baseline-tariff-91 | 3 | 1002 | 209229 |
| 103 | 2024-07-23T12:48:00 | 25.80 | 54 | verified | pilot-tariff-92 | 4 | 1003 | 7119770 |

The `energy_tariffs` table defines the commercial pricing structures. Each tariff is identified by a `tariff_code` such as `lu_tax_code_template_m41` or `7119770`, with a `provider_name` like `Primary Initiative A` or `Legacy Review D`. The `base_charge` and `rate_per_kwh` columns (e.g., base charge `10.20` with rate `10.20`, or base charge `16.80` with rate `19.80`) specify the pricing formula. The `effective_date` and `expiration_date` columns (e.g., effective `2023-02-14` expiring `2025-08-18`) define the tariff's validity window.

**Table `energy_tariffs`**

| tariff_code | provider_name | base_charge | rate_per_kwh | effective_date | expiration_date |
|---|---|---|---|---|---|
| lu_tax_code_template_m41 | Primary Initiative A | 10.20 | 10.20 | 2023-02-14 | 2025-08-18 |
| lu_tax_code_template_m14 | Composite Model | 12.40 | 13.40 | 2024-07-25 | 2022-01-02 |
| 209229 | Compact Cluster | 14.60 | 16.60 | 2025-12-09 | 2023-06-13 |
| 7119770 | Legacy Review D | 16.80 | 19.80 | 2022-05-20 | 2024-11-24 |

The `energy_appliances` table catalogs household devices. Each appliance has a surrogate `id` (`1` through `4`), an `appliance_id` such as `b_VB-IC-12` or `CH9UT3`, and an `appliance_type` like `refrigerator`, `air_conditioner`, `water_heater`, or `lighting`. The `rated_power_watts` column (e.g., `18.45`, `25.80`) specifies the device's power rating, while `energy_star_rating` (values `18` through `45`) indicates energy efficiency. The `purchase_date` (e.g., `2022-01-07`), `operational_status` (`active`, `inactive`, `maintenance`), and `household_id` foreign key complete the appliance profile.

**Table `energy_appliances`**

| id | appliance_id | appliance_type | rated_power_watts | energy_star_rating | purchase_date | operational_status | household_id |
|---|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | refrigerator | 18.45 | 18 | 2022-01-07 | active | 1000 |
| 2 | CH9UT3 | air_conditioner | 20.90 | 27 | 2023-06-18 | inactive | 1001 |
| 3 | 790487 | water_heater | 23.35 | 36 | 2024-11-02 | maintenance | 1002 |
| 4 | 9125640 | lighting | 25.80 | 45 | 2025-04-13 | active | 1003 |

The `home_energy_reduction_programs` table tracks organizational interventions. Each program has a `program_id` (e.g., `103176`, `2986219`), `start_date` and `end_date` defining its duration, and a `program_status` of `planned`, `active`, `completed`, or `cancelled`. The `target_savings_percent` column (e.g., `16.70`, `21.80`) sets the efficiency goal, while `household_id` and `consultant_id` foreign keys link the program to its target household and the assigned energy consultant.

**Table `home_energy_reduction_programs`**

| program_id | start_date | end_date | program_status | target_savings_percent | household_id | consultant_id |
|---|---|---|---|---|---|---|
| 103176 | 2022-09-05 | 2022-09-01 | planned | 16.70 | 1000 | 8189487 |
| 2986219 | 2023-02-16 | 2023-02-12 | active | 18.40 | 1001 | 2125 |
| 1186079 | 2024-07-27 | 2024-07-23 | completed | 20.10 | 1002 | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 |
| 1562855 | 2025-12-11 | 2025-12-07 | cancelled | 21.80 | 1003 | 611493 |

The `energy_consultants` table stores the personnel who design and oversee reduction programs. Each consultant is identified by a `consultant_id` such as `8189487`, `2125`, or `c7476bbe-8fcc-11eb-924d-9cd76263cbd0`.

**Table `energy_consultants`**

| consultant_id | business_name | certification_level | contact_email |
|---|---|---|---|
| 8189487 | Baseline Protocol D | seasonal-certific-59 | Christopher Wilson |
| 2125 | Distributed Programme | regional-certific-60 | Charles Larsen |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Standard | legacy-certific-61 | Mary Alvarez |
| 611493 | Primary Framework A | compact-certific-62 | April Snyder |

### Junction Tables and Many-to-Many Associations

The schema employs a network of junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `households_appliances` table links households to their appliances, enabling a single household to own multiple devices and a device type to appear across multiple homes.

**Table `households_appliances`**

| household_id | energy_appliance_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `meters_events` junction table associates electricity meters with consumption events, supporting scenarios where a meter records multiple events or where event attribution requires an intermediate association layer.

**Table `meters_events`**

| electricity_meter_id | energy_consumption_event_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `tariffs_events` table connects energy tariffs to consumption events, allowing a single tariff to apply across many events and events to be reclassified under different tariff bands over time.

**Table `tariffs_events`**

| tariff_code | energy_consumption_event_id |
|---|---|
| lu_tax_code_template_m41 | 100 |
| lu_tax_code_template_m41 | 101 |
| lu_tax_code_template_m14 | 101 |
| lu_tax_code_template_m14 | 102 |
| 209229 | 102 |
| 209229 | 103 |
| 7119770 | 103 |
| 7119770 | 100 |

The `appliances_events` junction table links energy appliances to consumption events, capturing the relationship between specific devices and the energy usage they contribute to.

**Table `appliances_events`**

| energy_appliance_id | energy_consumption_event_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `programs_events` table associates home energy reduction programs with consumption events, enabling the tracking of program impact through measured consumption data.

**Table `programs_events`**

| program_id | energy_consumption_event_id |
|---|---|
| 103176 | 100 |
| 103176 | 101 |
| 2986219 | 101 |
| 2986219 | 102 |
| 1186079 | 102 |
| 1186079 | 103 |
| 1562855 | 103 |
| 1562855 | 100 |

The `consultants_programs` junction table connects energy consultants to the reduction programs they manage, supporting the assignment of multiple consultants to multiple programs.

**Table `consultants_programs`**

| consultant_id | program_id |
|---|---|
| 8189487 | 103176 |
| 8189487 | 2986219 |
| 2125 | 2986219 |
| 2125 | 1186079 |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | 1186079 |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | 1562855 |
| 611493 | 1562855 |
| 611493 | 103176 |

The `consultants_appliances` table links consultants to appliances, representing the advisory relationship where consultants provide recommendations or assessments for specific device types.

**Table `consultants_appliances`**

| consultant_id | energy_appliance_id |
|---|---|
| 8189487 | 1 |
| 8189487 | 2 |
| 2125 | 2 |
| 2125 | 3 |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | 4 |
| 611493 | 4 |
| 611493 | 1 |

### Views as Reconstructed Domain Facts

The view layer materializes common analytical queries by joining entity and junction tables, each view answering a specific domain question through a particular combination of normalized tables.

The `household_electricity_meter_view` reconstructs the relationship between households and their meters, answering which meter serves which household. A row from this view might show household `1000` with address `distributed-address-72` linked to meter `1` of type `analog` with reading `11.20`, while household `1001` with address `baseline-address-73` connects to meter `2` of type `digital` with reading `13.40`.

**View `household_electricity_meter_view`**

```sql
CREATE VIEW household_electricity_meter_view AS
SELECT a.id, a.household_id, a.address, a.occupancy_status, b.electricity_meter_id AS meter_electricity_meter_id, b.meter_id AS meter_meter_id, b.installation_date AS meter_installation_date
FROM households a JOIN electricity_meters b ON a.electricity_meter_id = b.electricity_meter_id;
```

| id | household_id | address | occupancy_status | meter_electricity_meter_id | meter_meter_id | meter_installation_date |
|---|---|---|---|---|---|---|
| 1000 | 726044 | distributed-address-72 | occupied | 1 | ChIJs86LmnZu5kcRmKAuH61gkZk | 2022-01-10 |
| 1001 | 16605652 | baseline-address-73 | vacant | 2 | d9da0c5a-8fcc-11eb-924d-9cd76263cbd0 | 2023-06-21 |
| 1002 | 8928495 | pilot-address-74 | occupied | 3 | 5082989 | 2024-11-05 |
| 1003 | 5844284 | extended-address-75 | vacant | 4 | 937744 | 2025-04-16 |

The `household_energy_appliance_detail_view` joins households with their appliances, revealing the device inventory of each residence. For instance, household `1000` might be shown with appliance `b_VB-IC-12` (a `refrigerator` rated at `18.45` watts, status `active`), while household `1001` has appliance `CH9UT3` (an `air_conditioner` at `20.90` watts, status `inactive`).

**View `household_energy_appliance_detail_view`**

```sql
CREATE VIEW household_energy_appliance_detail_view AS
SELECT a.id, a.household_id, a.address, b.id AS appliance_id, b.appliance_id AS appliance_appliance_id, b.appliance_type AS appliance_appliance_type
FROM households a
  JOIN households_appliances j ON j.household_id = a.id
  JOIN energy_appliances b ON b.id = j.energy_appliance_id;
```

| id | household_id | address | appliance_id | appliance_appliance_id | appliance_appliance_type |
|---|---|---|---|---|---|
| 1000 | 726044 | distributed-address-72 | 1 | b_VB-IC-12 | refrigerator |
| 1000 | 726044 | distributed-address-72 | 2 | CH9UT3 | air_conditioner |
| 1001 | 16605652 | baseline-address-73 | 2 | CH9UT3 | air_conditioner |
| 1001 | 16605652 | baseline-address-73 | 3 | 790487 | water_heater |
| 1002 | 8928495 | pilot-address-74 | 3 | 790487 | water_heater |
| 1002 | 8928495 | pilot-address-74 | 4 | 9125640 | lighting |
| 1003 | 5844284 | extended-address-75 | 4 | 9125640 | lighting |
| 1003 | 5844284 | extended-address-75 | 1 | b_VB-IC-12 | refrigerator |

The `household_home_energy_reduction_program_view` links households to their assigned reduction programs, answering which program targets which residence. A representative row might show household `1000` enrolled in program `103176` with a `target_savings_percent` of `16.70` and status `planned`, while household `1001` is associated with program `2986219` targeting `18.40` percent savings in `active` status.

**View `household_home_energy_reduction_program_view`**

```sql
CREATE VIEW household_home_energy_reduction_program_view AS
SELECT a.id, a.household_id, a.address, a.occupancy_status, b.program_id AS program_program_id, b.start_date AS program_start_date, b.end_date AS program_end_date
FROM households a JOIN home_energy_reduction_programs b ON a.program_id = b.program_id;
```

| id | household_id | address | occupancy_status | program_program_id | program_start_date | program_end_date |
|---|---|---|---|---|---|---|
| 1000 | 726044 | distributed-address-72 | occupied | 103176 | 2022-09-05 | 2022-09-01 |
| 1001 | 16605652 | baseline-address-73 | vacant | 2986219 | 2023-02-16 | 2023-02-12 |
| 1002 | 8928495 | pilot-address-74 | occupied | 1186079 | 2024-07-27 | 2024-07-23 |
| 1003 | 5844284 | extended-address-75 | vacant | 1562855 | 2025-12-11 | 2025-12-07 |

The `electricity_meter_energy_consumption_event_detail_view` joins meters with their consumption events, reconstructing the temporal record of each meter's measurements. Row evidence might show meter `1` (type `analog`) associated with event `100` at timestamp `2025-04-17T15:57:00` recording `19.20` kWh of consumption with `verified` quality, while meter `2` (type `digital`) links to event `101` at `2022-09-01T22:14:00` with `21.40` kWh and `estimated` quality.

**View `electricity_meter_energy_consumption_event_detail_view`**

```sql
CREATE VIEW electricity_meter_energy_consumption_event_detail_view AS
SELECT a.electricity_meter_id, a.meter_id, a.installation_date, b.id AS event_id, b.event_timestamp AS event_event_timestamp, b.consumption_kwh AS event_consumption_kwh
FROM electricity_meters a
  JOIN meters_events j ON j.electricity_meter_id = a.electricity_meter_id
  JOIN energy_consumption_events b ON b.id = j.energy_consumption_event_id;
```

| electricity_meter_id | meter_id | installation_date | event_id | event_event_timestamp | event_consumption_kwh |
|---|---|---|---|---|---|
| 1 | ChIJs86LmnZu5kcRmKAuH61gkZk | 2022-01-10 | 100 | 2025-04-17T15:57:00 | 19.20 |
| 1 | ChIJs86LmnZu5kcRmKAuH61gkZk | 2022-01-10 | 101 | 2022-09-01T22:14:00 | 21.40 |
| 2 | d9da0c5a-8fcc-11eb-924d-9cd76263cbd0 | 2023-06-21 | 101 | 2022-09-01T22:14:00 | 21.40 |
| 2 | d9da0c5a-8fcc-11eb-924d-9cd76263cbd0 | 2023-06-21 | 102 | 2023-02-12T05:31:00 | 23.60 |
| 3 | 5082989 | 2024-11-05 | 102 | 2023-02-12T05:31:00 | 23.60 |
| 3 | 5082989 | 2024-11-05 | 103 | 2024-07-23T12:48:00 | 25.80 |
| 4 | 937744 | 2025-04-16 | 103 | 2024-07-23T12:48:00 | 25.80 |
| 4 | 937744 | 2025-04-16 | 100 | 2025-04-17T15:57:00 | 19.20 |

The `electricity_meter_household_view` provides a direct mapping from meters back to their owning households, answering which household each meter serves. A row might pair meter `1` with household `1000` (address `distributed-address-72`, `occupied`), while meter `3` connects to household `1002` (address `pilot-address-74`, `occupied`).

**View `electricity_meter_household_view`**

```sql
CREATE VIEW electricity_meter_household_view AS
SELECT a.electricity_meter_id, a.meter_id, a.installation_date, a.meter_type, b.id AS household_id, b.household_id AS household_household_id, b.address AS household_address
FROM electricity_meters a JOIN households b ON a.household_id = b.id;
```

| electricity_meter_id | meter_id | installation_date | meter_type | household_id | household_household_id | household_address |
|---|---|---|---|---|---|---|
| 1 | ChIJs86LmnZu5kcRmKAuH61gkZk | 2022-01-10 | analog | 1000 | 726044 | distributed-address-72 |
| 2 | d9da0c5a-8fcc-11eb-924d-9cd76263cbd0 | 2023-06-21 | digital | 1001 | 16605652 | baseline-address-73 |
| 3 | 5082989 | 2024-11-05 | smart | 1002 | 8928495 | pilot-address-74 |
| 4 | 937744 | 2025-04-16 | analog | 1003 | 5844284 | extended-address-75 |

The `energy_consumption_event_electricity_meter_view` joins consumption events with their source meters, reconstructing the provenance of each measurement. Event `100` at `2025-04-17T15:57:00` consuming `19.20` kWh might be traced to meter `1` (type `analog`, reading `11.20`), while event `102` at `2023-02-12T05:31:00` consuming `23.60` kWh originates from meter `3` (type `smart`, reading `15.60`).

**View `energy_consumption_event_electricity_meter_view`**

```sql
CREATE VIEW energy_consumption_event_electricity_meter_view AS
SELECT a.id, a.event_timestamp, a.consumption_kwh, a.interval_duration, b.electricity_meter_id AS meter_electricity_meter_id, b.meter_id AS meter_meter_id, b.installation_date AS meter_installation_date
FROM energy_consumption_events a JOIN electricity_meters b ON a.electricity_meter_id = b.electricity_meter_id;
```

| id | event_timestamp | consumption_kwh | interval_duration | meter_electricity_meter_id | meter_meter_id | meter_installation_date |
|---|---|---|---|---|---|---|
| 100 | 2025-04-17T15:57:00 | 19.20 | 36 | 1 | ChIJs86LmnZu5kcRmKAuH61gkZk | 2022-01-10 |
| 101 | 2022-09-01T22:14:00 | 21.40 | 42 | 2 | d9da0c5a-8fcc-11eb-924d-9cd76263cbd0 | 2023-06-21 |
| 102 | 2023-02-12T05:31:00 | 23.60 | 48 | 3 | 5082989 | 2024-11-05 |
| 103 | 2024-07-23T12:48:00 | 25.80 | 54 | 4 | 937744 | 2025-04-16 |

The `energy_consumption_event_household_view` links consumption events to their consuming households, answering which residence generated each measurement. Event `100` consuming `19.20` kWh might be attributed to household `1000` (address `distributed-address-72`, `occupied`), while event `103` consuming `25.80` kWh is linked to household `1003` (address `extended-address-75`, `vacant`).

**View `energy_consumption_event_household_view`**

```sql
CREATE VIEW energy_consumption_event_household_view AS
SELECT a.id, a.event_timestamp, a.consumption_kwh, a.interval_duration, b.id AS household_id, b.household_id AS household_household_id, b.address AS household_address
FROM energy_consumption_events a JOIN households b ON a.household_id = b.id;
```

| id | event_timestamp | consumption_kwh | interval_duration | household_id | household_household_id | household_address |
|---|---|---|---|---|---|---|
| 100 | 2025-04-17T15:57:00 | 19.20 | 36 | 1000 | 726044 | distributed-address-72 |
| 101 | 2022-09-01T22:14:00 | 21.40 | 42 | 1001 | 16605652 | baseline-address-73 |
| 102 | 2023-02-12T05:31:00 | 23.60 | 48 | 1002 | 8928495 | pilot-address-74 |
| 103 | 2024-07-23T12:48:00 | 25.80 | 54 | 1003 | 5844284 | extended-address-75 |

The `energy_consumption_event_energy_tariff_view` joins consumption events with their applicable tariffs, reconstructing the commercial context of each measurement. Event `100` with tariff code `lu_tax_code_template_m41` might show provider `Primary Initiative A` with a `rate_per_kwh` of `10.20`, while event `102` with tariff code `209229` shows provider `Compact Cluster` at a rate of `16.60` per kWh.

**View `energy_consumption_event_energy_tariff_view`**

```sql
CREATE VIEW energy_consumption_event_energy_tariff_view AS
SELECT a.id, a.event_timestamp, a.consumption_kwh, a.interval_duration, b.tariff_code AS tariff_tariff_code, b.provider_name AS tariff_provider_name, b.base_charge AS tariff_base_charge
FROM energy_consumption_events a JOIN energy_tariffs b ON a.tariff_code = b.tariff_code;
```

| id | event_timestamp | consumption_kwh | interval_duration | tariff_tariff_code | tariff_provider_name | tariff_base_charge |
|---|---|---|---|---|---|---|
| 100 | 2025-04-17T15:57:00 | 19.20 | 36 | lu_tax_code_template_m41 | Primary Initiative A | 10.20 |
| 101 | 2022-09-01T22:14:00 | 21.40 | 42 | lu_tax_code_template_m14 | Composite Model | 12.40 |
| 102 | 2023-02-12T05:31:00 | 23.60 | 48 | 209229 | Compact Cluster | 14.60 |
| 103 | 2024-07-23T12:48:00 | 25.80 | 54 | 7119770 | Legacy Review D | 16.80 |

The `energy_tariff_energy_consumption_event_detail_view` inverts the tariff-to-event relationship, showing which events fall under each tariff's pricing structure. A row might display tariff `lu_tax_code_template_m41` (provider `Primary Initiative A`, base charge `10.20`) associated with event `100` consuming `19.20` kWh, while tariff `7119770` (provider `Legacy Review D`, rate `19.80`) links to event `103` consuming `25.80` kWh.

**View `energy_tariff_energy_consumption_event_detail_view`**

```sql
CREATE VIEW energy_tariff_energy_consumption_event_detail_view AS
SELECT a.tariff_code, a.provider_name, a.base_charge, b.id AS event_id, b.event_timestamp AS event_event_timestamp, b.consumption_kwh AS event_consumption_kwh
FROM energy_tariffs a
  JOIN tariffs_events j ON j.tariff_code = a.tariff_code
  JOIN energy_consumption_events b ON b.id = j.energy_consumption_event_id;
```

| tariff_code | provider_name | base_charge | event_id | event_event_timestamp | event_consumption_kwh |
|---|---|---|---|---|---|
| lu_tax_code_template_m41 | Primary Initiative A | 10.20 | 100 | 2025-04-17T15:57:00 | 19.20 |
| lu_tax_code_template_m41 | Primary Initiative A | 10.20 | 101 | 2022-09-01T22:14:00 | 21.40 |
| lu_tax_code_template_m14 | Composite Model | 12.40 | 101 | 2022-09-01T22:14:00 | 21.40 |
| lu_tax_code_template_m14 | Composite Model | 12.40 | 102 | 2023-02-12T05:31:00 | 23.60 |
| 209229 | Compact Cluster | 14.60 | 102 | 2023-02-12T05:31:00 | 23.60 |
| 209229 | Compact Cluster | 14.60 | 103 | 2024-07-23T12:48:00 | 25.80 |
| 7119770 | Legacy Review D | 16.80 | 103 | 2024-07-23T12:48:00 | 25.80 |
| 7119770 | Legacy Review D | 16.80 | 100 | 2025-04-17T15:57:00 | 19.20 |

The `energy_appliance_household_view` joins appliances with their owning households, answering which residence contains each device. A representative row might show appliance `b_VB-IC-12` (a `refrigerator` at `18.45` watts) belonging to household `1000` (address `distributed-address-72`), while appliance `9125640` (lighting at `25.80` watts) is owned by household `1003` (address `extended-address-75`).

**View `energy_appliance_household_view`**

```sql
CREATE VIEW energy_appliance_household_view AS
SELECT a.id, a.appliance_id, a.appliance_type, a.rated_power_watts, b.id AS household_id, b.household_id AS household_household_id, b.address AS household_address
FROM energy_appliances a JOIN households b ON a.household_id = b.id;
```

| id | appliance_id | appliance_type | rated_power_watts | household_id | household_household_id | household_address |
|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | refrigerator | 18.45 | 1000 | 726044 | distributed-address-72 |
| 2 | CH9UT3 | air_conditioner | 20.90 | 1001 | 16605652 | baseline-address-73 |
| 3 | 790487 | water_heater | 23.35 | 1002 | 8928495 | pilot-address-74 |
| 4 | 9125640 | lighting | 25.80 | 1003 | 5844284 | extended-address-75 |

The `energy_appliance_energy_consumption_event_detail_view` links appliances to consumption events, reconstructing the contribution of specific devices to overall household consumption. A row might pair appliance `b_VB-IC-12` (refrigerator, `active`) with event `100` consuming `19.20` kWh, while appliance `CH9UT3` (air conditioner, `inactive`) associates with event `101` consuming `21.40` kWh.

**View `energy_appliance_energy_consumption_event_detail_view`**

```sql
CREATE VIEW energy_appliance_energy_consumption_event_detail_view AS
SELECT a.id, a.appliance_id, a.appliance_type, b.id AS event_id, b.event_timestamp AS event_event_timestamp, b.consumption_kwh AS event_consumption_kwh
FROM energy_appliances a
  JOIN appliances_events j ON j.energy_appliance_id = a.id
  JOIN energy_consumption_events b ON b.id = j.energy_consumption_event_id;
```

| id | appliance_id | appliance_type | event_id | event_event_timestamp | event_consumption_kwh |
|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | refrigerator | 100 | 2025-04-17T15:57:00 | 19.20 |
| 1 | b_VB-IC-12 | refrigerator | 101 | 2022-09-01T22:14:00 | 21.40 |
| 2 | CH9UT3 | air_conditioner | 101 | 2022-09-01T22:14:00 | 21.40 |
| 2 | CH9UT3 | air_conditioner | 102 | 2023-02-12T05:31:00 | 23.60 |
| 3 | 790487 | water_heater | 102 | 2023-02-12T05:31:00 | 23.60 |
| 3 | 790487 | water_heater | 103 | 2024-07-23T12:48:00 | 25.80 |
| 4 | 9125640 | lighting | 103 | 2024-07-23T12:48:00 | 25.80 |
| 4 | 9125640 | lighting | 100 | 2025-04-17T15:57:00 | 19.20 |

The `home_energy_reduction_program_household_view` joins programs with their target households, answering which residence each program aims to serve. A row might show program `103176` (status `planned`, target `16.70`% savings) targeting household `1000` (address `distributed-address-72`), while program `1186079` (status `completed`, target `20.10`% savings) targets household `1002` (address `pilot-address-74`).

**View `home_energy_reduction_program_household_view`**

```sql
CREATE VIEW home_energy_reduction_program_household_view AS
SELECT a.program_id, a.start_date, a.end_date, a.program_status, b.id AS household_id, b.household_id AS household_household_id, b.address AS household_address
FROM home_energy_reduction_programs a JOIN households b ON a.household_id = b.id;
```

| program_id | start_date | end_date | program_status | household_id | household_household_id | household_address |
|---|---|---|---|---|---|---|
| 103176 | 2022-09-05 | 2022-09-01 | planned | 1000 | 726044 | distributed-address-72 |
| 2986219 | 2023-02-16 | 2023-02-12 | active | 1001 | 16605652 | baseline-address-73 |
| 1186079 | 2024-07-27 | 2024-07-23 | completed | 1002 | 8928495 | pilot-address-74 |
| 1562855 | 2025-12-11 | 2025-12-07 | cancelled | 1003 | 5844284 | extended-address-75 |

The `home_energy_reduction_program_energy_consultant_view` links programs to their assigned consultants, answering which consultant oversees each reduction initiative. A representative row might display program `103176` (status `planned`) managed by consultant `8189487`, while program `2986219` (status `active`) is overseen by consultant `2125`.

**View `home_energy_reduction_program_energy_consultant_view`**

```sql
CREATE VIEW home_energy_reduction_program_energy_consultant_view AS
SELECT a.program_id, a.start_date, a.end_date, a.program_status, b.consultant_id AS consultant_consultant_id, b.business_name AS consultant_business_name, b.certification_level AS consultant_certification_level
FROM home_energy_reduction_programs a JOIN energy_consultants b ON a.consultant_id = b.consultant_id;
```

| program_id | start_date | end_date | program_status | consultant_consultant_id | consultant_business_name | consultant_certification_level |
|---|---|---|---|---|---|---|
| 103176 | 2022-09-05 | 2022-09-01 | planned | 8189487 | Baseline Protocol D | seasonal-certific-59 |
| 2986219 | 2023-02-16 | 2023-02-12 | active | 2125 | Distributed Programme | regional-certific-60 |
| 1186079 | 2024-07-27 | 2024-07-23 | completed | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Standard | legacy-certific-61 |
| 1562855 | 2025-12-11 | 2025-12-07 | cancelled | 611493 | Primary Framework A | compact-certific-62 |

The `home_energy_reduction_program_energy_consumption_event_detail_view` joins programs with consumption events, enabling impact analysis by linking reduction initiatives to measured consumption data. A row might show program `103176` (target `16.70`% savings) associated with event `100` consuming `19.20` kWh, while program `1562855` (status `cancelled`) links to event `103` consuming `25.80` kWh.

**View `home_energy_reduction_program_energy_consumption_event_detail_view`**

```sql
CREATE VIEW home_energy_reduction_program_energy_consumption_event_detail_view AS
SELECT a.program_id, a.start_date, a.end_date, b.id AS event_id, b.event_timestamp AS event_event_timestamp, b.consumption_kwh AS event_consumption_kwh
FROM home_energy_reduction_programs a
  JOIN programs_events j ON j.program_id = a.program_id
  JOIN energy_consumption_events b ON b.id = j.energy_consumption_event_id;
```

| program_id | start_date | end_date | event_id | event_event_timestamp | event_consumption_kwh |
|---|---|---|---|---|---|
| 103176 | 2022-09-05 | 2022-09-01 | 100 | 2025-04-17T15:57:00 | 19.20 |
| 103176 | 2022-09-05 | 2022-09-01 | 101 | 2022-09-01T22:14:00 | 21.40 |
| 2986219 | 2023-02-16 | 2023-02-12 | 101 | 2022-09-01T22:14:00 | 21.40 |
| 2986219 | 2023-02-16 | 2023-02-12 | 102 | 2023-02-12T05:31:00 | 23.60 |
| 1186079 | 2024-07-27 | 2024-07-23 | 102 | 2023-02-12T05:31:00 | 23.60 |
| 1186079 | 2024-07-27 | 2024-07-23 | 103 | 2024-07-23T12:48:00 | 25.80 |
| 1562855 | 2025-12-11 | 2025-12-07 | 103 | 2024-07-23T12:48:00 | 25.80 |
| 1562855 | 2025-12-11 | 2025-12-07 | 100 | 2025-04-17T15:57:00 | 19.20 |

The `energy_consultant_home_energy_reduction_program_detail_view` inverts the consultant-to-program relationship, showing all programs managed by each consultant. A row might display consultant `8189487` managing program `103176` (status `planned`, target `16.70`% savings), while consultant `c7476bbe-8fcc-11eb-924d-9cd76263cbd0` oversees program `1186079` (status `completed`, target `20.10`% savings).

**View `energy_consultant_home_energy_reduction_program_detail_view`**

```sql
CREATE VIEW energy_consultant_home_energy_reduction_program_detail_view AS
SELECT a.consultant_id, a.business_name, a.certification_level, b.program_id AS program_program_id, b.start_date AS program_start_date, b.end_date AS program_end_date
FROM energy_consultants a
  JOIN consultants_programs j ON j.consultant_id = a.consultant_id
  JOIN home_energy_reduction_programs b ON b.program_id = j.program_id;
```

| consultant_id | business_name | certification_level | program_program_id | program_start_date | program_end_date |
|---|---|---|---|---|---|
| 8189487 | Baseline Protocol D | seasonal-certific-59 | 103176 | 2022-09-05 | 2022-09-01 |
| 8189487 | Baseline Protocol D | seasonal-certific-59 | 2986219 | 2023-02-16 | 2023-02-12 |
| 2125 | Distributed Programme | regional-certific-60 | 2986219 | 2023-02-16 | 2023-02-12 |
| 2125 | Distributed Programme | regional-certific-60 | 1186079 | 2024-07-27 | 2024-07-23 |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Standard | legacy-certific-61 | 1186079 | 2024-07-27 | 2024-07-23 |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Standard | legacy-certific-61 | 1562855 | 2025-12-11 | 2025-12-07 |
| 611493 | Primary Framework A | compact-certific-62 | 1562855 | 2025-12-11 | 2025-12-07 |
| 611493 | Primary Framework A | compact-certific-62 | 103176 | 2022-09-05 | 2022-09-01 |

The `energy_consultant_energy_appliance_detail_view` links consultants to appliances, representing the advisory relationships where consultants provide recommendations for specific devices. A row might show consultant `8189487` advising on appliance `b_VB-IC-12` (refrigerator, `active`), while consultant `2125` is associated with appliance `CH9UT3` (air conditioner, `inactive`).

**View `energy_consultant_energy_appliance_detail_view`**

```sql
CREATE VIEW energy_consultant_energy_appliance_detail_view AS
SELECT a.consultant_id, a.business_name, a.certification_level, b.id AS appliance_id, b.appliance_id AS appliance_appliance_id, b.appliance_type AS appliance_appliance_type
FROM energy_consultants a
  JOIN consultants_appliances j ON j.consultant_id = a.consultant_id
  JOIN energy_appliances b ON b.id = j.energy_appliance_id;
```

| consultant_id | business_name | certification_level | appliance_id | appliance_appliance_id | appliance_appliance_type |
|---|---|---|---|---|---|
| 8189487 | Baseline Protocol D | seasonal-certific-59 | 1 | b_VB-IC-12 | refrigerator |
| 8189487 | Baseline Protocol D | seasonal-certific-59 | 2 | CH9UT3 | air_conditioner |
| 2125 | Distributed Programme | regional-certific-60 | 2 | CH9UT3 | air_conditioner |
| 2125 | Distributed Programme | regional-certific-60 | 3 | 790487 | water_heater |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Standard | legacy-certific-61 | 3 | 790487 | water_heater |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Standard | legacy-certific-61 | 4 | 9125640 | lighting |
| 611493 | Primary Framework A | compact-certific-62 | 4 | 9125640 | lighting |
| 611493 | Primary Framework A | compact-certific-62 | 1 | b_VB-IC-12 | refrigerator |

### Synthesis

The schema's design separates persistent entity data from transient event records and association relationships, using foreign keys and junction tables to maintain referential integrity across the normalized structure. The entity tables (`households`, `electricity_meters`, `energy_consumption_events`, `energy_tariffs`, `energy_appliances`, `home_energy_reduction_programs`, `energy_consultants`) capture the stable facts of the domain, while the junction tables (`households_appliances`, `meters_events`, `tariffs_events`, `appliances_events`, `programs_events`, `consultants_programs`, `consultants_appliances`) resolve the many-to-many relationships that arise when entities participate in multiple associations. The view layer then reconstructs domain facts by joining these tables along specific paths, each view answering a particular analytical question—from which meter serves which household, to which consultant manages which program, to how consumption events relate to specific appliances and tariffs. This separation of concerns between entities, associations, and analytical views enables both data integrity and flexible querying across the household energy management domain.