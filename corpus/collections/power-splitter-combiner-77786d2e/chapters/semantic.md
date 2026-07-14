In a radio-frequency test and measurement environment, every physical component—splitter, antenna, receiver, transformer—must be catalogued, instrumented, and traceable to its electrical characteristics. The schema captures this ecosystem through a set of normalized base tables whose primary keys and foreign keys encode the topology of signal flow: from antenna through RF port, through splitter or combiner, into receiver, with transformers providing impedance transformation and signal-characteristics tables recording measured or theoretical performance data. The following chapter explains how the domain ontology maps to relational tables, how cardinality-bounded relationships become columns and junction tables, and how each materialized view reconstructs a domain fact from the normalized store.

## Entity types and their columns

The domain centres on six principal entity types, each materialised as a base table. The `power_splitter_combiners` table stores the catalogue of RF power splitters and combiners. Its primary key `id` is an integer surrogate; the business identifier lives in `device_identifier`, which carries values such as `DEV-2372`, `DEV-2378`, `DEV-2384`, and `DEV-2390`. The `device_type` column classifies each unit as `simple_T`, `lumped_element`, or `transformer_based`. Electrical parameters are captured in `nominal_impedance` (9.20, 12.40, 15.60, 18.80), `port_count` (0 or 2 or 4), `isolation_rating` (5.70–10.80), `theoretical_insertion_loss` (6.70–17.80), and `phase_relationship` (`0_degrees` or `180_degrees`). Operational state is recorded in `status` (`active`, `standby`, `fault`), and a foreign key `signal_characteristic_id` links each splitter to a row in the `signal_characteristics` table. The `created_at` timestamp provides audit provenance.

**Table `power_splitter_combiners`**

| id | device_identifier | device_type | nominal_impedance | port_count | isolation_rating | theoretical_insertion_loss | phase_relationship | status | signal_characteristic_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | DEV-2372 | simple_T | 9.20 | 2 | 5.70 | 6.70 | 0_degrees | active | 100 | 2025-01-01 00:14:00 |
| 2 | DEV-2378 | lumped_element | 12.40 | 4 | 7.40 | 10.40 | 180_degrees | standby | 101 | 2025-02-06 03:14:00 |
| 3 | DEV-2384 | transformer_based | 15.60 | 0 | 9.10 | 14.10 | 0_degrees | fault | 102 | 2025-03-11 06:14:00 |
| 4 | DEV-2390 | simple_T | 18.80 | 2 | 10.80 | 17.80 | 180_degrees | active | 103 | 2025-04-16 09:14:00 |

The `r_f_ports` table is the connective tissue of the schema. Each row represents a physical RF port with primary key `id`, business key `port_identifier` (`POR-2480` through `POR-2489`), and a human-readable `port_label` (`input`, `output`, `sum`, `A`). Electrical attributes include `impedance` (6.20–18.80), `termination_state` (`open`, `matched`, `short`), and `vswr` (6.95–15.80). Three foreign keys anchor the port to the rest of the topology: `power_splitter_combiner_id` points to `power_splitter_combiners.id`, `antenna_id` points to `antennas.antenna_id`, and `receiver_id` points to `receivers.id`. This design allows a single RF port to be associated with one splitter, one antenna, and one receiver simultaneously, reflecting the physical reality that a port sits between components.

**Table `r_f_ports`**

| id | port_identifier | port_label | impedance | termination_state | vswr | power_splitter_combiner_id | antenna_id | receiver_id |
|---|---|---|---|---|---|---|---|---|
| 1 | POR-2480 | input | 6.20 | open | 6.95 | 1 | 1 | 1000 |
| 2 | POR-2483 | output | 10.40 | matched | 9.90 | 2 | 2 | 1001 |
| 3 | POR-2486 | sum | 14.60 | short | 12.85 | 3 | 3 | 1002 |
| 4 | POR-2489 | A | 18.80 | open | 15.80 | 4 | 4 | 1003 |

The `signal_characteristics` table records performance measurements. Its primary key `id` ranges from 100 to 103. The `characteristic_type` column distinguishes `amplitude`, `phase`, `isolation`, and `insertion_loss` readings. The `value` column holds the numeric measurement (19.95, 21.90, 23.85, 25.80), `unit` specifies `dB` or `degrees` or `volts`, and `measurement_condition` records whether the reading was taken `in_phase`, `out_of_phase`, or at `different_frequencies`. The `status` column indicates whether the data is `theoretical` or `measured`. Two foreign keys, `power_splitter_combiner_id` and `r_f_port_id`, tie each characteristic to a specific splitter and a specific port, enabling fine-grained traceability.

**Table `signal_characteristics`**

| id | characteristic_type | value | unit | measurement_condition | status | power_splitter_combiner_id | r_f_port_id |
|---|---|---|---|---|---|---|---|
| 100 | amplitude | 19.95 | dB | in_phase | theoretical | 1 | 1 |
| 101 | phase | 21.90 | degrees | out_of_phase | measured | 2 | 2 |
| 102 | isolation | 23.85 | volts | different_frequencies | theoretical | 3 | 3 |
| 103 | insertion_loss | 25.80 | dB | in_phase | measured | 4 | 4 |

The `antennas` table stores antenna inventory. Its primary key is `antenna_id` (1–4), with business identifier `antenna_identifier` (`ANT-2607` through `ANT-2619`). The `antenna_type` column distinguishes `directional` from `omnidirectional` antennas. Electrical parameters include `resonant_frequency` (11.95–17.80) and `impedance` (6.20–18.80). The `status` column records `active`, `faulty`, `open`, or `short`. Foreign keys `r_f_port_id` and `receiver_id` link each antenna to its associated RF port and receiver, respectively.

**Table `antennas`**

| antenna_id | antenna_identifier | antenna_type | resonant_frequency | impedance | status | r_f_port_id | receiver_id |
|---|---|---|---|---|---|---|---|
| 1 | ANT-2607 | directional | 11.95 | 6.20 | active | 1 | 1000 |
| 2 | ANT-2611 | omnidirectional | 13.90 | 10.40 | faulty | 2 | 1001 |
| 3 | ANT-2615 | directional | 15.85 | 14.60 | open | 3 | 1002 |
| 4 | ANT-2619 | omnidirectional | 17.80 | 18.80 | short | 4 | 1003 |

The `receivers` table captures receiver equipment. Primary key `id` ranges from 1000 to 1003. Business identifiers include `REC-2087`, `REC-2093`, `REC-2099`, and `REC-2105`. The `receiver_type` column distinguishes `superheterodyne` from `direct_conversion` architectures. Electrical parameters are `input_impedance` (21.20–30.80) and `sensitivity` (2.95–11.80). The `status` column records `active`, `standby`, or `fault`. Foreign keys `r_f_port_id` and `antenna_id` link each receiver to its RF port and antenna.

**Table `receivers`**

| id | receiver_identifier | receiver_type | input_impedance | sensitivity | status | r_f_port_id | antenna_id |
|---|---|---|---|---|---|---|---|
| 1000 | REC-2087 | superheterodyne | 21.20 | 2.95 | active | 1 | 1 |
| 1001 | REC-2093 | direct_conversion | 24.40 | 5.90 | standby | 2 | 2 |
| 1002 | REC-2099 | superheterodyne | 27.60 | 8.85 | fault | 3 | 3 |
| 1003 | REC-2105 | direct_conversion | 30.80 | 11.80 | active | 4 | 4 |

The `transformers` table stores RF transformer specifications. Primary key `transformer_id` ranges from 1 to 4. Business identifiers include `TRA-2610` through `TRA-2628`. The `turns_ratio` column carries descriptive values such as `pilot-turns-86`, `extended-turns-87`, `integrated-turns-88`, and `seasonal-turns-89`. Electrical parameters include `impedance_ratio` (7.20–16.80) and `phase_shift` (21.45–34.80). The `status` column records `active` or `faulty`. A foreign key `power_splitter_combiner_id` links each transformer to the splitter it serves.

**Table `transformers`**

| transformer_id | transformer_identifier | turns_ratio | impedance_ratio | phase_shift | status | power_splitter_combiner_id |
|---|---|---|---|---|---|---|
| 1 | TRA-2610 | pilot-turns-86 | 7.20 | 21.45 | active | 1 |
| 2 | TRA-2616 | extended-turns-87 | 10.40 | 25.90 | faulty | 2 |
| 3 | TRA-2622 | integrated-turns-88 | 13.60 | 30.35 | active | 3 |
| 4 | TRA-2628 | seasonal-turns-89 | 16.80 | 34.80 | faulty | 4 |

## Junction tables and many-to-many relationships

Two junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `combiners_ports` table resolves the relationship between `power_splitter_combiners` and `r_f_ports`, allowing a single splitter to connect to multiple ports and a single port to serve multiple splitters. Similarly, the `transformers_ports` table resolves the relationship between `transformers` and `r_f_ports`, enabling a transformer to be associated with multiple RF ports. These junction tables contain composite foreign keys referencing the primary keys of their parent tables, and they may carry additional attributes describing the nature of the connection.

## Foreign-key topology and signal-flow semantics

The foreign-key graph encodes the signal-flow topology of the RF test environment. At the centre sits `r_f_ports`, which holds three foreign keys pointing outward to `power_splitter_combiners`, `antennas`, and `receivers`. This design means every RF port is a nexus: it connects one splitter, one antenna, and one receiver in a single row. The `signal_characteristics` table adds a second layer of connectivity, with foreign keys pointing to both `power_splitter_combiners` and `r_f_ports`, creating a bridge between the component catalogue and the performance measurement records. The `transformers` table points back to `power_splitter_combiners`, indicating that transformers are subordinate components attached to splitters. The `antennas` and `receivers` tables each hold a foreign key to `r_f_ports`, completing the bidirectional links that allow queries to traverse the topology in either direction.

## View-based reconstruction of domain facts

Materialized views reconstruct domain facts by joining the normalized tables. Each view answers a specific question about the relationship between entity types.

The view `v_power_splitter_combiner_r_f_port_detail` joins `power_splitter_combiners` to `r_f_ports` on `power_splitter_combiners.id = r_f_ports.power_splitter_combiner_id`, producing a denormalized row per port that includes both the splitter's device identifier and the port's impedance, termination state, and VSWR. For example, the row for splitter `DEV-2372` joined with port `POR-2480` shows a nominal impedance of 9.20 alongside a port impedance of 6.20 and a VSWR of 6.95, allowing an engineer to assess impedance matching at a glance.

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

The view `v_power_splitter_combiner_signal_characteristic` joins `power_splitter_combiners` to `signal_characteristics` on `power_splitter_combiners.id = signal_characteristics.power_splitter_combiner_id`, attaching the characteristic type, value, unit, and measurement condition to each splitter. The row for `DEV-2372` (id 1) joined with characteristic id 100 reveals an `amplitude` measurement of 19.95 dB taken `in_phase` under `theoretical` conditions, providing a quick reference for expected performance.

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

The view `v_r_f_port_power_splitter_combiner` performs the inverse join, starting from `r_f_ports` and attaching the splitter's device identifier, device type, and status. The row for port `POR-2480` shows it connects to splitter `DEV-2372` of type `simple_T` with status `active`, answering the question "which splitter does this port belong to?"

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

The view `v_r_f_port_antenna` joins `r_f_ports` to `antennas` on `r_f_ports.antenna_id = antennas.antenna_id`, producing rows that pair each port with its antenna's identifier, type, resonant frequency, and status. Port `POR-2480` connects to antenna `ANT-2607`, a `directional` antenna with resonant frequency 11.95 and status `active`.

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

The view `v_r_f_port_receiver` joins `r_f_ports` to `receivers` on `r_f_ports.receiver_id = receivers.id`, pairing each port with its receiver's identifier, type, input impedance, and sensitivity. Port `POR-2480` connects to receiver `REC-2087`, a `superheterodyne` receiver with input impedance 21.20 and sensitivity 2.95.

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

The view `v_signal_characteristic_power_splitter_combiner` joins `signal_characteristics` to `power_splitter_combiners` on `signal_characteristics.power_splitter_combiner_id = power_splitter_combiners.id`, presenting measurement data alongside the splitter's device identifier and type. The row for characteristic id 101 (a `phase` measurement of 21.90 degrees, `out_of_phase`, `measured`) is attached to splitter `DEV-2378` of type `lumped_element`.

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

The view `v_signal_characteristic_r_f_port` joins `signal_characteristics` to `r_f_ports` on `signal_characteristics.r_f_port_id = r_f_ports.id`, linking each measurement to the specific port where it was taken. Characteristic id 102 (an `isolation` reading of 23.85 volts at `different_frequencies`, `theoretical`) is associated with port `POR-2486` (label `sum`, impedance 14.60).

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

The view `v_antenna_r_f_port` joins `antennas` to `r_f_ports` on `antennas.r_f_port_id = r_f_ports.id`, presenting each antenna alongside its port's identifier, label, impedance, and termination state. Antenna `ANT-2611`, an `omnidirectional` unit with status `faulty`, connects to port `POR-2483` (label `output`, impedance 10.40, termination `matched`).

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

The view `v_antenna_receiver` joins `antennas` to `receivers` on `antennas.receiver_id = receivers.id`, answering the question "which receiver is paired with this antenna?" Antenna `ANT-2615` (directional, status `open`) is paired with receiver `REC-2099` (superheterodyne, status `fault`).

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

The view `v_receiver_r_f_port` joins `receivers` to `r_f_ports` on `receivers.r_f_port_id = r_f_ports.id`, presenting each receiver alongside its port's identifier, label, and electrical parameters. Receiver `REC-2093` (direct_conversion, standby) connects to port `POR-2483` (output, impedance 10.40, VSWR 9.90).

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

The view `v_receiver_antenna` joins `receivers` to `antennas` on `receivers.antenna_id = antennas.antenna_id`, providing the reverse lookup from receiver to antenna. Receiver `REC-2105` (direct_conversion, active, sensitivity 11.80) is paired with antenna `ANT-2619` (omnidirectional, resonant frequency 17.80, status `short`).

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

The view `v_transformer_power_splitter_combiner` joins `transformers` to `power_splitter_combiners` on `transformers.power_splitter_combiner_id = power_splitter_combiners.id`, presenting each transformer alongside its parent splitter's device identifier and type. Transformer `TRA-2616` (turns ratio `extended-turns-87`, impedance ratio 10.40, status `faulty`) is attached to splitter `DEV-2378` (lumped_element, 4 ports).

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

The view `v_transformer_r_f_port_detail` joins `transformers` to `r_f_ports` through the `transformers_ports` junction table, producing rows that combine transformer specifications with port-level electrical data. Transformer `TRA-2622` (integrated-turns-88, phase shift 30.35, active) connects to port `POR-2486` (sum, impedance 14.60, VSWR 12.85), enabling impedance-matching analysis across the transformer-to-port boundary.

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

## Synthesis

The schema models an RF test environment as a network of interconnected components, with `r_f_ports` serving as the central hub that links splitters, antennas, and receivers in a single row. Foreign keys encode the directional relationships: splitters feed ports, ports connect to antennas and receivers, transformers attach to splitters, and signal characteristics annotate both splitters and ports. Junction tables `combiners_ports` and `transformers_ports` resolve many-to-many relationships that the direct foreign keys cannot express. The twelve materialized views each answer a specific relational question—connecting splitters to ports, ports to antennas, measurements to components—by joining the normalized tables along their foreign-key edges. Together, the base tables and views provide a complete, queryable representation of the RF domain, where every row in every view can be traced back to its constituent normalized tables and the domain facts they encode.

## Data appendix

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
