---
chapter_id: ch_live_evidence_with_mass_function_616d19
topic_id: 67
family: 06_belief_structure
cited_terms: ['evidence_with_mass_function', 'annotation_classifies_class', 'labrun_basic']
model: engine-refine
---

Evidence in analytical workflows is first captured as a dimensional observation, each record carrying an identifier such as FUNC-0001 through FUNC-0004, a description of the underlying data—provenance trace log, calibration certificate, telemetry dump, signal capture data—the mathematical form of its mass function, whether a Gaussian distribution, a calibration curve, or a normalized weight vector, the physical dimension it pertains to, pressure, temperature, or mass, and the method by which it was derived, automated, inferred, or hybrid. This four-part schema anchors every piece of evidence to a reproducible provenance chain, ensuring that downstream classification and uncertainty quantification rest on traceable foundations rather than opaque assumptions.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |

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

Classification of evidence proceeds through a separate annotation layer, where each fact_annotation record carries its own identifier (CLAS-0001 through CLAS-0004), a reference to the entity it classifies, a confidence score ranging from 0.236 to 0.845, an uncertainty magnitude between 22.02 and 690.59, and a miscellaneous value—979.94, 370.63, 360.27, 284.47—that captures auxiliary metadata. The confidence and uncertainty fields operate as complementary measures: a high confidence of 0.845 paired with an uncertainty of 690.59 signals a strong categorical assignment whose absolute deviation remains large, whereas a confidence of 0.236 alongside an uncertainty of 593.98 indicates a weak classification burdened by substantial imprecision. These annotations are themselves categorized through a label-to-category mapping, where Classifies Label 01 resolves to Classifies Category 01, Classifies Label 02 to Classifies Category 02, and so forth, providing a two-level taxonomy that separates granular descriptors from broader groupings.

**fact_annotation**

| id | classifies_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 0.845 | 690.59 | 979.94 |
| CLAS-0002 | CLAS-0006 | 0.236 | 593.98 | 370.63 |
| CLAS-0003 | CLAS-0001 | 0.271 | 104.01 | 360.27 |
| CLAS-0004 | CLAS-0002 | 0.303 | 22.02 | 284.47 |
| CLAS-0005 | CLAS-0005 | 0.002 | 328.54 | 25.47 |

**dim_classifies**

| id | classifies_label | classifies_category |
| --- | --- | --- |
| CLAS-0001 | Classifies Label 01 | Classifies Category 01 |
| CLAS-0002 | Classifies Label 02 | Classifies Category 02 |
| CLAS-0003 | Classifies Label 03 | Classifies Category 03 |
| CLAS-0004 | Classifies Label 04 | Classifies Category 04 |
| CLAS-0005 | Classifies Label 05 | Classifies Category 05 |
| CLAS-0006 | Classifies Label 06 | Classifies Category 06 |

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

Laboratory runs constitute the operational entities to which all attributes and values are bound. Each run is identified by a code such as LABR-0001 through LABR-0004 and named for its protocol—Microplate_Scan_9A, MassSpec_Triplicate, ELISA_Screen_4B, PCR_Amplification. Attributes are defined independently in a schema table, where attr_name specifies the property (duration_seconds, end_time, exit_code, host_name) and attr_type declares its XSD type (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string). This separation of attribute definition from attribute value enables schema evolution without retroactive modification of historical records.

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

Values are stored in four type-specific tables, each linking an entity_id and attr_id to a typed value. Decimal attributes such as duration_seconds hold measurements like 1438.98, 6523.97, 7176.32, 6375.34; integer attributes such as exit_code carry codes like 918, 57, 674, 220; datetime attributes such as end_time record timestamps including 2025-01-01T00:58:28, 2023-02-28T02:17:46, 2024-11-14T14:13:50, 2025-05-09T16:03:58; and varchar attributes such as host_name store strings like edge-03 alongside categorical descriptors such as Log Level 02, execution, complete. The entity_id and attr_id columns in each value table form foreign-key relationships to the lab run and attribute definitions, respectively, ensuring referential integrity across the typed value stores.

The interplay between these structures supports a complete audit trail: a lab run (LABR-0001, Microplate_Scan_9A) has a duration of 1438.98 seconds, an end time of 2025-01-01T00:58:28, an exit code of 918, and a host of edge-03; its associated evidence (FUNC-0001, provenance trace log) is classified with confidence 0.845 and uncertainty 690.59 under Classifies Category 01; the evidence itself is a pressure dimension captured by an automated method with a Gaussian mass function. Every field, from the XSD type of an attribute to the normalized weight vector of a mass function, participates in a coherent framework where provenance, classification, and uncertainty are simultaneously recorded and mutually queryable.