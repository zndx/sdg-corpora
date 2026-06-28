---
chapter_id: ch_live_mental_health_education_program_e63a84
topic_id: 27
family: 08_derived
cited_terms: ['mental_health_education_program', 'labrun_with_protocol', 'aggregation_over_time_window']
model: engine-refine
---

The governance of youth mental health programming and laboratory operations rests upon a unified identification and attribute framework that binds programmatic intent to measurable execution. Every initiative, whether a mental health education program or a laboratory run, receives a persistent identifier—PROG-0001 through PROG-0004 for programs, PROT-0001 through PROT-0004 for lab runs, and WIND-0001 through WIND-0004 for time-windowed aggregations—ensuring that each entity can be referenced unambiguously across the data model. The Youth Wellness Initiative, for instance, is tracked under PROG-0001, PROG-0002, and PROG-0004, each instance delivering a distinct educational presentation: a Coping Skills Session targeting Immigrant Adolescents, an Understanding Anxiety Workshop aimed at Foster Care Youths, and an Emotional Intelligence Talk directed at College Freshmen. Similarly, the Sources of Strength program (PROG-0003) deploys a Recognizing Depression Workshop within Athlete Communities. These identifiers anchor every downstream attribute and value, forming the primary key through which all observational data is organized and retrieved.

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |

**t_labrun_with_protocol**

| id | labrun | follows_protocol |
| --- | --- | --- |
| PROT-0001 | MassSpec_LC_MS | Microbiome_QIIME2_Pipe |
| PROT-0002 | Nanopore_FC_Nine | SingleCell_Gelbead10x |
| PROT-0003 | Nanopore_FC_Nine | MassSpec_QTOF_Cal |
| PROT-0004 | MassSpec_LC_MS | FlowCytometry_Panel7 |
| PROT-0005 | Microbiome_16S_Seq | Nanopore_Basecall_v2 |
| PROT-0006 | Proteomics_ICP_MS | PCR_ColdStart |

**t_labrun_with_protocol_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0003 | 497 |
| PROT-0002 | PROT-0001 | PROT-0007 | 434 |
| PROT-0003 | PROT-0002 | PROT-0003 | 538 |
| PROT-0004 | PROT-0002 | PROT-0007 | 309 |
| PROT-0005 | PROT-0003 | PROT-0003 | 513 |
| PROT-0006 | PROT-0003 | PROT-0007 | 375 |
| PROT-0007 | PROT-0004 | PROT-0003 | 355 |
| PROT-0008 | PROT-0004 | PROT-0007 | 171 |

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

Attributes and their associated types constitute the schema layer that describes what can be measured or recorded for any given entity. The attribute definition tables enumerate property names such as duration_seconds, end_time, exit_code, and host_name for laboratory runs, alongside confidence, dimension_kind, method, and recorded_at for time-window aggregations. Each attribute is paired with an attr type drawn from the XSD namespace—xsd:decimal for numeric quantities like 301.25 or 0.781, xsd:dateTime for temporal markers such as 2023-11-19T15:13:31, xsd:integer for discrete counts including 497 and 538, and xsd:string for categorical descriptors like node-b14 or Dimension Kind 01. This typed attribute registry ensures that every value stored in the system carries an explicit semantic contract, preventing type ambiguity and enabling automated validation at ingestion time.

The entity-attribute-value decomposition separates the definition of what is measured from the actual observations, distributing typed values across specialized storage tables. An entity_id—such as PROT-0001 or WIND-0001—links a concrete measurement back to its parent record, while an attr_id references the attribute definition that governs the value's semantics and type. Decimal values for duration_seconds cluster under attr_id PROT-0001 with magnitudes ranging from 301.25 to 6125.88, whereas datetime values for end_time reference attr_id WIND-0004 and span from 2023-03-02T05:31:47 through 2025-01-03T19:33:06. String-valued attributes like host_name and exit_code reside in the varchar value table, capturing operational states such as running and closeout alongside host identifiers like node-b14. This normalization pattern permits heterogeneous data types to coexist within a single logical model without schema migration, as new attributes can be registered and populated independently of existing ones.

**t_labrun_with_protocol_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROT-0001 | duration_seconds | xsd:decimal |
| PROT-0002 | end_time | xsd:dateTime |
| PROT-0003 | exit_code | xsd:integer |
| PROT-0004 | host_name | xsd:string |
| PROT-0005 | log_level | xsd:string |
| PROT-0006 | phase | xsd:string |
| PROT-0007 | retry_count | xsd:integer |
| PROT-0008 | scheduled_at | xsd:dateTime |

**t_labrun_with_protocol_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0002 | 2023-11-19T15:13:31 |
| PROT-0002 | PROT-0001 | PROT-0008 | 2023-04-19T03:43:36 |
| PROT-0003 | PROT-0001 | PROT-0009 | 2023-06-05T09:50:58 |
| PROT-0004 | PROT-0002 | PROT-0002 | 2023-12-21T19:08:32 |
| PROT-0005 | PROT-0002 | PROT-0008 | 2023-06-26T20:13:34 |
| PROT-0006 | PROT-0002 | PROT-0009 | 2023-11-18T07:40:33 |
| PROT-0007 | PROT-0003 | PROT-0002 | 2024-09-05T03:02:45 |
| PROT-0008 | PROT-0003 | PROT-0008 | 2024-06-07T02:35:38 |

**t_labrun_with_protocol_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0001 | 301.25 |
| PROT-0002 | PROT-0002 | PROT-0001 | 4042.33 |
| PROT-0003 | PROT-0003 | PROT-0001 | 6125.88 |
| PROT-0004 | PROT-0004 | PROT-0001 | 1565.69 |
| PROT-0005 | PROT-0005 | PROT-0001 | 1033.06 |
| PROT-0006 | PROT-0006 | PROT-0001 | 3134.56 |

**t_labrun_with_protocol_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0004 | node-b14 |
| PROT-0002 | PROT-0001 | PROT-0005 | Log Level 02 |
| PROT-0003 | PROT-0001 | PROT-0006 | closeout |
| PROT-0004 | PROT-0001 | PROT-0010 | running |
| PROT-0005 | PROT-0001 | PROT-0011 | Triggered By 05 |
| PROT-0006 | PROT-0002 | PROT-0004 | worker-07 |
| PROT-0007 | PROT-0002 | PROT-0005 | Log Level 07 |
| PROT-0008 | PROT-0002 | PROT-0006 | review |

Educational presentation and youth demographic fields operate as direct, denormalized columns within the mental health education program table, reflecting their role as categorical descriptors rather than measured quantities. The delivered_presentation column records the specific format of program delivery—an Understanding Anxiety Workshop or a Recognizing Depression Workshop—while targets_demographic captures the intended audience segment, from Immigrant Adolescents to Foster Care Youths to Athlete Communities and College Freshmen. These columns are not decomposed into the EAV pattern because they represent stable, enumerated categories that do not require the extensibility or type-safety guarantees afforded to laboratory and aggregation attributes. The distinction between denormalized categorical columns and normalized attribute-value pairs reflects a deliberate design choice: program metadata is fixed and well-understood, whereas operational telemetry demands the flexibility to accommodate evolving measurement schemas without structural disruption.