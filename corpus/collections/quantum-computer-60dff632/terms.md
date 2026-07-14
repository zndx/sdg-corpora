# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Quantum Computer
- **genus**: `cco:ont00000995`
- **definition**: A physical device that exploits quantum phenomena such as superposition and entanglement to perform computations.
- **attributes**: qubitCount, errorRate, faultTolerance, manufacturer, modelName, operationalStatus
- **relations**: usesQubitType→Qubit, threatensCryptosystem→Cryptosystem

## Quantum Bit
- **genus**: `bfo:0000015`
- **definition**: The fundamental unit of quantum information that exists in a vector space allowing superposition of states.
- **attributes**: stateVector, superpositionEnabled, entangledWith
- **relations**: constitutes→QuantumComputer

## Cryptosystem
- **genus**: `cco:ont00000995`
- **definition**: A system for secure communication that includes the protocols, algorithms, and keys used to encrypt and decrypt data.
- **attributes**: algorithmType, securityBasis, keyLength, vulnerabilityStatus
- **relations**: reliesOnMathProblem→MathematicalProblem, implementedIn→CyberSecurityProtocol

## Mathematical Problem
- **genus**: `bfo:0000015`
- **definition**: A computational problem such as integer factorization or discrete logarithm that serves as the hardness assumption for cryptographic security.
- **attributes**: problemName, classicalComplexity, quantumComplexity
- **relations**: solvedBy→QuantumComputer

## Cyber Security Protocol
- **genus**: `bfo:0000015`
- **definition**: A procedure or standard for securing communications, such as Quantum Key Distribution (QKD), that ensures data confidentiality and integrity.
- **attributes**: protocolName, transmissionMedium, maxDistance, disruptionRisk
- **relations**: usesQKD→QuantumKeyDistribution, securesDataFor→CyberSecuritySystem

## Quantum Key Distribution
- **genus**: `bfo:0000015`
- **definition**: A method of secure communication that uses quantum mechanical properties to allow two parties to produce a shared random secret key.
- **attributes**: photonPolarizationStates, detectorType, eavesdroppingDetection
- **relations**: implementedBy→CyberSecurityProtocol, transmitsDataTo→Receiver

## Receiver
- **genus**: `cco:ont00000995`
- **definition**: A physical device or endpoint that receives quantum signals, such as polarized photons, and translates them into classical bits.
- **attributes**: deviceID, location, detectorSensitivity
- **relations**: receivesFrom→QuantumKeyDistribution
