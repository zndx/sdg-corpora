---
chapter_id: ch_live_allocation_at_run_id_c1c205
topic_id: 24
family: 05_provo_lineage
cited_terms: ['allocation_at_run_id', 'vehicle_equipment_specification', 'dataset_was_attributed_to']
model: engine-refine
---

Equipment specifications serve as the primary governance artifacts within the vehicle compliance framework, each identified by a stable surrogate key and associated with a descriptive designation such as CAT 320 Excavator, Emergency Response, Scania R500, or Medium Duty. These specifications do not exist in isolation; they establish binding relationships to both vehicle classes and mandated components, and the nature of each relationship is captured through a role attribute that distinguishes whether a specification acts as contributor, owner, or reviewer in a given context. The specification-to-vehicle-class linkage, for instance, records that SPEC-0002 holds an owner role against SPEC-0001, while SPEC-0002 also appears as a contributor against SPEC-0005, demonstrating that a single specification can occupy multiple relational positions across different vehicle classes. The vehicle classes themselves—Tesla Model Y, Daf XF105, Toyota Hilux, Light Utility Vehicle—represent the operational targets to which equipment requirements are applied, and the many-to-many relationship between specifications and classes is mediated through a junction table that preserves both the directional subject and target identifiers alongside the role classification.

**t_allocation_at_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0001 | RUN-0003 | observer |
| RUN-0002 | RUN-0004 | RUN-0007 | reviewer |
| RUN-0003 | RUN-0003 | RUN-0004 | observer |
| RUN-0004 | RUN-0005 | RUN-0001 | observer |
| RUN-0005 | RUN-0007 | RUN-0002 | contributor |
| RUN-0006 | RUN-0007 | RUN-0001 | reviewer |
| RUN-0007 | RUN-0003 | RUN-0005 | owner |
| RUN-0008 | RUN-0007 | RUN-0004 | contributor |

**t_vehicle_equipment_specification**

| id | vehicle_equipment_specification |
| --- | --- |
| SPEC-0001 | CAT 320 Excavator |
| SPEC-0002 | Emergency Response |
| SPEC-0003 | Scania R500 |
| SPEC-0004 | Medium Duty |
| SPEC-0005 | Volvo FH16 |
| SPEC-0006 | Mercedes Sprinter |

**t_vehicle_equipment_specification_applies_to_vehicle_class**

| id | applies_to_vehicle_class |
| --- | --- |
| SPEC-0001 | Tesla Model Y |
| SPEC-0002 | Daf XF105 |
| SPEC-0003 | Toyota Hilux |
| SPEC-0004 | Light Utility Vehicle |
| SPEC-0005 | Ford F-150 |
| SPEC-0006 | Hybrid Electric |

**t_vehicle_equipment_specification__applies_to_vehicle_class**

| id | vehicle_id | applies_to_vehicle_class_id | role |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0005 | SPEC-0001 | contributor |
| SPEC-0002 | SPEC-0002 | SPEC-0005 | owner |
| SPEC-0003 | SPEC-0006 | SPEC-0004 | owner |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | reviewer |
| SPEC-0005 | SPEC-0001 | SPEC-0004 | reviewer |
| SPEC-0006 | SPEC-0006 | SPEC-0005 | contributor |
| SPEC-0007 | SPEC-0003 | SPEC-0003 | contributor |
| SPEC-0008 | SPEC-0001 | SPEC-0005 | owner |

**t_vehicle_equipment_specification_mandates_component**

| id | mandates_component |
| --- | --- |
| SPEC-0001 | Diesel Particulate Filter |
| SPEC-0002 | cache-warmup-ops |
| SPEC-0003 | pipeline-stage-alpha |
| SPEC-0004 | data-sync-nightly |
| SPEC-0005 | Auxiliary Power Unit |
| SPEC-0006 | pipeline-stage-alpha |

**t_vehicle_equipment_specification__mandates_component**

| id | vehicle_id | mandates_component_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SPEC-0001 | SPEC-0004 | SPEC-0003 | observer | Cardinality Note 01 |
| SPEC-0002 | SPEC-0003 | SPEC-0002 | contributor | Cardinality Note 02 |
| SPEC-0003 | SPEC-0006 | SPEC-0001 | contributor | Cardinality Note 03 |
| SPEC-0004 | SPEC-0006 | SPEC-0006 | observer | Cardinality Note 04 |
| SPEC-0005 | SPEC-0006 | SPEC-0006 | owner | Cardinality Note 05 |
| SPEC-0006 | SPEC-0005 | SPEC-0004 | observer | Cardinality Note 06 |
| SPEC-0007 | SPEC-0002 | SPEC-0005 | contributor | Cardinality Note 07 |
| SPEC-0008 | SPEC-0005 | SPEC-0004 | owner | Cardinality Note 08 |

Component mandates form a parallel governance layer, where each specification declares which vehicle components it requires. The mandated components range from physical hardware such as the Diesel Particulate Filter to operational constructs like cache-warmup-ops, pipeline-stage-alpha, and data-sync-nightly, reflecting a schema that accommodates both mechanical and procedural compliance requirements. The specification-to-component relationship is similarly mediated through a junction table that introduces a cardinality note—Cardinality Note 01 through Cardinality Note 04—providing additional constraint metadata that qualifies the strength or nature of the mandate. Within this relationship, roles again distinguish the relational posture: SPEC-0004 observes the mandate of SPEC-0003, while SPEC-0006 both contributes to and observes mandates involving SPEC-0001 and SPEC-0006 respectively, indicating that compliance obligations can be shared, monitored, or jointly enforced across specifications.

The allocation tracking subsystem operates as a parallel but structurally analogous framework, mapping resource allocations to execution contexts. Allocation entries—identified by keys such as RUN-0001 through RUN-0004—are associated with concrete items including Engine Block Heater, Roof Spoiler, Telematics Unit, and Adaptive Cruise Control, and are further contextualized through run identifiers like exec-token-4491, job-context-99a, tx-id-7721b, and run-7a2b4c1d. The junction table connecting allocations to run identifiers employs the same role-based relationship model, with entries recording observer and reviewer designations that establish accountability chains for each allocation within a given execution context. Notably, the cross-referencing is not constrained to same-range identifiers: RUN-0001 maps to RUN-0003 as its target, while RUN-0004 references RUN-0007, indicating that allocation relationships can span beyond the immediate set of defined allocations.

**t_allocation_at_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | Engine Block Heater |
| RUN-0002 | Roof Spoiler |
| RUN-0003 | Telematics Unit |
| RUN-0004 | Adaptive Cruise Control |
| RUN-0005 | data-sync-nightly |
| RUN-0006 | Engine Block Heater |
| RUN-0007 | Adaptive Cruise Control |

**t_allocation_at_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | exec-token-4491 |
| RUN-0002 | job-context-99a |
| RUN-0003 | tx-id-7721b |
| RUN-0004 | run-7a2b4c1d |
| RUN-0005 | run-hash-66d |
| RUN-0006 | epoch-tag-8812 |
| RUN-0007 | pipeline-run-zeta |
| RUN-0008 | job-context-99a |

Dataset provenance and metadata are captured through a fact-dimension pairing that records attribution, size, and version information. The fact table, identified by keys such as ATTR-0001 through ATTR-0004, stores quantitative measures including size in bytes—values ranging from 31,504,133 to 676,110,880—and version numbers spanning from 2 to 10. Each fact record references a dimension entry through the was_attributed_to_key column, which itself carries a human-readable label and a categorical classification. The dimension table provides the semantic context for these attributions, with labels such as Was Attributed To Label 01 and categories such as Was Attributed To Category 01, establishing a lookup structure that decouples stable categorical definitions from the mutable quantitative facts that reference them. This separation of fact and dimension follows a star-schema pattern that supports efficient analytical queries while maintaining data integrity through foreign-key constraints.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |