---
chapter_id: ch_live_division_assignment_record_faaf7f
topic_id: 67
family: 08_derived
cited_terms: ['division_assignment_record', 'labrun_basic', 'observation_records_state']
model: engine-refine
---

The data model centres on a set of identifiers that serve as stable, system-wide keys for every entity, attribute, and assignment record. Division facts carry identifiers such as RECO-0001 through RECO-0004, laboratory runs are keyed LABR-0001 through LABR-0004, and observation records use STAT-0001 through STAT-0004. These identifiers are not human-readable labels; they are opaque handles that anchor every foreign-key relationship in the model. An identifier in a fact table—say RECO-0001 in fact_division—corresponds to a single row in the dimension tables, and the same identifier pattern recurs across value tables to tie typed attribute values back to their originating entity. The identifier column is the universal join key, and every query that traverses from a fact to a dimension, or from an entity to its attribute values, begins with this column.

**t_observation_records_state**

| id | observation | records |
| --- | --- | --- |
| STAT-0001 | Network latency spike | Event log manifest |
| STAT-0002 | Water quality anomaly | Event log manifest |
| STAT-0003 | Reactor pressure threshold | Sensor data packet |
| STAT-0004 | Reactor pressure threshold | Diagnostic trace file |
| STAT-0005 | Network latency spike | Observation index cache |
| STAT-0006 | pH deviation alert | Sensor data packet |

**t_observation_records_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | duration_seconds | xsd:decimal |
| STAT-0002 | end_time | xsd:dateTime |
| STAT-0003 | exit_code | xsd:integer |
| STAT-0004 | host_name | xsd:string |
| STAT-0005 | log_level | xsd:string |
| STAT-0006 | phase | xsd:string |
| STAT-0007 | retry_count | xsd:integer |
| STAT-0008 | scheduled_at | xsd:dateTime |

The assigns_athlete and assigns_division columns in fact_division are the principal foreign keys that bind the fact table to its two dimension tables, dim_assigns_athlete and dim_assigns_division. Each row in fact_division records a pairing of one athlete assignment with one division assignment; for example, the row with identifier RECO-0001 links assigns_athlete_key RECO-0001 to assigns_division_key RECO-0007, while RECO-0004 links assigns_athlete_key RECO-0007 to assigns_division_key RECO-0001. The dimension tables supply the human-readable and categorical metadata for these keys. dim_assigns_athlete stores assigns_athlete_label values such as Assigns Athlete Label 01 alongside assigns_athlete_category values like Assigns Athlete Category 01, and dim_assigns_division mirrors this structure with assigns_division_label and assigns_division_category columns. The foreign-key relationship is therefore one-to-many on each side: a single athlete category may appear in many division facts, and a single division category may be referenced across multiple fact rows.

**dim_assigns_athlete**

| id | assigns_athlete_label | assigns_athlete_category |
| --- | --- | --- |
| RECO-0001 | Assigns Athlete Label 01 | Assigns Athlete Category 01 |
| RECO-0002 | Assigns Athlete Label 02 | Assigns Athlete Category 02 |
| RECO-0003 | Assigns Athlete Label 03 | Assigns Athlete Category 03 |
| RECO-0004 | Assigns Athlete Label 04 | Assigns Athlete Category 04 |
| RECO-0005 | Assigns Athlete Label 05 | Assigns Athlete Category 05 |
| RECO-0006 | Assigns Athlete Label 06 | Assigns Athlete Category 06 |
| RECO-0007 | Assigns Athlete Label 07 | Assigns Athlete Category 07 |

**dim_assigns_division**

| id | assigns_division_label | assigns_division_category |
| --- | --- | --- |
| RECO-0001 | Assigns Division Label 01 | Assigns Division Category 01 |
| RECO-0002 | Assigns Division Label 02 | Assigns Division Category 02 |
| RECO-0003 | Assigns Division Label 03 | Assigns Division Category 03 |
| RECO-0004 | Assigns Division Label 04 | Assigns Division Category 04 |
| RECO-0005 | Assigns Division Label 05 | Assigns Division Category 05 |
| RECO-0006 | Assigns Division Label 06 | Assigns Division Category 06 |
| RECO-0007 | Assigns Division Label 07 | Assigns Division Category 07 |

Every attribute in the model is defined by a name and a type, and the type governs which value table holds the actual data. The attribute definition tables—t_labrun_basic_attr and t_observation_records_state_attr—each carry an attr_name column (for example, duration_seconds, end_time, exit_code, host_name) and an attr_type column that uses XSD vocabulary: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This type annotation is not decorative; it determines the schema of the corresponding value table. A decimal attribute such as duration_seconds is stored in the _val_decimal table, a datetime attribute in _val_datetime, an integer in _val_int, and a string in _val_varchar. The value tables are structurally identical—each carries an entity_id column that references the originating entity, an attr_id column that references the attribute definition, and a value column that holds the misc data—but they are partitioned by type so that queries can be routed to the correct store without type coercion.

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

**t_observation_records_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | 2023-08-02T17:44:58 |
| STAT-0002 | STAT-0001 | STAT-0008 | 2025-03-10T03:55:42 |
| STAT-0003 | STAT-0001 | STAT-0009 | 2024-08-16T12:27:34 |
| STAT-0004 | STAT-0002 | STAT-0002 | 2024-01-02T12:08:53 |
| STAT-0005 | STAT-0002 | STAT-0008 | 2024-04-22T02:15:44 |
| STAT-0006 | STAT-0002 | STAT-0009 | 2025-02-09T01:29:13 |
| STAT-0007 | STAT-0003 | STAT-0002 | 2023-02-01T11:57:40 |
| STAT-0008 | STAT-0003 | STAT-0008 | 2023-09-23T07:16:43 |

**t_observation_records_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 4243.13 |
| STAT-0002 | STAT-0002 | STAT-0001 | 4365.77 |
| STAT-0003 | STAT-0003 | STAT-0001 | 5274.11 |
| STAT-0004 | STAT-0004 | STAT-0001 | 1567.00 |
| STAT-0005 | STAT-0005 | STAT-0001 | 420.59 |
| STAT-0006 | STAT-0006 | STAT-0001 | 6894.95 |

**t_observation_records_state_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | 958 |
| STAT-0002 | STAT-0001 | STAT-0007 | 456 |
| STAT-0003 | STAT-0002 | STAT-0003 | 517 |
| STAT-0004 | STAT-0002 | STAT-0007 | 41 |
| STAT-0005 | STAT-0003 | STAT-0003 | 930 |
| STAT-0006 | STAT-0003 | STAT-0007 | 257 |
| STAT-0007 | STAT-0004 | STAT-0003 | 71 |
| STAT-0008 | STAT-0004 | STAT-0007 | 485 |

**t_observation_records_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | worker-07 |
| STAT-0002 | STAT-0001 | STAT-0005 | Log Level 02 |
| STAT-0003 | STAT-0001 | STAT-0006 | execution |
| STAT-0004 | STAT-0001 | STAT-0010 | pending |
| STAT-0005 | STAT-0001 | STAT-0011 | Triggered By 05 |
| STAT-0006 | STAT-0002 | STAT-0004 | node-a01 |
| STAT-0007 | STAT-0002 | STAT-0005 | Log Level 07 |
| STAT-0008 | STAT-0002 | STAT-0006 | closeout |

The entity column in every value table is the foreign key that ties a typed value back to its source entity. In t_labrun_basic_val_decimal, entity_id values such as LABR-0001 and LABR-0002 point to rows in t_labrun_basic, where the labrun column holds descriptive names like Microplate_Scan_9A, MassSpec_Triplicate, ELISA_Screen_4B, and PCR_Amplification. Similarly, in t_observation_records_state_val_decimal, entity_id values STAT-0001 through STAT-0004 reference t_observation_records_state, where the observation column carries free-text descriptions such as Network latency spike, Water quality anomaly, and Reactor pressure threshold. The entity column is therefore the bridge between the typed value store and the entity's descriptive metadata; it is the second half of the composite foreign key (entity_id, attr_id) that uniquely identifies each attribute value within the entity's scope.

Confidence and uncertainty are numeric columns in fact_division that quantify the reliability of each athlete-division pairing. Confidence values range from 0.083 to 0.806 across the sample rows, with RECO-0004 recording the lowest confidence at 0.083 and RECO-0002 the highest at 0.806. Uncertainty values, expressed in the same scale, range from 96.89 to 740.08, with RECO-0001 at 96.89 and RECO-0004 at 740.08. These two columns are complementary: a high confidence score corresponds to a low uncertainty score and vice versa. The value column in fact_division—holding misc numeric data such as 330.50, 254.97, 407.11, and 404.52—represents the measured or derived quantity associated with the pairing, while confidence and uncertainty provide the metadata needed to assess whether that quantity should be acted upon. In operational practice, a division fact with confidence 0.083 and uncertainty 740.08 would be flagged for review, whereas one with confidence 0.806 and uncertainty 738.86 would be treated as reliable despite the high absolute uncertainty, because the relative confidence is strong.

**fact_division**

| id | assigns_athlete_key | assigns_division_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0007 | 0.517 | 96.89 | 330.50 |
| RECO-0002 | RECO-0004 | RECO-0003 | 0.806 | 738.86 | 254.97 |
| RECO-0003 | RECO-0001 | RECO-0001 | 0.257 | 500.56 | 407.11 |
| RECO-0004 | RECO-0007 | RECO-0001 | 0.083 | 740.08 | 404.52 |
| RECO-0005 | RECO-0006 | RECO-0007 | 0.281 | 881.15 | 8.05 |
| RECO-0006 | RECO-0007 | RECO-0004 | 0.538 | 6.12 | 177.48 |
| RECO-0007 | RECO-0003 | RECO-0005 | 0.833 | 343.27 | 857.73 |