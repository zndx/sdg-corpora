---
chapter_id: ch_live_port_isolation_measurement_12193f
topic_id: 186
family: 08_derived
cited_terms: ['port_isolation_measurement', 'primary_key_designation', 'process_either_started_or_completed']
model: engine-refine
---

Port isolation measurements capture the electrical isolation characteristics between pairs of ports in RF and network hardware, serving as a critical quality and compliance checkpoint for signal integrity. Each measurement record identifies a specific test scenario—such as Antenna_1_and_2, Switch_Network_P6, Balun_Prim_Sec, or Coaxial_Outlet_B—and declares which port pair is under evaluation, whether RF_Switch_3_4, Coaxial_Outlet_B, Fiber_Port_M_N, or Switch_Network_P6. These measurements do not exist in isolation; they depend on impedance termination conditions, with each measurement referencing one of several termination configurations (Depends On Impedance Termination 01 through 04) that define the electrical load state during testing. This dependency ensures that isolation results are traceable to the exact termination setup, enabling reproducible validation and root-cause analysis when measurements fall outside specification.

The attribute system provides a flexible, type-safe mechanism for attaching metadata to any entity in the domain. Rather than hardcoding properties into each entity type, the schema separates attribute definitions from their values: an attribute is declared by name and type—such as encoding, label_text, or language, all of type xsd:string—or confidence and dimension_kind as xsd:decimal and xsd:string respectively, or duration_seconds, end_time, exit_code, and host_name with types xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This separation allows the same attribute vocabulary to be reused across different entity types, while the type declaration enforces data integrity at the definition level.

Entity-attribute-value associations are materialized through a typed value store that routes each attribute's value to the appropriate storage table based on its declared type. For string-valued attributes, values such as Encoding 01, nightly summary, en, or node-a01 are stored in the varchar value table; decimal values like 0.354, 612.82, or 317.84 reside in the decimal table; integer values including 522, 9, 153, and 96 are stored in the integer table; and timestamped values such as 2024-07-25T13:27:19, 2024-03-16T21:31:41, or 2023-06-18T02:34:37 are persisted in the datetime table. Each value row links back to its entity through an entity identifier—MEAS-0001 for a port isolation measurement, DESI-0001 for a primary key designation, or COMP-0001 for a process event—and to its attribute through an attribute identifier, creating a many-to-many relationship that supports multiple attributes per entity and shared attribute definitions across entities.

**t_port_isolation_measurement**

| id | port_isolation_measurement | measures_port_isolation | depends_on_impedance_termination |
| --- | --- | --- | --- |
| MEAS-0001 | Antenna_1_and_2 | RF_Switch_3_4 | Depends On Impedance Termination 01 |
| MEAS-0002 | Switch_Network_P6 | Coaxial_Outlet_B | Depends On Impedance Termination 02 |
| MEAS-0003 | Balun_Prim_Sec | Fiber_Port_M_N | Depends On Impedance Termination 03 |
| MEAS-0004 | Coaxial_Outlet_B | Switch_Network_P6 | Depends On Impedance Termination 04 |
| MEAS-0005 | SMA_Port_A4 | Microstrip_Line_C | Depends On Impedance Termination 05 |
| MEAS-0006 | Balun_Secondary | SMA_Port_A4 | Depends On Impedance Termination 06 |
| MEAS-0007 | Optical_Coupler_1 | PCB_Trace_X_Y | Depends On Impedance Termination 07 |
| MEAS-0008 | Filter_Input_2 | Antenna_1_and_2 | Depends On Impedance Termination 08 |

**t_port_isolation_measurement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | encoding | xsd:string |
| MEAS-0002 | label_text | xsd:string |
| MEAS-0003 | language | xsd:string |

**t_port_isolation_measurement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | Encoding 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0002 | nightly summary |
| MEAS-0003 | MEAS-0001 | MEAS-0003 | en |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | Encoding 04 |
| MEAS-0005 | MEAS-0002 | MEAS-0002 | pre-release note |
| MEAS-0006 | MEAS-0002 | MEAS-0003 | de |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | Encoding 07 |
| MEAS-0008 | MEAS-0003 | MEAS-0002 | nightly summary |

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | clinical_trial_cohort |
| DESI-0002 | lab_specimens | lab_specimens |
| DESI-0003 | manufacturing_batches | telemetry_id |
| DESI-0004 | asset_inventory | sensor_calibrations |
| DESI-0005 | network_traffic_db | hardware_sn |
| DESI-0006 | manufacturing_batches | manufacturing_batches |

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |

**t_process_either_started_or_completed**

| id | process | process_2 | process_3 |
| --- | --- | --- | --- |
| COMP-0001 | Microtome sectioning | Hash partitioning pass | Log rotation routine |
| COMP-0002 | Chromatography elution | Pressure equalization | Data retention purge |
| COMP-0003 | Reactor startup sequence | Hash partitioning pass | Data retention purge |
| COMP-0004 | Reactor startup sequence | Buffer exchange step | Baseline calibration sweep |
| COMP-0005 | ETL data ingestion | Cache invalidation sweep | Sample deidentification pass |
| COMP-0006 | PCR thermal cycle | Cache invalidation sweep | Sample deidentification pass |

**t_process_either_started_or_completed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMP-0001 | duration_seconds | xsd:decimal |
| COMP-0002 | end_time | xsd:dateTime |
| COMP-0003 | exit_code | xsd:integer |
| COMP-0004 | host_name | xsd:string |
| COMP-0005 | log_level | xsd:string |
| COMP-0006 | phase | xsd:string |
| COMP-0007 | retry_count | xsd:integer |
| COMP-0008 | scheduled_at | xsd:dateTime |

**t_process_either_started_or_completed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0002 | 2023-09-15T18:52:08 |
| COMP-0002 | COMP-0001 | COMP-0008 | 2024-08-13T16:34:41 |
| COMP-0003 | COMP-0001 | COMP-0009 | 2025-03-15T23:53:33 |
| COMP-0004 | COMP-0002 | COMP-0002 | 2025-06-15T09:08:30 |
| COMP-0005 | COMP-0002 | COMP-0008 | 2025-01-13T18:32:01 |
| COMP-0006 | COMP-0002 | COMP-0009 | 2023-05-31T03:15:32 |
| COMP-0007 | COMP-0003 | COMP-0002 | 2024-08-17T22:03:21 |
| COMP-0008 | COMP-0003 | COMP-0008 | 2023-03-17T02:37:48 |

**t_process_either_started_or_completed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0001 | 992.92 |
| COMP-0002 | COMP-0002 | COMP-0001 | 6910.53 |
| COMP-0003 | COMP-0003 | COMP-0001 | 4781.54 |
| COMP-0004 | COMP-0004 | COMP-0001 | 3156.19 |
| COMP-0005 | COMP-0005 | COMP-0001 | 593.89 |
| COMP-0006 | COMP-0006 | COMP-0001 | 5472.77 |

**t_process_either_started_or_completed_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0003 | 522 |
| COMP-0002 | COMP-0001 | COMP-0007 | 9 |
| COMP-0003 | COMP-0002 | COMP-0003 | 153 |
| COMP-0004 | COMP-0002 | COMP-0007 | 96 |
| COMP-0005 | COMP-0003 | COMP-0003 | 508 |
| COMP-0006 | COMP-0003 | COMP-0007 | 474 |
| COMP-0007 | COMP-0004 | COMP-0003 | 5 |
| COMP-0008 | COMP-0004 | COMP-0007 | 25 |

**t_process_either_started_or_completed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0004 | node-a01 |
| COMP-0002 | COMP-0001 | COMP-0005 | Log Level 02 |
| COMP-0003 | COMP-0001 | COMP-0006 | initiation |
| COMP-0004 | COMP-0001 | COMP-0010 | running |
| COMP-0005 | COMP-0001 | COMP-0011 | Triggered By 05 |
| COMP-0006 | COMP-0002 | COMP-0004 | ingest-21 |
| COMP-0007 | COMP-0002 | COMP-0005 | Log Level 07 |
| COMP-0008 | COMP-0002 | COMP-0006 | review |

Identifiers serve as the stable, human-readable keys that anchor every record across the system. Port isolation measurements use identifiers like MEAS-0001 through MEAS-0004; primary key designations use DESI-0001 through DESI-0004; and process lifecycle events use COMP-0001 through COMP-0004. These identifiers appear consistently as foreign keys in value rows, in dependency declarations, and in cross-entity references, forming the connective tissue of the data model. The prefix convention (MEAS, DESI, COMP) provides immediate semantic context about the entity type, while the numeric suffix ensures uniqueness within each namespace.

The domain extends beyond port isolation measurements to encompass primary key designations and process lifecycle tracking, each leveraging the same attribute-value infrastructure. Primary key designations describe identifiers such as hardware_sn, lab_specimens, manufacturing_batches, and asset_inventory, and declare which data sets they serve as primary keys for—clinical_trial_cohort, lab_specimens, telemetry_id, or sensor_calibrations. Process events track operational milestones like Microtome sectioning, Chromatography elution, and Reactor startup sequence, recording their state transitions through attributes such as duration_seconds (992.92, 6910.53, 4781.54, 3156.19), exit_code (522, 9, 153, 96), host_name (node-a01), and end_time (2023-09-15T18:52:08, 2024-08-13T16:34:41, 2025-03-15T23:53:33, 2025-06-15T09:08:30). This unified attribute system ensures that compliance-relevant metadata—whether it describes the encoding of a measurement label, the confidence of a key designation, or the execution context of a process step—follows a consistent, queryable, and type-enforced pattern throughout the data architecture.