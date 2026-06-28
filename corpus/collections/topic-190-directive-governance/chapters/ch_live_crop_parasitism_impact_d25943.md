---
chapter_id: ch_live_crop_parasitism_impact_d25943
topic_id: 190
family: 08_derived
cited_terms: ['crop_parasitism_impact', 'observation_precedes_other', 'cardinality_exactly_one_generic']
model: engine-refine
---

Crop parasitism impact assessment sits at the intersection of agronomic science, household livelihood analysis, and operational governance: each recorded impact instance—such as Crop Parasitism Impact 01 through Crop Parasitism Impact 04, keyed under stable identifiers like IMPA-0001—represents a documented claim about how parasitic organisms degrade cultivated production. These impacts are not isolated facts; they are anchor points in a wider evidence chain. An impact record gains operational meaning only when it is linked to the cultivation context it affects, the weed species that parasitises the host crop, and the agricultural households that bear the consequence. Governance frameworks treat such identifiers as durable references so that field observations, extension advisories, and compliance audits can cite the same impact object across seasons without ambiguity.

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

**t_crop_parasitism_impact_affects_cultivation_system**

| id | affects_cultivation_system |
| --- | --- |
| IMPA-0001 | Affects Cultivation System 01 |
| IMPA-0002 | Affects Cultivation System 02 |
| IMPA-0003 | Affects Cultivation System 03 |
| IMPA-0004 | Affects Cultivation System 04 |
| IMPA-0005 | Affects Cultivation System 05 |
| IMPA-0006 | Affects Cultivation System 06 |
| IMPA-0007 | Affects Cultivation System 07 |
| IMPA-0008 | Affects Cultivation System 08 |

**t_crop_parasitism_impact_parasitises_host**

| id | parasitises_host |
| --- | --- |
| IMPA-0001 | Parasitises Host 01 |
| IMPA-0002 | Parasitises Host 02 |
| IMPA-0003 | Parasitises Host 03 |
| IMPA-0004 | Parasitises Host 04 |
| IMPA-0005 | Parasitises Host 05 |
| IMPA-0006 | Parasitises Host 06 |
| IMPA-0007 | Parasitises Host 07 |

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

The parasitic-weed dimension captures the biological mechanism. Each impact associates with a parasitises-host characterization—Parasitises Host 01 through Parasitises Host 04—describing which parasitic weed taxon or infestation profile is implicated. Relationship tables bind impact subjects to host targets with explicit roles: contributor and observer assignments on links such as IMPA-0004 parasitising IMPA-0007, or IMPA-0002 linked to IMPA-0001, signal who originated the association versus who attested it. Cardinality notes—Cardinality Note 01 through Cardinality Note 04 on these edges—document whether the modeled relationship permits one host per impact, many hosts, optional linkage, or mandatory pairing. Without cardinality notes, integrators cannot tell whether duplicate host associations represent data errors or legitimate multi-parasite scenarios.

Rice cultivation systems form the agronomic scope within which parasitism manifests. An impact may affect Affects Cultivation System 01 through Affects Cultivation System 04, but the binding to a specific system instance—such as IMPA-0006 targeted by both IMPA-0001 and IMPA-0002, or IMPA-0002 targeted by IMPA-0003—depends on junction records that carry role semantics. Where every cultivation-system link in the sample carries role owner, the framework encodes custodial responsibility: a designated party maintains the authoritative mapping between impact assessment and the rice system taxonomy (irrigated lowland, rainfed upland, direct-seeded, transplant-based, and similar classifications). This separation between display labels and resolved foreign keys allows cultivation-system vocabularies to evolve while impact histories remain traceable.

**t_crop_parasitism_impact__affects_cultivation_system**

| id | crop_id | affects_cultivation_system_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0006 | owner |
| IMPA-0002 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0003 | IMPA-0002 | IMPA-0002 | owner |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0005 | IMPA-0001 | IMPA-0001 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0007 | contributor |
| IMPA-0007 | IMPA-0002 | IMPA-0003 | observer |
| IMPA-0008 | IMPA-0002 | IMPA-0003 | reviewer |

Downstream effects land on agricultural households. Impacts Target 01 through Impacts Target 04 name the household entities—farming units whose yield, input costs, or food security are materially affected. Household linkage again uses role and cardinality note, but adds since, a temporal validity stamp recording when the relationship became effective. A household observed under role observer since 2024-06-04 differs from one owned since 2023-10-26: the former may reflect monitoring without operational authority, while the latter establishes accountable stewardship over the impact-to-household assertion. Cardinality notes on household edges prevent silent many-to-many explosions—critical when subsidy eligibility or compensation programs require exactly one accountable household per impact tier.

Identifiers and entities provide the structural backbone. Every governed object—impact, household, weed host, cultivation system, observation event—receives an identifier serving as the join key across attribute stores and relationship tables. The entity reference in typed value tables points back to whichever identifier owns a given fact, while attr names declare what is being asserted and attr_type enforces how values must be interpreted. Duration in seconds maps to xsd:decimal; end times to xsd:dateTime; exit codes to xsd:integer; host names to xsd:string. Storing values in a misc column per type-specific table keeps validation local: a decimal slot cannot accidentally hold a hostname string, and auditors can query each type domain independently.

**t_observation_precedes_other_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0002 | 2023-06-01T02:07:24 |
| OTHE-0002 | OTHE-0001 | OTHE-0008 | 2024-03-08T22:48:06 |
| OTHE-0003 | OTHE-0001 | OTHE-0009 | 2024-11-20T05:59:50 |
| OTHE-0004 | OTHE-0002 | OTHE-0002 | 2024-10-01T01:54:05 |
| OTHE-0005 | OTHE-0002 | OTHE-0008 | 2023-05-04T16:55:24 |
| OTHE-0006 | OTHE-0002 | OTHE-0009 | 2025-04-07T12:49:05 |
| OTHE-0007 | OTHE-0003 | OTHE-0002 | 2025-01-06T09:52:42 |
| OTHE-0008 | OTHE-0003 | OTHE-0008 | 2024-04-17T14:38:04 |

**t_observation_precedes_other_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0001 | 1684.40 |
| OTHE-0002 | OTHE-0002 | OTHE-0001 | 6255.67 |
| OTHE-0003 | OTHE-0003 | OTHE-0001 | 601.58 |
| OTHE-0004 | OTHE-0004 | OTHE-0001 | 5555.66 |
| OTHE-0005 | OTHE-0005 | OTHE-0001 | 2575.99 |
| OTHE-0006 | OTHE-0006 | OTHE-0001 | 3246.85 |
| OTHE-0007 | OTHE-0007 | OTHE-0001 | 663.52 |

**t_observation_precedes_other_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0003 | 701 |
| OTHE-0002 | OTHE-0001 | OTHE-0007 | 352 |
| OTHE-0003 | OTHE-0002 | OTHE-0003 | 884 |
| OTHE-0004 | OTHE-0002 | OTHE-0007 | 291 |
| OTHE-0005 | OTHE-0003 | OTHE-0003 | 330 |
| OTHE-0006 | OTHE-0003 | OTHE-0007 | 402 |
| OTHE-0007 | OTHE-0004 | OTHE-0003 | 564 |
| OTHE-0008 | OTHE-0004 | OTHE-0007 | 418 |

**t_observation_precedes_other_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OTHE-0001 | OTHE-0001 | OTHE-0004 | node-a01 |
| OTHE-0002 | OTHE-0001 | OTHE-0005 | Log Level 02 |
| OTHE-0003 | OTHE-0001 | OTHE-0006 | execution |
| OTHE-0004 | OTHE-0001 | OTHE-0010 | pending |
| OTHE-0005 | OTHE-0001 | OTHE-0011 | Triggered By 05 |
| OTHE-0006 | OTHE-0002 | OTHE-0004 | worker-07 |
| OTHE-0007 | OTHE-0002 | OTHE-0005 | Log Level 07 |
| OTHE-0008 | OTHE-0002 | OTHE-0006 | execution |

The observation-precedes-other pattern extends the same governance logic to temporal and causal sequencing outside pure agronomy—illustrating how the framework generalizes. Observations such as server_disk_full or packet_drop_event precede downstream events like firmware_update_init or power_stabilization, with attributes attached per entity: node-a01 as host_name, 1684.40 seconds as duration, 701 as exit_code, 2023-06-01T02:07:24 as end_time. Whether the subject is parasitic weed pressure or infrastructure telemetry, the model is identical—typed attributes hung on identified entities, related by precedence edges whose semantics downstream systems consume for alerting, root-cause analysis, or compliance timelines.

**t_observation_precedes_other**

| id | observation | precedes |
| --- | --- | --- |
| OTHE-0001 | server_disk_full | firmware_update_init |
| OTHE-0002 | server_disk_full | firmware_update_init |
| OTHE-0003 | server_disk_full | system_boot_sequence |
| OTHE-0004 | packet_drop_event | power_stabilization |
| OTHE-0005 | sensor_calibration_cycle | sensor_warmup_phase |
| OTHE-0006 | sensor_calibration_cycle | data_buffer_reset |
| OTHE-0007 | server_disk_full | config_load_event |

**t_observation_precedes_other_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OTHE-0001 | duration_seconds | xsd:decimal |
| OTHE-0002 | end_time | xsd:dateTime |
| OTHE-0003 | exit_code | xsd:integer |
| OTHE-0004 | host_name | xsd:string |
| OTHE-0005 | log_level | xsd:string |
| OTHE-0006 | phase | xsd:string |
| OTHE-0007 | retry_count | xsd:integer |
| OTHE-0008 | scheduled_at | xsd:dateTime |

Cardinality constraints at the policy layer close the loop. Rules such as ExclusiveOwner and StrictParent, applied to related objects like CoreService, SingleSource, DesignatedOwner, and SourceSystem, state invariants that relationship data must satisfy: exclusive ownership forbids competing authoritative roles on the same edge class, while strict parentage requires every child relation to resolve through exactly one parent context. Mapped back to crop parasitism, an ExclusiveOwner constraint on cultivation-system linkage would reject a second owner on IMPA-0006, and StrictParent would require every parasitises-host edge to roll up under a single impact parent. Together, cropparasitismimpact records, role-qualified relationships to ricecultivationsystem and parasiticweed entities, household impacts_target assertions with since provenance, typed attr bindings on identified entities, and cardinality notes plus generic cardinality rules form a coherent operational guide: document the impact, scope it to cultivation systems and biological agents, attribute consequences to agricultural households with temporal and custodial clarity, and enforce structural limits so evidence remains auditable under compliance review.

**t_crop_parasitism_impact__parasitises_host**

| id | crop_id | parasitises_host_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0004 | IMPA-0003 | contributor | Cardinality Note 01 |
| IMPA-0002 | IMPA-0006 | IMPA-0001 | observer | Cardinality Note 02 |
| IMPA-0003 | IMPA-0005 | IMPA-0004 | contributor | Cardinality Note 03 |
| IMPA-0004 | IMPA-0001 | IMPA-0007 | observer | Cardinality Note 04 |
| IMPA-0005 | IMPA-0001 | IMPA-0003 | reviewer | Cardinality Note 05 |
| IMPA-0006 | IMPA-0006 | IMPA-0002 | contributor | Cardinality Note 06 |
| IMPA-0007 | IMPA-0004 | IMPA-0005 | observer | Cardinality Note 07 |
| IMPA-0008 | IMPA-0004 | IMPA-0002 | reviewer | Cardinality Note 08 |

**t_crop_parasitism_impact__impacts_target**

| id | crop_id | impacts_target_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 01 | 2024-06-04 |
| IMPA-0002 | IMPA-0006 | IMPA-0004 | reviewer | Cardinality Note 02 | 2023-03-28 |
| IMPA-0003 | IMPA-0003 | IMPA-0002 | observer | Cardinality Note 03 | 2023-09-02 |
| IMPA-0004 | IMPA-0003 | IMPA-0002 | owner | Cardinality Note 04 | 2023-10-26 |
| IMPA-0005 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 05 | 2023-11-01 |
| IMPA-0006 | IMPA-0002 | IMPA-0001 | observer | Cardinality Note 06 | 2023-08-27 |
| IMPA-0007 | IMPA-0001 | IMPA-0005 | contributor | Cardinality Note 07 | 2025-05-05 |
| IMPA-0008 | IMPA-0003 | IMPA-0001 | contributor | Cardinality Note 08 | 2024-10-30 |

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |