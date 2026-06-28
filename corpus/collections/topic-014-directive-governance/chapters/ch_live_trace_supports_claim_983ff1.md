---
chapter_id: ch_live_trace_supports_claim_983ff1
topic_id: 14
family: 07_long_tail
cited_terms: ['trace_supports_claim', 'mass_function_subclass', 'nist80053_control_subclass']
model: engine-refine
---

Within the compliance evidence model, every assertion is anchored to a traceable provenance chain: claims such as CLAI-0001 through CLAI-0004 are each bound to an operational trace—compliance-audit-cycle, sensor-calibration-seq, incident-response-workflow, telemetry-ingestion-stream—so that any regulatory statement can be traced back to the exact process artifact that substantiates it. The claim identifiers serve as the immutable primary keys across the entire schema, appearing not only as row identifiers in the claim table itself but also as foreign keys in every attribute-value association, ensuring that no piece of evidence exists in isolation. This identifier discipline extends to the mass-function subclass table, where FUNC-0001 through FUNC-0004 encode evidentiary weight assignments such as fault_detection_assignment, signal_quality_mass, and network_topology_confidence, and to the NIST control subclass table, where CONT-0001 through CONT-0004 reference specific regulatory frameworks including NIST SP 800-53 Rev 5, NIST SP 800-171, NIST CSF 2.0, and NIST SP 800-207.

**t_trace_supports_claim**

| id | trace |
| --- | --- |
| CLAI-0001 | compliance-audit-cycle |
| CLAI-0002 | sensor-calibration-seq |
| CLAI-0003 | incident-response-workflow |
| CLAI-0004 | telemetry-ingestion-stream |
| CLAI-0005 | incident-response-workflow |
| CLAI-0006 | log-aggregation-cycle |

**t_trace_supports_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

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

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | FUNC-0006 |
| CONT-0002 | NIST SP 800-171 | FUNC-0004 |
| CONT-0003 | NIST CSF 2.0 | FUNC-0001 |
| CONT-0004 | NIST SP 800-207 | FUNC-0007 |
| CONT-0005 | FIPS 140-3 | FUNC-0006 |
| CONT-0006 | NIST SP 800-171 | FUNC-0007 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

Attributes provide the dimensional structure that transforms a bare claim or control into a measurable, auditable proposition. The attribute metadata tables define attribute names—confidence, dimension_kind, method, recorded_at for claims; effective_date, enforcement, mandatory, priority for controls—alongside their corresponding XML Schema types: xsd:decimal, xsd:string, xsd:dateTime, xsd:date, xsd:boolean, and xsd:integer. This type discipline is enforced through a family of value tables partitioned by data type, each carrying entity_id and attr_id as composite foreign keys that bind a specific attribute instance to a specific entity instance and store the actual value in the appropriate typed column. A decimal value such as 0.088 or 473.29 resides in the decimal value table, a timestamp like 2024-06-12T18:13:41 in the datetime table, a string such as Dimension Kind 01 or calibration record in the varchar table, and a boolean flag in the boolean table—each row uniquely identified by its own surrogate id and traceable to both the entity and the attribute it qualifies.

**t_trace_supports_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-06-12T18:13:41 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-04-03T22:44:05 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-09-25T21:45:51 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-07-08T19:08:05 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-05-02T18:38:21 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-03-27T11:44:46 |

**t_trace_supports_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.088 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 473.29 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 607.77 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.802 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 968.55 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 413.59 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.176 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 496.89 |

The entity concept in this model represents the concrete instance being described or governed. In the claim context, an entity such as CLAI-0001 may carry multiple attribute values simultaneously: a confidence decimal of 0.088, a dimension_kind string of Dimension Kind 01, and a recorded_at timestamp of 2024-06-12T18:13:41, all linked through the same entity_id across their respective value tables. Similarly, a NIST control entity like CONT-0001 carries an effective_date of 2023-01-02, an enforcement designation of Enforcement 02, a mandatory flag set to true, and a priority integer of 3, with each value independently addressable yet semantically unified under the entity identifier. This multi-attribute, multi-type composition allows a single compliance artifact to express a rich, typed profile without requiring schema changes or denormalization.

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

The misc column, realized through the varchar value table, captures free-form or coded descriptors that do not fit into the strongly typed numeric or temporal categories. Values such as Encoding 01, Encoding 02, intake form, and es appear as miscellaneous attribute values attached to both claims and controls, serving as human-readable labels, encoding schemes, or procedural references that complement the structured numeric and temporal data. These misc values are equally subject to the entity-attr foreign-key binding, ensuring that even unstructured or semi-structured annotations remain fully traceable to their governing entity and their declared attribute name.

**t_trace_supports_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | intake form |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | hybrid |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | count |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

The relationship between mass functions and frames of discernment introduces a governance layer that assigns accountability and authority to evidentiary weightings. The junction table t_mass_function_subclass__over_frame_of_discernment connects a mass_id to an over_frame_of_discernment_id through a role column that distinguishes reviewer, contributor, and owner relationships. For example, mass function FUNC-0006 assumes a reviewer role over the frame of discernment FUNC-0002 (resource_utilization_buckets), while FUNC-0007 appears as both reviewer and contributor over FUNC-0001 (signal_strength_levels), and FUNC-0004 holds an owner role over FUNC-0005. This role-based association model makes explicit who is responsible for, who contributes to, and who reviews each mass-function-to-frame mapping, thereby embedding governance accountability directly into the evidentiary structure.

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

Finally, the NIST control subclass table bridges regulatory frameworks to the mass-function evidence model through its nist80053_control column, which maps each control entity to a specific mass function: CONT-0001 (NIST SP 800-53 Rev 5) references FUNC-0006, CONT-0002 (NIST SP 800-171) references FUNC-0004, CONT-0003 (NIST CSF 2.0) references FUNC-0001, and CONT-0004 (NIST SP 800-207) references FUNC-0007. This linkage creates a closed loop in which a regulatory control is associated with a mass function, the mass function is assigned a role over a frame of discernment, and the control itself carries typed attributes—effective dates, enforcement levels, mandatory flags, priority integers—that govern its applicability. The result is a fully traceable, type-safe, role-aware compliance evidence model where every assertion, attribute, value, and governance relationship can be independently queried and audited.