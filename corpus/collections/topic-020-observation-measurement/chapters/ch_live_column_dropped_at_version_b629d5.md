---
chapter_id: ch_live_column_dropped_at_version_b629d5
topic_id: 20
family: 07_long_tail
cited_terms: ['column_dropped_at_version', 'schemaorg_product_brand', 'port_isolation_measurement']
model: engine-refine
---

Port isolation measurements form the operational core of signal integrity verification, capturing how well isolated pairs of ports maintain electromagnetic separation under test. Each measurement record identifies a specific test configuration—such as Antenna_1_and_2, Switch_Network_P6, or Balun_Prim_Sec—and records which port pair is being evaluated, whether that be RF_Switch_3_4, Coaxial_Outlet_B, or Fiber_Port_M_N. These measurements do not exist in isolation; they depend on impedance termination conditions, which serve as prerequisite circuit states that must be established before a valid reading can be taken. The relationship between a measurement and its associated impedance termination ensures traceability: every reported isolation value can be audited back to the exact termination configuration that produced it, a requirement for compliance documentation in regulated RF environments.

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

To support rich metadata around each measurement, the system employs an entity-attribute-value pattern where attributes are first declared with a name and a type, then populated with values against specific measurement entities. An attribute such as encoding or language_text carries a type constraint like xsd:string, ensuring that the values assigned—Encoding 01, nightly summary, or en—conform to the expected schema. This design allows arbitrary descriptive metadata to be attached to measurements without altering the underlying table structure, enabling flexible documentation of test conditions, procedural notes, or localization information while maintaining type safety through the attribute type declarations.

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

Brand and schema version dimensions provide organizational context for the data, each structured as a fact table linked to a corresponding dimension. Schemaorg facts reference a brand through a foreign key, connecting records identified as BRAN-0001 through BRAN-0004 to their respective brand labels and categories. The brand dimension itself stores human-readable labels such as Brand Label 01 alongside categorical groupings like Brand Category 01, enabling filtering and aggregation by product line or manufacturer. Similarly, schema facts carry a version number and a size in bytes—values ranging from 114,301,972 bytes for version 5 to 998,785,819 bytes for version 8—allowing the system to track the evolution and footprint of schema definitions over time.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |

Column-level facts introduce a quality and lifecycle dimension through confidence scores and schema version drop tracking. Each column fact carries a confidence value, which in the observed data ranges from 0.068 to 0.354, reflecting the reliability or certainty associated with the measurement or metadata stored in that column. An uncertainty metric, with values such as 560.21 or 744.10, quantifies the margin of error around the stored misc value—whether that be 257.80 or 140.18. Furthermore, each column fact is linked to a dropped-at-schema-version record, which categorizes when a column was deprecated; for instance, a column identified as VERS-0001 may have been dropped at schema version VERS-0006, while VERS-0004 was dropped earlier at VERS-0001. This lifecycle tracking, combined with the label and category metadata in the schema version dimension, provides a complete audit trail of which columns were active at any given schema revision and how their data quality was assessed.

**fact_column**

| id | dropped_at_schema_version_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| VERS-0001 | VERS-0006 | 0.164 | 560.21 | 257.80 |
| VERS-0002 | VERS-0004 | 0.068 | 744.10 | 571.55 |
| VERS-0003 | VERS-0006 | 0.107 | 984.09 | 140.18 |
| VERS-0004 | VERS-0001 | 0.354 | 404.01 | 131.27 |
| VERS-0005 | VERS-0005 | 0.790 | 109.97 | 235.19 |
| VERS-0006 | VERS-0001 | 0.934 | 653.09 | 813.74 |
| VERS-0007 | VERS-0006 | 0.938 | 827.04 | 409.13 |
| VERS-0008 | VERS-0001 | 0.734 | 419.22 | 492.32 |

**dim_dropped_at_schema_version**

| id | dropped_at_schema_version_label | dropped_at_schema_version_category |
| --- | --- | --- |
| VERS-0001 | Dropped At Schema Version Label 01 | Dropped At Schema Version Category 01 |
| VERS-0002 | Dropped At Schema Version Label 02 | Dropped At Schema Version Category 02 |
| VERS-0003 | Dropped At Schema Version Label 03 | Dropped At Schema Version Category 03 |
| VERS-0004 | Dropped At Schema Version Label 04 | Dropped At Schema Version Category 04 |
| VERS-0005 | Dropped At Schema Version Label 05 | Dropped At Schema Version Category 05 |
| VERS-0006 | Dropped At Schema Version Label 06 | Dropped At Schema Version Category 06 |