---
chapter_id: ch_live_column_version_subclass_2ed8f6
topic_id: 62
family: 07_long_tail
cited_terms: ['column_version_subclass', 'mass_function_equiv_frame_and_assignment', 'measurement_with_unit']
model: engine-refine
---

ISSN (E): 2277-7695 ISSN (P): 2349-8242 NAAS Rating: 5.23 TPI 2022; 11(12): 3056-3061 © 2022 TPI www.thepharmajournal.com Received: 07-10-2022 Accepted: 11-11-2022

Katkar Ankush Haribhau

Research Scholar, Department of Fruit Science, Pt. Kishori Lal Shukla College of Horticulture and Research Station, IGKV, Raipur Chhattisgarh, India

MS Paikra

Professor, Department of Fruit Science, Pt. Kishor...

In measurement and evidence management systems grounded in Dempster–Shafer theory, the integrity of belief assignment depends on a disciplined separation between the structural definition of attributes and the runtime values they carry. Each attribute is declared once with a name and an XML Schema datatype—`confidence` typed as `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`—and thereafter referenced by a stable identifier such as `VERS-0001` or `ASSI-0004`. This declarative layer ensures that every value stored downstream conforms to a known schema, preventing type drift across the heterogeneous value stores that hold datetime stamps like `2024-04-09T04:38:55`, decimal readings such as `0.648` and `428.43`, and free-text annotations including `Dimension Kind 01`, `pre-release note`, and `de`. The tripartite value storage—datetime, decimal, and varchar tables—mirrors the datatype discipline: each row carries an `entity_id` pointing to the subject entity, an `attr_id` resolving to the attribute definition, and a single `value` column whose interpretation is governed by the attribute's declared type.

The entities themselves are identified by scoped codes—`VERS-0001` through `VERS-0004` for column-version subclasses, `ASSI-0001` through `ASSI-0004` for mass-function assignments, and `UNIT-0001` through `UNIT-0004` for measurement-with-unit records—and each entity may accumulate multiple attributes across the three value tables. A single entity such as `VERS-0001` can simultaneously hold a decimal confidence of `0.648` (via `attr_id` `VERS-0001`), a string dimension kind of `Dimension Kind 01` (via `attr_id` `VERS-0002`), and a datetime recorded at `2024-04-09T04:38:55` (via `attr_id` `VERS-0004`), all without ambiguity because the `attr_id` disambiguates which attribute each value belongs to. This design permits arbitrary attribute cardinality per entity while keeping each value table homogeneous, which in turn enables efficient range queries on numeric or temporal attributes without scanning unrelated text values.

Mass-function assignments operate within this same attribute-value discipline but sit at a higher level of semantic abstraction. Each assignment—identified as `ASSI-0001` through `ASSI-0004`—represents a mass function defined over a frame of discernment (e.g., `VERS-0001`, `VERS-0005`, `VERS-0003`) and assigns belief mass to specific propositions such as `fault_or_failure`, `land_or_sea_only`, or `degraded_state_only`. The mass values themselves are stored as decimals: `0.002` for `ASSI-0001`, `724.48` for `ASSI-0002`, `469.73` for `ASSI-0003`, and `0.018` for `ASSI-0004`, with the magnitude reflecting the degree of belief committed to the assigned proposition within the given frame. The same attribute schema applies—`confidence`, `dimension_kind`, `method`, `recorded_at`—allowing provenance and metadata to travel with the mass assignment independent of the numerical belief value.

Measurement definitions and their units form a parallel identification layer, decoupled from the mass-function structure but interoperable through shared entity identifiers. A measurement such as `Blood pressure`, `Ozone concentration`, `Seismic magnitude`, or `Network latency` is declared in its own table and linked to one or more units—`milligrams per deciliter`, `Richter scale`, `milliseconds`, `beats per minute`—through a junction table that encodes a three-way relationship: the `subject` (measurement identifier), the `target` (unit identifier), and the `role` that the unit plays with respect to the measurement. Roles such as `owner`, `reviewer`, and `observer` distinguish between primary and secondary unit associations, enabling a single measurement to carry multiple unit references with different semantic weights. For instance, `UNIT-0004` (Network latency) links to `UNIT-0001` with role `owner`, while `UNIT-0002` (Ozone concentration) links to `UNIT-0002` with role `reviewer`, establishing a clear hierarchy of unit authority.

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |

The identifier namespace—`VERS-*` for column-version subclasses, `ASSI-*` for mass-function assignments, and `UNIT-*` for measurement-with-unit records—provides a consistent addressing scheme across all three conceptual domains. Foreign-key relationships bind the layers: attribute values reference both the entity and the attribute definition, mass-function assignments reference their frame of discernment and their assigned propositions, and measurement-unit junctions reference both the measurement and the unit. This cross-referential structure ensures that every value, whether a decimal belief mass of `0.648`, a datetime of `2025-06-10T14:56:29`, or a role designation of `reviewer`, is traceable to its defining attribute, its owning entity, and its position within the broader evidential or measurement graph.

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | ASSI-0005 |
| VERS-0002 | operator_code | ASSI-0002 |
| VERS-0003 | timestamp_utc | ASSI-0006 |
| VERS-0004 | humidity_pct | ASSI-0004 |
| VERS-0005 | sample_volume_ml | ASSI-0001 |
| VERS-0006 | ph_level | ASSI-0005 |

**t_column_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | VERS-0001 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | VERS-0005 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | VERS-0003 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | VERS-0001 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | VERS-0003 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | VERS-0003 | degraded_state_only |

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