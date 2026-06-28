---
chapter_id: ch_live_disjunctive_combination_453013
topic_id: 165
family: 07_long_tail
cited_terms: ['disjunctive_combination', 'mass_function_equiv_frame_and_assignment', 'profile_of_column']
model: engine-refine
---

Disjunctive combinations serve as the structural backbone for grouping mass function assignments under shared frames of discernment, each identified by a stable code such as COMB-0001 through COMB-0004. These combinations are classified by type—Schema_validation_union and OR_filter_rule being the two observed categories—and each one references one or more mass function assignments by their identifiers (ASSI-0001, ASSI-0005, ASSI-0006). The assignment table itself, t_mass_function_equiv_frame_and_assignment, records individual mass allocations with identifiers like ASSI-0001 through ASSI-0004, each carrying a mass descriptor (corrosion_rate_measurement, optical_transmittance_run, magnetic_offset_calibration, vibration_profile_test), a frame of discernment reference (COMB-0001, COMB-0003, COMB-0005), and a target subset (rain_or_snow_only, high_or_extreme_only, fault_or_failure). The foreign-key link from disjunctive_combination.disjunctively_combines to the assignment table's primary key establishes which assignments participate in which logical unions, while the over_frame_of_discernment column on the assignment table points back to the combination table, forming a bidirectional traceability chain between granular mass allocations and their higher-order groupings.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | ASSI-0006 |
| COMB-0002 | OR_filter_rule | ASSI-0005 |
| COMB-0003 | OR_filter_rule | ASSI-0001 |
| COMB-0004 | Schema_validation_union | ASSI-0005 |
| COMB-0005 | Metric_aggregation_branch | ASSI-0004 |
| COMB-0006 | Compliance_check_union | ASSI-0004 |

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | COMB-0001 | rain_or_snow_only |
| ASSI-0002 | optical_transmittance_run | COMB-0005 | high_or_extreme_only |
| ASSI-0003 | magnetic_offset_calibration | COMB-0003 | fault_or_failure |
| ASSI-0004 | vibration_profile_test | COMB-0001 | fault_or_failure |
| ASSI-0005 | pressure_deviation_check | COMB-0003 | primary_table |
| ASSI-0006 | vibration_profile_test | COMB-0003 | sensor_primary_signal |

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

Every assignment and combination carries a set of attributes—attr—that describe measurable or categorical properties of the entity. The attribute schema is uniform across both assignment and combination tables: attr_name takes values such as confidence, dimension_kind, method, and recorded_at, while attr_type constrains the data domain to xsd:decimal, xsd:string, or xsd:dateTime. This type discipline is enforced not within the attribute definition table itself but through a family of value tables partitioned by type. Decimal-valued attributes (confidence scores like 0.002, 0.018, 0.084, 0.409, and magnitude values such as 469.73, 689.68, 724.48) reside in the _val_decimal tables; string-valued attributes (dimension_kind values like "Dimension Kind 01", encoding identifiers like "Encoding 02", procedural notes like "calibration record" and "pre-release note", and locale codes such as "ja" and "fr") are stored in _val_varchar; and temporal attributes (recorded_at timestamps including 2023-09-21T03:35:03, 2023-12-19T10:56:22, 2024-03-24T16:20:19, 2024-06-25T12:59:02, 2025-01-18T01:14:05, 2025-03-04T17:25:44, 2025-06-10T14:56:29, 2025-06-13T05:31:45) are held in _val_datetime. Each value row carries an entity_id that references the parent assignment or combination identifier and an attr_id that references the attribute definition, ensuring that every datum is anchored to both its semantic property and its parent entity.

**t_disjunctive_combination_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0004 | 2023-12-19T10:56:22 |
| COMB-0002 | COMB-0002 | COMB-0004 | 2025-06-13T05:31:45 |
| COMB-0003 | COMB-0003 | COMB-0004 | 2023-09-21T03:35:03 |
| COMB-0004 | COMB-0004 | COMB-0004 | 2025-01-18T01:14:05 |
| COMB-0005 | COMB-0005 | COMB-0004 | 2023-04-13T14:48:56 |
| COMB-0006 | COMB-0006 | COMB-0004 | 2023-06-17T09:04:58 |

**t_disjunctive_combination_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0001 | 0.084 |
| COMB-0002 | COMB-0001 | COMB-0005 | 689.68 |
| COMB-0003 | COMB-0001 | COMB-0007 | 250.05 |
| COMB-0004 | COMB-0002 | COMB-0001 | 0.409 |
| COMB-0005 | COMB-0002 | COMB-0005 | 133.59 |
| COMB-0006 | COMB-0002 | COMB-0007 | 440.04 |
| COMB-0007 | COMB-0003 | COMB-0001 | 0.271 |
| COMB-0008 | COMB-0003 | COMB-0005 | 418.58 |

**t_disjunctive_combination_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0002 | Dimension Kind 01 |
| COMB-0002 | COMB-0001 | COMB-0008 | Encoding 02 |
| COMB-0003 | COMB-0001 | COMB-0009 | calibration record |
| COMB-0004 | COMB-0001 | COMB-0010 | ja |
| COMB-0005 | COMB-0001 | COMB-0003 | hybrid |
| COMB-0006 | COMB-0001 | COMB-0006 | count |
| COMB-0007 | COMB-0002 | COMB-0002 | Dimension Kind 07 |
| COMB-0008 | COMB-0002 | COMB-0008 | Encoding 08 |

The fact_profile table operates as the analytical grain of the model, recording measured or derived values alongside their epistemic quality. Each row is identified by a code such as COLU-0001 through COLU-0004 and carries a value (728.94, 380.57, 607.36, 448.09) that represents the substantive measurement or aggregation. The confidence column quantifies the degree of belief or reliability associated with that value, ranging from 0.226 to 0.994 in the observed data, while the uncertainty column provides a complementary scalar measure (284.36, 488.10, 557.92, 622.09) that captures the dispersion or imprecision surrounding the point estimate. These three numeric columns—value, confidence, and uncertainty—form the core evidentiary triad that downstream governance and risk analyses draw upon when assessing the trustworthiness of reported figures.

The about dimension decouples the semantic identity of what each fact_profile row describes from the fact itself. The dim_about table assigns each identifier (COLU-0001 through COLU-0004) an about_label (About Label 01 through About Label 04) and an about_category (About Category 01 through About Category 04), providing a human-readable and categorically organized glossary. The fact_profile table references this dimension through its about_key column, which points to the corresponding dim_about.id; for example, rows with about_key values of COLU-0002 and COLU-0001 and COLU-0006 link to their respective dimension entries, enabling consistent labeling and category-based filtering across the analytical layer. This separation of concerns—keeping factual measurements and their epistemic metadata in fact_profile while reserving semantic descriptors in dim_about—supports both data integrity and flexible reporting.

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| COLU-0001 | About Label 01 | About Category 01 |
| COLU-0002 | About Label 02 | About Category 02 |
| COLU-0003 | About Label 03 | About Category 03 |
| COLU-0004 | About Label 04 | About Category 04 |
| COLU-0005 | About Label 05 | About Category 05 |
| COLU-0006 | About Label 06 | About Category 06 |

The identifier namespace spans three distinct entity families: COMB- prefixed codes for disjunctive combinations, ASSI- prefixed codes for mass function assignments, and COLU- prefixed codes for profile facts and their about dimension entries. This partitioning prevents key collisions and makes the provenance of each datum immediately legible. Within each family, the identifiers serve as the primary keys that bind together the attribute definitions, the type-partitioned value tables, and the cross-referencing foreign keys that express the logical relationships between assignments, combinations, and facts. The result is a schema in which every numeric measurement, every categorical annotation, and every temporal stamp is traceable to its parent entity, its attribute definition, and its semantic category—a structure designed to support auditability, reproducibility, and rigorous uncertainty-aware reasoning across the full data lifecycle.

**t_disjunctive_combination_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMB-0001 | confidence | xsd:decimal |
| COMB-0002 | dimension_kind | xsd:string |
| COMB-0003 | method | xsd:string |
| COMB-0004 | recorded_at | xsd:dateTime |
| COMB-0005 | uncertainty | xsd:decimal |
| COMB-0006 | unit | xsd:string |
| COMB-0007 | value | xsd:decimal |
| COMB-0008 | encoding | xsd:string |

**fact_profile**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0002 | 0.299 | 284.36 | 728.94 |
| COLU-0002 | COLU-0002 | 0.994 | 557.92 | 380.57 |
| COLU-0003 | COLU-0001 | 0.773 | 622.09 | 607.36 |
| COLU-0004 | COLU-0006 | 0.226 | 488.10 | 448.09 |