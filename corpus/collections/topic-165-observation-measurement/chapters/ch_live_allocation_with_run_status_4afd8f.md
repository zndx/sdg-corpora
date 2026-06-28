---
chapter_id: ch_live_allocation_with_run_status_4afd8f
topic_id: 165
family: 05_provo_lineage
cited_terms: ['allocation_with_run_status', 'mass_function_equiv_frame_and_assignment', 'belief_interval_for_claim']
model: engine-refine
---

The architecture of evidence-bearing data rests upon a disciplined separation between what is asserted and how it is asserted. At the foundation, each record carries an identifier—`STAT-0001` through `STAT-0004` for operational allocations, `ASSI-0001` through `ASSI-0004` for mass function assignments, `CLAI-0001` through `CLAI-0004` for belief intervals—that serves as the immutable anchor for all downstream references. These identifiers do not merely label; they enable the cross-referencing that gives the system its relational integrity. An allocation such as `kafka-consumer-group` or `gpu-cluster-alpha` is not self-describing; it gains meaning through its association with a run status like `succeeded-final` or `timeout-expired`, and through the role—`reviewer`, `observer`, or `contributor`—that mediates the relationship between subject and target. In the junction table linking allocations to run statuses, the same identifier `STAT-0001` appears both as the subject referencing allocation `STAT-0001` and as the target referencing run status `STAT-0005`, demonstrating how a single record can occupy multiple relational positions simultaneously.

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |

The attribute system provides the mechanism by which assignments acquire their evidential character. Each mass function assignment—whether it concerns `corrosion_rate_measurement` over a `terrain_type_catalog` assigning mass to `fault_or_failure`, or `optical_transmittance_run` over a `temperature_range` assigning mass to `land_or_sea_only`—is enriched through a set of typed attributes. The attribute catalogue itself is minimal: `confidence` typed as `xsd:decimal`, `dimension_kind` typed as `xsd:string`, `method` typed as `xsd:string`, and `recorded_at` typed as `xsd:dateTime`. This typed attribute schema is then materialized across three value tables, each specialized for a distinct data type. Decimal values such as `0.002` or `724.48` populate the decimal value table, string values such as `Dimension Kind 01` or `Encoding 02` populate the varchar table, and timestamped values such as `2025-06-10T14:56:29` or `2024-06-25T12:59:02` populate the datetime table. The entity column in each value table references the assignment identifier, while the attribute column references the attribute definition, creating a normalized entity-attribute-value structure that preserves type safety while allowing arbitrary attributes to be attached to any assignment.

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

Dimension kind operates as a categorical classifier that appears both as an attribute of assignments and as a direct column in belief interval records. In the belief interval table, dimension kinds such as `time`, `length`, `count`, and `mass` are paired with belief statements—`Network packet loss`, `CPU utilization rate`, `Checksum mismatch found`, `Pipeline latency elevated`—and with corresponding claims such as `Pipeline latency elevated` or `Sensor calibration drift`. The value column in this table holds numeric measurements like `547.06`, `866.46`, `659.49`, and `457.08`, which represent the quantitative grounding of each belief-claim pair. The dimension kind here functions as a semantic tag that constrains the interpretation of the value: a value of `866.46` under dimension kind `length` carries a different evidential weight than the same value under dimension kind `mass`. This dual appearance of dimension kind—as both an attribute type and a direct classification—reflects the layered nature of the model, where metadata about metadata is itself subject to the same structural rules as primary data.

The role column in the allocation-to-status junction table introduces a social or procedural dimension to what would otherwise be a purely technical mapping. When `STAT-0001` links allocation `STAT-0001` to run status `STAT-0006` with the role `reviewer`, the relationship is not merely that one thing is associated with another; it is that the association carries a specific function or authority. The same identifier `STAT-0001` can appear again with the role `contributor` linking a different allocation to a different status, demonstrating that roles are not properties of entities but properties of relationships. This distinction is critical for governance: audit trails, access controls, and provenance tracking all depend on the ability to distinguish who or what was responsible for a given association, not merely that an association exists.

Together, these constructs—identifiers, entities, attributes with typed values, dimension kinds, roles, and subject-target relationships—form a coherent framework for representing uncertain or partial evidence in a relational database. The mass function assignment table sits at the center, connecting specific measurements to frames of discernment and to the propositions they support. The attribute-value tables radiate outward, attaching metadata of various types to each assignment. The belief interval table provides a parallel structure for claims that carry their own dimension kinds and numeric values. The allocation tables, while structurally similar, serve a different domain—operational resource management—yet they employ the same relational primitives: identifiers that cross-reference, roles that qualify relationships, and values that ground abstract associations in concrete data.

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

**t_belief_interval_for_claim**

| id | belief | for_claim | dimension_kind | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Network packet loss | Pipeline latency elevated | time | 547.06 |
| CLAI-0002 | CPU utilization rate | Sensor calibration drift | length | 866.46 |
| CLAI-0003 | Checksum mismatch found | Cache hit ratio low | count | 659.49 |
| CLAI-0004 | Pipeline latency elevated | Cache hit ratio low | mass | 457.08 |