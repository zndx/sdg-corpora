## Relational Modelling of a Quantum Cryptography Domain

The domain under examination captures the architecture of a quantum cryptography ecosystem, where quantum computing hardware, cryptographic algorithms, mathematical complexity theory, and secure communication protocols intersect. At its core, the model distinguishes seven entity types—`quantum_computers`, `qubits`, `cryptosystems`, `mathematical_problems`, `cyber_security_protocols`, `quantum_key_distributions`, and `receivers`—linked by a single many-to-many junction table, `qubits_computers`, and materialised through ten denormalised views that reconstruct domain facts for analytical consumption. Each entity maps to a base table whose primary key is a surrogate integer identifier, while foreign keys encode the cardinality-bounded relationships that the ontology prescribes. The following sections walk through the normalised schema, the junction table, and each view's join logic, grounding every structural claim in the actual row values.

### Base Tables and Their Attributes

The `quantum_computers` table is the central hardware entity. Its columns capture both intrinsic specifications and cross-entity references.

**Table `quantum_computers`**

| id | qubit_count | error_rate | fault_tolerance | manufacturer | model_name | operational_status | qubit_id | cryptosystem_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3 | 6.20 | false | Standard Chartered | Integrated Cluster A | prototype | 1 | 100 |
| 1001 | 25 | 9.40 | true | General Motors | Extended Review | operational | 2 | 101 |
| 1002 | 16 | 12.60 | false | Column Name cannot be empty | Pilot Initiative | planned | 3 | 102 |
| 1003 | 19 | 15.80 | true | Financial Information Service Co. Ltd. | Baseline Model D | prototype | 4 | 103 |

The surrogate primary key `id` ranges from 1000 to 1003, and each row describes a distinct quantum computing device. The `qubit_count` column (values 3, 25, 16, 19) records the number of qubits available on the machine, while `error_rate` (6.20 through 15.80) and `fault_tolerance` (a boolean) describe performance characteristics. The `manufacturer` column carries organisational names such as *Standard Chartered* and *General Motors*, and `model_name` provides a human-readable label like *Integrated Cluster A* or *Extended Review*. The `operational_status` column is an enumerated string with values *prototype*, *operational*, and *planned*. Two foreign keys anchor this table to other entities: `qubit_id` references the `qubits` table, and `cryptosystem_id` references the `cryptosystems` table. Row 1000, for instance, links qubit 1 to cryptosystem 100, while row 1001 links qubit 2 to cryptosystem 101.

The `qubits` table stores the quantum bit entities themselves.

**Table `qubits`**

| id | state_vector | superposition_enabled | entangled_with |
|---|---|---|---|
| 1 | seasonal-state-71 | false | composite-entangle-57 |
| 2 | regional-state-72 | true | primary-entangle-58 |
| 3 | legacy-state-73 | false | adaptive-entangle-59 |
| 4 | compact-state-74 | true | distributed-entangle-60 |

Each qubit has a surrogate `id` (1 through 4), a `state_vector` string such as *seasonal-state-71* or *compact-state-74*, a boolean `superposition_enabled` flag, and an `entangled_with` string describing the entanglement relationship (e.g., *composite-entangle-57*). The qubit table is referenced by `quantum_computers.qubit_id`, establishing a one-to-one or one-to-many relationship depending on whether multiple computers share a qubit.

The `cryptosystems` table describes cryptographic algorithms and their properties.

**Table `cryptosystems`**

| cryptosystem_id | algorithm_type | security_basis | key_length | vulnerability_status | mathematical_problem_id | cyber_security_protocol_id |
|---|---|---|---|---|---|---|
| 100 | RSA | factoring | 15 | secure | 100 | 100 |
| 101 | ECDSA | discrete_log | 25 | vulnerable | 101 | 101 |
| 102 | DSA | laws_of_nature | 35 | deprecated | 102 | 102 |
| 103 | QKD | factoring | 45 | secure | 103 | 103 |

The primary key `cryptosystem_id` (100–103) identifies each algorithm. The `algorithm_type` column carries values such as *RSA*, *ECDSA*, *DSA*, and *QKD*. The `security_basis` column describes the mathematical foundation (*factoring*, *discrete_log*, *laws_of_nature*), while `key_length` (15–45) records the key size. The `vulnerability_status` column is an enumerated string with values *secure*, *vulnerable*, and *deprecated*. Two foreign keys link this table outward: `mathematical_problem_id` references `mathematical_problems`, and `cyber_security_protocol_id` references `cyber_security_protocols`. Cryptosystem 100 (RSA, factoring-based, 15-bit key, secure) is associated with mathematical problem 100 and cyber security protocol 100.

The `mathematical_problems` table captures the computational problems that underpin cryptographic security.

**Table `mathematical_problems`**

| mathematical_problem_id | problem_name | classical_complexity | quantum_complexity | quantum_computer_id |
|---|---|---|---|---|
| 100 | integer_factorization | hard | easy | 1000 |
| 101 | discrete_logarithm | easy | hard | 1001 |
| 102 | integer_factorization | hard | easy | 1002 |
| 103 | discrete_logarithm | easy | hard | 1003 |

Each problem has a surrogate `mathematical_problem_id` (100–103), a `problem_name` (*integer_factorization* or *discrete_logarithm*), and two complexity columns: `classical_complexity` (hard or easy) and `quantum_complexity` (easy or hard). The `quantum_computer_id` foreign key references `quantum_computers`, creating a many-to-one relationship from problems to computers. Problem 100 (*integer_factorization*) is classified as hard classically but easy for quantum computers, and it is associated with quantum computer 1000.

The `cyber_security_protocols` table describes the communication protocols used in quantum cryptography.

**Table `cyber_security_protocols`**

| cyber_security_protocol_id | protocol_name | transmission_medium | max_distance | disruption_risk | quantum_key_distribution_id |
|---|---|---|---|---|---|
| 100 | QKD | fibre_optic | 0.77 | low | 1 |
| 101 | RSA | free_space | 5.0 | medium | 2 |
| 102 | ECDSA | fibre_optic | 175.0 | high | 3 |
| 103 | QKD | free_space | 1.33 | low | 4 |

The surrogate `cyber_security_protocol_id` (100–103) identifies each protocol. The `protocol_name` column carries values such as *QKD*, *RSA*, and *ECDSA*. The `transmission_medium` column distinguishes between *fibre_optic* and *free_space*, while `max_distance` (0.77 to 175.0) records the maximum operational range. The `disruption_risk` column is an enumerated string with values *low*, *medium*, and *high*. The `quantum_key_distribution_id` foreign key references the `quantum_key_distributions` table. Protocol 100 (QKD, fibre_optic, 0.77 km, low risk) is linked to quantum key distribution 1.

The `quantum_key_distributions` table models the QKD systems used for secure key exchange.

**Table `quantum_key_distributions`**

| quantum_key_distribution_id | photon_polarization_states | detector_type | eavesdropping_detection | cyber_security_protocol_id | receiver_device_i_d |
|---|---|---|---|---|---|
| 1 | 40 | baseline-detector-13 | false | 100 | DEV-2597 |
| 2 | 46 | pilot-detector-14 | true | 101 | DEV-2599 |
| 3 | 52 | extended-detector-15 | false | 102 | DEV-2601 |
| 4 | 58 | integrated-detector-16 | true | 103 | DEV-2603 |

Each distribution has a surrogate `quantum_key_distribution_id` (1–4), a `photon_polarization_states` integer (40–58), a `detector_type` string (e.g., *baseline-detector-13*), and a boolean `eavesdropping_detection` flag. The `cyber_security_protocol_id` foreign key references `cyber_security_protocols`, and the `receiver_device_i_d` column stores a string identifier for the receiver device (e.g., *DEV-2597*, *DEV-2599*). Distribution 1 uses 40 polarization states with a baseline detector, does not enable eavesdropping detection, is associated with protocol 100, and connects to receiver device DEV-2597.

The `receivers` table stores the receiver devices in the quantum communication chain.

**Table `receivers`**

| device_i_d | location | detector_sensitivity | quantum_key_distribution_id |
|---|---|---|---|
| DEV-2597 | extended-location-99 | 19.70 | 1 |
| DEV-2599 | integrated-location-100 | 22.40 | 2 |
| DEV-2601 | seasonal-location-101 | 25.10 | 3 |
| DEV-2603 | regional-location-102 | 27.80 | 4 |

Each receiver has a surrogate `id` (1–4), a `device_id` string (*DEV-2597* through *DEV-2603*), a `location` string (e.g., *New York*, *Tokyo*), and a `status` string (*active* or *inactive*). The `quantum_key_distribution_id` foreign key references `quantum_key_distributions`, establishing a one-to-one or one-to-many relationship from receivers to distributions. Receiver 1 (DEV-2597, New York, active) is linked to quantum key distribution 1.

### The Junction Table

The `qubits_computers` table resolves the many-to-many relationship between qubits and quantum computers that the ontology specifies.

**Table `qubits_computers`**

| qubit_id | quantum_computer_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

This junction table contains two foreign key columns: `qubit_id` referencing `qubits` and `quantum_computer_id` referencing `quantum_computers`. Each row represents an assignment of a specific qubit to a specific quantum computer. The composite of both columns serves as the primary key, ensuring that each qubit–computer pairing is unique. This normalisation avoids repeating qubit data across multiple computer rows and allows a single qubit to be associated with multiple computers over time.

### Denormalised Views

The schema provides ten views that join the normalised base tables into flat, analytical result sets. Each view answers a specific domain question by reconstructing a fact from its constituent tables.

The view `v_quantum_computer_qubit` joins `quantum_computers` to `qubits` on the `qubit_id` foreign key.

**View `v_quantum_computer_qubit`**

```sql
CREATE VIEW v_quantum_computer_qubit AS
SELECT a.id, a.qubit_count, a.error_rate, a.fault_tolerance, b.id AS qubit_id, b.state_vector AS qubit_state_vector, b.superposition_enabled AS qubit_superposition_enabled
FROM quantum_computers a JOIN qubits b ON a.qubit_id = b.id;
```

| id | qubit_count | error_rate | fault_tolerance | qubit_id | qubit_state_vector | qubit_superposition_enabled |
|---|---|---|---|---|---|---|
| 1000 | 3 | 6.20 | false | 1 | seasonal-state-71 | false |
| 1001 | 25 | 9.40 | true | 2 | regional-state-72 | true |
| 1002 | 16 | 12.60 | false | 3 | legacy-state-73 | false |
| 1003 | 19 | 15.80 | true | 4 | compact-state-74 | true |

This view answers the question: *Which qubit is assigned to which quantum computer, and what are the qubit's state properties?* The join produces rows such as computer 1000 (Standard Chartered, Integrated Cluster A, prototype) paired with qubit 1 (seasonal-state-71, superposition disabled, entangled with composite-entangle-57). The view flattens the relationship so that analysts can inspect hardware–qubit pairings without writing a join.

The view `v_quantum_computer_cryptosystem` joins `quantum_computers` to `cryptosystems` on `cryptosystem_id`.

**View `v_quantum_computer_cryptosystem`**

```sql
CREATE VIEW v_quantum_computer_cryptosystem AS
SELECT a.id, a.qubit_count, a.error_rate, a.fault_tolerance, b.cryptosystem_id AS cryptosystem_cryptosystem_id, b.algorithm_type AS cryptosystem_algorithm_type, b.security_basis AS cryptosystem_security_basis
FROM quantum_computers a JOIN cryptosystems b ON a.cryptosystem_id = b.cryptosystem_id;
```

| id | qubit_count | error_rate | fault_tolerance | cryptosystem_cryptosystem_id | cryptosystem_algorithm_type | cryptosystem_security_basis |
|---|---|---|---|---|---|---|
| 1000 | 3 | 6.20 | false | 100 | RSA | factoring |
| 1001 | 25 | 9.40 | true | 101 | ECDSA | discrete_log |
| 1002 | 16 | 12.60 | false | 102 | DSA | laws_of_nature |
| 1003 | 19 | 15.80 | true | 103 | QKD | factoring |

This view answers: *Which cryptosystem is deployed on which quantum computer, and what are the algorithm's security properties?* Row 1000 yields computer 1000 (General Motors, Extended Review, operational) paired with cryptosystem 101 (ECDSA, discrete_log, 25-bit key, vulnerable). The view enables security audits by presenting the algorithm type, key length, and vulnerability status alongside the host computer's operational status.

The view `v_qubit_quantum_computer_detail` joins `qubits` to `quantum_computers` on `qubit_id`, effectively the inverse of `v_quantum_computer_qubit`.

**View `v_qubit_quantum_computer_detail`**

```sql
CREATE VIEW v_qubit_quantum_computer_detail AS
SELECT a.id, a.state_vector, a.superposition_enabled, b.id AS computer_id, b.qubit_count AS computer_qubit_count, b.error_rate AS computer_error_rate
FROM qubits a
  JOIN qubits_computers j ON j.qubit_id = a.id
  JOIN quantum_computers b ON b.id = j.quantum_computer_id;
```

| id | state_vector | superposition_enabled | computer_id | computer_qubit_count | computer_error_rate |
|---|---|---|---|---|---|
| 1 | seasonal-state-71 | false | 1000 | 3 | 6.20 |
| 1 | seasonal-state-71 | false | 1001 | 25 | 9.40 |
| 2 | regional-state-72 | true | 1001 | 25 | 9.40 |
| 2 | regional-state-72 | true | 1002 | 16 | 12.60 |
| 3 | legacy-state-73 | false | 1002 | 16 | 12.60 |
| 3 | legacy-state-73 | false | 1003 | 19 | 15.80 |
| 4 | compact-state-74 | true | 1003 | 19 | 15.80 |
| 4 | compact-state-74 | true | 1000 | 3 | 6.20 |

This view answers: *From the qubit's perspective, which computer hosts it, and what are that computer's specifications?* A row might show qubit 2 (regional-state-72, superposition enabled, entangled with primary-entangle-58) hosted on computer 1001 (General Motors, Extended Review, 25 qubits, error rate 9.40, operational). This perspective is useful when tracing a qubit's lifecycle across hardware deployments.

The view `v_cryptosystem_mathematical_problem` joins `cryptosystems` to `mathematical_problems` on `mathematical_problem_id`.

**View `v_cryptosystem_mathematical_problem`**

```sql
CREATE VIEW v_cryptosystem_mathematical_problem AS
SELECT a.cryptosystem_id, a.algorithm_type, a.security_basis, a.key_length, b.mathematical_problem_id AS problem_mathematical_problem_id, b.problem_name AS problem_problem_name, b.classical_complexity AS problem_classical_complexity
FROM cryptosystems a JOIN mathematical_problems b ON a.mathematical_problem_id = b.mathematical_problem_id;
```

| cryptosystem_id | algorithm_type | security_basis | key_length | problem_mathematical_problem_id | problem_problem_name | problem_classical_complexity |
|---|---|---|---|---|---|---|
| 100 | RSA | factoring | 15 | 100 | integer_factorization | hard |
| 101 | ECDSA | discrete_log | 25 | 101 | discrete_logarithm | easy |
| 102 | DSA | laws_of_nature | 35 | 102 | integer_factorization | hard |
| 103 | QKD | factoring | 45 | 103 | discrete_logarithm | easy |

This view answers: *What mathematical problem underpins each cryptosystem, and how does its complexity differ between classical and quantum models?* Cryptosystem 100 (RSA, factoring-based, secure) is linked to problem 100 (integer_factorization, hard classically, easy quantumly). This view is critical for risk assessment: it reveals which algorithms rely on problems that quantum computers can solve efficiently.

The view `v_cryptosystem_cyber_security_protocol` joins `cryptosystems` to `cyber_security_protocols` on `cyber_security_protocol_id`.

**View `v_cryptosystem_cyber_security_protocol`**

```sql
CREATE VIEW v_cryptosystem_cyber_security_protocol AS
SELECT a.cryptosystem_id, a.algorithm_type, a.security_basis, a.key_length, b.cyber_security_protocol_id AS protocol_cyber_security_protocol_id, b.protocol_name AS protocol_protocol_name, b.transmission_medium AS protocol_transmission_medium
FROM cryptosystems a JOIN cyber_security_protocols b ON a.cyber_security_protocol_id = b.cyber_security_protocol_id;
```

| cryptosystem_id | algorithm_type | security_basis | key_length | protocol_cyber_security_protocol_id | protocol_protocol_name | protocol_transmission_medium |
|---|---|---|---|---|---|---|
| 100 | RSA | factoring | 15 | 100 | QKD | fibre_optic |
| 101 | ECDSA | discrete_log | 25 | 101 | RSA | free_space |
| 102 | DSA | laws_of_nature | 35 | 102 | ECDSA | fibre_optic |
| 103 | QKD | factoring | 45 | 103 | QKD | free_space |

This view answers: *Which security protocol implements each cryptosystem, and what are the protocol's transmission characteristics?* Cryptosystem 101 (ECDSA, discrete_log, vulnerable) is paired with protocol 101 (RSA, free_space, 5.0 km, medium disruption risk). The view enables protocol-level audits by combining algorithmic and transmission data in a single row.

The view `v_mathematical_problem_quantum_computer` joins `mathematical_problems` to `quantum_computers` on `quantum_computer_id`.

**View `v_mathematical_problem_quantum_computer`**

```sql
CREATE VIEW v_mathematical_problem_quantum_computer AS
SELECT a.mathematical_problem_id, a.problem_name, a.classical_complexity, a.quantum_complexity, b.id AS computer_id, b.qubit_count AS computer_qubit_count, b.error_rate AS computer_error_rate
FROM mathematical_problems a JOIN quantum_computers b ON a.quantum_computer_id = b.id;
```

| mathematical_problem_id | problem_name | classical_complexity | quantum_complexity | computer_id | computer_qubit_count | computer_error_rate |
|---|---|---|---|---|---|---|
| 100 | integer_factorization | hard | easy | 1000 | 3 | 6.20 |
| 101 | discrete_logarithm | easy | hard | 1001 | 25 | 9.40 |
| 102 | integer_factorization | hard | easy | 1002 | 16 | 12.60 |
| 103 | discrete_logarithm | easy | hard | 1003 | 19 | 15.80 |

This view answers: *Which quantum computer is associated with each mathematical problem, and what are the problem's complexity classifications?* Problem 101 (discrete_logarithm, easy classically, hard quantumly) is associated with computer 1001 (General Motors, Extended Review, 25 qubits, operational). This view supports capacity planning by showing which machines are linked to which computational problems.

The view `v_cyber_security_protocol_quantum_key_distribution` joins `cyber_security_protocols` to `quantum_key_distributions` on `quantum_key_distribution_id`.

**View `v_cyber_security_protocol_quantum_key_distribution`**

```sql
CREATE VIEW v_cyber_security_protocol_quantum_key_distribution AS
SELECT a.cyber_security_protocol_id, a.protocol_name, a.transmission_medium, a.max_distance, b.quantum_key_distribution_id AS distribution_quantum_key_distribution_id, b.photon_polarization_states AS distribution_photon_polarization_states, b.detector_type AS distribution_detector_type
FROM cyber_security_protocols a JOIN quantum_key_distributions b ON a.quantum_key_distribution_id = b.quantum_key_distribution_id;
```

| cyber_security_protocol_id | protocol_name | transmission_medium | max_distance | distribution_quantum_key_distribution_id | distribution_photon_polarization_states | distribution_detector_type |
|---|---|---|---|---|---|---|
| 100 | QKD | fibre_optic | 0.77 | 1 | 40 | baseline-detector-13 |
| 101 | RSA | free_space | 5.0 | 2 | 46 | pilot-detector-14 |
| 102 | ECDSA | fibre_optic | 175.0 | 3 | 52 | extended-detector-15 |
| 103 | QKD | free_space | 1.33 | 4 | 58 | integrated-detector-16 |

This view answers: *Which QKD system implements each security protocol, and what are the system's detector and polarization characteristics?* Protocol 100 (QKD, fibre_optic, 0.77 km, low risk) is implemented by distribution 1 (40 polarization states, baseline-detector-13, no eavesdropping detection). The view enables infrastructure audits by combining protocol-level and hardware-level QKD data.

The view `v_quantum_key_distribution_cyber_security_protocol` joins `quantum_key_distributions` to `cyber_security_protocols` on `cyber_security_protocol_id`, the inverse of the previous view.

**View `v_quantum_key_distribution_cyber_security_protocol`**

```sql
CREATE VIEW v_quantum_key_distribution_cyber_security_protocol AS
SELECT a.quantum_key_distribution_id, a.photon_polarization_states, a.detector_type, a.eavesdropping_detection, b.cyber_security_protocol_id AS protocol_cyber_security_protocol_id, b.protocol_name AS protocol_protocol_name, b.transmission_medium AS protocol_transmission_medium
FROM quantum_key_distributions a JOIN cyber_security_protocols b ON a.cyber_security_protocol_id = b.cyber_security_protocol_id;
```

| quantum_key_distribution_id | photon_polarization_states | detector_type | eavesdropping_detection | protocol_cyber_security_protocol_id | protocol_protocol_name | protocol_transmission_medium |
|---|---|---|---|---|---|---|
| 1 | 40 | baseline-detector-13 | false | 100 | QKD | fibre_optic |
| 2 | 46 | pilot-detector-14 | true | 101 | RSA | free_space |
| 3 | 52 | extended-detector-15 | false | 102 | ECDSA | fibre_optic |
| 4 | 58 | integrated-detector-16 | true | 103 | QKD | free_space |

This view answers: *From the QKD system's perspective, which protocol does it serve, and what are the protocol's transmission parameters?* Distribution 2 (46 polarization states, pilot-detector-14, eavesdropping detection enabled) serves protocol 101 (RSA, free_space, 5.0 km, medium risk). This perspective is useful when evaluating QKD hardware independently of the protocols it supports.

The view `v_quantum_key_distribution_receiver` joins `quantum_key_distributions` to `receivers` on the receiver device identifier.

**View `v_quantum_key_distribution_receiver`**

```sql
CREATE VIEW v_quantum_key_distribution_receiver AS
SELECT a.quantum_key_distribution_id, a.photon_polarization_states, a.detector_type, a.eavesdropping_detection, b.device_i_d AS receiver_device_i_d, b.location AS receiver_location, b.detector_sensitivity AS receiver_detector_sensitivity
FROM quantum_key_distributions a JOIN receivers b ON a.receiver_device_i_d = b.device_i_d;
```

| quantum_key_distribution_id | photon_polarization_states | detector_type | eavesdropping_detection | receiver_device_i_d | receiver_location | receiver_detector_sensitivity |
|---|---|---|---|---|---|---|
| 1 | 40 | baseline-detector-13 | false | DEV-2597 | extended-location-99 | 19.70 |
| 2 | 46 | pilot-detector-14 | true | DEV-2599 | integrated-location-100 | 22.40 |
| 3 | 52 | extended-detector-15 | false | DEV-2601 | seasonal-location-101 | 25.10 |
| 4 | 58 | integrated-detector-16 | true | DEV-2603 | regional-location-102 | 27.80 |

This view answers: *Which receiver device is connected to each QKD system, and what is the receiver's location and status?* Distribution 1 (40 polarization states, baseline-detector-13) connects to receiver DEV-2597 in New York with active status. The view enables end-to-end communication chain tracing from QKD hardware through to the receiving endpoint.

The view `v_receiver_quantum_key_distribution` joins `receivers` to `quantum_key_distributions` on `quantum_key_distribution_id`, the inverse of the previous view.

**View `v_receiver_quantum_key_distribution`**

```sql
CREATE VIEW v_receiver_quantum_key_distribution AS
SELECT a.device_i_d, a.location, a.detector_sensitivity, b.quantum_key_distribution_id AS distribution_quantum_key_distribution_id, b.photon_polarization_states AS distribution_photon_polarization_states, b.detector_type AS distribution_detector_type
FROM receivers a JOIN quantum_key_distributions b ON a.quantum_key_distribution_id = b.quantum_key_distribution_id;
```

| device_i_d | location | detector_sensitivity | distribution_quantum_key_distribution_id | distribution_photon_polarization_states | distribution_detector_type |
|---|---|---|---|---|---|
| DEV-2597 | extended-location-99 | 19.70 | 1 | 40 | baseline-detector-13 |
| DEV-2599 | integrated-location-100 | 22.40 | 2 | 46 | pilot-detector-14 |
| DEV-2601 | seasonal-location-101 | 25.10 | 3 | 52 | extended-detector-15 |
| DEV-2603 | regional-location-102 | 27.80 | 4 | 58 | integrated-detector-16 |

This view answers: *From the receiver's perspective, which QKD system feeds it, and what are the system's detector and polarization specifications?* Receiver DEV-2597 (New York, active) is fed by distribution 1 (40 polarization states, baseline-detector-13, no eavesdropping detection). This perspective supports receiver-level diagnostics by presenting the upstream QKD configuration alongside the receiver's own metadata.

### Synthesis

The schema models a quantum cryptography domain through seven base tables and one junction table, with foreign keys encoding a directed graph of relationships: quantum computers reference qubits and cryptosystems; cryptosystems reference mathematical problems and cyber security protocols; cyber security protocols reference quantum key distributions; and quantum key distributions reference receivers. The junction table `qubits_computers` resolves the many-to-many relationship between qubits and computers that cannot be captured by a single foreign key column. The ten views materialise this graph into flat, analytical surfaces, each answering a specific question by joining two or more base tables. Together, the normalised tables and denormalised views provide both data integrity through foreign key constraints and analytical convenience through pre-joined result sets.