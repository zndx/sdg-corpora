---
chapter_id: ch_live_national_dataset_augmentation_process_6f99f5
topic_id: 46
family: 08_derived
cited_terms: ['national_dataset_augmentation_process', 'state_observed_at_time', 'tc_classifier_subclass']
model: engine-refine
---

National dataset augmentation processes form the backbone of geospatial data lineage, capturing how disparate sources are systematically merged into unified reference products. Each augmentation process—identified by codes such as PROC-0001 through PROC-0004—encapsulates a specific integration workflow, whether that is the DGIWGBase standard, the NRCANMap pipeline, a TerrainDataMerge routine, or an EuroStatSync operation. These processes are defined by two critical relationships: the observation source they incorporate and the existing dataset they augment. For instance, a process may pull from CopernicusLand or CMEMSDataCube as its observation source while simultaneously enhancing a foundational layer like SentinelCoreLoad or GADMAdminLevels. This dual-reference structure ensures that every augmentation is traceable to both its observational provenance and the baseline it modifies, enabling auditable data lineage across the entire geospatial stack.

**t_national_dataset_augmentation_process**

| id | national_dataset_augmentation_process | incorporates_observation_source | augments_existing_dataset |
| --- | --- | --- | --- |
| PROC-0001 | DGIWGBase | CopernicusLand | SentinelCoreLoad |
| PROC-0002 | NRCANMap | CMEMSDataCube | GADMAdminLevels |
| PROC-0003 | TerrainDataMerge | GLO30Coverage | CensusMapAlign |
| PROC-0004 | EuroStatSync | CopernicusCrisis | LandCoverSync |
| PROC-0005 | CensusMapAlign | CMEMSDataCube | CensusMapAlign |
| PROC-0006 | DGIWGBase | CopernicusCrisis | GADMAdminLevels |
| PROC-0007 | LandCoverSync | CAMSReanalysis | GADMv32 |

Temporal observations are captured through a state-at-time model that records the condition of entities at precise moments. Each observation is timestamped with ISO 8601 precision—values such as 2024-03-16T07:00:05Z or 2024-03-17T09:33:40Z anchor the record to an exact point in time, while the state field encodes the entity's operational condition at that moment, taking values like offline, calibrated, or idle. This model supports time-series analysis of system health, sensor readiness, or data availability, allowing operators to reconstruct the sequence of state transitions and identify periods of degradation or maintenance. The temporal granularity enables correlation with external events, such as software deployments or environmental conditions, that may have triggered state changes.

**t_state_observed_at_time**

| id | state | observed_at |
| --- | --- | --- |
| TIME-0001 | offline | 2024-03-16T07:00:05Z |
| TIME-0002 | calibrated | 2024-03-17T09:33:40Z |
| TIME-0003 | idle | 2024-03-18T08:05:19Z |
| TIME-0004 | calibrated | 2024-03-16T11:22:30Z |
| TIME-0005 | idle | 2024-03-17T13:50:02Z |
| TIME-0006 | draining | 2024-03-15T10:45:11Z |
| TIME-0007 | idle | 2024-03-16T07:00:05Z |
| TIME-0008 | locked | 2024-03-15T08:30:00Z |

The attribute system extends each temporal observation with structured metadata through an entity-attribute-value (EAV) pattern that separates attribute definitions from their concrete values. Attribute definitions—such as confidence, dimension_kind, method, and recorded_at—are typed using XML Schema datatypes including xsd:decimal, xsd:string, and xsd:dateTime, ensuring type safety across the system. Values are stored in dedicated tables keyed by datatype: decimal values like 0.673 or 138.13 reside in the decimal store, string values such as Dimension Kind 01 or Encoding 02 in the varchar store, and datetime values like 2023-08-28T00:49:09 in the datetime store. Each value record links back to its parent observation through the entity foreign key and to its attribute definition through the attr foreign key, creating a flexible schema that accommodates evolving metadata requirements without table modifications.

**t_state_observed_at_time_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIME-0001 | confidence | xsd:decimal |
| TIME-0002 | dimension_kind | xsd:string |
| TIME-0003 | method | xsd:string |
| TIME-0004 | recorded_at | xsd:dateTime |
| TIME-0005 | uncertainty | xsd:decimal |
| TIME-0006 | unit | xsd:string |
| TIME-0007 | value | xsd:decimal |
| TIME-0008 | encoding | xsd:string |

**t_state_observed_at_time_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0004 | 2023-08-28T00:49:09 |
| TIME-0002 | TIME-0002 | TIME-0004 | 2023-01-12T06:19:16 |
| TIME-0003 | TIME-0003 | TIME-0004 | 2023-12-07T18:51:38 |
| TIME-0004 | TIME-0004 | TIME-0004 | 2024-05-06T22:48:11 |
| TIME-0005 | TIME-0005 | TIME-0004 | 2023-11-07T19:04:18 |
| TIME-0006 | TIME-0006 | TIME-0004 | 2024-03-08T08:57:30 |
| TIME-0007 | TIME-0007 | TIME-0004 | 2023-04-13T11:54:48 |
| TIME-0008 | TIME-0008 | TIME-0004 | 2024-08-24T14:36:17 |

**t_state_observed_at_time_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0001 | 0.673 |
| TIME-0002 | TIME-0001 | TIME-0005 | 138.13 |
| TIME-0003 | TIME-0001 | TIME-0007 | 126.00 |
| TIME-0004 | TIME-0002 | TIME-0001 | 0.137 |
| TIME-0005 | TIME-0002 | TIME-0005 | 428.04 |
| TIME-0006 | TIME-0002 | TIME-0007 | 24.81 |
| TIME-0007 | TIME-0003 | TIME-0001 | 0.753 |
| TIME-0008 | TIME-0003 | TIME-0005 | 875.90 |

**t_state_observed_at_time_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0002 | Dimension Kind 01 |
| TIME-0002 | TIME-0001 | TIME-0008 | Encoding 02 |
| TIME-0003 | TIME-0001 | TIME-0009 | nightly summary |
| TIME-0004 | TIME-0001 | TIME-0010 | fr |
| TIME-0005 | TIME-0001 | TIME-0003 | automated |
| TIME-0006 | TIME-0001 | TIME-0006 | ms |
| TIME-0007 | TIME-0002 | TIME-0002 | Dimension Kind 07 |
| TIME-0008 | TIME-0002 | TIME-0008 | Encoding 08 |

Classification facts are organized around a dimensional model that separates classifier measurements from their categorical metadata. The classifier fact table records quantitative properties of each classifier instance, including file size in bytes—values ranging from approximately 623 million to 883 million bytes—and version numbers spanning from 1 to 9. Each classifier is associated with a direction through the t_c_direction_key foreign key, which references a dimension table containing directional labels and categories. This separation of fact and dimension follows star-schema principles, enabling efficient aggregation of classifier sizes by direction category and supporting trend analysis across version numbers. The directional categorization provides a semantic layer that groups classifiers by their operational orientation, facilitating targeted analysis of classifier performance or resource consumption within specific directional contexts.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |