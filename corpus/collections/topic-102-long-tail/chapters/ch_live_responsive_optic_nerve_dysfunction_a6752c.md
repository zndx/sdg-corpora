---
chapter_id: ch_live_responsive_optic_nerve_dysfunction_a6752c
topic_id: 102
family: 08_derived
cited_terms: ['responsive_optic_nerve_dysfunction', 'ice_about_artifact', 'outlier_claim_subclass']
model: engine-refine
---

Within the ontology, an identifier serves as the immutable primary key that anchors every entity, whether it denotes a clinical observation such as `DYSF-0001` through `DYSF-0004`, an artifact record like `ARTI-0001` through `ARTI-0004`, or an outlier claim enumerated as `CLAI-0001` through `CLAI-0004`. These identifiers are not arbitrary; they encode the semantic domain of their parent entity through a prefix convention—`DYSF` for dysfunction records, `ARTI` for artifacts, and `CLAI` for claims—thereby enabling rapid classification without requiring a join. The entity itself is the concrete instance to which attributes are bound. In the artifact valuation table, for example, `entity_id` values such as `ARTI-0001` and `ARTI-0002` designate the specific artifacts whose properties are being recorded, and each entity may carry multiple attribute-value pairs, as evidenced by `ARTI-0001` appearing three times with distinct `attr_id` references.

**t_ice_about_artifact**

| id | ice |
| --- | --- |
| ARTI-0001 | Compliance-Audit-Log |
| ARTI-0002 | Supply-Chain-Declaration |
| ARTI-0003 | Calibration-Certificate-2024 |
| ARTI-0004 | Calibration-Certificate-2024 |
| ARTI-0005 | Design-Specification-Draft |
| ARTI-0006 | Validation-Protocol-7B |

**t_ice_about_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | encoding | xsd:string |
| ARTI-0002 | label_text | xsd:string |
| ARTI-0003 | language | xsd:string |

**t_ice_about_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | calibration record |
| ARTI-0003 | ARTI-0001 | ARTI-0003 | es |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | Encoding 04 |
| ARTI-0005 | ARTI-0002 | ARTI-0002 | calibration record |
| ARTI-0006 | ARTI-0002 | ARTI-0003 | de |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | Encoding 07 |
| ARTI-0008 | ARTI-0003 | ARTI-0002 | nightly summary |

An attribute (`attr`) is a named property of an entity, defined in the attribute definition table by `attr_name` and constrained by `attr_type`. The attribute definition table records properties such as `encoding`, `label_text`, and `language`, each typed as `xsd:string`, establishing a schema-level contract that all corresponding values must conform to. The `attr_type` column thus functions as a type guard: every value in the valuation table is implicitly validated against the type declared in the attribute definition table. This separation of attribute metadata from attribute values permits schema evolution—new attributes can be registered without altering existing data—and supports heterogeneous entity types, since the same attribute definition can be referenced by entities from different domains. The `misc` column in the valuation table holds the actual property values: `Encoding 01`, `calibration record`, `es`, and `Encoding 04` are the concrete instantiations bound to their respective `attr_id` and `entity_id` pairs.

The clinical domain employs a parallel structure but with domain-specific categorical classifications. The responsive optic nerve dysfunction table records observations keyed by identifiers such as `DYSF-0001` through `DYSF-0004`, each carrying three categorical columns: `responsive` (with values `Focal Response` and `Diffuse Response`), `optic_nerve_dysfunction` (encompassing `MT-ND6 Strain`, `Secondary Atrophy`, `Nutritional Deficit`, and `Hereditary Degeneration`), and `leber_optic_atrophy` (spanning `Hereditary Degeneration`, `Nutritional Deficit`, `Bilateral Atrophy`, and `Focal Atrophy`). The `leberopticatrophy` classification and the `opticnervedysfunction` classification are not independent; they co-occur within the same record, implying a clinical relationship where a single patient observation is simultaneously characterized by its dysfunction etiology and its atrophy phenotype. For instance, `DYSF-0001` associates `MT-ND6 Strain` dysfunction with `Hereditary Degeneration` atrophy, while `DYSF-0002` pairs `Secondary Atrophy` with `Nutritional Deficit`, suggesting that the taxonomy captures comorbid diagnostic dimensions rather than mutually exclusive categories.

**t_responsive_optic_nerve_dysfunction**

| id | responsive | optic_nerve_dysfunction | leber_optic_atrophy |
| --- | --- | --- | --- |
| DYSF-0001 | Focal Response | MT-ND6 Strain | Hereditary Degeneration |
| DYSF-0002 | Focal Response | Secondary Atrophy | Nutritional Deficit |
| DYSF-0003 | Diffuse Response | Nutritional Deficit | Bilateral Atrophy |
| DYSF-0004 | Focal Response | Hereditary Degeneration | Focal Atrophy |
| DYSF-0005 | Bilateral Response | Primary Atrophy | Papilledema |
| DYSF-0006 | Left Optic Response | Hereditary Degeneration | MT-ND6 Strain |
| DYSF-0007 | Left Optic Response | Compressive Lesion | Ischemic Optic Neuropathy |

In the anomaly-explanation domain, the relationship between subject and target is mediated by a junction table that introduces `role` as a third dimension of association. The outlier claim subclass table defines outlier types—`Network_Bandwidth_Spike`, `Patient_Vital_Anomaly`, `Log_Flood_Event`—each identified by a `CLAI`-prefixed key. A separate mapping table links each outlier to the context in which it is observed: `Automotive_Test_Drive`, `Power_Grid_Substation`, and `Financial_Trading_Queue` appear as the `explains_anomaly_in` values. The junction table then binds a `subject` (an `outlier_id`) to a `target` (an `explains_anomaly_in_id`) under a specific `role`, which takes the values `reviewer`, `owner`, or `observer`. The same outlier identifier, `CLAI-0001`, appears twice in the junction table with different roles—`reviewer` when linked to `CLAI-0005` and `observer` when linked to `CLAI-0006`—demonstrating that role is not a property of the outlier itself but a contextual assignment that varies per relationship instance. This triadic structure (subject, target, role) generalizes beyond binary associations and supports the modeling of multi-party investigative workflows where the same anomaly may be reviewed, owned, and observed by different parties across different contexts.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |