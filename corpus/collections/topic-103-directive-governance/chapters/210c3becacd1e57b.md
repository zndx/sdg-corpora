---
chapter_id: 210c3becacd1e57b
topic_id: 103
family: 02_observation_measurement
cited_terms: ['trace_in_service', 'span_with_status', 'measurement_equiv_with_dim_unit', 'span_with_parent']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Formal Ontology of Service Tracing and Measurement in Distributed Control Systems

## 4.1 Scope and Preamble

This chapter establishes the formal ontological framework required for the rigorous documentation of operational traces, status spans, and dimensional measurements within distributed industrial control environments. The definitions provided herein are derived from the Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO), specifically targeting the semantic interoperability of service logs and audit trails. The content is intended for systems architects, compliance officers, and data engineers responsible for implementing high-fidelity digital twins of physical processes. The following sections detail the axiomatic structure of four primary concept classes—Trace in Service, Span with Status, Measurement Equivalence, and Span with Parent—alongside their corresponding relational schema implementations. These constructs ensure that all observational data is anchored to a verifiable lineage of process execution and state transition.

## 4.2 Trace in Service

### 4.2.1 Axiomatic Definition

The fundamental unit of observability in any service-oriented architecture is the binding of a specific operational trace to its parent service context. This relationship is formalized by the axiom `trace_in_service`, which asserts that a specific entity (Class X) is a process that exists *in service* of a containing entity (Class Y). In Manchester syntax, this is expressed as `Class: {X:Class} SubClassOf: bfo:0000015, sdg:inService some {Y:Class}`.

Verbalized, the axiom states: **{X} is something that in service {Y}**.

This definition mandates that no trace exists in a vacuum; it is ontologically dependent on the service definition which provides its operational context. The `bfo:0000015` reference denotes that X is a subclass of 'Process', ensuring that we are dealing with temporal entities that unfold over time, rather than static objects. The `sdg:inService` object property creates the necessary link between the subordinate trace and the governing service.

### 4.2.2 Implementation Schema

The relational projection of this axiom creates a normalized structure for storing these dependencies. The table `t_trace_in_service` serves as the central registry for all active traces within the system.

**Table Structure:**
The primary key is the unique identifier (`id`) for the trace instance. The column `x` represents the specific trace class or instance name, while `y` represents the service identifier. A foreign key constraint is not strictly applied to `y` in this specific table definition within the schema provided, but logically, `y` must resolve to a valid service context. However, to maintain referential integrity across the broader schema, this table acts as a parent to other status tables.

The following table illustrates the instantiation of this axiom within a Fire Ventilation Control System, mapping specific operational traces to their governing service contexts.

| id | x | y |
| :--- | :--- | :--- |
| TRC-FV-01 | MainVentilationLoop | FireVentilationService |
| TRC-CV-01 | ComfortCycleRoutine | ComfortVentilationService |
| TRC-FV-02 | EmergencyPurgeSequence | FireVentilationService |
| TRC-PWR-01 | GridPowerMonitoring | PowerManagementService |
| TRC-AUD-01 | AccessControlLog | SecurityService |

*Table 4.1: Instantiation of Trace in Service Axiom*

In the data presented above, the entity `MainVentilationLoop` (x) is explicitly defined as being in service of `FireVentilationService` (y). This distinction is critical for audit compliance, as it segregates logs belonging to safety-critical fire operations from those belonging to routine comfort cycles, even if they physically utilize the same hardware actuators.

## 4.3 Span with Status

### 4.3.1 Axiomatic Definition

While a trace defines the broad context of a process, a "span" defines a specific, bounded segment of that process. To manage state transitions effectively, the ontology introduces the `span_with_status` axiom. This axiom asserts that a process span (Class X) possesses a specific status attribute (Class Y). The Manchester syntax is defined as: `Class: {X:Class} SubClassOf: bfo:0000015, sdg:hasSpanStatus some {Y:Class}`.

Verbalized, the axiom states: **{X} is something that has span status {Y}**.

This construct allows for the granular decomposition of a trace into discrete temporal windows (spans), each characterized by a specific state (e.g., 'Active', 'Idle', 'Fault'). By anchoring the status to the span rather than the trace, the system supports high-frequency state changes without invalidating the overarching trace identity.

### 4.3.2 Implementation Schema

The relational schema for `t_span_with_status` enforces a strict dependency on the `t_trace_in_service` table. The column `y`, representing the status, is defined as a foreign key referencing the `id` column of `t_trace_in_service`. This structural constraint implies that valid status values must be defined as entities within the trace table, effectively treating status definitions as specific types of service traces or context identifiers.

**Table Structure:**
The primary key (`id`) uniquely identifies the span instance. Column `x` holds the span descriptor, and column `y` holds the status identifier, which must exist in the `t_trace_in_service` table.

The following table demonstrates the assignment of status values to specific operational spans within the ventilation system. Note that the values in the `y` column (e.g., `STS-ACTIVE`, `STS-FAULT`) correspond to identifiers that would be defined as primary keys in the `t_trace_in_service` table.

| id | x | y |
| :--- | :--- | :--- |
| SPN-001 | ActuatorGroup_A_Fire | STS-ACTIVE |
| SPN-002 | ActuatorGroup_A_Comfort | STS-IDLE |
| SPN-003 | Damper_Position_Check | STS-FAULT |
| SPN-004 | Power_Unit_24V | STS-ACTIVE |
| SPN-005 | Signal_Fire_Switch_1 | STS-NORMAL |

*Table 4.2: Instantiation of Span with Status Axiom*

In this example, the span `ActuatorGroup_A_Fire` is currently assigned the status `STS-ACTIVE`. The referential integrity ensures that `STS-ACTIVE` is a pre-validated, governed state defined within the service ontology. This prevents the introduction of ambiguous or non-compliant status strings (such as "on" or "1") into the formal log.

## 4.4 Measurement Equivalence with Dimension and Unit

### 4.4.1 Axiomatic Definition

To provide semantic meaning to the data collected during process spans, the ontology employs the `measurement_equiv_with_dim_unit` axiom. This axiom defines a class (X) that is equivalent to a `cco:DescriptiveICE` (Information Content Entity) which possesses a specific dimension (Y) and unit (Z). The Manchester syntax is: `Class: {X:Class} EquivalentTo: cco:DescriptiveICE and (sdg:hasDimension some {Y:Class}) and (sdg:hasUnit some {Z:Class})`.

Verbalized, the axiom implies that **{X} is a measurement defined by dimension {Y} and unit {Z}**.

This equivalence class is crucial for automated data processing. It explicitly separates the *value* of a measurement (which is a data literal) from its *semantic type* (the dimension and unit). By declaring X as a DescriptiveICE, we treat the measurement as a distinct informational artifact that can be annotated, queried, and reasoned over, independent of the physical value it holds at any given moment.

### 4.4.2 Implementation Schema

The table `t_measurement_equiv_with_dim_unit` encodes these definitions. The schema includes a foreign key constraint where the dimension (`y`) must reference an existing span status (`id` from `t_span_with_status`). This is a sophisticated constraint implying that the valid dimensions for a measurement may be context-dependent on the status of the span being measured (e.g., a "Temperature" dimension might only be valid or defined when the span is in a "Heating" status).

**Table Structure:**
The table includes columns for the measurement definition (`x`), the dimension (`y`), and the unit (`z`). The `id` serves as the primary key for the measurement class definition.

The following table catalogs the measurement types utilized in the control system, linking them to their respective dimensions and units of measure.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| MEAS-001 | AirflowVelocity | SPN-001 | CubicMetersPerHour |
| MEAS-002 | ElectricalCurrent | SPN-001 | Ampere |
| MEAS-003 | AmbientTemperature | SPN-002 | Celsius |
| MEAS-004 | ControlSignalVoltage | SPN-004 | VoltDC |
| MEAS-005 | ActuatorPosition | SPN-001 | PercentOpen |

*Table 4.3: Instantiation of Measurement Equivalence Axiom*

Here, the measurement `AirflowVelocity` (x) is defined with the unit `CubicMetersPerHour` (z). Its dimension (`y`) is linked to `SPN-001` (the `ActuatorGroup_A_Fire` span). This linkage suggests that the definition or applicability of this airflow measurement is specifically bound to the context of the Fire Ventilation span status, ensuring that measurements taken during comfort cycles are not semantically conflated with those taken during emergency fire operations, even if they use the same physical sensors.

## 4.5 Span with Parent

### 4.5.1 Axiomatic Definition

Complex control processes are rarely flat; they are hierarchical trees of sub-processes. The `span_with_parent` axiom captures this hierarchy by asserting that a child span (Class X) has a parent span (Class Y). The Manchester syntax is: `Class: {X:Class} SubClassOf: bfo:0000015, sdg:hasParentSpan some {Y:Class}`.

Verbalized, the axiom states: **{X} is something that has parent span {Y}**.

This recursive structure allows for the decomposition of a high-level process (such as "Fire Ventilation") into constituent sub-processes (such as "Open Damper", "Activate Fan", "Monitor Pressure"). The parent-child relationship is essential for root-cause analysis, as it allows an auditor to trace a failure in a leaf-node span up to the root service trace.

### 4.5.2 Implementation Schema

The `t_span_with_parent` table implements this hierarchy. The foreign key constraint requires that the parent span identifier (`y`) must reference a valid trace (`id`) in the `t_trace_in_service` table. This design choice elevates the "Parent" concept to the level of a Service Trace, meaning that top-level spans are directly anchored to the service itself, while deeper spans anchor to their immediate antecedents.

**Table Structure:**
The table consists of the child span identifier (`id`), the child span description (`x`), and the parent span reference (`y`).

The following table outlines the hierarchical decomposition of the `FireVentilationService`, showing how specific operational sub-routines are nested within the main service trace.

| id | x | y |
| :--- | :--- | :--- |
| SPN-SUB-01 | Ignition_Safety_Check | TRC-FV-01 |
| SPN-SUB-02 | Main_Fan_Activation | TRC-FV-01 |
| SPN-SUB-03 | Smoke_Damper_Closure | TRC-FV-01 |
| SPN-SUB-04 | Pressure_Transducer_Read | SPN-SUB-02 |
| SPN-SUB-05 | Fan_Speed_Ramp_Up | SPN-SUB-02 |

*Table 4.4: Instantiation of Span with Parent Axiom*

In this dataset, `Main_Fan_Activation` (x) is identified as a child span with the parent `TRC-FV-01` (y), which corresponds to the `FireVentilationService` trace established in Section 4.2. Furthermore, `Fan_Speed_Ramp_Up` is shown as a child of `Main_Fan_Activation`, demonstrating the multi-level capability of the schema. This structure ensures that every atomic action performed by the control unit is traceable back to the specific service invocation that authorized it.

```json
{
  "tables": [
    {
      "name": "t_trace_in_service",
      "rows": [
        [
          "TRC-FV-01",
          "MainVentilationLoop",
          "FireVentilationService"
        ],
        [
          "TRC-CV-01",
          "ComfortCycleRoutine",
          "ComfortVentilationService"
        ],
        [
          "TRC-FV-02",
          "EmergencyPurgeSequence",
          "FireVentilationService"
        ],
        [
          "TRC-PWR-01",
          "GridPowerMonitoring",
          "PowerManagementService"
        ],
        [
          "TRC-AUD-01",
          "AccessControlLog",
          "SecurityService"
        ],
        [
          "STS-ACTIVE",
          "StatusActive",
          "SystemState"
        ],
        [
          "STS-IDLE",
          "StatusIdle",
          "SystemState"
        ],
        [
          "STS-FAULT",
          "StatusFault",
          "SystemState"
        ],
        [
          "STS-NORMAL",
          "StatusNormal",
          "SystemState"
        ]
      ]
    },
    {
      "name": "t_span_with_status",
      "rows": [
        [
          "SPN-001",
          "ActuatorGroup_A_Fire",
          "STS-ACTIVE"
        ],
        [
          "SPN-002",
          "ActuatorGroup_A_Comfort",
          "STS-IDLE"
        ],
        [
          "SPN-003",
          "Damper_Position_Check",
          "STS-FAULT"
        ],
        [
          "SPN-004",
          "Power_Unit_24V",
          "STS-ACTIVE"
        ],
        [
          "SPN-005",
          "Signal_Fire_Switch_1",
          "STS-NORMAL"
        ]
      ]
    },
    {
      "name": "t_measurement_equiv_with_dim_unit",
      "rows": [
        [
          "MEAS-001",
          "AirflowVelocity",
          "SPN-001",
          "CubicMetersPerHour"
        ],
        [
          "MEAS-002",
          "ElectricalCurrent",
          "SPN-001",
          "Ampere"
        ],
        [
          "MEAS-003",
          "AmbientTemperature",
          "SPN-002",
          "Celsius"
        ],
        [
          "MEAS-004",
          "ControlSignalVoltage",
          "SPN-004",
          "VoltDC"
        ],
        [
          "MEAS-005",
          "ActuatorPosition",
          "SPN-001",
          "PercentOpen"
        ]
      ]
    },
    {
      "name": "t_span_with_parent",
      "rows": [
        [
          "SPN-SUB-01",
          "Ignition_Safety_Check",
          "TRC-FV-01"
        ],
        [
          "SPN-SUB-02",
          "Main_Fan_Activation",
          "TRC-FV-01"
        ],
        [
          "SPN-SUB-03",
          "Smoke_Damper_Closure",
          "TRC-FV-01"
        ],
        [
          "SPN-SUB-04",
          "Pressure_Transducer_Read",
          "SPN-SUB-02"
        ],
        [
          "SPN-SUB-05",
          "Fan_Speed_Ramp_Up",
          "SPN-SUB-02"
        ]
      ]
    }
  ]
}
```