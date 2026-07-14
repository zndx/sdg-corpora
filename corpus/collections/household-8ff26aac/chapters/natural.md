## Home Energy Management: Records, Relationships, and Operational Analytics

Modern residential energy management systems track the flow of electricity from the grid into individual dwellings, recording consumption at the meter, associating usage with tariff structures, cataloging the appliances that drive demand, and coordinating reduction programs guided by certified consultants. The data model underlying such a system is organized around seven base tables that capture households, meters, consumption events, tariffs, appliances, energy reduction programs, and the consultants who design them, supplemented by junction tables that express many-to-many relationships between these entities. Together, these records form a coherent operational picture: which household consumes how much energy, under what pricing, through which appliances, and in response to which reduction initiatives.

The foundation of the system is the `households` table, which stores the core attributes of each dwelling under observation.

**Table `households`**

| id | household_id | address | occupancy_status | construction_year | floor_area | electricity_meter_id | program_id |
|---|---|---|---|---|---|---|---|
| 1000 | 726044 | distributed-address-72 | occupied | 14 | 5.95 | 1 | 103176 |
| 1001 | 16605652 | baseline-address-73 | vacant | 21 | 9.90 | 2 | 2986219 |
| 1002 | 8928495 | pilot-address-74 | occupied | 28 | 13.85 | 3 | 1186079 |
| 1003 | 5844284 | extended-address-75 | vacant | 35 | 17.80 | 4 | 1562855 |

Each household record carries a unique `id` (1000 through 1003 in the sample), a `household_id` that serves as an external identifier (such as `726044` or `16605652`), and an `address` field using descriptive labels like `distributed-address-72` or `baseline-address-73`. The `occupancy_status` column distinguishes between `occupied` and `vacant` dwellings, while `construction_year` and `floor_area` provide structural context — for instance, household 1000 was built in year 14 with a floor area of 5.95 units, whereas household 1003 dates to year 35 with an area of 17.80 units. The `electricity_meter_id` column links each household to its corresponding meter, and `program_id` associates the household with a specific energy reduction program.

Electricity meters are the physical instruments that measure energy flow into each dwelling. The `electricity_meters` table records their specifications and current state.

**Table `electricity_meters`**

| electricity_meter_id | meter_id | installation_date | meter_type | current_reading | last_calibration_date | household_id |
|---|---|---|---|---|---|---|
| 1 | ChIJs86LmnZu5kcRmKAuH61gkZk | 2022-01-10 | analog | 11.20 | 2025-12-01 | 1000 |
| 2 | d9da0c5a-8fcc-11eb-924d-9cd76263cbd0 | 2023-06-21 | digital | 13.40 | 2022-05-12 | 1001 |
| 3 | 5082989 | 2024-11-05 | smart | 15.60 | 2023-10-23 | 1002 |
| 4 | 937744 | 2025-04-16 | analog | 17.80 | 2024-03-07 | 1003 |

The `electricity_meter_id` (1 through 4) serves as the primary key, while `meter_id` holds a unique device identifier — for example, meter 1 carries the identifier `ChIJs86LmnZu5kcRmKAuH61gkZk`, and meter 2 uses the UUID `d9da0c5a-8fcc-11eb-924d-9cd76263cbd0`. The `installation_date` records when the meter was deployed, ranging from `2022-01-10` for meter 1 to `2025-04-16` for meter 4. The `meter_type` column classifies devices as `analog`, `digital`, or `smart`, with meters 1 and 4 being analog and meter 3 being a smart meter. The `current_reading` reflects the latest energy measurement (11.20 for meter 1, 17.80 for meter 4), and `last_calibration_date` tracks the most recent calibration event. The `household_id` column establishes the link back to the dwelling the meter serves.

Energy consumption events are the granular measurements captured by these meters over time. The `energy_consumption_events` table stores each recorded interval of energy use.

**Table `energy_consumption_events`**

| id | event_timestamp | consumption_kwh | interval_duration | measurement_quality | tariff_band | electricity_meter_id | household_id | tariff_code |
|---|---|---|---|---|---|---|---|---|
| 100 | 2025-04-17T15:57:00 | 19.20 | 36 | verified | adaptive-tariff-89 | 1 | 1000 | lu_tax_code_template_m41 |
| 101 | 2022-09-01T22:14:00 | 21.40 | 42 | estimated | distributed-tariff-90 | 2 | 1001 | lu_tax_code_template_m14 |
| 102 | 2023-02-12T05:31:00 | 23.60 | 48 | flagged | baseline-tariff-91 | 3 | 1002 | 209229 |
| 103 | 2024-07-23T12:48:00 | 25.80 | 54 | verified | pilot-tariff-92 | 4 | 1003 | 7119770 |

Each event has a unique `id` (100 through 103 in the sample), an `event_timestamp` indicating when the measurement was taken (such as `2025-04-17T15:57:00` for event 100), and a `consumption_kwh` value representing the energy consumed during the interval (19.20 kWh for event 100, 25.80 kWh for event 103). The `interval_duration` column records the length of the measurement window in minutes (36 for event 100, 54 for event 103), and `measurement_quality` indicates the confidence level of the reading — values include `verified`, `estimated`, and `flagged`. The `tariff_band` column references the pricing tier active at the time of consumption (e.g., `adaptive-tariff-89` for event 100, `pilot-tariff-92` for event 103). Each event is linked to its source meter via `electricity_meter_id` and to the consuming household via `household_id`. The `tariff_code` column provides the specific tariff identifier applied to the event, such as `lu_tax_code_template_m41` for event 100.

The `energy_tariffs` table defines the pricing structures that govern how consumption is billed.

**Table `energy_tariffs`**

| tariff_code | provider_name | base_charge | rate_per_kwh | effective_date | expiration_date |
|---|---|---|---|---|---|
| lu_tax_code_template_m41 | Primary Initiative A | 10.20 | 10.20 | 2023-02-14 | 2025-08-18 |
| lu_tax_code_template_m14 | Composite Model | 12.40 | 13.40 | 2024-07-25 | 2022-01-02 |
| 209229 | Compact Cluster | 14.60 | 16.60 | 2025-12-09 | 2023-06-13 |
| 7119770 | Legacy Review D | 16.80 | 19.80 | 2022-05-20 | 2024-11-24 |

Each tariff is identified by its `tariff_code` (e.g., `lu_tax_code_template_m41`, `209229`), has a `provider_name` (such as `Primary Initiative A` or `Compact Cluster`), and specifies a `base_charge` and `rate_per_kwh` — for instance, tariff `lu_tax_code_template_m41` carries a base charge of 10.20 and a rate of 10.20 per kilowatt-hour. The `effective_date` and `expiration_date` define the validity window of each tariff; tariff `lu_tax_code_template_m41` is effective from `2023-02-14` through `2025-08-18`, while tariff `lu_tax_code_template_m14` has an expiration date of `2022-01-02`, indicating it has lapsed.

Household appliances are cataloged in the `energy_appliances` table, which records the devices that drive energy demand within each dwelling.

**Table `energy_appliances`**

| id | appliance_id | appliance_type | rated_power_watts | energy_star_rating | purchase_date | operational_status | household_id |
|---|---|---|---|---|---|---|---|
| 1 | b_VB-IC-12 | refrigerator | 18.45 | 18 | 2022-01-07 | active | 1000 |
| 2 | CH9UT3 | air_conditioner | 20.90 | 27 | 2023-06-18 | inactive | 1001 |
| 3 | 790487 | water_heater | 23.35 | 36 | 2024-11-02 | maintenance | 1002 |
| 4 | 9125640 | lighting | 25.80 | 45 | 2025-04-13 | active | 1003 |

Each appliance record has a unique `id` (1 through 4), an `appliance_id` serving as a device identifier (such as `b_VB-IC-12` for the refrigerator in household 1000), and an `appliance_type` (refrigerator, air_conditioner, water_heater, lighting). The `rated_power_watts` column specifies the device's power rating (18.45 watts for the refrigerator, 25.80 watts for the lighting unit), and `energy_star_rating` provides an efficiency score (18 for the refrigerator, 45 for the lighting). The `purchase_date` records when the appliance was acquired, and `operational_status` indicates its current state — values include `active`, `inactive`, and `maintenance`. The `household_id` column links each appliance to the dwelling it serves.

Energy reduction programs are tracked in the `home_energy_reduction_programs` table, which captures the structure and status of initiatives designed to lower household energy consumption.

**Table `home_energy_reduction_programs`**

| program_id | start_date | end_date | program_status | target_savings_percent | household_id | consultant_id |
|---|---|---|---|---|---|---|
| 103176 | 2022-09-05 | 2022-09-01 | planned | 16.70 | 1000 | 8189487 |
| 2986219 | 2023-02-16 | 2023-02-12 | active | 18.40 | 1001 | 2125 |
| 1186079 | 2024-07-27 | 2024-07-23 | completed | 20.10 | 1002 | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 |
| 1562855 | 2025-12-11 | 2025-12-07 | cancelled | 21.80 | 1003 | 611493 |

Each program has a unique `program_id` (103176, 2986219, 1186079, 1562855), a `start_date` and `end_date` defining its operational window, and a `program_status` indicating its current phase — values include `planned`, `active`, `completed`, and `cancelled`. The `target_savings_percent` column specifies the goal for energy reduction (16.70% for program 103176, 21.80% for program 1562855). The `household_id` column links the program to the household it targets, and `consultant_id` identifies the energy consultant responsible for designing or managing the program.

The `energy_consultants` table stores information about the professionals who design and oversee these reduction programs.

**Table `energy_consultants`**

| consultant_id | business_name | certification_level | contact_email |
|---|---|---|---|
| 8189487 | Baseline Protocol D | seasonal-certific-59 | Christopher Wilson |
| 2125 | Distributed Programme | regional-certific-60 | Charles Larsen |
| c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Standard | legacy-certific-61 | Mary Alvarez |
| 611493 | Primary Framework A | compact-certific-62 | April Snyder |

Each consultant record carries a unique `id`, a `consultant_id` as an external identifier, a `name`, a `specialization` area, and a `contact_email` for communication.

Beyond the core entity tables, several junction tables capture many-to-many relationships that arise when a single entity participates in multiple associations. The `households_appliances` table links households to their appliances, allowing a household to be associated with multiple devices and an appliance model to appear across multiple households. The `meters_events` table connects electricity meters to their consumption events, enabling a meter to accumulate many readings over time. The `tariffs_events` table associates tariff definitions with the consumption events they governed, supporting historical billing analysis. The `programs_events` table links energy reduction programs to the consumption events that occurred during their active periods, enabling impact assessment.

The `consultants_programs` table records which consultants are assigned to which programs, and the `consultants_appliances` table tracks which consultants have expertise with or recommendations for specific appliance types.

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

These junction tables ensure that the data model supports flexible, real-world relationships: a consultant may oversee multiple programs and advise on multiple appliance categories, while a household may own multiple appliances and participate in multiple programs over time.

The system's analytical power emerges from its views, which join these base and junction tables to answer specific operational questions. Each view presents a pre-joined perspective on the data, combining entity attributes with their relationships into a single, queryable result set.

The `household_electricity_meter_view` joins households with their associated electricity meters, answering the question of which meter serves which dwelling and what the meter's current state is.

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

This view reveals, for example, that household 1000 (address `distributed-address-72`, occupied, built in year 14) is served by meter 1 (type `analog`, current reading 11.20, last calibrated on `2025-12-01`). Similarly, household 1002 (address `pilot-address-74`, occupied, built in year 28) is served by meter 3 (type `smart`, current reading 15.60).

The `household_energy_appliance_detail_view` joins households with their appliances, providing a complete picture of what devices operate within each dwelling.

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

From this view, one can see that household 1000 operates a refrigerator (appliance ID `b_VB-IC-12`, rated at 18.45 watts, energy star rating 18, status `active`), while household 1001 has an air conditioner (appliance ID `CH9UT3`, rated at 20.90 watts, status `inactive`).

The `household_home_energy_reduction_program_view` joins households with their assigned energy reduction programs, showing which initiatives target each dwelling.

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

This view shows that household 1000 is enrolled in program 103176 (status `planned`, target savings 16.70%), while household 1001 is enrolled in program 2986219 (status `active`, target savings 18.40%).

The `electricity_meter_energy_consumption_event_detail_view` joins meters with their consumption events, linking physical instruments to the readings they produce.

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

This view reveals that meter 1 (analog, reading 11.20) produced event 100 (consumption 19.20 kWh, verified quality, adaptive tariff band), while meter 4 (analog, reading 17.80) produced event 103 (consumption 25.80 kWh, verified quality, pilot tariff band).

The `electricity_meter_household_view` joins meters with their households, providing the inverse perspective of the meter-to-household relationship.

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

This view confirms that meter 2 (digital, reading 13.40) serves household 1001 (address `baseline-address-73`, vacant, built in year 21), and meter 3 (smart, reading 15.60) serves household 1002 (address `pilot-address-74`, occupied, built in year 28).

The `energy_consumption_event_electricity_meter_view` joins consumption events with their source meters, answering which meter generated each reading.

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

From this view, event 101 (consumption 21.40 kWh, estimated quality, `2022-09-01T22:14:00`) is traced to meter 2 (digital, reading 13.40), and event 102 (consumption 23.60 kWh, flagged quality, `2023-02-12T05:31:00`) is traced to meter 3 (smart, reading 15.60).

The `energy_consumption_event_household_view` joins consumption events with their source households, showing which dwelling consumed the energy.

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

This view shows that event 100 (19.20 kWh, verified) was consumed by household 1000 (address `distributed-address-72`, occupied), and event 103 (25.80 kWh, verified) was consumed by household 1003 (address `extended-address-75`, vacant).

The `energy_consumption_event_energy_tariff_view` joins consumption events with their applicable tariffs, linking energy use to its pricing structure.

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

This view reveals that event 100 (19.20 kWh, adaptive tariff band) was billed under tariff `lu_tax_code_template_m41` (provider `Primary Initiative A`, base charge 10.20, rate 10.20/kWh), while event 102 (23.60 kWh, baseline tariff band) was billed under tariff `209229` (provider `Compact Cluster`, base charge 14.60, rate 16.60/kWh).

The `energy_tariff_energy_consumption_event_detail_view` joins tariffs with their consumption events, providing the inverse perspective of the tariff-to-event relationship.

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

This view shows that tariff `lu_tax_code_template_m41` (effective `2023-02-14` through `2025-08-18`) governed event 100, and tariff `lu_tax_code_template_m14` (effective `2024-07-25`, expired `2022-01-02`) governed event 101.

The `energy_appliance_household_view` joins appliances with their households, showing which devices belong to which dwellings.

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

This view confirms that the refrigerator (appliance ID `b_VB-IC-12`, 18.45 watts, status `active`) belongs to household 1000, and the lighting unit (appliance ID `9125640`, 25.80 watts, status `active`) belongs to household 1003.

The `energy_appliance_energy_consumption_event_detail_view` joins appliances with consumption events, enabling analysis of which devices may have driven specific consumption patterns.

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

This view links the refrigerator in household 1000 to event 100 (19.20 kWh consumption), and the air conditioner in household 1001 to event 101 (21.40 kWh consumption).

The `home_energy_reduction_program_household_view` joins programs with their target households, showing which dwellings are enrolled in each initiative.

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

This view shows that program 103176 (status `planned`, target savings 16.70%) targets household 1000, and program 1186079 (status `completed`, target savings 20.10%) targeted household 1002.

The `home_energy_reduction_program_energy_consultant_view` joins programs with their assigned consultants, identifying who is responsible for each initiative.

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

This view reveals that program 103176 is managed by consultant 8189487, program 2986219 by consultant 2125, program 1186079 by consultant `c7476bbe-8fcc-11eb-924d-9cd76263cbd0`, and program 1562855 by consultant 611493.

The `home_energy_reduction_program_energy_consumption_event_detail_view` joins programs with consumption events, enabling assessment of consumption patterns during program periods.

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

This view links program 103176 (target savings 16.70%) to event 100 (19.20 kWh consumption), and program 2986219 (target savings 18.40%) to event 101 (21.40 kWh consumption).

The `energy_consultant_home_energy_reduction_program_detail_view` joins consultants with their programs, providing a consultant-centric view of their portfolio.

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

This view shows that consultant 8189487 manages program 103176 (status `planned`, target savings 16.70%), and consultant 2125 manages program 2986219 (status `active`, target savings 18.40%).

The `energy_consultant_energy_appliance_detail_view` joins consultants with appliances, revealing which device types each consultant specializes in or recommends.

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

This view connects consultant 8189487 to the refrigerator (appliance ID `b_VB-IC-12`, 18.45 watts) in household 1000, and consultant 2125 to the air conditioner (appliance ID `CH9UT3`, 20.90 watts) in household 1001.

The operational relationships captured by these tables and views form a comprehensive record of residential energy management. Households are the central entities, each linked to a meter that records consumption, to appliances that drive demand, to tariffs that price usage, and to reduction programs that aim to lower it. Consultants provide the expertise that shapes these programs and informs appliance choices. The junction tables and views ensure that every relationship — from meter to event, from tariff to consumption, from consultant to program — is traceable and queryable. This structure supports both real-time operational monitoring and retrospective analysis, enabling utilities, program administrators, and households themselves to understand energy flows, evaluate pricing, assess program effectiveness, and make informed decisions about efficiency improvements.

## Data appendix

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
