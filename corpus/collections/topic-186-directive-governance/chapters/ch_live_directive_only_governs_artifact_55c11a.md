---
chapter_id: ch_live_directive_only_governs_artifact_55c11a
topic_id: 186
family: 07_long_tail
cited_terms: ['directive_only_governs_artifact', 'home_electricity_reduction_program', 'video_surveillance_activity']
model: engine-refine
---

Compliance frameworks require precise mapping between regulatory directives and the artifacts they govern, a relationship captured through a typed attribute system that supports granular policy enforcement. Directives such as the ISO 27001 Security Policy, SOC 2 Type II Standard, GDPR Compliance Mandate, and PCI DSS v4.0 Compliance each govern specific artifacts—Sensor Data Streams, Network Access Control Lists, and the Data Lake Metadata Catalog—while carrying structured metadata that defines their operational parameters. Attributes are typed to their semantic domain: effective dates like 2023-09-27 and 2025-04-15 establish temporal scope, boolean flags such as mandatory=true or mandatory=false signal enforceability, integer priorities like 5 and 959 enable ranking, and free-text values including "Encoding 01", "Enforcement 02", "nightly summary", and "en" provide contextual detail. This separation of attribute definitions from their typed values—date, boolean, integer, and varchar—allows the governance model to remain extensible without schema migration, supporting the kind of policy evolution that modern compliance programs demand.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | Sensor Data Streams |
| ARTI-0002 | SOC 2 Type II Standard | Network Access Control Lists |
| ARTI-0003 | GDPR Compliance Mandate | Data Lake Metadata Catalog |
| ARTI-0004 | PCI DSS v4.0 Compliance | Data Lake Metadata Catalog |
| ARTI-0005 | FISMA Moderate Baseline | Laboratory Reagent Inventory |
| ARTI-0006 | OWASP Top Ten Control | Access Control Matrices |
| ARTI-0007 | NIST Cybersecurity Framework | Sensor Data Streams |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

Residential energy programs operate through a parallel structure of program definitions, participant targeting, and metric tracking, each layer connected by role-based relationships. Reduction programs such as the EcoHome Initiative, SmartThermostat Rebate, PowerDown Project, and NetZero Home define the scope of intervention, while targeted participants—including MultiGen Home, Property Manager, and SingleParent Household—represent the human actors responsible for execution. The join between programs and participants is mediated by a role assignment table that distinguishes between contributor and reviewer responsibilities, ensuring accountability is explicit rather than implicit. A Property Manager, for instance, may serve as reviewer for one program engagement and contributor for another, reflecting the fluid nature of household-level energy management where different stakeholders assume different functions across initiatives.

**t_home_electricity_reduction_program**

| id | reduction_program |
| --- | --- |
| PROG-0001 | EcoHome Initiative |
| PROG-0002 | SmartThermostat Rebate |
| PROG-0003 | PowerDown Project |
| PROG-0004 | NetZero Home |
| PROG-0005 | DemandResponse Trial |
| PROG-0006 | SmartThermostat Rebate |

**t_home_electricity_reduction_program_targets_participant**

| id | targets_participant |
| --- | --- |
| PROG-0001 | MultiGen Home |
| PROG-0002 | Property Manager |
| PROG-0003 | SingleParent Household |
| PROG-0004 | Property Manager |
| PROG-0005 | Suburban Dweller |
| PROG-0006 | Large Family Unit |
| PROG-0007 | Urban Apartment |

**t_home_electricity_reduction_program__targets_participant**

| id | home_id | targets_participant_id | role |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0001 | PROG-0007 | contributor |
| PROG-0002 | PROG-0003 | PROG-0002 | contributor |
| PROG-0003 | PROG-0002 | PROG-0007 | reviewer |
| PROG-0004 | PROG-0001 | PROG-0003 | reviewer |
| PROG-0005 | PROG-0006 | PROG-0004 | contributor |
| PROG-0006 | PROG-0003 | PROG-0007 | observer |
| PROG-0007 | PROG-0001 | PROG-0002 | contributor |
| PROG-0008 | PROG-0004 | PROG-0004 | contributor |

**t_home_electricity_reduction_program_addresses_usage_metric**

| id | addresses_usage_metric |
| --- | --- |
| PROG-0001 | Seasonal Peak |
| PROG-0002 | Daily kWh Consumption |
| PROG-0003 | Base Load Baseline |
| PROG-0004 | Daily kWh Consumption |
| PROG-0005 | Base Load Baseline |
| PROG-0006 | Base Load Baseline |

Usage metrics form the measurement backbone of these reduction programs, with each program addressing specific consumption indicators such as Seasonal Peak, Daily kWh Consumption, and Base Load Baseline. The relationship between programs and metrics is similarly role-structured, with participants assigned as owner or observer depending on their engagement depth. Cardinality notes attached to these relationships—Cardinality Note 01 through Cardinality Note 04—encode multiplicity constraints that govern whether a program targets a single metric, a metric is shared across programs, or a participant's observational role carries specific reporting obligations. This dual-layer role and cardinality model ensures that both the governance of compliance directives and the operational management of energy reduction programs share a consistent relational vocabulary.

**t_home_electricity_reduction_program__addresses_usage_metric**

| id | home_id | addresses_usage_metric_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | PROG-0004 | reviewer | Cardinality Note 01 |
| PROG-0002 | PROG-0001 | PROG-0006 | owner | Cardinality Note 02 |
| PROG-0003 | PROG-0001 | PROG-0006 | observer | Cardinality Note 03 |
| PROG-0004 | PROG-0006 | PROG-0002 | observer | Cardinality Note 04 |
| PROG-0005 | PROG-0002 | PROG-0005 | contributor | Cardinality Note 05 |
| PROG-0006 | PROG-0005 | PROG-0005 | contributor | Cardinality Note 06 |
| PROG-0007 | PROG-0003 | PROG-0003 | observer | Cardinality Note 07 |
| PROG-0008 | PROG-0006 | PROG-0002 | contributor | Cardinality Note 08 |

Surveillance operations follow a comparable pattern of activity-to-environment-to-device mapping, where video surveillance activities like AdminOffice, EastWing_Patrol, Gymnasium, and ParkingLotA each monitor specific school environments such as the Courtyard, MainEntrance_Day, Gymnasium, and ParkingLot_Dusk_Rec. The devices employed—Fixed_Lens_Camera, IP_Overwatch_Node, Multi_Sensor_Array, and Thermal_Array_Sensor—represent a heterogeneous hardware ecosystem that the surveillance system must account for in its operational model. The temporal qualifier embedded in environment names like MainEntrance_Day and ParkingLot_Dusk_Rec suggests that surveillance activities are time-aware, with different device configurations and monitoring strategies deployed according to the time-of-day context. This mirrors the date-aware governance model used in compliance, where effective dates and temporal scope are first-class concerns rather than afterthoughts.

**t_video_surveillance_activity**

| id | video_surveillance_activity | monitors | employs_device |
| --- | --- | --- | --- |
| ACTI-0001 | AdminOffice | Courtyard | Fixed_Lens_Camera |
| ACTI-0002 | EastWing_Patrol | MainEntrance_Day | IP_Overwatch_Node |
| ACTI-0003 | Gymnasium | Gymnasium | Multi_Sensor_Array |
| ACTI-0004 | ParkingLotA | ParkingLot_Dusk_Rec | Thermal_Array_Sensor |
| ACTI-0005 | Lobby_Morning_Clip | Playground_Activity | PTZ_Network_Cam |
| ACTI-0006 | Hallway_B2_Feed | Cafeteria_Lunch | Dome_IR_Unit |