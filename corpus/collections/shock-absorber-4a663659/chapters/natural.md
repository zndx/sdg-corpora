## Infrastructure Monitoring and Shock Absorption Systems

Modern industrial installations rely on networks of shock absorbers deployed across structural frameworks to mitigate mechanical stress from operational events. Each absorber is a physical device characterized by its model designation, maximum force tolerance, and electrical specifications, all tracked through a lifecycle that moves from pending installation through active operation to either successful completion or failure. The monitoring ecosystem surrounding these absorbers encompasses temperature measurement, power distribution, and sensor instrumentation, each contributing to a comprehensive picture of system health. This chapter documents the data architecture that records these assets, their deployments, and the events they experience.

**Table `shock_absorbers`**

| id | identifier | model | max_force | max_voltage | max_power | status | installation_date | structure_id | temperature_reading_id | power_system_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | composite-model-81 | 18.45 | 3.45 | 21.95 | pending | 2022-01-10T00:12:00 | 1000 | 1 | 100 |
| 1001 | IDE-2091 | primary-model-82 | 22.90 | 6.90 | 24.90 | running | 2023-06-21T07:29:00 | 1001 | 2 | 101 |
| 1002 | IDE-2096 | adaptive-model-83 | 27.35 | 10.35 | 27.85 | complete | 2024-11-05T14:46:00 | 1002 | 3 | 102 |
| 1003 | IDE-2101 | distributed-model-84 | 31.80 | 13.80 | 30.80 | failed | 2025-04-16T21:03:00 | 1003 | 4 | 103 |

The shock absorbers table anchors the entire monitoring domain. Each row represents a physical device identified by a unique code such as IDE-2086 or IDE-2101, with a model designation that describes its engineering class. The composite-model-81, primary-model-82, adaptive-model-83, and distributed-model-84 variants each carry distinct performance envelopes. The max_force column records the maximum mechanical load the device can withstand, ranging from 18.45 units for the earliest deployed unit to 31.80 for the most recent. Electrical limits are captured in max_voltage and max_power, which scale in tandem with force capacity. The status field tracks the operational state—pending, running, complete, or failed—and installation_date marks when the device was placed in service. Foreign keys structure_id, temperature_reading_id, and power_system_id link each absorber to its host structure, an associated temperature measurement, and the power infrastructure that energizes it.

**Table `structures`**

| id | identifier | name | location | area | volume | status | construction_date | shock_absorber_id | shock_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | extended-location-99 | 5.95 | 9.45 | pending | 2023-06-12T05:27:00 | 1000 | 1 |
| 1001 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 7.90 | 11.90 | running | 2024-11-23T12:44:00 | 1001 | 2 |
| 1002 | IDE-2096 | Baseline Model | seasonal-location-101 | 9.85 | 14.35 | complete | 2025-04-07T19:01:00 | 1002 | 3 |
| 1003 | IDE-2101 | Distributed Cluster | regional-location-102 | 11.80 | 16.80 | failed | 2022-09-18T02:18:00 | 1003 | 4 |

Structures represent the physical installations that house and support shock absorbers. The structures table records each facility with an identifier, a descriptive name such as Extended Review or Pilot Initiative A, and a geographic location designation like extended-location-99 or regional-location-102. The area and volume columns quantify the physical footprint of each structure, with values increasing from 5.95 square units and 9.45 cubic units for the smallest installation to 11.80 and 16.80 for the largest. Construction_date records when the structure was built, while status mirrors the lifecycle states found in the absorbers table. The shock_absorber_id column creates a direct association to the absorber installed within, and shock_event_id links the structure to the most recent shock event it experienced.

**Table `shock_events`**

| shock_event_id | identifier | start_time | end_time | intensity | depth | force | status | duration | structure_id | temperature_reading_id | sensor_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 7.20 | 0.15 | 20.70 | pending | 4.20 | 1000 | 1 | 100 |
| 2 | IDE-2091 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 9.40 | 0.07500005 | 23.40 | running | 8.40 | 1001 | 2 | 101 |
| 3 | IDE-2096 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 11.60 | 2.5 | 26.10 | complete | 12.60 | 1002 | 3 | 102 |
| 4 | IDE-2101 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 13.80 | 0.44305528 | 28.80 | failed | 16.80 | 1003 | 4 | 103 |

Shock events capture discrete episodes of mechanical stress that the infrastructure must absorb. Each event carries an identifier, a start_time and end_time defining its temporal window, and a set of measured parameters. The intensity column records the severity of the event, ranging from 7.20 for the mildest recorded episode to 13.80 for the most extreme. Depth measures how far the shock propagated through the structure, with values spanning from 0.075 to 2.5 units. Force quantifies the peak mechanical load during the event, scaling from 20.70 to 28.80. Duration captures the total elapsed time of the event in hours, from 4.20 to 16.80. The status field reflects the event's processing state, while structure_id, temperature_reading_id, and sensor_id associate the event with the affected structure, a concurrent temperature reading, and the sensor that detected it.

**Table `temperature_readings`**

| temperature_reading_id | identifier | value | unit | timestamp | location | status | sensor_id | structure_id | shock_event_id | measured_by_sensor_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | 19.95 | distributed-unit-18 | 2024-07-08T18:18:00 | extended-location-99 | pending | 5c6f01c708ff420a862fd80b80bd80dc | 1000 | 1 | 100 |
| 2 | IDE-2091 | 21.90 | baseline-unit-19 | 2025-12-19T01:35:00 | integrated-location-100 | running | 937728 | 1001 | 2 | 101 |
| 3 | IDE-2096 | 23.85 | pilot-unit-20 | 2022-05-03T08:52:00 | seasonal-location-101 | complete | 209232 | 1002 | 3 | 102 |
| 4 | IDE-2101 | 25.80 | extended-unit-21 | 2023-10-14T15:09:00 | regional-location-102 | failed | 2530a2f0-8fb3-11eb-924d-9cd76263cbd0 | 1003 | 4 | 103 |

Temperature readings provide environmental context for every monitored installation. Each reading is identified by a unique code and records a numerical value along with its unit of measurement. The values progress from 19.95 in distributed-unit-18 to 25.80 in extended-unit-21, reflecting the thermal conditions at each site. The timestamp column records when the measurement was taken, and location provides a geographic reference that often corresponds to the host structure's location. Status tracks the reading's processing state. The sensor_id column identifies the sensor that produced the measurement, while structure_id and shock_event_id link the reading to the affected structure and any concurrent shock event. The measured_by_sensor_id column provides an additional reference to the sensor responsible, enabling cross-validation of readings.

**Table `power_systems`**

| power_system_id | identifier | voltage | current | power | status | installation_date | cable_type | shock_absorber_id | structure_id | sensor_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 16.45 | 10.20 | 21.70 | pending | 2022-01-10T00:12:00 | seasonal-cable-53 | 1000 | 1000 | 100 |
| 101 | IDE-2091 | 20.90 | 13.40 | 25.40 | running | 2023-06-21T07:29:00 | regional-cable-54 | 1001 | 1001 | 101 |
| 102 | IDE-2096 | 25.35 | 16.60 | 29.10 | complete | 2024-11-05T14:46:00 | legacy-cable-55 | 1002 | 1002 | 102 |
| 103 | IDE-2101 | 29.80 | 19.80 | 32.80 | failed | 2025-04-16T21:03:00 | compact-cable-56 | 1003 | 1003 | 103 |

Power systems supply the electrical infrastructure that energizes shock absorbers and their associated instrumentation. Each power system is identified by a unique code and characterized by its voltage, current, and total power output. The voltage values range from 16.45 to 29.80, current from 10.20 to 19.80, and power from 21.70 to 32.80, showing a clear correlation between system capacity and deployment recency. The installation_date records when the power system was commissioned, and cable_type describes the wiring configuration, with designations such as seasonal-cable-53, regional-cable-54, legacy-cable-55, and compact-cable-56. Status tracks the system's operational state. The shock_absorber_id, structure_id, and sensor_id columns link each power system to the absorber it energizes, the structure it serves, and the sensor it supports.

**Table `sensors`**

| id | identifier | type | accuracy | status | installation_date | calibration_date | temperature_reading_id | power_system_id | structure_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | composite-type-69 | 17.20 | pending | 2022-01-10T00:12:00 | 2023-02-08T01:51:00 | 1 | 100 | 1000 |
| 101 | IDE-2091 | primary-type-70 | 21.40 | running | 2023-06-21T07:29:00 | 2024-07-19T08:08:00 | 2 | 101 | 1001 |
| 102 | IDE-2096 | adaptive-type-71 | 25.60 | complete | 2024-11-05T14:46:00 | 2025-12-03T15:25:00 | 3 | 102 | 1002 |
| 103 | IDE-2101 | distributed-type-72 | 29.80 | failed | 2025-04-16T21:03:00 | 2022-05-14T22:42:00 | 4 | 103 | 1003 |

Sensors form the detection layer of the monitoring ecosystem, capturing environmental and operational data across all installations. Each sensor carries a unique identifier, a type designation such as composite-type-69 or distributed-type-72, and an accuracy specification that ranges from 17.20 to 29.80. The installation_date records when the sensor was deployed, and calibration_date indicates the most recent calibration event. Status tracks the sensor's operational state. The temperature_reading_id column links the sensor to the temperature readings it produces, power_system_id associates it with the power system that energizes it, and structure_id identifies the structure where the sensor is installed.

The relationships between these base tables become most apparent through the joined views that combine their data. Each view answers a specific operational question by bringing together records from multiple tables.

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

This view joins shock absorbers with their host structures, answering which absorber is deployed in which installation. The joined result reveals that absorber IDE-2086 (composite-model-81) is installed in the Extended Review structure at extended-location-99, while IDE-2101 (distributed-model-84) serves the Distributed Cluster at regional-location-102. The view confirms that each absorber has exactly one associated structure and that the status values align across both tables, indicating synchronized lifecycle tracking.

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

By linking shock absorbers to temperature readings, this view reveals the thermal environment surrounding each device. Absorber IDE-2086 is associated with a temperature reading of 19.95 in distributed-unit-18, while IDE-2101 corresponds to a reading of 25.80 in extended-unit-21. The view demonstrates that temperature conditions increase alongside absorber capacity, suggesting that higher-performance devices are deployed in thermally more demanding environments.

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

This view connects shock absorbers to the power systems that energize them. The joined data shows that absorber IDE-2086 is powered by a system delivering 16.45 volts and 21.70 power units via seasonal-cable-53, while absorber IDE-2101 draws from a system providing 29.80 volts and 32.80 power units through compact-cable-56. The correlation between absorber max_power ratings and their supply power values indicates that power systems are sized to match absorber requirements.

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

This view presents the structure-to-absorber relationship from the structure's perspective, answering which absorber serves each installation. The Extended Review structure hosts absorber IDE-2086 with a max_force of 18.45, while the Distributed Cluster structure accommodates absorber IDE-2101 with a max_force of 31.80. The view confirms that larger structures with greater area and volume are equipped with absorbers having higher force tolerances.

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

Joining structures with shock events reveals which events have affected each installation. The Extended Review structure experienced shock event IDE-2086 with an intensity of 7.20 and force of 20.70, while the Distributed Cluster structure was subjected to event IDE-2101 with an intensity of 13.80 and force of 28.80. The view shows that structures with higher status values have experienced more intense shock events, suggesting a correlation between structural capacity and exposure to severe conditions.

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

This view presents the shock event-to-structure relationship, answering which structure was affected by each event. Event IDE-2086 with intensity 7.20 affected the Extended Review structure, while event IDE-2101 with intensity 13.80 impacted the Distributed Cluster. The joined data confirms that each shock event is associated with exactly one structure, and the structure's status reflects the event's processing state.

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

This view links shock events to concurrent temperature readings, revealing the thermal conditions during each event. Shock event IDE-2086 occurred alongside a temperature reading of 19.95, while event IDE-2101 coincided with a reading of 25.80. The view demonstrates that higher-intensity events tend to occur in warmer thermal environments, which may indicate that temperature influences mechanical stress levels.

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

By connecting shock events to the sensors that detected them, this view identifies which sensor was responsible for each recording. Event IDE-2086 was detected by sensor IDE-2086 (composite-type-69), while event IDE-2101 was captured by sensor IDE-2101 (distributed-type-72). The view confirms that each shock event is associated with exactly one sensor, and the sensor's accuracy specification correlates with the event's measured parameters.

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

This view joins temperature readings with their host structures, answering which structure each reading monitors. Reading IDE-2086 with value 19.95 corresponds to the Extended Review structure at extended-location-99, while reading IDE-2101 with value 25.80 maps to the Distributed Cluster at regional-location-102. The view confirms that temperature readings are geographically anchored to specific structures, enabling location-based thermal analysis.

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

Linking temperature readings to shock events reveals the temporal relationship between thermal conditions and mechanical stress. Reading IDE-2086 (19.95) is associated with shock event IDE-2086 (intensity 7.20), while reading IDE-2101 (25.80) corresponds to event IDE-2101 (intensity 13.80). The view suggests that elevated temperatures may precede or accompany higher-intensity shock events, providing a potential predictive indicator.

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

This view connects temperature readings to the sensors that produced them, answering which sensor generated each measurement. Reading IDE-2086 was produced by sensor IDE-2086 with accuracy 17.20, while reading IDE-2101 was captured by sensor IDE-2101 with accuracy 29.80. The view confirms that each temperature reading has a single source sensor, and the sensor's accuracy specification provides a confidence metric for the recorded value.

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

This view presents the power system-to-absorber relationship, answering which power system energizes each absorber. Power system IDE-2086 (16.45 volts, seasonal-cable-53) energizes absorber IDE-2086, while power system IDE-2101 (29.80 volts, compact-cable-56) powers absorber IDE-2101. The view confirms that power systems are sized to match absorber electrical requirements, with voltage and power values scaling proportionally.

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

Joining power systems with structures reveals which installation each power system serves. Power system IDE-2086 serves the Extended Review structure, while power system IDE-2101 supplies the Distributed Cluster. The view demonstrates that power system capacity correlates with structural size, as larger structures with greater volume require higher power delivery.

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

This view links power systems to the sensors they energize, answering which sensor draws power from each system. Power system IDE-2086 supports sensor IDE-2086 (composite-type-69), while power system IDE-2101 energizes sensor IDE-2101 (distributed-type-72). The view confirms that each power system serves exactly one sensor, and the system's power output is sufficient to support the sensor's operational requirements.

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

This view connects sensors to the temperature readings they produce, answering which sensor generated each measurement. Sensor IDE-2086 (accuracy 17.20) produced reading IDE-2086 with value 19.95, while sensor IDE-2101 (accuracy 29.80) generated reading IDE-2101 with value 25.80. The view confirms that each temperature reading has a single originating sensor, and the sensor's accuracy specification provides a quality metric for the associated reading.

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

By linking sensors to their power systems, this view reveals the energy source for each detection device. Sensor IDE-2086 draws power from system IDE-2086 (16.45 volts), while sensor IDE-2101 is powered by system IDE-2101 (29.80 volts). The view confirms that sensor power requirements are met by their associated systems, with voltage levels scaling to support higher-accuracy sensors.

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

This view joins sensors with the structures where they are installed, answering which structure hosts each sensor. Sensor IDE-2086 is installed in the Extended Review structure, while sensor IDE-2101 serves the Distributed Cluster. The view confirms that each sensor is physically located within a single structure, and the sensor's type designation often corresponds to the structural classification.

The data architecture described in this chapter provides a comprehensive framework for tracking shock absorption infrastructure across multiple dimensions. Each base table captures a distinct aspect of the monitoring ecosystem—physical devices, host structures, stress events, environmental conditions, power delivery, and detection instrumentation—while the joined views synthesize these perspectives into actionable operational intelligence. The consistent use of lifecycle status values across all tables ensures that the state of any component can be understood in the context of its relationships to other elements in the system. This interconnected record structure enables operators to trace the full chain of influence from power delivery through sensor detection to shock event recording, providing the visibility necessary for proactive maintenance and capacity planning.