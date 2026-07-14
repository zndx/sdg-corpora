# Quantum-Resistant Cryptography: Infrastructure, Protocols, and Operational Relationships

The transition from classical to quantum-resistant cryptography demands a comprehensive understanding of the hardware, algorithms, and communication protocols that form the backbone of post-quantum security. Modern quantum computing infrastructure is not a monolithic entity but a layered ecosystem spanning physical qubit architectures, cryptographic algorithms, mathematical problem classes, and the quantum key distribution networks that bind them together. This chapter examines each component of that ecosystem, drawing on operational records from a representative deployment environment to illustrate how these elements interconnect in practice.

The deployment under examination includes four quantum computing systems manufactured by organizations ranging from financial services firms to automotive enterprises. Each system operates with a distinct qubit count, error profile, and fault-tolerance configuration, reflecting the heterogeneous state of the field.

**Table `quantum_computers`**

| id | qubit_count | error_rate | fault_tolerance | manufacturer | model_name | operational_status | qubit_id | cryptosystem_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3 | 6.20 | false | Standard Chartered | Integrated Cluster A | prototype | 1 | 100 |
| 1001 | 25 | 9.40 | true | General Motors | Extended Review | operational | 2 | 101 |
| 1002 | 16 | 12.60 | false | Column Name cannot be empty | Pilot Initiative | planned | 3 | 102 |
| 1003 | 19 | 15.80 | true | Financial Information Service Co. Ltd. | Baseline Model D | prototype | 4 | 103 |

The qubit count alone does not determine a system's utility; error rates and fault tolerance are equally critical. System 1001, operated by General Motors under the designation Extended Review, achieves operational status with 25 qubits and a 9.40 percent error rate, while its fault-tolerance flag is enabled. By contrast, system 1002, a planned Pilot Initiative with 16 qubits and a 12.60 percent error rate, lacks fault tolerance entirely. These distinctions matter when matching computational workloads to available hardware.

The physical qubits themselves carry state vectors and entanglement relationships that define their computational behavior.

**Table `qubits`**

| id | state_vector | superposition_enabled | entangled_with |
|---|---|---|---|
| 1 | seasonal-state-71 | false | composite-entangle-57 |
| 2 | regional-state-72 | true | primary-entangle-58 |
| 3 | legacy-state-73 | false | adaptive-entangle-59 |
| 4 | compact-state-74 | true | distributed-entangle-60 |

Qubit 1, carrying the seasonal-state-71 vector, operates without superposition enabled and participates in a composite entanglement relationship identified as composite-entangle-57. Qubit 2, by contrast, has superposition enabled and is linked through primary-entangle-58. The state vector nomenclature—seasonal, regional, legacy, compact—suggests a classification scheme tied to deployment lifecycle or environmental calibration, though the operational implications of each label are determined by the superposition and entanglement flags.

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

The qubits_computers table establishes which qubits are assigned to which quantum computers, forming the physical mapping between abstract qubit resources and the machines that execute algorithms on them.

Cryptographic systems sit at the intersection of mathematical theory and practical security. The deployment records four distinct cryptosystems, each grounded in a different algorithmic approach and security basis.

**Table `cryptosystems`**

| cryptosystem_id | algorithm_type | security_basis | key_length | vulnerability_status | mathematical_problem_id | cyber_security_protocol_id |
|---|---|---|---|---|---|---|
| 100 | RSA | factoring | 15 | secure | 100 | 100 |
| 101 | ECDSA | discrete_log | 25 | vulnerable | 101 | 101 |
| 102 | DSA | laws_of_nature | 35 | deprecated | 102 | 102 |
| 103 | QKD | factoring | 45 | secure | 103 | 103 |

The RSA implementation (cryptosystem 100) relies on factoring as its security basis with a key length of 15 bits and maintains a secure vulnerability status. ECDSA (cryptosystem 101), based on discrete logarithms with a 25-bit key, is flagged as vulnerable. DSA (cryptosystem 102) presents an unusual security basis of laws_of_nature with a 35-bit key and carries a deprecated status. The QKD-based cryptosystem (103) also references factoring as its security basis but achieves a secure status with a 45-bit key length.

These cryptosystems are not abstract constructs; each is anchored to a specific mathematical problem that defines its hardness assumptions.

**Table `mathematical_problems`**

| mathematical_problem_id | problem_name | classical_complexity | quantum_complexity | quantum_computer_id |
|---|---|---|---|---|
| 100 | integer_factorization | hard | easy | 1000 |
| 101 | discrete_logarithm | easy | hard | 1001 |
| 102 | integer_factorization | hard | easy | 1002 |
| 103 | discrete_logarithm | easy | hard | 1003 |

The integer_factorization problem (mathematical_problem_id 100) is classified as hard under classical complexity but easy under quantum complexity, making it the foundational challenge for RSA-style systems. The discrete_logarithm problem (101) presents the inverse profile: easy classically but hard for quantum computers. This asymmetry is precisely why certain cryptosystems are vulnerable while others remain secure in a quantum context. Each mathematical problem is associated with a specific quantum computer in the deployment—problem 100 with system 1000, problem 101 with system 1001—indicating which hardware platform is designated for evaluating or solving that problem.

The operational deployment of these cryptographic systems requires cyber security protocols that govern key exchange, transmission, and verification.

**Table `cyber_security_protocols`**

| cyber_security_protocol_id | protocol_name | transmission_medium | max_distance | disruption_risk | quantum_key_distribution_id |
|---|---|---|---|---|---|
| 100 | QKD | fibre_optic | 0.77 | low | 1 |
| 101 | RSA | free_space | 5.0 | medium | 2 |
| 102 | ECDSA | fibre_optic | 175.0 | high | 3 |
| 103 | QKD | free_space | 1.33 | low | 4 |

Protocol 100, named QKD, operates over a fibre_optic transmission medium with a maximum distance of 0.77 units and carries a low disruption_risk. Protocol 101, named RSA, uses free_space transmission with a substantially longer range of 5.0 units and a medium disruption_risk. Protocol 102, named ECDSA, returns to fibre_optic with a maximum distance of 175.0 units—the longest in the deployment—but carries a high disruption_risk. Protocol 103, another QKD protocol, uses free_space with a 1.33-unit range and low disruption_risk. The transmission medium and distance parameters directly influence the physical infrastructure required to deploy each protocol.

Quantum key distribution serves as the mechanism that translates cryptographic theory into physical key exchange.

**Table `quantum_key_distributions`**

| quantum_key_distribution_id | photon_polarization_states | detector_type | eavesdropping_detection | cyber_security_protocol_id | receiver_device_i_d |
|---|---|---|---|---|---|
| 1 | 40 | baseline-detector-13 | false | 100 | DEV-2597 |
| 2 | 46 | pilot-detector-14 | true | 101 | DEV-2599 |
| 3 | 52 | extended-detector-15 | false | 102 | DEV-2601 |
| 4 | 58 | integrated-detector-16 | true | 103 | DEV-2603 |

Each quantum key distribution is characterized by the number of photon_polarization_states it employs, the detector type used for measurement, and whether eavesdropping_detection is enabled. Distribution 1 uses 40 polarization states with a baseline-detector-13 and has eavesdropping_detection disabled. Distribution 2 increases to 46 states, uses a pilot-detector-14, and enables eavesdropping_detection. Distribution 3 reaches 52 states with an extended-detector-15 but disables detection again. Distribution 4 employs the highest state count at 58, uses an integrated-detector-16, and enables detection. The correlation between detector sophistication and detection capability suggests a design trade-off between state complexity and security monitoring.

Every quantum key distribution terminates at a receiver device, which captures and processes the transmitted quantum states.

**Table `receivers`**

| device_i_d | location | detector_sensitivity | quantum_key_distribution_id |
|---|---|---|---|
| DEV-2597 | extended-location-99 | 19.70 | 1 |
| DEV-2599 | integrated-location-100 | 22.40 | 2 |
| DEV-2601 | seasonal-location-101 | 25.10 | 3 |
| DEV-2603 | regional-location-102 | 27.80 | 4 |

The receiver devices are identified by codes such as DEV-2597, DEV-2599, DEV-2601, and DEV-2603. Each is associated with a specific quantum key distribution, forming the endpoint of the quantum communication chain.

## Operational Views and Joined Relationships

The true value of this dataset emerges when the individual tables are joined into analytical views. Each view answers a specific operational question by combining records across multiple domains.

The view v_quantum_computer_qubit links quantum computing systems to their assigned qubits, answering the question of which physical qubit resources are available on each machine.

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

In this view, system 1000 (Standard Chartered, Integrated Cluster A) is associated with qubit 1, which carries the seasonal-state-71 vector and has superposition disabled. System 1001 (General Motors, Extended Review) is paired with qubit 2, which has superposition enabled and participates in primary-entangle-58. The join reveals that operational systems tend to be paired with qubits that have superposition enabled, while prototype systems may use qubits without that capability.

The view v_quantum_computer_cryptosystem connects each quantum computer to the cryptosystem it is configured to support.

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

System 1000 supports cryptosystem 100 (RSA, factoring-based, secure), while system 1001 supports cryptosystem 101 (ECDSA, discrete_log-based, vulnerable). System 1002 is linked to cryptosystem 102 (DSA, laws_of_nature-based, deprecated), and system 1003 to cryptosystem 103 (QKD, factoring-based, secure). This alignment suggests that operational systems are paired with cryptosystems that have a secure or at least functional status, while planned or prototype systems may be associated with deprecated or vulnerable configurations under evaluation.

The view v_qubit_quantum_computer_detail provides an enriched perspective on the qubit-to-computer mapping by including qubit state information alongside computer specifications.

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

Qubit 1 (seasonal-state-71, superposition disabled) is mapped to system 1000, which has 3 qubits, a 6.20 error rate, and prototype status. Qubit 2 (regional-state-72, superposition enabled) is mapped to system 1001, which has 25 qubits, a 9.40 error rate, and operational status. The detail view makes it clear that higher-qubit-count systems with fault tolerance enabled are paired with qubits that have superposition capabilities, reinforcing the relationship between hardware maturity and qubit functionality.

The view v_cryptosystem_mathematical_problem reveals which mathematical problem underpins each cryptosystem.

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

Cryptosystem 100 (RSA) is grounded in mathematical problem 100 (integer_factorization, hard classically/easy quantumly). Cryptosystem 101 (ECDSA) is grounded in problem 101 (discrete_logarithm, easy classically/hard quantumly). Cryptosystem 102 (DSA) is grounded in problem 102 (integer_factorization), and cryptosystem 103 (QKD) in problem 103 (discrete_logarithm). The view makes explicit the vulnerability patterns: cryptosystems based on problems that are easy for quantum computers (integer_factorization) may face future risk, while those based on problems that remain hard for quantum computers (discrete_logarithm) offer more durable security.

The view v_cryptosystem_cyber_security_protocol shows which security protocol is associated with each cryptosystem.

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

Cryptosystem 100 (RSA) is paired with protocol 100 (QKD, fibre_optic, low disruption_risk). Cryptosystem 101 (ECDSA) is paired with protocol 101 (RSA, free_space, medium disruption_risk). Cryptosystem 102 (DSA) is paired with protocol 102 (ECDSA, fibre_optic, high disruption_risk). Cryptosystem 103 (QKD) is paired with protocol 103 (QKD, free_space, low disruption_risk). The pairing of RSA-based cryptosystems with QKD protocols and vice versa suggests a cross-protocol strategy where quantum key distribution is used to secure classical cryptographic exchanges.

The view v_mathematical_problem_quantum_computer maps each mathematical problem to the quantum computer designated for its evaluation.

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

Problem 100 (integer_factorization) is evaluated on system 1000 (3 qubits, prototype). Problem 101 (discrete_logarithm) is evaluated on system 1001 (25 qubits, operational). Problem 102 (integer_factorization) is evaluated on system 1002 (16 qubits, planned). Problem 103 (discrete_logarithm) is evaluated on system 1003 (19 qubits, prototype). The view highlights that discrete logarithm problems are being tested on systems with higher qubit counts and operational status, while integer factorization problems are assigned to smaller or prototype systems, possibly reflecting the different computational demands of each problem class.

The view v_cyber_security_protocol_quantum_key_distribution links each cyber security protocol to its corresponding quantum key distribution mechanism.

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

Protocol 100 (QKD, fibre_optic) is linked to quantum key distribution 1 (40 polarization states, baseline-detector-13, no eavesdropping detection). Protocol 101 (RSA, free_space) is linked to distribution 2 (46 states, pilot-detector-14, eavesdropping detection enabled). Protocol 102 (ECDSA, fibre_optic) is linked to distribution 3 (52 states, extended-detector-15, no detection). Protocol 103 (QKD, free_space) is linked to distribution 4 (58 states, integrated-detector-16, detection enabled). The view reveals a pattern: protocols with higher disruption risk tend to be paired with distributions that use more polarization states but may lack eavesdropping detection, while lower-risk protocols use fewer states but include detection capabilities.

The view v_quantum_key_distribution_cyber_security_protocol presents the same relationship from the quantum key distribution perspective, showing which cyber security protocol each distribution supports.

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

Distribution 1 supports protocol 100 (QKD, fibre_optic, 0.77 max distance, low disruption). Distribution 2 supports protocol 101 (RSA, free_space, 5.0 max distance, medium disruption). Distribution 3 supports protocol 102 (ECDSA, fibre_optic, 175.0 max distance, high disruption). Distribution 4 supports protocol 103 (QKD, free_space, 1.33 max distance, low disruption). The view underscores the diversity of transmission media: fibre_optic distributions achieve either very short or very long ranges, while free_space distributions occupy the middle ground.

The view v_quantum_key_distribution_receiver connects each quantum key distribution to its terminating receiver device.

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

Distribution 1 terminates at receiver DEV-2597. Distribution 2 at DEV-2599. Distribution 3 at DEV-2601. Distribution 4 at DEV-2603. The sequential receiver identifiers suggest a planned deployment sequence, with each distribution assigned to a dedicated receiver endpoint.

The view v_receiver_quantum_key_distribution presents the same relationship from the receiver perspective, showing which quantum key distribution each receiver is associated with.

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

Receiver DEV-2597 is associated with distribution 1 (40 polarization states, baseline-detector-13). Receiver DEV-2599 with distribution 2 (46 states, pilot-detector-14). Receiver DEV-2601 with distribution 3 (52 states, extended-detector-15). Receiver DEV-2603 with distribution 4 (58 states, integrated-detector-16). The receiver-to-distribution mapping confirms that each receiver is dedicated to a single distribution, and the progression of detector types—from baseline through pilot, extended, to integrated—correlates with increasing polarization state counts, suggesting an evolutionary hardware deployment strategy.

## Synthesis

The records examined here paint a picture of a quantum cryptography infrastructure in active development. Four quantum computers, ranging from 3 to 25 qubits, support four distinct cryptosystems grounded in two fundamental mathematical problems. The operational status of each system—prototype, operational, or planned—correlates with the maturity of its associated qubits, the security status of its cryptosystem, and the sophistication of its quantum key distribution and receiver hardware.

The most significant finding is the asymmetry between classical and quantum complexity for the underlying mathematical problems. Integer factorization, which secures RSA, is easy for quantum computers but hard classically. Discrete logarithms, which secure ECDSA, present the opposite profile. This asymmetry drives the selection of cryptosystems and the configuration of quantum key distributions, with higher state counts and more sophisticated detectors reserved for the most critical security channels.

The deployment demonstrates that quantum-resistant cryptography is not a single algorithm or protocol but an integrated system spanning physical qubits, mathematical hardness assumptions, cryptographic algorithms, transmission media, and receiver hardware. Each component must be evaluated not in isolation but in the context of its relationships to the others, as the joined views make clear.