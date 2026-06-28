---
chapter_id: ch_live_evidence_independent_of_b2ab34
topic_id: 187
family: 07_long_tail
cited_terms: ['evidence_independent_of', 'measurement_with_op_artifact', 'crop_parasitism_impact']
model: engine-refine
---

Crop parasitism impact serves as the central nexus in a structured framework for tracking how parasitic organisms affect agricultural systems, linking biological threats to the cultivation practices and households that bear their consequences. Each impact record—designated by identifiers such as IMPA-0001 through IMPA-0004—encapsulates a distinct parasitism event, catalogued under labels like Crop Parasitism Impact 01 or Crop Parasitism Impact 02. These records do not exist in isolation; they propagate outward through two primary relational channels. The first channels connect impacts to rice cultivation systems, establishing which farming practices are affected—Affects Cultivation System 01 through 04—while the second channels identify the parasitic weeds responsible, with entries such as Parasitises Host 01 and Parasitises Host 02 documenting the biological agents at work.

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

**t_crop_parasitism_impact_affects_cultivation_system**

| id | affects_cultivation_system |
| --- | --- |
| IMPA-0001 | Affects Cultivation System 01 |
| IMPA-0002 | Affects Cultivation System 02 |
| IMPA-0003 | Affects Cultivation System 03 |
| IMPA-0004 | Affects Cultivation System 04 |
| IMPA-0005 | Affects Cultivation System 05 |
| IMPA-0006 | Affects Cultivation System 06 |
| IMPA-0007 | Affects Cultivation System 07 |
| IMPA-0008 | Affects Cultivation System 08 |

**t_crop_parasitism_impact__affects_cultivation_system**

| id | crop_id | affects_cultivation_system_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0006 | owner |
| IMPA-0002 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0003 | IMPA-0002 | IMPA-0002 | owner |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0005 | IMPA-0001 | IMPA-0001 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0007 | contributor |
| IMPA-0007 | IMPA-0002 | IMPA-0003 | observer |
| IMPA-0008 | IMPA-0002 | IMPA-0003 | reviewer |

**t_crop_parasitism_impact_parasitises_host**

| id | parasitises_host |
| --- | --- |
| IMPA-0001 | Parasitises Host 01 |
| IMPA-0002 | Parasitises Host 02 |
| IMPA-0003 | Parasitises Host 03 |
| IMPA-0004 | Parasitises Host 04 |
| IMPA-0005 | Parasitises Host 05 |
| IMPA-0006 | Parasitises Host 06 |
| IMPA-0007 | Parasitises Host 07 |

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

The relational layer between crop parasitism impacts and parasitic weeds is governed by role assignments and cardinality constraints that define the nature and scope of each interaction. An impact designated IMPA-0004 may parasitize host IMPA-0003 in a contributor capacity, whereas IMPA-0006 and IMPA-0005 assume observer and contributor roles respectively against hosts IMPA-0001 and IMPA-0004. Each of these relationships carries a cardinality note—Cardinality Note 01 through 04—that qualifies the multiplicity of the association, ensuring that downstream consumers of the data understand whether a parasitism relationship is singular, one-to-many, or many-to-many. This discipline of explicit cardinality prevents ambiguous interpretations when aggregating impact data across regions or seasons.

**t_crop_parasitism_impact__parasitises_host**

| id | crop_id | parasitises_host_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0004 | IMPA-0003 | contributor | Cardinality Note 01 |
| IMPA-0002 | IMPA-0006 | IMPA-0001 | observer | Cardinality Note 02 |
| IMPA-0003 | IMPA-0005 | IMPA-0004 | contributor | Cardinality Note 03 |
| IMPA-0004 | IMPA-0001 | IMPA-0007 | observer | Cardinality Note 04 |
| IMPA-0005 | IMPA-0001 | IMPA-0003 | reviewer | Cardinality Note 05 |
| IMPA-0006 | IMPA-0006 | IMPA-0002 | contributor | Cardinality Note 06 |
| IMPA-0007 | IMPA-0004 | IMPA-0005 | observer | Cardinality Note 07 |
| IMPA-0008 | IMPA-0004 | IMPA-0002 | reviewer | Cardinality Note 08 |

A parallel relational structure connects crop parasitism impacts to agricultural households, the human entities that experience the downstream consequences of parasitism. Here, the relationship metadata is enriched with a temporal dimension: the since field records when each impact began affecting a given household, with dates such as 2024-06-04, 2023-03-28, 2023-09-02, and 2023-10-26 anchoring the onset of each impact-household linkage. Roles in these relationships—observer, reviewer, owner—further distinguish whether a household passively experiences the impact, actively monitors it, or holds stewardship responsibility. The same cardinality note discipline applies, ensuring that the multiplicity of household-level impacts is unambiguously documented.

**t_crop_parasitism_impact__impacts_target**

| id | crop_id | impacts_target_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 01 | 2024-06-04 |
| IMPA-0002 | IMPA-0006 | IMPA-0004 | reviewer | Cardinality Note 02 | 2023-03-28 |
| IMPA-0003 | IMPA-0003 | IMPA-0002 | observer | Cardinality Note 03 | 2023-09-02 |
| IMPA-0004 | IMPA-0003 | IMPA-0002 | owner | Cardinality Note 04 | 2023-10-26 |
| IMPA-0005 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 05 | 2023-11-01 |
| IMPA-0006 | IMPA-0002 | IMPA-0001 | observer | Cardinality Note 06 | 2023-08-27 |
| IMPA-0007 | IMPA-0001 | IMPA-0005 | contributor | Cardinality Note 07 | 2025-05-05 |
| IMPA-0008 | IMPA-0003 | IMPA-0001 | contributor | Cardinality Note 08 | 2024-10-30 |

Supporting this impact-centric architecture is a provenance and measurement infrastructure that tracks the evidence underpinning each assessment. Independent evidence records—identified as INDE-0001 through INDE-0004—encompass diverse artifact types: clinical trial outcomes, compliance certification records, sensor calibration traces, and lab assay results. Each evidence item is associated with a dependency target such as a data warehouse, labeling schema, or measurement device, establishing the chain of custody for the data. The relationships between evidence items are themselves role-qualified, with contributor, reviewer, and observer roles distinguishing the function each evidence item plays relative to its dependencies.

**t_evidence_independent_of**

| id | evidence |
| --- | --- |
| INDE-0001 | clinical trial outcome |
| INDE-0002 | compliance certification record |
| INDE-0003 | sensor calibration trace |
| INDE-0004 | lab assay result |
| INDE-0005 | batch processing checksum |
| INDE-0006 | telemetry snapshot |
| INDE-0007 | compliance certification record |

**t_evidence_independent_of_evidence_independent_of**

| id | evidence_independent_of |
| --- | --- |
| INDE-0001 | data warehouse |
| INDE-0002 | labeling schema |
| INDE-0003 | measurement device |
| INDE-0004 | data warehouse |
| INDE-0005 | partition strategy |
| INDE-0006 | git repository |
| INDE-0007 | monitoring dashboard |
| INDE-0008 | labeling schema |

**t_evidence_independent_of__evidence_independent_of**

| id | evidence_id | evidence_independent_of_id | role |
| --- | --- | --- | --- |
| INDE-0001 | INDE-0005 | INDE-0008 | contributor |
| INDE-0002 | INDE-0003 | INDE-0008 | reviewer |
| INDE-0003 | INDE-0003 | INDE-0008 | observer |
| INDE-0004 | INDE-0002 | INDE-0005 | reviewer |
| INDE-0005 | INDE-0002 | INDE-0003 | observer |
| INDE-0006 | INDE-0006 | INDE-0001 | contributor |
| INDE-0007 | INDE-0001 | INDE-0005 | contributor |
| INDE-0008 | INDE-0002 | INDE-0005 | contributor |

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | INDE-0007 |
| ARTI-0002 | Seismic Calibration Unit | INDE-0005 |
| ARTI-0003 | Turbidity Index | INDE-0003 |
| ARTI-0004 | Seismic Calibration Unit | INDE-0004 |
| ARTI-0005 | pH Batch Alpha Assay | INDE-0007 |
| ARTI-0006 | Soil Moisture Profile | INDE-0003 |

**t_measurement_with_op_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

Measurement artifacts provide the physical instrumentation layer that generates or validates the evidence. Devices such as the Seismic Calibration Unit and Turbidity Index—identified as ARTI-0001 through ARTI-0004—are linked to evidence items through an about relationship, indicating which evidence each measurement instrument pertains to. Each artifact carries typed attributes: confidence scores stored as xsd:decimal values (0.340, 723.57, 106.04, 0.434), dimension classifications as xsd:string (Dimension Kind 01, Encoding 02), procedural methods (change rationale, fr), and timestamps as xsd:dateTime (2024-07-05T11:56:13, 2024-04-19T15:36:13, 2023-08-09T17:12:55, 2023-08-07T05:21:09). The separation of attribute definitions from their typed values—organized across decimal, datetime, and varchar value tables—enables type-safe querying while maintaining a clean schema for attribute metadata.

**t_measurement_with_op_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-07-05T11:56:13 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-04-19T15:36:13 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-08-09T17:12:55 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2023-08-07T05:21:09 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2024-01-27T15:32:18 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2024-09-24T04:37:52 |

**t_measurement_with_op_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.340 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 723.57 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 106.04 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.434 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 258.77 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 846.45 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.917 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 397.02 |

**t_measurement_with_op_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | change rationale |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | m/s |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |