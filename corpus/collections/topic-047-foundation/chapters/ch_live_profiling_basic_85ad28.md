---
chapter_id: ch_live_profiling_basic_85ad28
topic_id: 47
family: 02_observation_measurement
cited_terms: ['profiling_basic', 'subclass_to_directive_ice', 'mass_function_subclass']
model: engine-refine
---

Profiling infrastructure in the operational registry is anchored by a fact table that records execution telemetry for each profiling event, keyed by a unique identifier such as PROF-0001 through PROF-0004. Each record captures the elapsed duration in seconds—values ranging from 1113.38 to 6716.87—alongside an exit code that signals the termination state of the profiling run, with observed codes including 725, 809, 348, and 827. The retry count, reflecting the number of re-attempts before final resolution, spans from 186 to 303 across the observed entries. A profiling key, drawn from the same identifier namespace, links each fact record to its corresponding dimension entry, where the profiling category is classified under a categorical label such as Profiling Category 01 or Profiling Category 03, and further resolved through a category identifier like PROF-0008 or PROF-0007 that references a dedicated category dimension table. This category dimension itself stores human-readable category names—Category Name 01 through Category Name 04—providing the semantic layer that maps machine identifiers to organizational classifications.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

The dimension table for profiling also carries a profiling label, stored under the misc column, which assigns a descriptive designation such as Profiling Label 01 or Profiling Label 04 to each profiling entity. These labels serve as the primary human-facing identifier within governance dashboards and audit reports, bridging the gap between the machine-resilient identifier column and the operational vocabulary used by compliance officers and system administrators. The category column within this dimension, distinct from the profiling category field, establishes a secondary classification axis that enables multi-dimensional filtering of profiling records by organizational unit, regulatory domain, or functional area. Together, the identifier, profiling label, and category fields form a tripartite addressing scheme that supports both programmatic lookups and manual investigation.

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

Directive-to-subclass mappings are maintained in a separate table that associates each subclass with a directive type, an encoding standard, and a label text. The directive column captures requirements such as ProvenanceTraceRequirement or EncryptionStandard, as well as operational instructions like CalibrationInstruction, which appears for both ICE-0003 and ICE-0004. The encoding column specifies the character encoding applied to the directive payload—ascii for directives ICE-0001 and ICE-0002, and unicode for ICE-0003 and ICE-0004—ensuring that downstream systems interpret the directive content correctly. The label text column provides a contextual descriptor for each directive-subclass pairing, with values including intake form, calibration record, and nightly summary, enabling operators to quickly identify the purpose of a given mapping without resolving the underlying directive type.

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |

The mass function framework introduces a three-table structure that models relationships between mass function subclasses and frames of discernment. The mass function subclass table assigns a mass value to each subclass identifier, with observed values such as fault_detection_assignment, signal_quality_mass, and network_topology_confidence, the latter appearing for both FUNC-0003 and FUNC-0004. The frame of discernment table defines the evaluation domains—resource_utilization_buckets, signal_strength_levels, and protocol_compliance_status—against which mass values are assessed. A junction table mediates the many-to-many relationship between these two entities, linking a mass identifier (the subject) to a frame-of-discernment identifier (the target) while assigning a role that describes the nature of the association. Observed roles include reviewer, which appears for both FUNC-0001 and FUNC-0002, contributor for FUNC-0003, and owner for FUNC-0004, establishing a clear governance hierarchy over how mass function subclasses interact with frames of discernment.

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