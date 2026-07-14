## RF Signal Distribution and Reception Networks

Radio-frequency engineering relies on a chain of interconnected components that route, split, combine, and terminate electromagnetic energy from the antenna through the receiver. At the heart of such a chain sits the power splitter or combiner, a device that divides an incoming signal into multiple paths or merges several paths into one. Each device carries a unique identifier, a type classification, and a set of electrical ratings that determine how it behaves in the field. The records in the system capture every such device along with its signal-characteristic measurements, its associated RF ports, and the transformers that realize its internal circuitry. Understanding how these records relate to one another is essential for anyone designing, troubleshooting, or auditing an RF distribution network.

**Table `power_splitter_combiners`**

| id | device_identifier | device_type | nominal_impedance | port_count | isolation_rating | theoretical_insertion_loss | phase_relationship | status | signal_characteristic_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | DEV-2372 | simple_T | 9.20 | 2 | 5.70 | 6.70 | 0_degrees | active | 100 | 2025-01-01 00:14:00 |
| 2 | DEV-2378 | lumped_element | 12.40 | 4 | 7.40 | 10.40 | 180_degrees | standby | 101 | 2025-02-06 03:14:00 |
| 3 | DEV-2384 | transformer_based | 15.60 | 0 | 9.10 | 14.10 | 0_degrees | fault | 102 | 2025-03-11 06:14:00 |
| 4 | DEV-2390 | simple_T | 18.80 | 2 | 10.80 | 17.80 | 180_degrees | active | 103 | 2025-04-16 09:14:00 |

The power splitter and combiner table stores the core inventory of RF division devices. Each row represents a single unit, identified by a device code such as DEV-2372 or DEV-2390. The device_type column distinguishes between simple T-junctions, lumped-element implementations, and transformer-based architectures. Nominal impedance values range from 9.20 ohms on DEV-2372 up to 18.80 ohms on DEV-2390, reflecting the different impedance environments each device is designed to serve. Port count indicates how many signal paths the device manages; DEV-2372 and DEV-2390 each carry two ports, while DEV-2378 carries four. The isolation rating, measured in decibels, quantifies how well the device prevents signal leakage between its ports—DEV-2372 achieves 5.70 dB, whereas DEV-2390 reaches 10.80 dB. Theoretical insertion loss follows a similar progression, with DEV-2372 at 6.70 dB and DEV-2390 at 17.80 dB. Phase relationship is recorded as either 0_degrees or 180_degrees, and the status field tracks whether a device is active, on standby, or in fault. Every device is linked to a signal characteristic record through the signal_characteristic_id column, which ties the physical hardware to its measured or theoretical performance data.

**Table `r_f_ports`**

| id | port_identifier | port_label | impedance | termination_state | vswr | power_splitter_combiner_id | antenna_id | receiver_id |
|---|---|---|---|---|---|---|---|---|
| 1 | POR-2480 | input | 6.20 | open | 6.95 | 1 | 1 | 1000 |
| 2 | POR-2483 | output | 10.40 | matched | 9.90 | 2 | 2 | 1001 |
| 3 | POR-2486 | sum | 14.60 | short | 12.85 | 3 | 3 | 1002 |
| 4 | POR-2489 | A | 18.80 | open | 15.80 | 4 | 4 | 1003 |

RF ports serve as the physical interface points where signals enter and leave every component in the chain. The r_f_ports table catalogs each port with a unique identifier such as POR-2480 or POR-2489, a human-readable label like input, output, sum, or A, and an impedance value that must match the connected equipment. Termination state describes how the port is terminated—open, matched, or short—and VSWR (voltage standing wave ratio) quantifies the quality of that match. DEV-2372's port POR-2480 presents an impedance of 6.20 ohms with an open termination and a VSWR of 6.95, while DEV-2378's port POR-2483 shows 10.40 ohms, a matched termination, and a VSWR of 9.90. Each port is associated with exactly one power splitter or combiner, and may also be linked to an antenna and a receiver, forming the complete signal path from sky to demodulation.

**Table `signal_characteristics`**

| id | characteristic_type | value | unit | measurement_condition | status | power_splitter_combiner_id | r_f_port_id |
|---|---|---|---|---|---|---|---|
| 100 | amplitude | 19.95 | dB | in_phase | theoretical | 1 | 1 |
| 101 | phase | 21.90 | degrees | out_of_phase | measured | 2 | 2 |
| 102 | isolation | 23.85 | volts | different_frequencies | theoretical | 3 | 3 |
| 103 | insertion_loss | 25.80 | dB | in_phase | measured | 4 | 4 |

Signal characteristics capture the measurable or theoretical performance of each power splitter or combiner. The characteristic_type column identifies what is being measured—amplitude, phase, isolation, or insertion loss—and the value column records the magnitude of that measurement. Units vary by type: amplitude and insertion loss are expressed in decibels, phase in degrees, and isolation in volts, reflecting the different physical quantities involved. The measurement_condition field notes whether the measurement was taken under in_phase, out_of_phase, or different_frequencies conditions, and the status column distinguishes between theoretical calculations and actual measured values. For instance, characteristic 100 records an amplitude of 19.95 dB measured under in_phase conditions as a theoretical value, while characteristic 103 records an insertion loss of 25.80 dB measured under in_phase conditions as a measured value. Each characteristic is tied to a specific power splitter or combiner and to a specific RF port, anchoring the performance data to the physical hardware.

**Table `antennas`**

| antenna_id | antenna_identifier | antenna_type | resonant_frequency | impedance | status | r_f_port_id | receiver_id |
|---|---|---|---|---|---|---|---|
| 1 | ANT-2607 | directional | 11.95 | 6.20 | active | 1 | 1000 |
| 2 | ANT-2611 | omnidirectional | 13.90 | 10.40 | faulty | 2 | 1001 |
| 3 | ANT-2615 | directional | 15.85 | 14.60 | open | 3 | 1002 |
| 4 | ANT-2619 | omnidirectional | 17.80 | 18.80 | short | 4 | 1003 |

Antennas convert electromagnetic waves into electrical signals and vice versa. The antennas table records each antenna with an identifier such as ANT-2607 or ANT-2619, a type classification of directional or omnidirectional, a resonant frequency, an impedance, and a status. ANT-2607 is a directional antenna operating at a resonant frequency of 11.95 with an impedance of 6.20 ohms and an active status. ANT-2611 is an omnidirectional antenna at 13.90 resonant frequency with 10.40 ohms impedance, currently marked faulty. ANT-2615 and ANT-2619 follow the same pattern, with resonant frequencies of 15.85 and 17.80 respectively. Each antenna is linked to an RF port and a receiver, completing the signal path from the antenna element through the port to the receiver circuitry.

**Table `receivers`**

| id | receiver_identifier | receiver_type | input_impedance | sensitivity | status | r_f_port_id | antenna_id |
|---|---|---|---|---|---|---|---|
| 1000 | REC-2087 | superheterodyne | 21.20 | 2.95 | active | 1 | 1 |
| 1001 | REC-2093 | direct_conversion | 24.40 | 5.90 | standby | 2 | 2 |
| 1002 | REC-2099 | superheterodyne | 27.60 | 8.85 | fault | 3 | 3 |
| 1003 | REC-2105 | direct_conversion | 30.80 | 11.80 | active | 4 | 4 |

Receivers process the electrical signals delivered by antennas through RF ports. The receivers table stores each unit with an identifier such as REC-2087 or REC-2105, a receiver_type of superheterodyne or direct_conversion, an input_impedance, a sensitivity value, and a status. REC-2087 is a superheterodyne receiver with an input impedance of 21.20 ohms and a sensitivity of 2.95, currently active. REC-2093 is a direct_conversion unit at 24.40 ohms input impedance with a sensitivity of 5.90, on standby. REC-2099 and REC-2105 continue the pattern, with sensitivities of 8.85 and 11.80 respectively. Each receiver is associated with an RF port and an antenna, forming the final stage of the signal chain.

**Table `transformers`**

| transformer_id | transformer_identifier | turns_ratio | impedance_ratio | phase_shift | status | power_splitter_combiner_id |
|---|---|---|---|---|---|---|
| 1 | TRA-2610 | pilot-turns-86 | 7.20 | 21.45 | active | 1 |
| 2 | TRA-2616 | extended-turns-87 | 10.40 | 25.90 | faulty | 2 |
| 3 | TRA-2622 | integrated-turns-88 | 13.60 | 30.35 | active | 3 |
| 4 | TRA-2628 | seasonal-turns-89 | 16.80 | 34.80 | faulty | 4 |

Transformers provide impedance transformation and phase shifting within power splitter and combiner circuits. The transformers table records each unit with an identifier such as TRA-2610 or TRA-2628, a turns_ratio designation like pilot-turns-86 or extended-turns-87, an impedance_ratio, a phase_shift value, and a status. TRA-2610 carries a turns ratio of pilot-turns-86, an impedance ratio of 7.20, and a phase shift of 21.45 degrees, with an active status. TRA-2616 uses extended-turns-87 with an impedance ratio of 10.40 and a phase shift of 25.90 degrees, currently faulty. TRA-2622 and TRA-2628 follow with integrated-turns-88 and seasonal-turns-89, impedance ratios of 13.60 and 16.80, and phase shifts of 30.35 and 34.80 degrees respectively. Each transformer is linked to a specific power splitter or combiner, providing the internal circuitry that realizes the device's electrical behavior.

**Table `combiners_ports`**

| power_splitter_combiner_id | r_f_port_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The combiners_ports table provides an additional layer of port-level detail for power splitter and combiner devices, capturing port-specific attributes that may not be present in the general RF ports table. This table ensures that every port associated with a splitter or combiner has a complete record, including any specialized configuration parameters required for proper signal routing.

**Table `transformers_ports`**

| transformer_id | r_f_port_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The transformers_ports table documents the port connections associated with each transformer, linking the internal transformer circuitry to the external port structure of the power splitter or combiner. This record enables precise mapping of how signals flow through the transformer's windings and emerge at the appropriate output port.

### Power Splitter and Combiner Port Detail

**View `v_power_splitter_combiner_r_f_port_detail`**

```sql
CREATE VIEW v_power_splitter_combiner_r_f_port_detail AS
SELECT a.id, a.device_identifier, a.device_type, b.id AS port_id, b.port_identifier AS port_port_identifier, b.port_label AS port_port_label
FROM power_splitter_combiners a
  JOIN combiners_ports j ON j.power_splitter_combiner_id = a.id
  JOIN r_f_ports b ON b.id = j.r_f_port_id;
```

| id | device_identifier | device_type | port_id | port_port_identifier | port_port_label |
|---|---|---|---|---|---|
| 1 | DEV-2372 | simple_T | 1 | POR-2480 | input |
| 1 | DEV-2372 | simple_T | 2 | POR-2483 | output |
| 2 | DEV-2378 | lumped_element | 2 | POR-2483 | output |
| 2 | DEV-2378 | lumped_element | 3 | POR-2486 | sum |
| 3 | DEV-2384 | transformer_based | 3 | POR-2486 | sum |
| 3 | DEV-2384 | transformer_based | 4 | POR-2489 | A |
| 4 | DEV-2390 | simple_T | 4 | POR-2489 | A |
| 4 | DEV-2390 | simple_T | 1 | POR-2480 | input |

This view joins the power splitter and combiner records with their associated RF ports, answering the question of which physical ports belong to which division device and what their electrical properties are. The joined result shows, for example, that DEV-2372 (a simple_T device with 9.20 ohms nominal impedance) is connected to port POR-2480, which carries an impedance of 6.20 ohms, an open termination, and a VSWR of 6.95. Similarly, DEV-2390 (also a simple_T at 18.80 ohms) connects to port POR-2489 with an impedance of 18.80 ohms, an open termination, and a VSWR of 15.80. This view is essential for verifying that the port-level impedance and termination match the device's design specifications.

### Power Splitter and Combiner Signal Characteristics

**View `v_power_splitter_combiner_signal_characteristic`**

```sql
CREATE VIEW v_power_splitter_combiner_signal_characteristic AS
SELECT a.id, a.device_identifier, a.device_type, a.nominal_impedance, b.id AS characteristic_id, b.characteristic_type AS characteristic_characteristic_type, b.value AS characteristic_value
FROM power_splitter_combiners a JOIN signal_characteristics b ON a.signal_characteristic_id = b.id;
```

| id | device_identifier | device_type | nominal_impedance | characteristic_id | characteristic_characteristic_type | characteristic_value |
|---|---|---|---|---|---|---|
| 1 | DEV-2372 | simple_T | 9.20 | 100 | amplitude | 19.95 |
| 2 | DEV-2378 | lumped_element | 12.40 | 101 | phase | 21.90 |
| 3 | DEV-2384 | transformer_based | 15.60 | 102 | isolation | 23.85 |
| 4 | DEV-2390 | simple_T | 18.80 | 103 | insertion_loss | 25.80 |

This view links each power splitter or combiner to its signal characteristic record, providing a consolidated view of device performance data. DEV-2372 is associated with characteristic 100, an amplitude measurement of 19.95 dB under in_phase conditions recorded as theoretical. DEV-2378 carries characteristic 101, a phase measurement of 21.90 degrees under out_of_phase conditions recorded as measured. DEV-2384 links to characteristic 102, an isolation measurement of 23.85 volts under different_frequencies conditions, theoretical. DEV-2390 connects to characteristic 103, an insertion loss of 25.80 dB under in_phase conditions, measured. This view enables engineers to quickly assess the performance profile of each device and determine whether measurements are theoretical predictions or field-verified data.

### RF Port to Power Splitter and Combiner Mapping

**View `v_r_f_port_power_splitter_combiner`**

```sql
CREATE VIEW v_r_f_port_power_splitter_combiner AS
SELECT a.id, a.port_identifier, a.port_label, a.impedance, b.id AS combiner_id, b.device_identifier AS combiner_device_identifier, b.device_type AS combiner_device_type
FROM r_f_ports a JOIN power_splitter_combiners b ON a.power_splitter_combiner_id = b.id;
```

| id | port_identifier | port_label | impedance | combiner_id | combiner_device_identifier | combiner_device_type |
|---|---|---|---|---|---|---|
| 1 | POR-2480 | input | 6.20 | 1 | DEV-2372 | simple_T |
| 2 | POR-2483 | output | 10.40 | 2 | DEV-2378 | lumped_element |
| 3 | POR-2486 | sum | 14.60 | 3 | DEV-2384 | transformer_based |
| 4 | POR-2489 | A | 18.80 | 4 | DEV-2390 | simple_T |

This view maps each RF port back to its parent power splitter or combiner, answering the question of which device a given port serves. POR-2480, labeled input with 6.20 ohms impedance and open termination, belongs to DEV-2372, a simple_T device with 2 ports and 5.70 dB isolation. POR-2483, labeled output with 10.40 ohms impedance and matched termination, belongs to DEV-2378, a lumped_element device with 4 ports and 7.40 dB isolation. This bidirectional mapping is critical for tracing signal paths and diagnosing port-level issues by referencing the parent device's specifications.

### RF Port to Antenna Association

**View `v_r_f_port_antenna`**

```sql
CREATE VIEW v_r_f_port_antenna AS
SELECT a.id, a.port_identifier, a.port_label, a.impedance, b.antenna_id AS antenna_antenna_id, b.antenna_identifier AS antenna_antenna_identifier, b.antenna_type AS antenna_antenna_type
FROM r_f_ports a JOIN antennas b ON a.antenna_id = b.antenna_id;
```

| id | port_identifier | port_label | impedance | antenna_antenna_id | antenna_antenna_identifier | antenna_antenna_type |
|---|---|---|---|---|---|---|
| 1 | POR-2480 | input | 6.20 | 1 | ANT-2607 | directional |
| 2 | POR-2483 | output | 10.40 | 2 | ANT-2611 | omnidirectional |
| 3 | POR-2486 | sum | 14.60 | 3 | ANT-2615 | directional |
| 4 | POR-2489 | A | 18.80 | 4 | ANT-2619 | omnidirectional |

This view connects each RF port to its associated antenna, revealing the antenna that feeds or receives through a given port. POR-2480 connects to ANT-2607, a directional antenna at 11.95 resonant frequency with 6.20 ohms impedance and active status. POR-2483 connects to ANT-2611, an omnidirectional antenna at 13.90 resonant frequency with 10.40 ohms impedance and faulty status. This association is vital for understanding the signal source or destination at each port and for correlating antenna health with port performance.

### RF Port to Receiver Association

**View `v_r_f_port_receiver`**

```sql
CREATE VIEW v_r_f_port_receiver AS
SELECT a.id, a.port_identifier, a.port_label, a.impedance, b.id AS receiver_id, b.receiver_identifier AS receiver_receiver_identifier, b.receiver_type AS receiver_receiver_type
FROM r_f_ports a JOIN receivers b ON a.receiver_id = b.id;
```

| id | port_identifier | port_label | impedance | receiver_id | receiver_receiver_identifier | receiver_receiver_type |
|---|---|---|---|---|---|---|
| 1 | POR-2480 | input | 6.20 | 1000 | REC-2087 | superheterodyne |
| 2 | POR-2483 | output | 10.40 | 1001 | REC-2093 | direct_conversion |
| 3 | POR-2486 | sum | 14.60 | 1002 | REC-2099 | superheterodyne |
| 4 | POR-2489 | A | 18.80 | 1003 | REC-2105 | direct_conversion |

This view links each RF port to its associated receiver, showing which receiver processes signals from a given port. POR-2480 feeds into REC-2087, a superheterodyne receiver with 21.20 ohms input impedance, 2.95 sensitivity, and active status. POR-2483 feeds into REC-2093, a direct_conversion receiver with 24.40 ohms input impedance, 5.90 sensitivity, and standby status. This mapping allows engineers to trace the complete signal path from antenna through port to receiver and to verify that receiver specifications are compatible with the port's electrical characteristics.

### Signal Characteristic to Power Splitter and Combiner

**View `v_signal_characteristic_power_splitter_combiner`**

```sql
CREATE VIEW v_signal_characteristic_power_splitter_combiner AS
SELECT a.id, a.characteristic_type, a.value, a.unit, b.id AS combiner_id, b.device_identifier AS combiner_device_identifier, b.device_type AS combiner_device_type
FROM signal_characteristics a JOIN power_splitter_combiners b ON a.power_splitter_combiner_id = b.id;
```

| id | characteristic_type | value | unit | combiner_id | combiner_device_identifier | combiner_device_type |
|---|---|---|---|---|---|---|
| 100 | amplitude | 19.95 | dB | 1 | DEV-2372 | simple_T |
| 101 | phase | 21.90 | degrees | 2 | DEV-2378 | lumped_element |
| 102 | isolation | 23.85 | volts | 3 | DEV-2384 | transformer_based |
| 103 | insertion_loss | 25.80 | dB | 4 | DEV-2390 | simple_T |

This view presents signal characteristics from the perspective of the characteristic record, showing which power splitter or combiner each measurement belongs to. Characteristic 100 (amplitude, 19.95 dB, in_phase, theoretical) belongs to DEV-2372, a simple_T device with 2 ports and 0_degrees phase relationship. Characteristic 103 (insertion_loss, 25.80 dB, in_phase, measured) belongs to DEV-2390, also a simple_T with 2 ports and 180_degrees phase relationship. This view is useful for quality assurance, allowing auditors to verify that each device has an associated characteristic record and that the measurement conditions are appropriate for the device type.

### Signal Characteristic to RF Port

**View `v_signal_characteristic_r_f_port`**

```sql
CREATE VIEW v_signal_characteristic_r_f_port AS
SELECT a.id, a.characteristic_type, a.value, a.unit, b.id AS port_id, b.port_identifier AS port_port_identifier, b.port_label AS port_port_label
FROM signal_characteristics a JOIN r_f_ports b ON a.r_f_port_id = b.id;
```

| id | characteristic_type | value | unit | port_id | port_port_identifier | port_port_label |
|---|---|---|---|---|---|---|
| 100 | amplitude | 19.95 | dB | 1 | POR-2480 | input |
| 101 | phase | 21.90 | degrees | 2 | POR-2483 | output |
| 102 | isolation | 23.85 | volts | 3 | POR-2486 | sum |
| 103 | insertion_loss | 25.80 | dB | 4 | POR-2489 | A |

This view connects signal characteristics to their associated RF ports, providing a granular view of how performance measurements relate to specific port configurations. Characteristic 100 (amplitude, 19.95 dB) is associated with POR-2480, an input port with 6.20 ohms impedance and open termination. Characteristic 103 (insertion_loss, 25.80 dB) is associated with POR-2489, port A with 18.80 ohms impedance and open termination. This view helps engineers understand how port-level electrical properties influence the measured signal characteristics and can guide troubleshooting when a characteristic deviates from expected values.

### Antenna to RF Port

**View `v_antenna_r_f_port`**

```sql
CREATE VIEW v_antenna_r_f_port AS
SELECT a.antenna_id, a.antenna_identifier, a.antenna_type, a.resonant_frequency, b.id AS port_id, b.port_identifier AS port_port_identifier, b.port_label AS port_port_label
FROM antennas a JOIN r_f_ports b ON a.r_f_port_id = b.id;
```

| antenna_id | antenna_identifier | antenna_type | resonant_frequency | port_id | port_port_identifier | port_port_label |
|---|---|---|---|---|---|---|
| 1 | ANT-2607 | directional | 11.95 | 1 | POR-2480 | input |
| 2 | ANT-2611 | omnidirectional | 13.90 | 2 | POR-2483 | output |
| 3 | ANT-2615 | directional | 15.85 | 3 | POR-2486 | sum |
| 4 | ANT-2619 | omnidirectional | 17.80 | 4 | POR-2489 | A |

This view presents antennas from the perspective of their associated RF ports, showing which port each antenna connects through. ANT-2607 (directional, 11.95 resonant frequency, active) connects through POR-2480, an input port with 6.20 ohms impedance and open termination. ANT-2619 (omnidirectional, 17.80 resonant frequency, short) connects through POR-2489, port A with 18.80 ohms impedance and open termination. This view is essential for antenna inventory management and for verifying that the antenna's impedance matches the port's impedance for proper signal transfer.

### Antenna to Receiver

**View `v_antenna_receiver`**

```sql
CREATE VIEW v_antenna_receiver AS
SELECT a.antenna_id, a.antenna_identifier, a.antenna_type, a.resonant_frequency, b.id AS receiver_id, b.receiver_identifier AS receiver_receiver_identifier, b.receiver_type AS receiver_receiver_type
FROM antennas a JOIN receivers b ON a.receiver_id = b.id;
```

| antenna_id | antenna_identifier | antenna_type | resonant_frequency | receiver_id | receiver_receiver_identifier | receiver_receiver_type |
|---|---|---|---|---|---|---|
| 1 | ANT-2607 | directional | 11.95 | 1000 | REC-2087 | superheterodyne |
| 2 | ANT-2611 | omnidirectional | 13.90 | 1001 | REC-2093 | direct_conversion |
| 3 | ANT-2615 | directional | 15.85 | 1002 | REC-2099 | superheterodyne |
| 4 | ANT-2619 | omnidirectional | 17.80 | 1003 | REC-2105 | direct_conversion |

This view links antennas directly to receivers, revealing the complete antenna-to-receiver pairing without requiring an intermediate port lookup. ANT-2607 (directional, active) is paired with REC-2087 (superheterodyne, active), while ANT-2611 (omnidirectional, faulty) is paired with REC-2093 (direct_conversion, standby). This pairing view is particularly useful for system-level analysis, allowing engineers to assess whether the antenna type and receiver type are compatible and whether the status of one component should trigger a status change in the other.

### Receiver to RF Port

**View `v_receiver_r_f_port`**

```sql
CREATE VIEW v_receiver_r_f_port AS
SELECT a.id, a.receiver_identifier, a.receiver_type, a.input_impedance, b.id AS port_id, b.port_identifier AS port_port_identifier, b.port_label AS port_port_label
FROM receivers a JOIN r_f_ports b ON a.r_f_port_id = b.id;
```

| id | receiver_identifier | receiver_type | input_impedance | port_id | port_port_identifier | port_port_label |
|---|---|---|---|---|---|---|
| 1000 | REC-2087 | superheterodyne | 21.20 | 1 | POR-2480 | input |
| 1001 | REC-2093 | direct_conversion | 24.40 | 2 | POR-2483 | output |
| 1002 | REC-2099 | superheterodyne | 27.60 | 3 | POR-2486 | sum |
| 1003 | REC-2105 | direct_conversion | 30.80 | 4 | POR-2489 | A |

This view presents receivers from the perspective of their associated RF ports, showing which port each receiver is connected to. REC-2087 (superheterodyne, 21.20 ohms input impedance, active) connects to POR-2480, an input port with 6.20 ohms impedance and open termination. REC-2105 (direct_conversion, 30.80 ohms input impedance, active) connects to POR-2489, port A with 18.80 ohms impedance and open termination. This view helps verify that receiver input impedance is compatible with the port's characteristics and can identify potential impedance mismatch issues.

### Receiver to Antenna

**View `v_receiver_antenna`**

```sql
CREATE VIEW v_receiver_antenna AS
SELECT a.id, a.receiver_identifier, a.receiver_type, a.input_impedance, b.antenna_id AS antenna_antenna_id, b.antenna_identifier AS antenna_antenna_identifier, b.antenna_type AS antenna_antenna_type
FROM receivers a JOIN antennas b ON a.antenna_id = b.antenna_id;
```

| id | receiver_identifier | receiver_type | input_impedance | antenna_antenna_id | antenna_antenna_identifier | antenna_antenna_type |
|---|---|---|---|---|---|---|
| 1000 | REC-2087 | superheterodyne | 21.20 | 1 | ANT-2607 | directional |
| 1001 | REC-2093 | direct_conversion | 24.40 | 2 | ANT-2611 | omnidirectional |
| 1002 | REC-2099 | superheterodyne | 27.60 | 3 | ANT-2615 | directional |
| 1003 | REC-2105 | direct_conversion | 30.80 | 4 | ANT-2619 | omnidirectional |

This view connects receivers to their associated antennas, providing a direct mapping of the end-to-end signal path. REC-2087 (superheterodyne, active) is linked to ANT-2607 (directional, active), while REC-2099 (superheterodyne, fault) is linked to ANT-2615 (directional, open). This view is valuable for system health monitoring, as it allows engineers to quickly identify pairs where both components are active, where one is faulty, or where both are in problematic states.

### Transformer to Power Splitter and Combiner

**View `v_transformer_power_splitter_combiner`**

```sql
CREATE VIEW v_transformer_power_splitter_combiner AS
SELECT a.transformer_id, a.transformer_identifier, a.turns_ratio, a.impedance_ratio, b.id AS combiner_id, b.device_identifier AS combiner_device_identifier, b.device_type AS combiner_device_type
FROM transformers a JOIN power_splitter_combiners b ON a.power_splitter_combiner_id = b.id;
```

| transformer_id | transformer_identifier | turns_ratio | impedance_ratio | combiner_id | combiner_device_identifier | combiner_device_type |
|---|---|---|---|---|---|---|
| 1 | TRA-2610 | pilot-turns-86 | 7.20 | 1 | DEV-2372 | simple_T |
| 2 | TRA-2616 | extended-turns-87 | 10.40 | 2 | DEV-2378 | lumped_element |
| 3 | TRA-2622 | integrated-turns-88 | 13.60 | 3 | DEV-2384 | transformer_based |
| 4 | TRA-2628 | seasonal-turns-89 | 16.80 | 4 | DEV-2390 | simple_T |

This view links each transformer to its parent power splitter or combiner, showing which device each transformer serves internally. TRA-2610 (pilot-turns-86, impedance ratio 7.20, phase shift 21.45, active) serves DEV-2372, a simple_T device with 2 ports and 5.70 dB isolation. TRA-2628 (seasonal-turns-89, impedance ratio 16.80, phase shift 34.80, faulty) serves DEV-2390, also a simple_T with 2 ports and 10.80 dB isolation. This view is critical for understanding the internal architecture of each splitter or combiner and for diagnosing device-level faults by referencing the status of the internal transformer.

### Transformer to RF Port Detail

**View `v_transformer_r_f_port_detail`**

```sql
CREATE VIEW v_transformer_r_f_port_detail AS
SELECT a.transformer_id, a.transformer_identifier, a.turns_ratio, b.id AS port_id, b.port_identifier AS port_port_identifier, b.port_label AS port_port_label
FROM transformers a
  JOIN transformers_ports j ON j.transformer_id = a.transformer_id
  JOIN r_f_ports b ON b.id = j.r_f_port_id;
```

| transformer_id | transformer_identifier | turns_ratio | port_id | port_port_identifier | port_port_label |
|---|---|---|---|---|---|
| 1 | TRA-2610 | pilot-turns-86 | 1 | POR-2480 | input |
| 1 | TRA-2610 | pilot-turns-86 | 2 | POR-2483 | output |
| 2 | TRA-2616 | extended-turns-87 | 2 | POR-2483 | output |
| 2 | TRA-2616 | extended-turns-87 | 3 | POR-2486 | sum |
| 3 | TRA-2622 | integrated-turns-88 | 3 | POR-2486 | sum |
| 3 | TRA-2622 | integrated-turns-88 | 4 | POR-2489 | A |
| 4 | TRA-2628 | seasonal-turns-89 | 4 | POR-2489 | A |
| 4 | TRA-2628 | seasonal-turns-89 | 1 | POR-2480 | input |

This view connects transformers to their associated RF ports, providing a detailed view of how the internal transformer circuitry interfaces with the external port structure. TRA-2610 (active, phase shift 21.45) is associated with POR-2480, an input port with 6.20 ohms impedance and open termination. TRA-2622 (active, phase shift 30.35) is associated with POR-2486, a sum port with 14.60 ohms impedance and short termination. This view enables engineers to trace the signal path through the transformer's internal circuitry to the specific port where the signal emerges, facilitating precise troubleshooting of signal integrity issues.

### Synthesis

The RF signal distribution and reception domain is defined by a tightly coupled set of records that together describe the complete signal path from antenna through splitter or combiner to receiver. Power splitters and combiners serve as the central routing nodes, each characterized by its type, impedance, port count, isolation, and phase relationship. RF ports provide the physical interface points, each with its own impedance, termination state, and VSWR. Signal characteristics attach performance measurements to each device, while transformers provide the internal circuitry that realizes the device's electrical behavior. Antennas and receivers form the endpoints of the chain, with antennas converting electromagnetic energy to electrical signals and receivers processing those signals for further use. The views presented in this chapter demonstrate how these records interrelate, enabling engineers to trace signal paths, verify impedance matching, diagnose faults, and audit the overall health of the RF distribution network. Every identifier, every measurement, and every status field contributes to a coherent picture of how RF energy flows through the system.