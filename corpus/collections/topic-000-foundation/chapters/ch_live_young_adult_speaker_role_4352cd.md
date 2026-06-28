---
chapter_id: ch_live_young_adult_speaker_role_4352cd
topic_id: 0
family: 08_derived
cited_terms: ['young_adult_speaker_role', 'outlier_detection_targets_dataset', 'mass_function_equiv_frame_and_assignment']
model: engine-refine
---

Within the mass function framework, each assignment of a measurement to a frame of discernment carries a structured set of attributes whose types are declared independently of their values. The attribute catalogue—identified by an internal key and a human-readable name—specifies the schema constraint through an attribute type drawn from the XML Schema namespace: decimal for numeric confidence scores, string for categorical descriptors such as dimension kind or encoding, and dateTime for temporal stamps. A recorded-at attribute, typed as xsd:dateTime, anchors the assignment to a precise moment—2025-06-10T14:56:29 for one corrosion-rate measurement, 2024-06-25T12:59:02 for an optical transmittance run—while a confidence attribute, typed as xsd:decimal, quantifies the degree of belief, holding values such as 0.002 for a fault-or-failure assignment over a terrain-type catalog and 0.018 for the same assignment over a temperature range. The separation of attribute definition from value storage permits heterogeneous value types to coexist without schema mutation: decimal values reside in a dedicated value table, string values in a varchar table, and datetime values in a datetime table, each linked back to the assignment entity and the attribute it populates.

**t_mass_function_equiv_frame_and_assignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-06-10T14:56:29 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-25T12:59:02 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2024-03-24T16:20:19 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-03-04T17:25:44 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2024-07-15T05:15:18 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-09-16T23:06:46 |

**t_mass_function_equiv_frame_and_assignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.002 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 724.48 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 469.73 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.018 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 449.10 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 350.09 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.405 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 839.88 |

**t_mass_function_equiv_frame_and_assignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | pre-release note |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | fr |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | manual |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | kg |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

The assignment entity itself is the pivot around which the mass function model rotates. Each entity carries a mass label—corrosion_rate_measurement, optical_transmittance_run, magnetic_offset_calibration, vibration_profile_test—that identifies the source measurement, a frame of discernment—terrain_type_catalog, temperature_range, geographic_zone_map—that defines the universe of mutually exclusive hypotheses, and a target classification—fault_or_failure, land_or_sea_only, degraded_state_only—that receives the belief mass. The entity identifier, such as ASSI-0001, serves as the foreign key through which attribute values are resolved: the same entity ASSI-0001 may accumulate a confidence of 0.002, a dimension kind labeled Dimension Kind 01, an encoding of Encoding 02, a pre-release note, and a locale tag fr, all retrievable through a single join on the entity key. This design mirrors the evidential reasoning paradigm in which a single piece of evidence is characterized by multiple facets—its strength, its provenance, its measurement context—each facet typed and stored according to its semantic nature.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | terrain_type_catalog | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | temperature_range | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | geographic_zone_map | degraded_state_only |
| ASSI-0004 | vibration_profile_test | temperature_range | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | terrain_type_catalog | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | material_phase_index | degraded_state_only |

**t_mass_function_equiv_frame_and_assignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

Outlier tracking operates as a parallel observability layer, recording the behavior of processes that deviate from expected execution profiles. The fact table for outliers captures the quantitative footprint of each anomalous run: a duration in seconds, an exit code signaling the nature of the termination, and a retry count reflecting how many times the system attempted recovery before the event was logged. A single outlier event, identified by the key DATA-0003, may appear across multiple fact rows if the system records both the initial failure and subsequent retry attempts, with durations ranging from 1182.39 seconds for a brief abort to 6466.78 seconds for a prolonged hang, exit codes spanning the range from 4 to 760, and retry counts climbing from 101 to 308. The dimension table for outliers provides the categorical context—each outlier receives a label such as Outlier Label 03 and a category such as Outlier Category 03—allowing analysts to aggregate anomalous behavior by type rather than by individual instance.

The identifier space unifies these disparate concerns. Every entity, every assignment, every outlier fact and dimension row carries a unique key—ROLE-0001 through ROLE-0004 for speaker roles, ASSI-0001 through ASSI-0004 for mass assignments, DATA-0001 through DATA-0004 for outlier records—that serves as the stable reference point across joins and aggregations. In the speaker-role domain, an identifier such as ROLE-0001 binds a young adult speaker role—Morales PolicyYouth—to a qualifying individual, Chloe Tan, and to the presentation topic she delivers, Ethical AI Governance. The same presentation topic appears across multiple roles and individuals—Lucas Fernandez and Elena Rossi also deliver on Ethical AI Governance—demonstrating that identifiers disambiguate instances while foreign keys express the many-to-one relationships that structure the data model.

**t_young_adult_speaker_role**

| id | young_adult_speaker_role | qualifying_individual | delivers_presentation |
| --- | --- | --- | --- |
| ROLE-0001 | Morales PolicyYouth | Chloe Tan | Ethical AI Governance |
| ROLE-0002 | Ruiz OpenEdLead | Lucas Fernandez | Ethical AI Governance |
| ROLE-0003 | Chen TEDx2023 | Elena Rossi | Open Source Licensing |
| ROLE-0004 | Tanaka YouthTech | Zara Okonkwo | Ethical AI Governance |
| ROLE-0005 | Tanaka YouthTech | Zara Okonkwo | Cloud Cost Optimization |
| ROLE-0006 | Patel AIWorkshop | Zara Okonkwo | Neuroplasticity Learning |

In practice, the framework's value lies in its ability to correlate evidential assignments with operational anomalies and human factors within a single queryable fabric. An analyst investigating why a vibration_profile_test (ASSI-0004) yields a degraded_state_only classification over a temperature_range frame can inspect the recorded_at timestamp, cross-reference the confidence decimal, and then pivot to outlier facts to determine whether the measurement was taken during a period of elevated retry activity or unusual exit codes. The attr and attr_type columns ensure that the attribute schema is self-describing, the category column in the outlier dimension enables roll-up by anomaly class, and the duration_seconds and retry_count columns in the fact table provide the temporal and operational metrics needed to distinguish transient glitches from systemic failures. Together, these elements form a coherent evidential model in which belief assignments, their attributes, the outliers that perturb them, and the individuals who produce them are all traceable to a common set of identifiers.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 3360.34 | 760 | 293 |
| DATA-0002 | DATA-0001 | 6466.78 | 4 | 225 |
| DATA-0003 | DATA-0002 | 5282.09 | 490 | 101 |
| DATA-0004 | DATA-0003 | 1182.39 | 124 | 308 |
| DATA-0005 | DATA-0002 | 3041.72 | 808 | 59 |
| DATA-0006 | DATA-0005 | 3852.38 | 619 | 489 |
| DATA-0007 | DATA-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DATA-0001 | Outlier Label 01 | Outlier Category 01 |
| DATA-0002 | Outlier Label 02 | Outlier Category 02 |
| DATA-0003 | Outlier Label 03 | Outlier Category 03 |
| DATA-0004 | Outlier Label 04 | Outlier Category 04 |
| DATA-0005 | Outlier Label 05 | Outlier Category 05 |
| DATA-0006 | Outlier Label 06 | Outlier Category 06 |