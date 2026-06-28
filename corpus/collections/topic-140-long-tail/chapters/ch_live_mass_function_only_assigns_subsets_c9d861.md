---
chapter_id: ch_live_mass_function_only_assigns_subsets_c9d861
topic_id: 140
family: 06_belief_structure
cited_terms: ['mass_function_only_assigns_subsets', 'mass_function_subclass', 'mass_function_with_focal_element']
model: engine-refine
---

The architecture of evidentiary tracking rests upon a disciplined nomenclature of identifiers that anchor every record to a reproducible lineage. Each datum is indexed by a stable key—SUBS-0001 through SUBS-0004 for subset assignments, FUNC-0001 through FUNC-0004 for subclass mappings, and ELEM-0001 through ELEM-0004 for focal element registrations—ensuring that cross-referential lookups remain unambiguous across distributed subsystems. At the core of this indexing lies the entity, which functions as the primary locus of measurement and attribute binding. Entities do not exist in isolation; they are characterized by a structured set of attributes, such as confidence, dimension_kind, method, and recorded_at, each of which is formally typed to guarantee computational interoperability. The attr_type registry enforces strict schema discipline, constraining confidence and dimension_kind to xsd:decimal and xsd:string respectively, while recorded_at is bound to xsd:dateTime, thereby preventing type coercion errors during downstream aggregation and audit.

**t_mass_function_only_assigns_subsets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0004 | 2024-10-19T15:01:03 |
| SUBS-0002 | SUBS-0002 | SUBS-0004 | 2023-10-05T14:35:44 |
| SUBS-0003 | SUBS-0003 | SUBS-0004 | 2024-02-24T01:03:34 |
| SUBS-0004 | SUBS-0004 | SUBS-0004 | 2024-04-26T17:49:00 |
| SUBS-0005 | SUBS-0005 | SUBS-0004 | 2024-01-29T11:02:31 |
| SUBS-0006 | SUBS-0006 | SUBS-0004 | 2023-11-16T17:14:50 |

**t_mass_function_only_assigns_subsets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0001 | 0.589 |
| SUBS-0002 | SUBS-0001 | SUBS-0005 | 503.17 |
| SUBS-0003 | SUBS-0001 | SUBS-0007 | 721.15 |
| SUBS-0004 | SUBS-0002 | SUBS-0001 | 0.512 |
| SUBS-0005 | SUBS-0002 | SUBS-0005 | 595.07 |
| SUBS-0006 | SUBS-0002 | SUBS-0007 | 721.26 |
| SUBS-0007 | SUBS-0003 | SUBS-0001 | 0.645 |
| SUBS-0008 | SUBS-0003 | SUBS-0005 | 722.55 |

**t_mass_function_with_focal_element**

| id | mass | focal_element | confidence | method |
| --- | --- | --- | --- | --- |
| ELEM-0001 | 1.5L coolant sample | network_latency_classes | 0.863 | manual |
| ELEM-0002 | 3.7g soil core | device_operational_states | 0.119 | hybrid |
| ELEM-0003 | 920g polymer pellet | incident_severity_levels | 0.941 | automated |
| ELEM-0004 | 3.7g soil core | sensor fusion layer | 0.033 | hybrid |
| ELEM-0005 | 500MB telemetry dump | primary telemetry stream | 0.250 | hybrid |

Once attributes are defined, their material values are resolved through a dedicated value layer that accommodates heterogeneous data classes without compromising referential integrity. The misc column serves as the universal carrier for these resolved values, partitioned by type-specific tables that preserve precision and temporal fidelity. Decimal-valued attributes yield continuous measurements such as 0.589, 503.17, and 721.15, which are typically associated with quantitative assessments like data_quality or edge_node evaluations. String-valued attributes capture categorical or descriptive metadata, including Dimension Kind 01, Encoding 02, nightly summary, and de, while temporal attributes resolve to ISO 8601 timestamps such as 2024-10-19T15:01:03 and 2023-10-05T14:35:44. This tripartite value resolution ensures that every entity-attr pairing is grounded in a concrete, type-safe observation, whether the underlying phenomenon is a thermal_overload event, a sensor_offline condition, or a data_corruption incident.

Beyond raw measurement, the system explicitly models epistemic certainty and procedural provenance through the confidence and method dimensions. Confidence operates as a normalized scalar that quantifies the reliability of a focal element assignment, ranging from 0.033 for highly uncertain classifications to 0.941 for robustly validated observations. These confidence scores are not arbitrary; they are systematically paired with methodological descriptors—manual, hybrid, or automated—that document how the underlying mass was derived. For instance, a 1.5L coolant sample evaluated against network_latency_classes carries a confidence of 0.863 via an automated pipeline, whereas a 3.7g soil core assessed for device_operational_states registers a confidence of 0.119 through a hybrid review process. This dual encoding of confidence and method transforms subjective or heuristic judgments into auditable, machine-readable provenance trails.

The governance of these evidentiary assignments is mediated through a role-based relational framework that explicitly distinguishes between subject and target in cross-functional mappings. Within the subclass architecture, mass identifiers function as subjects that exert influence over target frames of discernment, such as sensor fusion layer, baseline observation window, validation rule set, and network_latency_classes. The linkage between subject and target is not merely structural; it is semantically qualified by a role designation that assigns operational accountability. Records consistently designate reviewer, contributor, or owner roles to govern how fault_detection_assignment, signal_quality_mass, or network_topology_confidence interact with their respective targets. This role-mediated subject-target coupling ensures that every mass function carries an explicit chain of custody, clarifying whether a given entity is being evaluated, amended, or ratified by a designated authority.

**t_mass_function_only_assigns_subsets**

| id | mass | assigns_mass_to |
| --- | --- | --- |
| SUBS-0001 | data_quality | network_congestion |
| SUBS-0002 | edge_node | thermal_overload |
| SUBS-0003 | thermal_fusion | sensor_offline |
| SUBS-0004 | telemetry_confidence | data_corruption |
| SUBS-0005 | signal_integrity | packet_loss |
| SUBS-0006 | edge_node | thermal_overload |

**t_mass_function_only_assigns_subsets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0002 | Dimension Kind 01 |
| SUBS-0002 | SUBS-0001 | SUBS-0008 | Encoding 02 |
| SUBS-0003 | SUBS-0001 | SUBS-0009 | nightly summary |
| SUBS-0004 | SUBS-0001 | SUBS-0010 | de |
| SUBS-0005 | SUBS-0001 | SUBS-0003 | manual |
| SUBS-0006 | SUBS-0001 | SUBS-0006 | mg/L |
| SUBS-0007 | SUBS-0002 | SUBS-0002 | Dimension Kind 07 |
| SUBS-0008 | SUBS-0002 | SUBS-0008 | Encoding 08 |

**t_mass_function_subclass**

| id | mass |
| --- | --- |
| FUNC-0001 | fault_detection_assignment |
| FUNC-0002 | signal_quality_mass |
| FUNC-0003 | network_topology_confidence |
| FUNC-0004 | network_topology_confidence |
| FUNC-0005 | signal_quality_mass |
| FUNC-0006 | network_topology_confidence |
| FUNC-0007 | signal_quality_mass |

**t_mass_function_subclass_over_frame_of_discernment**

| id | over_frame_of_discernment |
| --- | --- |
| FUNC-0001 | sensor fusion layer |
| FUNC-0002 | baseline observation window |
| FUNC-0003 | validation rule set |
| FUNC-0004 | network_latency_classes |
| FUNC-0005 | fault_type_taxonomy |
| FUNC-0006 | network_latency_classes |

**t_mass_function_subclass__over_frame_of_discernment**

| id | mass_id | over_frame_of_discernment_id | role |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0006 | FUNC-0002 | reviewer |
| FUNC-0002 | FUNC-0007 | FUNC-0001 | reviewer |
| FUNC-0003 | FUNC-0007 | FUNC-0001 | contributor |
| FUNC-0004 | FUNC-0004 | FUNC-0005 | owner |
| FUNC-0005 | FUNC-0003 | FUNC-0005 | owner |
| FUNC-0006 | FUNC-0003 | FUNC-0002 | reviewer |
| FUNC-0007 | FUNC-0005 | FUNC-0001 | observer |
| FUNC-0008 | FUNC-0006 | FUNC-0001 | contributor |

Collectively, these components form a cohesive evidentiary substrate where identifiers provide stability, entities supply context, attributes and their types enforce schema discipline, and value layers materialize heterogeneous observations. Confidence and method inject epistemic transparency, while role, subject, and target establish governance boundaries across functional mappings. The system does not merely store data; it encodes the provenance, certainty, and accountability of every assignment, whether tracking telemetry_confidence against network_congestion, evaluating thermal_fusion under sensor_offline conditions, or certifying incident_severity_levels through automated pipelines. By binding quantitative precision to qualitative oversight, the architecture ensures that every recorded mass function remains traceable, auditable, and operationally actionable across complex, multi-layered monitoring environments.

**t_mass_function_only_assigns_subsets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBS-0001 | confidence | xsd:decimal |
| SUBS-0002 | dimension_kind | xsd:string |
| SUBS-0003 | method | xsd:string |
| SUBS-0004 | recorded_at | xsd:dateTime |
| SUBS-0005 | uncertainty | xsd:decimal |
| SUBS-0006 | unit | xsd:string |
| SUBS-0007 | value | xsd:decimal |
| SUBS-0008 | encoding | xsd:string |