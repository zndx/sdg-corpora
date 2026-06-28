---
chapter_id: ch_live_measurement_with_method_05910a
topic_id: 4
family: 02_observation_measurement
cited_terms: ['measurement_with_method', 'column_tag_at_confidence', 'measurement_basic']
model: engine-refine
---

Data quality in measurement systems hinges on the disciplined separation of what was measured, how it was measured, and how trustworthy the result is. At the core of this discipline are entities—distinct, identifiable records such as MEAS-0001 for an Air Quality Index reading or CONF-0001 for a confidence tag on the instrument_serial column. Each entity carries a set of attributes, and these attributes are typed to enforce schema integrity across heterogeneous value stores. An attribute like confidence is declared as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. This type discipline ensures that the decimal value 0.375 stored against entity CONF-0001's confidence attribute is not conflated with the string "Dimension Kind 01" stored against its dimension_kind attribute, or with the ISO 8601 timestamp 2024-04-09T22:04:24 stored against its recorded_at attribute. The same attribute taxonomy recurs across measurement domains: the Air Quality Index, Disk Throughput, and Water pH Level each carry confidence, dimension_kind, method, and recorded_at attributes, enabling uniform quality assessment regardless of the physical or computational phenomenon being observed.

**fact_measurement**

| id | via_method_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0003 | 0.496 | 306.26 | 353.34 |
| METH-0002 | METH-0002 | 0.945 | 279.24 | 660.64 |
| METH-0003 | METH-0005 | 0.506 | 120.70 | 878.99 |
| METH-0004 | METH-0005 | 0.307 | 364.07 | 64.10 |
| METH-0005 | METH-0001 | 0.923 | 642.96 | 897.70 |

**t_column_tag_at_confidence**

| id | column | tag_confidence |
| --- | --- | --- |
| CONF-0001 | instrument_serial | MEAS-0005 |
| CONF-0002 | audit_log_id | MEAS-0004 |
| CONF-0003 | calibration_date | MEAS-0007 |
| CONF-0004 | instrument_serial | MEAS-0007 |
| CONF-0005 | geospatial_ref | MEAS-0003 |
| CONF-0006 | sample_volume_ml | MEAS-0005 |

**t_column_tag_at_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

**t_column_tag_at_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2024-04-09T22:04:24 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2025-04-05T07:15:37 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-17T15:47:25 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2024-06-11T23:21:15 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-11-28T13:45:04 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-05-23T02:47:56 |

**t_column_tag_at_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.375 |
| CONF-0002 | CONF-0001 | CONF-0005 | 699.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 906.58 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.359 |
| CONF-0005 | CONF-0002 | CONF-0005 | 525.15 |
| CONF-0006 | CONF-0002 | CONF-0007 | 158.80 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.944 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.61 |

**t_measurement_basic**

| id | measurement |
| --- | --- |
| MEAS-0001 | Air Quality Index |
| MEAS-0002 | Disk Throughput |
| MEAS-0003 | Water pH Level |
| MEAS-0004 | Air Quality Index |
| MEAS-0005 | Network Latency |
| MEAS-0006 | Air Quality Index |
| MEAS-0007 | Disk Throughput |

**t_measurement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MEAS-0001 | confidence | xsd:decimal |
| MEAS-0002 | dimension_kind | xsd:string |
| MEAS-0003 | method | xsd:string |
| MEAS-0004 | recorded_at | xsd:dateTime |
| MEAS-0005 | uncertainty | xsd:decimal |
| MEAS-0006 | unit | xsd:string |
| MEAS-0007 | value | xsd:decimal |
| MEAS-0008 | encoding | xsd:string |

**t_measurement_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0004 | 2024-05-15T18:00:29 |
| MEAS-0002 | MEAS-0002 | MEAS-0004 | 2024-04-18T18:40:50 |
| MEAS-0003 | MEAS-0003 | MEAS-0004 | 2023-06-19T08:04:37 |
| MEAS-0004 | MEAS-0004 | MEAS-0004 | 2024-12-12T18:49:55 |
| MEAS-0005 | MEAS-0005 | MEAS-0004 | 2024-07-10T05:51:16 |
| MEAS-0006 | MEAS-0006 | MEAS-0004 | 2023-05-22T02:44:37 |
| MEAS-0007 | MEAS-0007 | MEAS-0004 | 2023-01-22T19:04:55 |

**t_measurement_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0001 | 0.231 |
| MEAS-0002 | MEAS-0001 | MEAS-0005 | 407.80 |
| MEAS-0003 | MEAS-0001 | MEAS-0007 | 947.91 |
| MEAS-0004 | MEAS-0002 | MEAS-0001 | 0.117 |
| MEAS-0005 | MEAS-0002 | MEAS-0005 | 521.52 |
| MEAS-0006 | MEAS-0002 | MEAS-0007 | 399.99 |
| MEAS-0007 | MEAS-0003 | MEAS-0001 | 0.530 |
| MEAS-0008 | MEAS-0003 | MEAS-0005 | 792.36 |

The confidence attribute quantifies the assessor's belief in the accuracy of a measurement or a column-level quality tag. In the fact_measurement table, confidence values range from 0.307 for record METH-0004 to 0.945 for METH-0002, reflecting a spectrum from low to high assurance. These are not binary flags but continuous scores that downstream governance processes can threshold, weight, or aggregate. Confidence is also tagged at the column level: the instrument_serial column receives tag MEAS-0005, the audit_log_id column receives MEAS-0004, and the calibration_date column receives MEAS-0007, each carrying its own confidence provenance. This dual placement—confidence on both individual measurements and on the columns that contain them—allows auditors to trace quality from the raw data element up through the derived measurement value.

Uncertainty provides the complementary, quantitative expression of measurement imprecision. Where confidence is a subjective probability, uncertainty is an absolute magnitude expressed in the same units as the measurement itself. Record METH-0001 carries a value of 353.34 with an uncertainty of 306.26, meaning the true value could plausibly fall anywhere within a range spanning nearly the full magnitude of the reading. By contrast, METH-0003 reports a value of 878.99 with an uncertainty of only 120.70, indicating a substantially tighter bound. The inverse relationship between confidence and uncertainty is not guaranteed—METH-0004 has the lowest confidence at 0.307 and the highest uncertainty at 364.07, while METH-0002 achieves the highest confidence at 0.945 with an uncertainty of 279.24—but the pair together gives a complete picture of measurement reliability that neither metric could convey alone.

The via_method dimension captures how each measurement was obtained, decomposing the method into a human-readable label and a categorical classification. The fact_measurement table references dim_via_method through the via_method_key foreign key, so that METH-0003 in the fact table resolves to the label "Via Method Label 03" and the category "Via Method Category 03" in the dimension table. This normalization prevents duplication of method metadata and enables filtering or aggregation by category—for instance, comparing all measurements obtained through "Via Method Category 01" regardless of their specific label. The method attribute itself, stored as an xsd:string on each measurement entity, records the procedural provenance alongside the numeric result, ensuring that reproducibility is preserved as a first-class property of the data.

**dim_via_method**

| id | via_method_label | via_method_category |
| --- | --- | --- |
| METH-0001 | Via Method Label 01 | Via Method Category 01 |
| METH-0002 | Via Method Label 02 | Via Method Category 02 |
| METH-0003 | Via Method Label 03 | Via Method Category 03 |
| METH-0004 | Via Method Label 04 | Via Method Category 04 |
| METH-0005 | Via Method Label 05 | Via Method Category 05 |
| METH-0006 | Via Method Label 06 | Via Method Category 06 |

The entity-attribute-value pattern used throughout this schema—where each entity is a composite of typed attributes stored in separate value tables by data type—serves a governance purpose: it decouples the definition of quality metadata from the measurement values themselves. The t_column_tag_at_confidence_val_decimal table holds decimal attributes like confidence and numeric measurements (0.375, 699.80, 906.58), while t_column_tag_at_confidence_val_varchar holds categorical attributes like dimension_kind ("Dimension Kind 01"), encoding ("Encoding 02"), summary type ("nightly summary"), and language ("fr"). The t_column_tag_at_confidence_val_datetime table stores temporal provenance (2024-04-09T22:04:24, 2025-04-05T07:15:37, 2023-12-17T15:47:25). This separation allows the system to evolve its attribute schema without restructuring value storage, and it ensures that every quality attribute—whether a confidence score, a method label, a recorded timestamp, or a dimension classification—is traceable to a specific entity and a specific attribute definition.

**t_column_tag_at_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | nightly summary |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | automated |
| CONF-0006 | CONF-0001 | CONF-0006 | kg |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

**t_measurement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0001 | MEAS-0002 | Dimension Kind 01 |
| MEAS-0002 | MEAS-0001 | MEAS-0008 | Encoding 02 |
| MEAS-0003 | MEAS-0001 | MEAS-0009 | calibration record |
| MEAS-0004 | MEAS-0001 | MEAS-0010 | es |
| MEAS-0005 | MEAS-0001 | MEAS-0003 | automated |
| MEAS-0006 | MEAS-0001 | MEAS-0006 | ms |
| MEAS-0007 | MEAS-0002 | MEAS-0002 | Dimension Kind 07 |
| MEAS-0008 | MEAS-0002 | MEAS-0008 | Encoding 08 |