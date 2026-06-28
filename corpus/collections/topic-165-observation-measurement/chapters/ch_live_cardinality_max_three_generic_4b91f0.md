---
chapter_id: ch_live_cardinality_max_three_generic_4b91f0
topic_id: 165
family: 01_foundation
cited_terms: ['cardinality_max_three_generic', 'equiv_union_basic', 'mass_function_equiv_frame_and_assignment']
model: engine-refine
---

Within the mass function equivalence framework, identifiers serve as the immutable anchors that bind attributes, entities, and their assigned values into a coherent evidential structure. Each identifier follows a domain-specific prefix convention: GENE- prefixed codes such as GENE-0001 through GENE-0004 designate cardinality constraints—capped-pair, bounded-triplet, single-bound, and max-three—while ASSI- prefixed codes from ASSI-0001 through ASSI-0004 identify individual mass function assignments, and UNIO- prefixed codes from UNIO-0001 through UNIO-0004 enumerate equivalence unions. The cardinality table links each GENE entity to a related ASSI entity; for instance, GENE-0001 (capped-pair) references ASSI-0006, whereas GENE-0003 (single-bound) also references ASSI-0006, establishing that multiple cardinality constraints may converge on the same assignment entity. The equivalence union table similarly cross-references three distinct entities per union: UNIO-0001 binds telemetry_hub_alpha, schema_v3_prod, and governance_log_f into a single equivalence class, while UNIO-0002 couples metric_bundle_plus with warehouse_db_staging and metric_aggregate_g, reflecting the multi-source provenance that mass function theory requires for frame-of-discernment construction.

**t_cardinality_max_three_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | capped-pair | ASSI-0006 |
| GENE-0002 | bounded-triplet | ASSI-0001 |
| GENE-0003 | single-bound | ASSI-0006 |
| GENE-0004 | max-three | ASSI-0004 |
| GENE-0005 | limited-association | ASSI-0004 |
| GENE-0006 | triple-cap | ASSI-0001 |
| GENE-0007 | fixed-triple | ASSI-0006 |
| GENE-0008 | capped-pair | ASSI-0003 |

**t_equiv_union_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| UNIO-0001 | telemetry_hub_alpha | schema_v3_prod | governance_log_f |
| UNIO-0002 | metric_bundle_plus | warehouse_db_staging | metric_aggregate_g |
| UNIO-0003 | ingest_pipeline_main | probe_array_thirteen | repository_db_j |
| UNIO-0004 | sensor_array_beta | compliance_log_sixteen | edge_node_h |
| UNIO-0005 | batch_run_four | staging_run_twelve | governance_log_f |

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | GENE-0003 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | GENE-0007 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | GENE-0001 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | GENE-0003 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | GENE-0001 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | GENE-0001 | degraded_state_only |

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

Attribute definitions constitute the typed schema layer that governs how evidence values are stored and validated. The attribute table enumerates four named properties—confidence, dimension_kind, method, and recorded_at—each bound to an XSD type that constrains its permissible values. Confidence carries the xsd:decimal type, dimension_kind and method are xsd:string, and recorded_at is xsd:dateTime. This type discipline ensures that the decimal-valued confidence measures, such as 0.002 and 0.018, remain numerically comparable across assignments, while the recorded_at timestamps—2025-06-10T14:56:29, 2024-06-25T12:59:02, 2024-03-24T16:20:19, and 2025-03-04T17:25:44—are stored in ISO 8601 format suitable for temporal ordering and audit trails. The varchar values, including Dimension Kind 01, Encoding 02, pre-release note, and the French string fr, demonstrate that the attribute-value model accommodates both machine-readable codes and free-text annotations within the same typed framework.

The mass function assignment table is the central entity that ties together the evidential mass, the frame of discernment, and the target proposition. Each assignment carries a mass value—corrosion_rate_measurement, optical_transmittance_run, magnetic_offset_calibration, and vibration_profile_test—over a frame of discernment identified by a GENE entity (GENE-0003, GENE-0007, or GENE-0001), and assigns that mass to a specific proposition such as fault_or_failure, land_or_sea_only, or degraded_state_only. The assignment ASSI-0001, for example, places the mass corrosion_rate_measurement over the frame GENE-0003 and assigns it to the proposition fault_or_failure, while ASSI-0004 assigns the mass vibration_profile_test over frame GENE-0003 to the proposition degraded_state_only. Notably, GENE-0003 appears as the frame of discernment for two distinct assignments (ASSI-0001 and ASSI-0004), illustrating that a single frame can support multiple mass assignments to different propositions—a structural requirement for combining evidence from independent sources.

The value tables implement an entity-attribute-value (EAV) pattern that decouples attribute definitions from their runtime values, enabling dynamic extension without schema modification. Each value row references an entity_id (the assignment identifier), an attr_id (the attribute definition), and a typed value. The decimal value table stores confidence measurements for entities ASSI-0001 and ASSI-0002, with attribute references extending beyond the four core attributes to include ASSI-0005, ASSI-0007, and ASSI-0010, suggesting that additional numeric attributes are defined elsewhere. The datetime value table records the recorded_at timestamp for all four assignments, with each entity referencing the same attribute ASSI-0004, confirming that recorded_at is a universal metadata property applied uniformly across the assignment set. The varchar value table populates dimension_kind and encoding attributes for entity ASSI-0001 with values Dimension Kind 01 and Encoding 02, alongside the free-text annotation pre-release note and the locale code fr, demonstrating how the EAV model accommodates structured codes and unstructured annotations within a single value store.

The inter-table relationships form a directed graph of dependencies: cardinality constraints (GENE entities) define the structural bounds within which mass assignments operate, equivalence unions (UNIO entities) group heterogeneous data sources into provable equivalence classes, attribute definitions (ASSI entities in the attr table) specify the typed properties that every assignment may carry, and value rows instantiate those properties with concrete measurements, timestamps, and annotations. The related column in the cardinality table—linking GENE-0001 to ASSI-0006, GENE-0002 to ASSI-0001, GENE-0003 to ASSI-0006, and GENE-0004 to ASSI-0004—establishes which cardinality constraint governs each assignment, while the frame-of-discernment column in the assignment table links back to GENE entities, creating a bidirectional dependency between structural constraints and evidential scope. This architecture ensures that every mass value is traceable to its originating frame, its assigned proposition, its typed attributes, and the cardinality rules that bound its applicability.