---
chapter_id: ch_live_mass_function_subclass_262572
topic_id: 140
family: 06_belief_structure
cited_terms: ['mass_function_subclass', 'summary_metric_subclass', 'measurement_subclass']
model: engine-refine
---

In governed information systems, stable reference is the precondition for auditability, reconciliation, and cross-system alignment. An identifier furnishes that reference as a durable, system-neutral handle that survives renaming, reclassification, and redistribution of descriptive content. Entries such as FUNC-0001 and METR-0003 do not merely label rows; they anchor claims about mass-function subclasses, summary metrics, and measurement subclasses so that downstream assertions—whether a network_topology_confidence mass is evaluated over protocol_compliance_status or a batch_job_completion_rate summary is classified under MEAS-0005—can be verified, cited, and compared without depending on display strings that may vary by locale, vendor, or revision cycle.

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

**t_summary_metric_subclass**

| id | summary | metric_kind |
| --- | --- | --- |
| METR-0001 | network_bandwidth_rollup | MEAS-0005 |
| METR-0002 | network_bandwidth_rollup | MEAS-0005 |
| METR-0003 | batch_job_completion_rate | MEAS-0005 |
| METR-0004 | error_rate_dashboard | MEAS-0006 |
| METR-0005 | resource_utilization_snapshot | MEAS-0003 |
| METR-0006 | storage_io_throughput | MEAS-0002 |
| METR-0007 | system_uptime_window | MEAS-0002 |

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

An entity is the unit to which governed properties attach: the object of record whose lifecycle, provenance, and compliance posture the registry is charged to maintain. When METR-0001 carries a checksum of 7b14de08, an oid-scheme identifier, and a license value of MPL-2.0, those bindings are not free-floating literals; they are statements about a particular summary-metric subclass entity, the same entity that may also receive typed temporal and numeric facts. Separating entity from the literals asserted of it is what permits heterogeneous encodings—dates in one store, integers in another, character data in a third—while preserving a single coherent subject for governance review.

**t_summary_metric_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| METR-0001 | checksum | xsd:string |
| METR-0002 | created_date | xsd:date |
| METR-0003 | identifier | cco:DesignativeICE |
| METR-0004 | license | xsd:string |
| METR-0005 | mime_type | xsd:string |
| METR-0006 | size_bytes | xsd:long |
| METR-0007 | uri | xsd:string |
| METR-0008 | version | xsd:integer |

**t_summary_metric_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0002 | 2023-11-11 |
| METR-0002 | METR-0002 | METR-0002 | 2024-08-19 |
| METR-0003 | METR-0003 | METR-0002 | 2023-07-21 |
| METR-0004 | METR-0004 | METR-0002 | 2023-02-24 |
| METR-0005 | METR-0005 | METR-0002 | 2024-01-28 |
| METR-0006 | METR-0006 | METR-0002 | 2025-06-08 |
| METR-0007 | METR-0007 | METR-0002 | 2023-06-04 |

Attributes name the facets along which an entity may be described, and attr_type fixes the interpretive contract under which each facet must be read. The pairing of checksum with xsd:string, created_date with xsd:date, and identifier with cco:DesignativeICE is not decorative metadata; it governs validation, interchange, and semantic interoperability. A conformance checker can reject a mistyped value before it enters the authoritative record, and an integrator can route created_date assertions to a date-valued store while treating DesignativeICE identifiers as designative ICE-class terms rather than unconstrained text. Attribute typing thus converts informal labels into enforceable obligations on producers and consumers alike.

The misc dimension—here realized as the stored value carried beside entity and attribute keys—completes the assertion triple in operational form. Values such as 2023-11-11, 245, ap-south-2, and reviewer are meaningful only when read through their attribute typing and entity binding: a date records when a metric lineage was established, an integer may quantify a rollup parameter, a region code may scope deployment, and a role token may annotate participation in a relationship rather than an intrinsic property of a mass function. Partitioning values by representation (date, integer, varchar) while retaining a uniform entity–attribute linkage pattern is a practical strategy for retaining query performance and schema clarity without fragmenting the governance model.

Relational governance extends beyond unary properties through subject–target patterns qualified by role. A subject denotes the party or construct that initiates or bears a directed association—FUNC-0007 as mass_id in a mass-to-frame link, MEAS-0004 as measurement_id in a measurement-to-dimension association—while a target names the counterpart frame, dimension, or class against which the subject is positioned. Role supplies the normative stance within that linkage: owner, contributor, and reviewer are not synonyms for possession but differentiated responsibilities in oversight, authorship, and validation. Observing that two distinct mass-function associations both target FUNC-0001 over signal_strength_levels yet carry reviewer and contributor roles illustrates how identical structural endpoints can encode divergent accountability, a distinction compliance workflows must preserve when assigning approvals, escalations, and evidentiary weight.

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role constitute a layered vocabulary for accountable description: identifiers stabilize reference; entities delimit what is being described; attributes and types specify what may be said and how it must be parsed; misc values instantiate claims under those contracts; and subject–target–role triples articulate directed, responsibility-bearing relationships among classified constructs such as mass functions over frames of discernment, summary metrics over metric kinds, and measurements over dimensions. Systems that treat these elements as first-class governance primitives—rather than as incidental column semantics—gain the ability to trace why network_bandwidth_rollup shares a metric_kind with batch_job_completion_rate, why soil moisture measurements align to mass and energy dimensions under distinct reviewer and owner roles, and why duplicate topology-confidence masses diverge at the frame of discernment. That traceability is the operational substance of compliance: not the inventory of fields, but the demonstrable chain from typed assertion through identified entity to the roles and endpoints that authorize it.

**t_mass_function_subclass_over_frame_of_discernment**

| id | over_frame_of_discernment |
| --- | --- |
| FUNC-0001 | resource_utilization_buckets |
| FUNC-0002 | signal_strength_levels |
| FUNC-0003 | signal_strength_levels |
| FUNC-0004 | protocol_compliance_status |
| FUNC-0005 | incident_severity_levels |
| FUNC-0006 | protocol_compliance_status |

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

**t_summary_metric_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0006 | 23 |
| METR-0002 | METR-0001 | METR-0008 | 7 |
| METR-0003 | METR-0002 | METR-0006 | 245 |
| METR-0004 | METR-0002 | METR-0008 | 1 |
| METR-0005 | METR-0003 | METR-0006 | 376 |
| METR-0006 | METR-0003 | METR-0008 | 2 |
| METR-0007 | METR-0004 | METR-0006 | 195 |
| METR-0008 | METR-0004 | METR-0008 | 7 |

**t_summary_metric_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| METR-0001 | METR-0001 | METR-0001 | 7b14de08 |
| METR-0002 | METR-0001 | METR-0003 | oid:1.3.6.1 |
| METR-0003 | METR-0001 | METR-0004 | MPL-2.0 |
| METR-0004 | METR-0001 | METR-0009 | ap-south-2 |
| METR-0005 | METR-0001 | METR-0005 | application/avro |
| METR-0006 | METR-0001 | METR-0010 | Name 06 |
| METR-0007 | METR-0001 | METR-0011 | ml-infra |
| METR-0008 | METR-0001 | METR-0012 | Tags 08 |

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |