---
chapter_id: ch_live_instrument_with_function_48a4ee
topic_id: 155
family: 01_foundation
cited_terms: ['instrument_with_function', 'intermediate_floor_assembly', 'internal_communication_requirement']
model: engine-refine
---

Within the instrument function registry, each realized capability—Signal Amplification, Temperature Measurement, Concentration Quantification, Gas Composition—is anchored by a stable identifier such as FUNC-0001 through FUNC-0004, and the functional mapping itself is expressed through the instrument column, which records the physical or logical device responsible, from Keysight DSOX3024T oscilloscopes to Thermo Q Exactive mass spectrometers to Zygo NewView interferometers to Agilent 5975C chromatographs. The attribute system operates orthogonally to this core mapping: the attribute definition table enumerates metadata properties—checksum, created_date, identifier, license—each declared with a precise type constraint, whether xsd:string for free-form text, xsd:date for temporal values, or cco:DesignativeICE for controlled designative identifiers. These typed attributes are then materialized across three value tables partitioned by domain, so that the checksum a3f9c21e and the license MPL-2.0 and the region us-east-1 and the reference ref-8842 all resolve as varchar values attached to their respective attribute definitions, while created_date values such as 2024-09-19, 2023-09-07, 2024-09-12, and 2024-08-15 are stored in the date-specific table, and integer-valued attributes like 359, 4, 439, and 6 occupy the integer partition. The entity column in each value table serves as the foreign key binding a particular attribute value back to the instrument-with-function record it qualifies, establishing a normalized star schema where the attribute definition acts as the central dimension and the three value tables function as type-specialized fact tables.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | Signal Amplification |
| FUNC-0002 | Thermo Q Exactive | Temperature Measurement |
| FUNC-0003 | Zygo NewView | Concentration Quantification |
| FUNC-0004 | Agilent 5975C | Gas Composition |
| FUNC-0005 | Agilent 5975C | Gas Composition |
| FUNC-0006 | Agilent 5975C | Pressure Monitoring |

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |

The intermediate floor assembly table captures a parallel structural taxonomy for physical infrastructure, where assemblies such as the Gearbox Intermediate Shelf, Motor Mount Deck, Wing Spar Floor, and a second Motor Mount Deck entry are each associated with a contained component—Retaining Clip, Locking Clevis, Shear Pin Assembly, Damping Mount—forming a containment hierarchy that mirrors the attribute-value decomposition but operates over mechanical parts rather than metadata properties. The lateral restraint strap column, though present in the schema, does not appear populated in the current dataset, suggesting either an optional containment relationship or a component class reserved for future assembly definitions.

**t_intermediate_floor_assembly**

| id | intermediate_floor_assembly | contains_component |
| --- | --- | --- |
| ASSE-0001 | Gearbox Intermediate Shelf | Retaining Clip |
| ASSE-0002 | Motor Mount Deck | Locking Clevis |
| ASSE-0003 | Wing Spar Floor | Shear Pin Assembly |
| ASSE-0004 | Motor Mount Deck | Damping Mount |

The internal communication requirement table governs organizational messaging through a structured set of constraints: each requirement—Remote Work Policy Update, Employee Feedback Loop Mandate, Incident Response Notification Rule—specifies the enterprise social media platform on which it is enacted, whether Yammer, Discord Internal, or Chatter, and declares the organizational communication goal it serves, ranging from Safety Protocol Awareness and Change Management Adoption to Regulatory Compliance. The review cycle days column imposes a temporal governance cadence, with values of 750, 478, 606, and 186 days dictating how frequently each requirement must be re-evaluated, while the language column—en for English, ja for Japanese—ensures that the requirement is authored and disseminated in the appropriate linguistic register. This table thus functions as a policy registry, coupling communication channels to strategic objectives with explicit review frequencies and language constraints, creating an auditable chain from organizational goal through platform specification to temporal compliance obligation.

**t_internal_communication_requirement**

| id | internal_communication_requirement | specifies_platform | targets_goal | review_cycle_days | language |
| --- | --- | --- | --- | --- | --- |
| REQU-0001 | Remote Work Policy Update | Yammer | Safety Protocol Awareness | 750 | en |
| REQU-0002 | Employee Feedback Loop Mandate | Discord Internal | Change Management Adoption | 478 | en |
| REQU-0003 | Employee Feedback Loop Mandate | Chatter | Regulatory Compliance | 606 | ja |
| REQU-0004 | Incident Response Notification Rule | Yammer | Regulatory Compliance | 186 | en |
| REQU-0005 | Q3 Transparency Directive | Yammer | Regulatory Compliance | 572 | en |
| REQU-0006 | Internal Knowledge Sharing Standard | Mattermost | Culture Reinforcement | 940 | ja |