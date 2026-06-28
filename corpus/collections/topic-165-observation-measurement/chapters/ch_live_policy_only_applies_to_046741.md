---
chapter_id: ch_live_policy_only_applies_to_046741
topic_id: 165
family: 01_foundation
cited_terms: ['policy_only_applies_to', 'mass_function_equiv_frame_and_assignment', 'lane_compliance_behavior']
model: engine-refine
---

Governance over compliance obligations begins with stable identifiers that anchor every subsequent assertion in a traceable graph. An application-scope record such as APPL-0001 names a binding between a named policy instrument—Privacy Shield Compliance, Encryption Baseline, or Data Classification Guideline—and the operational assignments that must observe it; the companion identifier ASSI-0003 then denotes a concrete mass-function assignment whose evidentiary frame is resolved through that scope. Because the same guideline may be re-bound to the same assignment at different moments, effectivedate governs temporal jurisdiction rather than mere cataloguing: APPL-0001 takes effect on 2023-08-29, APPL-0003 on 2023-08-21, and a later rebinding of Data Classification Guideline to ASSI-0003 under APPL-0004 on 2023-12-18 supersedes earlier applicability without erasing audit history. Where multiple scopes could overlap, priority supplies an explicit precedence rule—Privacy Shield Compliance and Encryption Baseline both carry priority 5, whereas duplicate Data Classification Guideline bindings register at priority 3—so adjudicators can determine which obligation governs when frames of discernment collide.

**t_policy_only_applies_to**

| id | policy | applies_to | effective_date | priority |
| --- | --- | --- | --- | --- |
| APPL-0001 | Privacy Shield Compliance | ASSI-0003 | 2023-08-29 | 5 |
| APPL-0002 | Encryption Baseline | ASSI-0005 | 2023-11-05 | 5 |
| APPL-0003 | Data Classification Guideline | ASSI-0006 | 2023-08-21 | 3 |
| APPL-0004 | Data Classification Guideline | ASSI-0003 | 2023-12-18 | 3 |
| APPL-0005 | Data Retention Standard | ASSI-0006 | 2024-11-09 | 4 |
| APPL-0006 | Data Classification Guideline | ASSI-0003 | 2023-01-13 | 2 |
| APPL-0007 | Vendor Risk Assessment | ASSI-0001 | 2025-03-17 | 2 |
| APPL-0008 | Network Segmentation Rule | ASSI-0002 | 2024-05-19 | 2 |

Mass-function equivalence framing translates policy scope into measurable assignment semantics. Each assignment identifier—ASSI-0001 through ASSI-0004—pairs a named measurement function (corrosion_rate_measurement, optical_transmittance_run, magnetic_offset_calibration, vibration_profile_test) with an over_frame_of_discernment reference back into the application-scope namespace and an assigns_mass_to outcome that constrains how belief or responsibility mass may be distributed (fault_or_failure, land_or_sea_only, degraded_state_only). The pattern is not decorative taxonomy: optical_transmittance_run and vibration_profile_test both resolve over APPL-0003 yet assign mass exclusively to degraded_state_only, while corrosion_rate_measurement maps over APPL-0001 to fault_or_failure, encoding that identical policy envelopes can license divergent evidentiary postures depending on the function under evaluation. Identifier stability across these joins is what permits a compliance reviewer to traverse from a lane-level behavior back through assignment mass to the policy that authorized the frame of discernment in the first place.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | APPL-0003 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | APPL-0007 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | APPL-0001 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | APPL-0003 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | APPL-0001 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | APPL-0001 | degraded_state_only |

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

Typed attributes and entity-bound values constitute the evidentiary substrate on which those frames rest. An entity in this sense is the assignment record itself—ASSI-0001, ASSI-0002, and so forth—while attr names the semantic slot (confidence, dimension_kind, method, recorded_at) and attr_type declares the interpretive contract through XSD-aligned typing: xsd:decimal for quantitative confidence, xsd:string for categorical descriptors, xsd:dateTime for temporal stamps. Values materialize in type-partitioned stores where misc holds the literal payload—0.002 and 0.018 as decimal confidence readings, Dimension Kind 01 and Encoding 02 as varchar classifications, 2025-06-10T14:56:29 through 2025-03-04T17:25:44 as recorded_at instants—always keyed by the pairing of entity and attr so that heterogeneous observations on a single assignment remain queryable without schema collapse. The separation of attr_type from misc is deliberate: adjudication logic can reject ill-typed assertions before they enter a compliance ledger, and downstream analytics can aggregate decimals independently of string annotations such as pre-release note or locale marker fr.

Lane compliance behavior names the operational surface on which governance obligations become observable conduct. A lanecompliancebehavior record—whether I-280 Express Lane, I-70 Eastbound, SR-520 Toll, or Route 128 North—does not merely label infrastructure; it situates enforcement within a traffic-management context where Heavy Haul Supervisor, Delivery Van Operator, Autonomous Fleet Unit, and RideShare Driver appear as involved operators whose responsibilities are not implicit but role-assigned. In relational edges, subject identifies the lane-side anchor of the association: BEHA-0002 linked as subject to an operator target with role reviewer, BEHA-0005 with role owner—distinctions that determine who may attest, who may override, and who bears accountability when a behavior misfires against its governing frame. The same subject–target–role grammar extends to streettrafficconfiguration, where occurs_on_street_type situates behavior within Tunnel Approach Lane, Urban Signalized Intersection, Highway Work Zone, or Bridge Deck Section geometries; observer and owner roles on those edges record whether a party witnesses compliance passively or holds configuration authority over the street type in question.

**t_lane_compliance_behavior__involves_operator**

| id | lane_id | involves_operator_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0002 | BEHA-0005 | reviewer |
| BEHA-0002 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0003 | BEHA-0005 | BEHA-0005 | owner |
| BEHA-0004 | BEHA-0002 | BEHA-0003 | owner |
| BEHA-0005 | BEHA-0003 | BEHA-0006 | owner |
| BEHA-0006 | BEHA-0003 | BEHA-0007 | contributor |
| BEHA-0007 | BEHA-0003 | BEHA-0006 | contributor |
| BEHA-0008 | BEHA-0002 | BEHA-0007 | observer |

**t_lane_compliance_behavior_occurs_on_street_type**

| id | occurs_on_street_type |
| --- | --- |
| BEHA-0001 | Tunnel Approach Lane |
| BEHA-0002 | Urban Signalized Intersection |
| BEHA-0003 | Highway Work Zone |
| BEHA-0004 | Bridge Deck Section |
| BEHA-0005 | Rural Interstate Highway |
| BEHA-0006 | Urban Signalized Intersection |

Cardinality notes close the loop between permissive graph modeling and auditable constraint documentation. Where a lane may relate to multiple street types, or where operator involvement is many-to-many, cardinality_note—Cardinality Note 01 through Cardinality Note 04 in the exemplar set—records the intended multiplicity and any exceptional allowance that pure relational keys would otherwise leave implicit. BEHA-0003 as subject to BEHA-0001 with role owner and Cardinality Note 03, contrasted with BEHA-0001 as subject to BEHA-0005 under role reviewer and Cardinality Note 04, illustrates that identical topological shapes can carry different cardinality semantics and therefore different compliance interpretations. Taken together, identifier, effectivedate, priority, entity, attr, attr_type, misc, lanecompliancebehavior, streettrafficconfiguration, role, subject, and cardinality_note form an interlocking reference architecture: policies time-bind to assignments through scoped identifiers; assignments carry typed evidentiary attributes; lane behaviors and street configurations instantiate those abstractions in operable space; and roles plus cardinality notes specify who may act and how often relationships may legitimately recur—precisely the fabric required for defensible, evidence-anchored compliance adjudication.

**t_lane_compliance_behavior**

| id | lane_compliance_behavior |
| --- | --- |
| BEHA-0001 | I-280 Express Lane |
| BEHA-0002 | I-70 Eastbound |
| BEHA-0003 | SR-520 Toll |
| BEHA-0004 | Route 128 North |
| BEHA-0005 | I-70 Eastbound |
| BEHA-0006 | Highway 401 Inner |

**t_lane_compliance_behavior_involves_operator**

| id | involves_operator |
| --- | --- |
| BEHA-0001 | Heavy Haul Supervisor |
| BEHA-0002 | Delivery Van Operator |
| BEHA-0003 | Autonomous Fleet Unit |
| BEHA-0004 | RideShare Driver |
| BEHA-0005 | RideShare Driver |
| BEHA-0006 | Logistics Coordinator |
| BEHA-0007 | Autonomous Fleet Unit |

**t_lane_compliance_behavior__occurs_on_street_type**

| id | lane_id | occurs_on_street_type_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| BEHA-0001 | BEHA-0003 | BEHA-0006 | observer | Cardinality Note 01 |
| BEHA-0002 | BEHA-0004 | BEHA-0002 | observer | Cardinality Note 02 |
| BEHA-0003 | BEHA-0002 | BEHA-0001 | owner | Cardinality Note 03 |
| BEHA-0004 | BEHA-0001 | BEHA-0005 | reviewer | Cardinality Note 04 |
| BEHA-0005 | BEHA-0001 | BEHA-0006 | observer | Cardinality Note 05 |
| BEHA-0006 | BEHA-0001 | BEHA-0003 | contributor | Cardinality Note 06 |
| BEHA-0007 | BEHA-0004 | BEHA-0006 | contributor | Cardinality Note 07 |
| BEHA-0008 | BEHA-0006 | BEHA-0004 | observer | Cardinality Note 08 |