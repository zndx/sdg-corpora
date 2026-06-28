---
chapter_id: ch_live_mass_function_equiv_frame_and_assignment_2605a2
topic_id: 165
family: 06_belief_structure
cited_terms: ['mass_function_equiv_frame_and_assignment', 'mass_function_min_one_focal', 'mass_function_normalized_form']
model: engine-refine
---

In evidence-governed measurement systems, a mass function expresses how quantitative or categorical belief is distributed over a frame of discernment—the set of mutually exclusive hypotheses under which an observation may be interpreted. Each such function receives a durable identifier (for example ASSI-0001 or FOCA-0003) so that assignments, focalisations, and normalized forms remain addressable across audit cycles, cross-referencing, and downstream reconciliation. The identifier is not merely a surrogate key: it anchors provenance, permits idempotent ingestion when the same corrosion_rate_measurement or provenance_record_epsilon is re-submitted from independent laboratories, and preserves referential integrity when belief is reassigned from one frame to another. Without stable identifiers, the evidentiary chain that links a vibration_profile_test conducted over FORM-0003 to a subsequent degraded_state_only classification cannot be reconstructed under regulatory scrutiny.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | FORM-0006 |
| FOCA-0002 | audit_trail_eta | FORM-0002 |
| FOCA-0003 | provenance_record_epsilon | FORM-0004 |
| FOCA-0004 | sensor_array_gamma | FORM-0006 |
| FOCA-0005 | governance_log_delta | FORM-0001 |
| FOCA-0006 | provenance_record_epsilon | FORM-0001 |

**t_mass_function_normalized_form**

| id | mass |
| --- | --- |
| FORM-0001 | Silicon-28 isotope |
| FORM-0002 | Tungsten calibration |
| FORM-0003 | Copper-63 signal |
| FORM-0004 | Platinum-195 trace |
| FORM-0005 | Copper-63 signal |
| FORM-0006 | Carbon-13 baseline |
| FORM-0007 | Copper-63 signal |
| FORM-0008 | Carbon-13 baseline |

**t_mass_function_normalized_form_normalized_form**

| id | normalized_form |
| --- | --- |
| FORM-0001 | ISO 17025 baseline |
| FORM-0002 | NRC traceable standard |
| FORM-0003 | WHO certified control |
| FORM-0004 | BIPM pilot scale |
| FORM-0005 | BIPM pilot scale |
| FORM-0006 | NRC traceable standard |
| FORM-0007 | ISO 17025 baseline |
| FORM-0008 | OIML R111 class |

An entity, in this architecture, is the logical bearer of attributes—the record to which observable properties attach. When entity_id ASSI-0001 carries attr_id ASSI-0001 with misc value 0.002, the system records that a specific assignment instance possesses a confidence decimal; when the same entity_id appears against attr_id ASSI-0002 with misc Dimension Kind 01, a orthogonal descriptive facet is asserted without collapsing the two assertions into a single untyped field. Entity thus names the "who" or "what" in the attribute–value relation, distinct from the identifier of the value row itself and distinct from the attr that names the property. This separation matters because mass-function governance routinely requires multiple typed observations per assignment—method, dimension_kind, recorded_at, confidence—each validated independently and each potentially subject to different retention or disclosure rules.

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

Attributes and attribute types form the declarative contract under which misc values acquire meaning. An attr such as recorded_at or method is declared once in an attribute catalogue (FOCA-0004, ASSI-0004) and bound to an attr_type drawn from a controlled vocabulary: xsd:decimal for belief weights, xsd:string for encodings and calibration labels, xsd:dateTime for temporal stamps. The type governs storage partition—values land in typed valuation relations rather than a single undifferentiated heap—so that 0.161 cannot be silently coerced into 2023-08-08T03:21:21 and so that locale-tagged strings (fr, es) remain distinguishable from numeric confidence. Attribute typing is therefore a compliance instrument: it enforces parseability, enables schema-level validation before belief masses enter normalized forms, and documents intent for auditors who must determine whether a misc entry was meant as measurement, metadata, or procedural annotation.

The misc column holds the instantiated value—the evidentiary payload—once entity, attr, and attr_type have fixed the interpretive frame. A misc of 724.48 attached to entity ASSI-0001 under an appropriate attr_id denotes a quantitative observation whose magnitude can be compared across assignments; pre-release note and calibration record illustrate categorical or documentary misc values that qualify how belief was produced rather than how much belief is allocated. Datetime misc values (2025-06-10T14:56:29 for ASSI-0001; 2024-04-19T20:46:34 for FOCA-0003) establish temporal ordering among focal elements and equivalence-frame assignments, which becomes decisive when normalized forms are revised and historical belief must be replayed. Misc is deliberately generic in name but never generic in treatment: its semantics are fully determined by the attr–attr_type pairing, and governance frameworks treat untyped or mistyped misc insertion as a finding, not a convenience.

Subject and target articulate directed relationships between normalized forms and the masses they organise, while role qualifies the nature of that directed link. In the normalized-form association pattern, mass_id FORM-0004 as subject and normalized_form_id FORM-0004 as target under role observer states that a Platinum-195 trace mass stands in an observational relation to a BIPM pilot scale normalization; conversely, mass_id FORM-0007 linked to normalized_form_id FORM-0007 with role owner asserts custodial authority over a Tungsten calibration lineage. Roles such as reviewer introduce a third party distinct from both subject and target, signalling that belief normalization was scrutinised rather than merely registered. This tripartite subject–role–target model prevents ambiguous graph edges: an auditor can determine whether FORM-0006 participates as focal_element for audit_trail_eta or as an endpoint in a normalization chain, because the role disambiguates parallel edges that would otherwise collapse into undifferentiated association.

Operationally, these constructs interlock across three mass-function idioms—equivalence-frame assignment, minimum-one focalisation, and normalized form—and the cross-cutting attribute layer unifies them. Assignments map corrosion_rate_measurement and magnetic_offset_calibration over frames FORM-0003 and FORM-0001 onto outcome hypotheses including fault_or_failure and land_or_sea_only; focalisations concentrate belief on audit_trail_eta and sensor_array_gamma against focal elements FORM-0006 and FORM-0002; normalized forms lift raw masses such as Silicon-28 isotope into ISO 17025 baseline and WHO certified control regimes. Identifiers thread through all layers so that a confidence attr typed xsd:decimal on FOCA-0001 and the homologous attr on ASSI-0001 remain comparable; entities ensure each function carries its own attribute bundle; misc values supply the evidential particulars; and subject–target–role tuples document how standardized forms relate to the masses they certify. Taken together, the vocabulary furnishes a reproducible grammar for belief management in metrological and compliance contexts: every allocation of mass is named, typed, timestamped, and situated within an explicit frame, and every normalization is attributed to accountable parties whose roles are machine-readable and audit-ready.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | FORM-0003 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | FORM-0007 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | FORM-0001 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | FORM-0003 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | FORM-0001 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | FORM-0001 | degraded_state_only |

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

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_normalized_form__normalized_form**

| id | mass_id | normalized_form_id | role |
| --- | --- | --- | --- |
| FORM-0001 | FORM-0004 | FORM-0004 | observer |
| FORM-0002 | FORM-0007 | FORM-0007 | owner |
| FORM-0003 | FORM-0006 | FORM-0008 | reviewer |
| FORM-0004 | FORM-0008 | FORM-0001 | reviewer |
| FORM-0005 | FORM-0006 | FORM-0006 | contributor |
| FORM-0006 | FORM-0003 | FORM-0006 | reviewer |
| FORM-0007 | FORM-0003 | FORM-0006 | observer |
| FORM-0008 | FORM-0008 | FORM-0008 | reviewer |