The domain under examination is an industrial monitoring ecosystem in which shock absorbers, structural installations, transient shock events, continuous temperature observations, power delivery subsystems, and the sensors that measure them are all tracked as interrelated assets. Each asset carries a lifecycle status—`pending`, `running`, `complete`, or `failed`—and a human-readable identifier such as `IDE-2086` or `IDE-2101`. The relational model captures these entities as six base tables, linked by foreign keys that encode one-to-one and one-to-many relationships. A set of twelve views then materialises the most common join paths so that analysts can query domain facts without writing joins by hand.

**Table `shock_absorbers`**

| id | identifier | model | max_force | max_voltage | max_power | status | installation_date | structure_id | temperature_reading_id | power_system_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | composite-model-81 | 18.45 | 3.45 | 21.95 | pending | 2022-01-10T00:12:00 | 1000 | 1 | 100 |
| 1001 | IDE-2091 | primary-model-82 | 22.90 | 6.90 | 24.90 | running | 2023-06-21T07:29:00 | 1001 | 2 | 101 |
| 1002 | IDE-2096 | adaptive-model-83 | 27.35 | 10.35 | 27.85 | complete | 2024-11-05T14:46:00 | 1002 | 3 | 102 |
| 1003 | IDE-2101 | distributed-model-84 | 31.80 | 13.80 | 30.80 | failed | 2025-04-16T21:03:00 | 1003 | 4 | 103 |

The `shock_absorbers` table is the central equipment registry. Each row represents a physical shock absorber unit identified by a surrogate primary key `id` (e.g., `1000`) and a business identifier `identifier` (e.g., `IDE-2086`). The `model` column classifies the absorber type—`composite-model-81`, `primary-model-82`, `adaptive-model-83`, `distributed-model-84`—while `max_force`, `max_voltage`, and `max_power` record the engineering limits of the device. The `status` column tracks operational state, and `installation_date` anchors the unit in time. Three foreign keys—`structure_id`, `temperature_reading_id`, and `power_system_id`—tie each absorber to its host structure, its associated temperature observation, and its power supply, respectively. For instance, absorber `1000` (`IDE-2086`) is linked to structure `1000`, temperature reading `1`, and power system `100`.

**Table `structures`**

| id | identifier | name | location | area | volume | status | construction_date | shock_absorber_id | shock_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | extended-location-99 | 5.95 | 9.45 | pending | 2023-06-12T05:27:00 | 1000 | 1 |
| 1001 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 7.90 | 11.90 | running | 2024-11-23T12:44:00 | 1001 | 2 |
| 1002 | IDE-2096 | Baseline Model | seasonal-location-101 | 9.85 | 14.35 | complete | 2025-04-07T19:01:00 | 1002 | 3 |
| 1003 | IDE-2101 | Distributed Cluster | regional-location-102 | 11.80 | 16.80 | failed | 2022-09-18T02:18:00 | 1003 | 4 |

The `structures` table describes the physical installations that host shock absorbers. Its primary key `id` (e.g., `1000`) pairs with a human-readable `name` such as `Extended Review` or `Pilot Initiative A`. The `location` column stores a site code like `extended-location-99`, while `area` and `volume` capture geometric dimensions—`5.95` and `9.45` for structure `1000`, for example. The `status` and `construction_date` columns mirror the lifecycle pattern of the absorbers. Two foreign keys, `shock_absorber_id` and `shock_event_id`, create a bidirectional link: each structure references the absorber it hosts, and each structure references the shock event that triggered its monitoring. Structure `1000` (`IDE-2086`, `Extended Review`) is associated with shock absorber `1000` and shock event `1`.

**Table `shock_events`**

| shock_event_id | identifier | start_time | end_time | intensity | depth | force | status | duration | structure_id | temperature_reading_id | sensor_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 7.20 | 0.15 | 20.70 | pending | 4.20 | 1000 | 1 | 100 |
| 2 | IDE-2091 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 9.40 | 0.07500005 | 23.40 | running | 8.40 | 1001 | 2 | 101 |
| 3 | IDE-2096 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 11.60 | 2.5 | 26.10 | complete | 12.60 | 1002 | 3 | 102 |
| 4 | IDE-2101 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 13.80 | 0.44305528 | 28.80 | failed | 16.80 | 1003 | 4 | 103 |

Transient shock events are recorded in the `shock_events` table, where the primary key `shock_event_id` (e.g., `1`) identifies each incident. The `identifier` column (`IDE-2086`) provides a business key, while `start_time` and `end_time` delimit the event window—`2024-03-27T14:42:00` to `2023-02-26T13:27:00` for event `1`, noting that the end time precedes the start time in the raw data, a quirk of the synthetic dataset. The `intensity`, `depth`, `force`, and `duration` columns quantify the physical characteristics of the event; event `1` has an intensity of `7.20`, a depth of `0.15`, a force of `20.70`, and a duration of `4.20`. The `structure_id`, `temperature_reading_id`, and `sensor_id` foreign keys connect the event to its host structure, its temperature observation, and the sensor that recorded it. Event `1` is linked to structure `1000`, temperature reading `1`, and sensor `100`.

**Table `temperature_readings`**

| temperature_reading_id | identifier | value | unit | timestamp | location | status | sensor_id | structure_id | shock_event_id | measured_by_sensor_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 19.95 | distributed-unit-18 | 2024-07-08T18:18:00 | extended-location-99 | pending | 5c6f01c708ff420a862fd80b80bd80dc | 1000 | 1 | 100 |
| 2 | IDE-2091 | 21.90 | baseline-unit-19 | 2025-12-19T01:35:00 | integrated-location-100 | running | 937728 | 1001 | 2 | 101 |
| 3 | IDE-2096 | 23.85 | pilot-unit-20 | 2022-05-03T08:52:00 | seasonal-location-101 | complete | 209232 | 1002 | 3 | 102 |
| 4 | IDE-2101 | 25.80 | extended-unit-21 | 2023-10-14T15:09:00 | regional-location-102 | failed | 2530a2f0-8fb3-11eb-924d-9cd76263cbd0 | 1003 | 4 | 103 |

The `temperature_readings` table logs continuous thermal observations. Its surrogate key `temperature_reading_id` (e.g., `1`) pairs with the `identifier` (`IDE-2086`). The `value` column holds the measured temperature—`19.95` for reading `1`—and `unit` specifies the scale, such as `distributed-unit-18`. The `timestamp` records when the reading was taken (`2024-07-08T18:18:00`), and `location` repeats the site code (`extended-location-99`). The `sensor_id` column references the sensor that produced the reading, while `structure_id` and `shock_event_id` tie the observation to its host structure and the triggering event. An additional column, `measured_by_sensor_id`, provides a secondary sensor reference. Reading `1` (`IDE-2086`, value `19.95`) was captured by sensor `5c6f01c708ff420a862fd80b80bd80dc` at structure `1000` during shock event `1`.

**Table `power_systems`**

| power_system_id | identifier | voltage | current | power | status | installation_date | cable_type | shock_absorber_id | structure_id | sensor_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 16.45 | 10.20 | 21.70 | pending | 2022-01-10T00:12:00 | seasonal-cable-53 | 1000 | 1000 | 100 |
| 101 | IDE-2091 | 20.90 | 13.40 | 25.40 | running | 2023-06-21T07:29:00 | regional-cable-54 | 1001 | 1001 | 101 |
| 102 | IDE-2096 | 25.35 | 16.60 | 29.10 | complete | 2024-11-05T14:46:00 | legacy-cable-55 | 1002 | 1002 | 102 |
| 103 | IDE-2101 | 29.80 | 19.80 | 32.80 | failed | 2025-04-16T21:03:00 | compact-cable-56 | 1003 | 1003 | 103 |

Power delivery infrastructure is modelled in the `power_systems` table. The primary key `power_system_id` (e.g., `100`) identifies each subsystem, with `identifier` (`IDE-2086`) as the business key. Electrical parameters—`voltage` (`16.45`), `current` (`10.20`), and `power` (`21.70`)—describe the system's output. The `status` column tracks operational state, `installation_date` anchors deployment, and `cable_type` specifies the wiring standard, such as `seasonal-cable-53`. Foreign keys `shock_absorber_id`, `structure_id`, and `sensor_id` link the power system to the absorber it feeds, the structure it serves, and the sensor monitoring it. Power system `100` (`IDE-2086`, voltage `16.45`) supplies absorber `1000` at structure `1000`, monitored by sensor `100`.

**Table `sensors`**

| id | identifier | type | accuracy | status | installation_date | calibration_date | temperature_reading_id | power_system_id | structure_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | composite-type-69 | 17.20 | pending | 2022-01-10T00:12:00 | 2023-02-08T01:51:00 | 1 | 100 | 1000 |
| 101 | IDE-2091 | primary-type-70 | 21.40 | running | 2023-06-21T07:29:00 | 2024-07-19T08:08:00 | 2 | 101 | 1001 |
| 102 | IDE-2096 | adaptive-type-71 | 25.60 | complete | 2024-11-05T14:46:00 | 2025-12-03T15:25:00 | 3 | 102 | 1002 |
| 103 | IDE-2101 | distributed-type-72 | 29.80 | failed | 2025-04-16T21:03:00 | 2022-05-14T22:42:00 | 4 | 103 | 1003 |

The `sensors` table is the master catalog of measurement devices. Its primary key `id` (e.g., `100`) pairs with `identifier` (`IDE-2086`) and `type` (`composite-type-69`). The `accuracy` column records precision—`17.20` for sensor `100`—while `status`, `installation_date`, and `calibration_date` manage the device lifecycle. Three foreign keys—`temperature_reading_id`, `power_system_id`, and `structure_id`—tie each sensor to the temperature reading it produces, the power system it draws from, and the structure it is mounted on. Sensor `100` (`IDE-2086`, `composite-type-69`, accuracy `17.20`) is installed at structure `1000`, draws power from system `100`, and produces temperature reading `1`.

The foreign-key topology across these six tables forms a tightly coupled mesh. The `shock_absorbers` table holds three outbound foreign keys pointing to `structures`, `temperature_readings`, and `power_systems`. Conversely, `structures` references `shock_absorbers` and `shock_events`, creating a bidirectional absorber–structure link. `shock_events` points to `structures`, `temperature_readings`, and `sensors`. `temperature_readings` references `sensors`, `structures`, and `shock_events`. `power_systems` points to `shock_absorbers`, `structures`, and `sensors`. Finally, `sensors` references `temperature_readings`, `power_systems`, and `structures`. This dense interconnection means that any single entity—say, shock absorber `1000`—can be traced through its associated structure, shock event, temperature reading, power system, and sensor in a single hop.

**View `vw_shock_absorber_structure`**

```sql
CREATE VIEW vw_shock_absorber_structure AS
SELECT a.id, a.identifier, a.model, a.max_force, b.id AS structure_id, b.identifier AS structure_identifier, b.name AS structure_name
FROM shock_absorbers a JOIN structures b ON a.structure_id = b.id;
```

| id | identifier | model | max_force | structure_id | structure_identifier | structure_name |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | composite-model-81 | 18.45 | 1000 | IDE-2086 | Extended Review |
| 1001 | IDE-2091 | primary-model-82 | 22.90 | 1001 | IDE-2091 | Pilot Initiative A |
| 1002 | IDE-2096 | adaptive-model-83 | 27.35 | 1002 | IDE-2096 | Baseline Model |
| 1003 | IDE-2101 | distributed-model-84 | 31.80 | 1003 | IDE-2101 | Distributed Cluster |

The view `vw_shock_absorber_structure` joins `shock_absorbers` to `structures` on the mutual foreign keys, answering the question: "Which structure hosts which shock absorber, and what are their combined attributes?" For absorber `1000` (`IDE-2086`, `composite-model-81`, status `pending`), the view returns structure `1000` (`IDE-2086`, `Extended Review`, `extended-location-99`, area `5.95`). The join confirms that absorber `1000` is installed at structure `1000`, and both entities share the same lifecycle status (`pending`).

**View `vw_shock_absorber_temperature_reading`**

```sql
CREATE VIEW vw_shock_absorber_temperature_reading AS
SELECT a.id, a.identifier, a.model, a.max_force, b.temperature_reading_id AS reading_temperature_reading_id, b.identifier AS reading_identifier, b.value AS reading_value
FROM shock_absorbers a JOIN temperature_readings b ON a.temperature_reading_id = b.temperature_reading_id;
```

| id | identifier | model | max_force | reading_temperature_reading_id | reading_identifier | reading_value |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | composite-model-81 | 18.45 | 1 | IDE-2086 | 19.95 |
| 1001 | IDE-2091 | primary-model-82 | 22.90 | 2 | IDE-2091 | 21.90 |
| 1002 | IDE-2096 | adaptive-model-83 | 27.35 | 3 | IDE-2096 | 23.85 |
| 1003 | IDE-2101 | distributed-model-84 | 31.80 | 4 | IDE-2101 | 25.80 |

The view `vw_shock_absorber_temperature_reading` links `shock_absorbers` to `temperature_readings`, answering: "What temperature reading is associated with each shock absorber?" Absorber `1001` (`IDE-2091`, `primary-model-82`, status `running`) is paired with temperature reading `2` (`IDE-2091`, value `21.90`, unit `baseline-unit-19`, status `running`). The matching statuses and identifiers across the two tables indicate a synchronized operational state: the absorber is running, and its associated temperature reading was captured while the system was active.

**View `vw_shock_absorber_power_system`**

```sql
CREATE VIEW vw_shock_absorber_power_system AS
SELECT a.id, a.identifier, a.model, a.max_force, b.power_system_id AS system_power_system_id, b.identifier AS system_identifier, b.voltage AS system_voltage
FROM shock_absorbers a JOIN power_systems b ON a.power_system_id = b.power_system_id;
```

| id | identifier | model | max_force | system_power_system_id | system_identifier | system_voltage |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | composite-model-81 | 18.45 | 100 | IDE-2086 | 16.45 |
| 1001 | IDE-2091 | primary-model-82 | 22.90 | 101 | IDE-2091 | 20.90 |
| 1002 | IDE-2096 | adaptive-model-83 | 27.35 | 102 | IDE-2096 | 25.35 |
| 1003 | IDE-2101 | distributed-model-84 | 31.80 | 103 | IDE-2101 | 29.80 |

The view `vw_shock_absorber_power_system` joins `shock_absorbers` to `power_systems`, answering: "Which power system supplies each shock absorber?" Absorber `1002` (`IDE-2096`, `adaptive-model-83`, status `complete`) is linked to power system `102` (`IDE-2096`, voltage `25.35`, current `16.60`, power `29.10`, status `complete`). Both entities share the `complete` status, suggesting that the power system and absorber reached their operational target simultaneously.

**View `vw_structure_shock_absorber`**

```sql
CREATE VIEW vw_structure_shock_absorber AS
SELECT a.id, a.identifier, a.name, a.location, b.id AS absorber_id, b.identifier AS absorber_identifier, b.model AS absorber_model
FROM structures a JOIN shock_absorbers b ON a.shock_absorber_id = b.id;
```

| id | identifier | name | location | absorber_id | absorber_identifier | absorber_model |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | extended-location-99 | 1000 | IDE-2086 | composite-model-81 |
| 1001 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 1001 | IDE-2091 | primary-model-82 |
| 1002 | IDE-2096 | Baseline Model | seasonal-location-101 | 1002 | IDE-2096 | adaptive-model-83 |
| 1003 | IDE-2101 | Distributed Cluster | regional-location-102 | 1003 | IDE-2101 | distributed-model-84 |

The view `vw_structure_shock_absorber` performs the inverse join of `vw_shock_absorber_structure`, answering: "From the structure's perspective, which shock absorber is installed here?" Structure `1002` (`IDE-2096`, `Baseline Model`, `seasonal-location-101`, volume `14.35`) is paired with shock absorber `1002` (`IDE-2096`, `adaptive-model-83`, max_force `27.35`). The view confirms the bidirectional relationship: the structure hosts the absorber, and the absorber references the structure.

**View `vw_structure_shock_event`**

```sql
CREATE VIEW vw_structure_shock_event AS
SELECT a.id, a.identifier, a.name, a.location, b.shock_event_id AS event_shock_event_id, b.identifier AS event_identifier, b.start_time AS event_start_time
FROM structures a JOIN shock_events b ON a.shock_event_id = b.shock_event_id;
```

| id | identifier | name | location | event_shock_event_id | event_identifier | event_start_time |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | extended-location-99 | 1 | IDE-2086 | 2024-03-27T14:42:00 |
| 1001 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 2 | IDE-2091 | 2025-08-11T21:59:00 |
| 1002 | IDE-2096 | Baseline Model | seasonal-location-101 | 3 | IDE-2096 | 2022-01-22T04:16:00 |
| 1003 | IDE-2101 | Distributed Cluster | regional-location-102 | 4 | IDE-2101 | 2023-06-06T11:33:00 |

The view `vw_structure_shock_event` joins `structures` to `shock_events`, answering: "Which shock event is associated with each structure?" Structure `1001` (`IDE-2091`, `Pilot Initiative A`, `integrated-location-100`, area `7.90`) is linked to shock event `2` (`IDE-2091`, intensity `9.40`, depth `0.075`, force `23.40`, duration `8.40`, status `running`). The matching `running` status across both tables indicates that the structure and its associated shock event are both in an active state.

**View `vw_shock_event_structure`**

```sql
CREATE VIEW vw_shock_event_structure AS
SELECT a.shock_event_id, a.identifier, a.start_time, a.end_time, b.id AS structure_id, b.identifier AS structure_identifier, b.name AS structure_name
FROM shock_events a JOIN structures b ON a.structure_id = b.id;
```

| shock_event_id | identifier | start_time | end_time | structure_id | structure_identifier | structure_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1000 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 1001 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 1002 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 1003 | IDE-2101 | Distributed Cluster |

The view `vw_shock_event_structure` performs the inverse join of `vw_structure_shock_event`, answering: "From the shock event's perspective, which structure was affected?" Shock event `3` (`IDE-2096`, intensity `11.60`, depth `2.5`, force `26.10`, duration `12.60`, status `complete`) is paired with structure `1002` (`IDE-2096`, `Baseline Model`, `seasonal-location-101`, volume `14.35`). The `complete` status on both sides suggests the event concluded and the structure's response was fully recorded.

**View `vw_shock_event_temperature_reading`**

```sql
CREATE VIEW vw_shock_event_temperature_reading AS
SELECT a.shock_event_id, a.identifier, a.start_time, a.end_time, b.temperature_reading_id AS reading_temperature_reading_id, b.identifier AS reading_identifier, b.value AS reading_value
FROM shock_events a JOIN temperature_readings b ON a.temperature_reading_id = b.temperature_reading_id;
```

| shock_event_id | identifier | start_time | end_time | reading_temperature_reading_id | reading_identifier | reading_value |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | IDE-2086 | 19.95 |
| 2 | IDE-2091 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | IDE-2091 | 21.90 |
| 3 | IDE-2096 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | IDE-2096 | 23.85 |
| 4 | IDE-2101 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | IDE-2101 | 25.80 |

The view `vw_shock_event_temperature_reading` joins `shock_events` to `temperature_readings`, answering: "What temperature reading was captured during each shock event?" Shock event `4` (`IDE-2101`, intensity `13.80`, depth `0.443`, force `28.80`, duration `16.80`, status `failed`) is linked to temperature reading `4` (`IDE-2101`, value `25.80`, unit `extended-unit-21`, status `failed`). The shared `failed` status indicates that both the shock event and its associated temperature reading were recorded in a failed state, possibly reflecting a system-wide fault.

**View `vw_shock_event_sensor`**

```sql
CREATE VIEW vw_shock_event_sensor AS
SELECT a.shock_event_id, a.identifier, a.start_time, a.end_time, b.id AS sensor_id, b.identifier AS sensor_identifier, b.type AS sensor_type
FROM shock_events a JOIN sensors b ON a.sensor_id = b.id;
```

| shock_event_id | identifier | start_time | end_time | sensor_id | sensor_identifier | sensor_type |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | IDE-2086 | composite-type-69 |
| 2 | IDE-2091 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | IDE-2091 | primary-type-70 |
| 3 | IDE-2096 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | IDE-2096 | adaptive-type-71 |
| 4 | IDE-2101 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | IDE-2101 | distributed-type-72 |

The view `vw_shock_event_sensor` joins `shock_events` to `sensors`, answering: "Which sensor recorded each shock event?" Shock event `1` (`IDE-2086`, intensity `7.20`, force `20.70`, status `pending`) is paired with sensor `100` (`IDE-2086`, `composite-type-69`, accuracy `17.20`, status `pending`). The matching identifiers and statuses confirm that sensor `100` was the device responsible for capturing the data for shock event `1`.

**View `vw_temperature_reading_structure`**

```sql
CREATE VIEW vw_temperature_reading_structure AS
SELECT a.temperature_reading_id, a.identifier, a.value, a.unit, b.id AS structure_id, b.identifier AS structure_identifier, b.name AS structure_name
FROM temperature_readings a JOIN structures b ON a.structure_id = b.id;
```

| temperature_reading_id | identifier | value | unit | structure_id | structure_identifier | structure_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 19.95 | distributed-unit-18 | 1000 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | 21.90 | baseline-unit-19 | 1001 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | 23.85 | pilot-unit-20 | 1002 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | 25.80 | extended-unit-21 | 1003 | IDE-2101 | Distributed Cluster |

The view `vw_temperature_reading_structure` joins `temperature_readings` to `structures`, answering: "At which structure was each temperature reading taken?" Temperature reading `3` (`IDE-2096`, value `23.85`, unit `pilot-unit-20`, timestamp `2022-05-03T08:52:00`, status `complete`) is linked to structure `1002` (`IDE-2096`, `Baseline Model`, `seasonal-location-101`, volume `14.35`). The view confirms that reading `3` was captured at structure `1002`, and both entities share the `complete` status.

**View `vw_temperature_reading_shock_event`**

```sql
CREATE VIEW vw_temperature_reading_shock_event AS
SELECT a.temperature_reading_id, a.identifier, a.value, a.unit, b.shock_event_id AS event_shock_event_id, b.identifier AS event_identifier, b.start_time AS event_start_time
FROM temperature_readings a JOIN shock_events b ON a.shock_event_id = b.shock_event_id;
```

| temperature_reading_id | identifier | value | unit | event_shock_event_id | event_identifier | event_start_time |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 19.95 | distributed-unit-18 | 1 | IDE-2086 | 2024-03-27T14:42:00 |
| 2 | IDE-2091 | 21.90 | baseline-unit-19 | 2 | IDE-2091 | 2025-08-11T21:59:00 |
| 3 | IDE-2096 | 23.85 | pilot-unit-20 | 3 | IDE-2096 | 2022-01-22T04:16:00 |
| 4 | IDE-2101 | 25.80 | extended-unit-21 | 4 | IDE-2101 | 2023-06-06T11:33:00 |

The view `vw_temperature_reading_shock_event` joins `temperature_readings` to `shock_events`, answering: "Which shock event triggered each temperature reading?" Temperature reading `2` (`IDE-2091`, value `21.90`, unit `baseline-unit-19`, timestamp `2025-12-19T01:35:00`, status `running`) is linked to shock event `2` (`IDE-2091`, intensity `9.40`, depth `0.075`, force `23.40`, duration `8.40`, status `running`). The synchronized `running` statuses indicate that the temperature reading was captured while the shock event was active.

**View `vw_temperature_reading_sensor`**

```sql
CREATE VIEW vw_temperature_reading_sensor AS
SELECT a.temperature_reading_id, a.identifier, a.value, a.unit, b.id AS sensor_id, b.identifier AS sensor_identifier, b.type AS sensor_type
FROM temperature_readings a JOIN sensors b ON a.measured_by_sensor_id = b.id;
```

| temperature_reading_id | identifier | value | unit | sensor_id | sensor_identifier | sensor_type |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 19.95 | distributed-unit-18 | 100 | IDE-2086 | composite-type-69 |
| 2 | IDE-2091 | 21.90 | baseline-unit-19 | 101 | IDE-2091 | primary-type-70 |
| 3 | IDE-2096 | 23.85 | pilot-unit-20 | 102 | IDE-2096 | adaptive-type-71 |
| 4 | IDE-2101 | 25.80 | extended-unit-21 | 103 | IDE-2101 | distributed-type-72 |

The view `vw_temperature_reading_sensor` joins `temperature_readings` to `sensors`, answering: "Which sensor produced each temperature reading?" Temperature reading `1` (`IDE-2086`, value `19.95`, unit `distributed-unit-18`, timestamp `2024-07-08T18:18:00`, status `pending`) is paired with sensor `100` (`IDE-2086`, `composite-type-69`, accuracy `17.20`, status `pending`). The view confirms that sensor `100` produced reading `1`, and both share the `pending` status.

**View `vw_power_system_shock_absorber`**

```sql
CREATE VIEW vw_power_system_shock_absorber AS
SELECT a.power_system_id, a.identifier, a.voltage, a.current, b.id AS absorber_id, b.identifier AS absorber_identifier, b.model AS absorber_model
FROM power_systems a JOIN shock_absorbers b ON a.shock_absorber_id = b.id;
```

| power_system_id | identifier | voltage | current | absorber_id | absorber_identifier | absorber_model |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 16.45 | 10.20 | 1000 | IDE-2086 | composite-model-81 |
| 101 | IDE-2091 | 20.90 | 13.40 | 1001 | IDE-2091 | primary-model-82 |
| 102 | IDE-2096 | 25.35 | 16.60 | 1002 | IDE-2096 | adaptive-model-83 |
| 103 | IDE-2101 | 29.80 | 19.80 | 1003 | IDE-2101 | distributed-model-84 |

The view `vw_power_system_shock_absorber` joins `power_systems` to `shock_absorbers`, answering: "Which shock absorber is supplied by each power system?" Power system `101` (`IDE-2091`, voltage `20.90`, current `13.40`, power `25.40`, status `running`) is linked to shock absorber `1001` (`IDE-2091`, `primary-model-82`, max_force `22.90`, max_voltage `6.90`, max_power `24.90`, status `running`). The matching `running` statuses and identifiers confirm that power system `101` is actively supplying absorber `1001`.

**View `vw_power_system_structure`**

```sql
CREATE VIEW vw_power_system_structure AS
SELECT a.power_system_id, a.identifier, a.voltage, a.current, b.id AS structure_id, b.identifier AS structure_identifier, b.name AS structure_name
FROM power_systems a JOIN structures b ON a.structure_id = b.id;
```

| power_system_id | identifier | voltage | current | structure_id | structure_identifier | structure_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 16.45 | 10.20 | 1000 | IDE-2086 | Extended Review |
| 101 | IDE-2091 | 20.90 | 13.40 | 1001 | IDE-2091 | Pilot Initiative A |
| 102 | IDE-2096 | 25.35 | 16.60 | 1002 | IDE-2096 | Baseline Model |
| 103 | IDE-2101 | 29.80 | 19.80 | 1003 | IDE-2101 | Distributed Cluster |

The view `vw_power_system_structure` joins `power_systems` to `structures`, answering: "Which structure is served by each power system?" Power system `103` (`IDE-2101`, voltage `29.80`, current `19.80`, power `32.80`, status `failed`) is linked to structure `1003` (`IDE-2101`, `Distributed Cluster`, `regional-location-102`, volume `16.80`, status `failed`). The shared `failed` status indicates that both the power system and the structure it serves are in a failed state.

**View `vw_power_system_sensor`**

```sql
CREATE VIEW vw_power_system_sensor AS
SELECT a.power_system_id, a.identifier, a.voltage, a.current, b.id AS sensor_id, b.identifier AS sensor_identifier, b.type AS sensor_type
FROM power_systems a JOIN sensors b ON a.sensor_id = b.id;
```

| power_system_id | identifier | voltage | current | sensor_id | sensor_identifier | sensor_type |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 16.45 | 10.20 | 100 | IDE-2086 | composite-type-69 |
| 101 | IDE-2091 | 20.90 | 13.40 | 101 | IDE-2091 | primary-type-70 |
| 102 | IDE-2096 | 25.35 | 16.60 | 102 | IDE-2096 | adaptive-type-71 |
| 103 | IDE-2101 | 29.80 | 19.80 | 103 | IDE-2101 | distributed-type-72 |

The view `vw_power_system_sensor` joins `power_systems` to `sensors`, answering: "Which sensor monitors each power system?" Power system `102` (`IDE-2096`, voltage `25.35`, current `16.60`, power `29.10`, status `complete`) is paired with sensor `102` (`IDE-2096`, `adaptive-type-71`, accuracy `25.60`, status `complete`). The matching identifiers and `complete` statuses confirm that sensor `102` is monitoring power system `102`.

**View `vw_sensor_temperature_reading`**

```sql
CREATE VIEW vw_sensor_temperature_reading AS
SELECT a.id, a.identifier, a.type, a.accuracy, b.temperature_reading_id AS reading_temperature_reading_id, b.identifier AS reading_identifier, b.value AS reading_value
FROM sensors a JOIN temperature_readings b ON a.temperature_reading_id = b.temperature_reading_id;
```

| id | identifier | type | accuracy | reading_temperature_reading_id | reading_identifier | reading_value |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | composite-type-69 | 17.20 | 1 | IDE-2086 | 19.95 |
| 101 | IDE-2091 | primary-type-70 | 21.40 | 2 | IDE-2091 | 21.90 |
| 102 | IDE-2096 | adaptive-type-71 | 25.60 | 3 | IDE-2096 | 23.85 |
| 103 | IDE-2101 | distributed-type-72 | 29.80 | 4 | IDE-2101 | 25.80 |

The view `vw_sensor_temperature_reading` joins `sensors` to `temperature_readings`, answering: "Which temperature reading was produced by each sensor?" Sensor `101` (`IDE-2091`, `primary-type-70`, accuracy `21.40`, status `running`) is linked to temperature reading `2` (`IDE-2091`, value `21.90`, unit `baseline-unit-19`, timestamp `2025-12-19T01:35:00`, status `running`). The view confirms that sensor `101` produced reading `2`, and both share the `running` status.

**View `vw_sensor_power_system`**

```sql
CREATE VIEW vw_sensor_power_system AS
SELECT a.id, a.identifier, a.type, a.accuracy, b.power_system_id AS system_power_system_id, b.identifier AS system_identifier, b.voltage AS system_voltage
FROM sensors a JOIN power_systems b ON a.power_system_id = b.power_system_id;
```

| id | identifier | type | accuracy | system_power_system_id | system_identifier | system_voltage |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | composite-type-69 | 17.20 | 100 | IDE-2086 | 16.45 |
| 101 | IDE-2091 | primary-type-70 | 21.40 | 101 | IDE-2091 | 20.90 |
| 102 | IDE-2096 | adaptive-type-71 | 25.60 | 102 | IDE-2096 | 25.35 |
| 103 | IDE-2101 | distributed-type-72 | 29.80 | 103 | IDE-2101 | 29.80 |

The view `vw_sensor_power_system` joins `sensors` to `power_systems`, answering: "Which power system does each sensor draw from?" Sensor `103` (`IDE-2101`, `distributed-type-72`, accuracy `29.80`, status `failed`) is linked to power system `103` (`IDE-2101`, voltage `29.80`, current `19.80`, power `32.80`, status `failed`). The shared `failed` status indicates that sensor `103` and its power source are both in a failed state.

**View `vw_sensor_structure`**

```sql
CREATE VIEW vw_sensor_structure AS
SELECT a.id, a.identifier, a.type, a.accuracy, b.id AS structure_id, b.identifier AS structure_identifier, b.name AS structure_name
FROM sensors a JOIN structures b ON a.structure_id = b.id;
```

| id | identifier | type | accuracy | structure_id | structure_identifier | structure_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | composite-type-69 | 17.20 | 1000 | IDE-2086 | Extended Review |
| 101 | IDE-2091 | primary-type-70 | 21.40 | 1001 | IDE-2091 | Pilot Initiative A |
| 102 | IDE-2096 | adaptive-type-71 | 25.60 | 1002 | IDE-2096 | Baseline Model |
| 103 | IDE-2101 | distributed-type-72 | 29.80 | 1003 | IDE-2101 | Distributed Cluster |

The view `vw_sensor_structure` joins `sensors` to `structures`, answering: "At which structure is each sensor mounted?" Sensor `100` (`IDE-2086`, `composite-type-69`, accuracy `17.20`, status `pending`) is paired with structure `1000` (`IDE-2086`, `Extended Review`, `extended-location-99`, area `5.95`, status `pending`). The view confirms that sensor `100` is installed at structure `1000`, and both entities share the `pending` status.

The materialised views collectively cover every pairwise relationship among the six base tables, forming a complete join graph. Each view answers a specific analytical question by denormalising two related tables into a single result set. The foreign-key constraints ensure referential integrity: every `structure_id` in `shock_absorbers` must exist in `structures`, every `shock_absorber_id` in `structures` must exist in `shock_absorbers`, and so on through the mesh. The `identifier` column, consistently formatted as `IDE-2086` through `IDE-2101`, serves as a cross-table business key that allows analysts to trace a single asset across all six tables without relying on surrogate keys alone. The `status` column, shared across all tables with the same four values (`pending`, `running`, `complete`, `failed`), provides a quick diagnostic: if a shock absorber, its structure, its power system, and its sensor all share the same status, the entire subsystem is in a coherent state; if statuses diverge, it signals a partial failure or a mismatch in lifecycle tracking. This model, grounded in the ontology of industrial monitoring assets, provides both a normalized storage layer and a set of pre-joined views that make the most common domain queries efficient and self-documenting.