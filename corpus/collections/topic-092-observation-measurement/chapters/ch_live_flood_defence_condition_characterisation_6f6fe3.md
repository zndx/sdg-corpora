---
chapter_id: ch_live_flood_defence_condition_characterisation_6f6fe3
topic_id: 92
family: 08_derived
cited_terms: ['flood_defence_condition_characterisation', 'schemaorg_event_organizer', 'control_min_one_owner']
model: engine-refine
---

Flood defence condition characterisation names the methodological posture an organisation adopts when inferring asset state from observational evidence rather than direct inspection alone. Each characterisation—whether ExpertReviewPanel, GroundTruthSampling, CrossSensorCalibration, or UncertaintyPropagated—commits the programme to a distinct epistemic contract: who adjudicates quality, how ground references enter the chain, whether multiple sensors are harmonised before inference, and whether uncertainty is carried forward into downstream decisions. These are not interchangeable labels; they govern auditability, liability, and the defensibility of condition grades when regulators or insurers challenge a rating. A programme that registers CrossSensorCalibration signals that discrepancies between CopernicusDEM and Sentinel1GRD must be reconciled before a condition score is published, whereas UncertaintyPropagated paired with LiDARBathymetry implies bathymetric precision limits will flow into breach-risk models rather than being collapsed to a single nominal depth.

Earth observation data and validation process form the evidentiary substrate on which characterisations rest. Earth observation data denotes the remote-sensing or derived geospatial products—CopernicusDEM for terrain context, Sentinel1GRD for coherent change detection under cloud, LiDARBathymetry for high-resolution channel geometry—that supply measurable proxies for structural integrity, scour, or overtopping potential. Validation process records how those proxies are checked against independent truth: HistoricalBaselineMatch anchors contemporary readings to a trusted pre-event record; GroundTruthSampling ties model outputs to field measurements; event-specific processes such as SeineBreach2016 encode lessons from a documented failure into repeatable acceptance criteria. When two characterisations both employ LiDARBathymetry yet diverge on validation—GroundTruthSampling versus SeineBreach2016—the distinction is operational: one prioritises statistically representative field corroboration, the other a forensic benchmark from a known breach scenario. Governance systems that persist these pairings make the evidence chain inspectable long after the analyst who ran the workflow has left the programme.

Identifier stability underpins every cross-domain link in such a framework. An identifier is a durable, surrogate key—CHAR-0001 for a characterisation record, ORGA-0003 for an event organiser entity, OWNE-0003 for a control owner—that must remain constant while descriptive content evolves. Without canonical identifiers, attribute values cannot be joined reliably across typed stores, provenance cannot be reconstructed, and compliance controls cannot be mapped to the organisational objects they govern. In practice, identifiers function as the contract between operational registries and metadata layers: a flood characterisation keyed as CHAR-0004 remains addressable even if its display label shifts from UncertaintyPropagated to a revised methodology name, and an organiser ORGA-0001 continues to reference OWNE-0005 as accountable party regardless of conference rebranding.

**t_schemaorg_event_organizer**

| id | schemaorg | organizer |
| --- | --- | --- |
| ORGA-0001 | Edge Compute Fest | OWNE-0005 |
| ORGA-0002 | Telemetry Conference | OWNE-0005 |
| ORGA-0003 | Stream Processing Conclave | OWNE-0006 |
| ORGA-0004 | Governance Workshop | OWNE-0007 |
| ORGA-0005 | Stream Processing Conclave | OWNE-0004 |
| ORGA-0006 | Edge Compute Fest | OWNE-0001 |
| ORGA-0007 | Cloud Observability Meetup | OWNE-0004 |

**t_schemaorg_event_organizer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ORGA-0001 | checksum | xsd:string |
| ORGA-0002 | created_date | xsd:date |
| ORGA-0003 | identifier | cco:DesignativeICE |
| ORGA-0004 | license | xsd:string |
| ORGA-0005 | mime_type | xsd:string |
| ORGA-0006 | size_bytes | xsd:long |
| ORGA-0007 | uri | xsd:string |
| ORGA-0008 | version | xsd:integer |

**t_schemaorg_event_organizer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0006 | 440 |
| ORGA-0002 | ORGA-0001 | ORGA-0008 | 7 |
| ORGA-0003 | ORGA-0002 | ORGA-0006 | 450 |
| ORGA-0004 | ORGA-0002 | ORGA-0008 | 6 |
| ORGA-0005 | ORGA-0003 | ORGA-0006 | 147 |
| ORGA-0006 | ORGA-0003 | ORGA-0008 | 6 |
| ORGA-0007 | ORGA-0004 | ORGA-0006 | 298 |
| ORGA-0008 | ORGA-0004 | ORGA-0008 | 7 |

**t_control_min_one_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Rate Limit Threshold |
| OWNE-0002 | Encryption At Rest |
| OWNE-0003 | RBAC Assignment Policy |
| OWNE-0004 | Backup Retention Directive |
| OWNE-0005 | MFA Enforcement |
| OWNE-0006 | Change Approval Workflow |
| OWNE-0007 | Change Approval Workflow |

**t_control_min_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_min_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 5 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 245 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 1 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 705 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 3 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 899 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 438 |

Entity denotes the governed object to which attributes attach—not the attribute definition itself, but the row in a domain registry that carries business meaning. An entity might be Edge Compute Fest under a schema.org-oriented event model, or RBAC Assignment Policy under a minimum-one-owner control regime; in each case the entity record holds the stable identity while orthogonal attribute catalogues describe what may be said about it. Typed value partitions then store concrete assertions: created_date values of 2024-07-16 and 2023-04-02 for different organisers, or effective_date values spanning 2023-12-25 through 2025-01-07 for successive control revisions. Separating entity from attribute definition prevents schema churn from rewriting historical facts; when Encryption At Rest (OWNE-0002) is marked mandatory true while Rate Limit Threshold remains mandatory false, the boolean is interpreted against a fixed entity identity, not an inlined column that would force destructive migrations on every policy change.

Attr and attr_type together constitute the metadata vocabulary that constrains what misc values may legally occupy storage. An attr is the semantic name of a property—checksum, license, enforcement, priority—while attr_type declares its interpretive grammar: xsd:string for free text or controlled literals, xsd:date for calendar-effective boundaries, xsd:boolean for binary obligations, xsd:integer for ordinal or numeric policy parameters, or domain-specific types such as cco:DesignativeICE for designative identifiers that must resolve within an interchange context. The type system is the enforcement layer: storing CC-BY-4.0 and ap-south-2 in a varchar partition is sound because both attrs are typed xsd:string, whereas placing gid://svc/77 under an attr typed cco:DesignativeICE signals that downstream consumers must validate ICE syntax, not merely parse characters. Misc, in this architecture, is the neutral term for the payload held in a type-matched value store—the actual datum once entity, attr, and attr_type have done their definitional work. A misc value of 440 beside priority on one control and 7 beside a separate integer attr on an organiser record are comparable only after resolving attr_type; conflating unlike misc slots is a common source of silent compliance drift.

**t_schemaorg_event_organizer_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0002 | 2024-07-16 |
| ORGA-0002 | ORGA-0002 | ORGA-0002 | 2023-04-02 |
| ORGA-0003 | ORGA-0003 | ORGA-0002 | 2023-04-02 |
| ORGA-0004 | ORGA-0004 | ORGA-0002 | 2023-04-08 |
| ORGA-0005 | ORGA-0005 | ORGA-0002 | 2023-03-07 |
| ORGA-0006 | ORGA-0006 | ORGA-0002 | 2023-12-15 |
| ORGA-0007 | ORGA-0007 | ORGA-0002 | 2023-05-20 |

**t_schemaorg_event_organizer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0001 | 7b14de08 |
| ORGA-0002 | ORGA-0001 | ORGA-0003 | gid://svc/77 |
| ORGA-0003 | ORGA-0001 | ORGA-0004 | CC-BY-4.0 |
| ORGA-0004 | ORGA-0001 | ORGA-0009 | ap-south-2 |
| ORGA-0005 | ORGA-0001 | ORGA-0005 | application/xml |
| ORGA-0006 | ORGA-0001 | ORGA-0010 | Name 06 |
| ORGA-0007 | ORGA-0001 | ORGA-0011 | platform-team |
| ORGA-0008 | ORGA-0001 | ORGA-0012 | Tags 08 |

**t_control_min_one_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | false |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | false |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | true |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | false |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_min_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2023-12-25 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2023-01-26 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2024-02-04 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2025-01-07 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-09-08 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-04-04 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2024-01-22 |

**t_control_min_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | audit excerpt |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | de |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | pre-release note |

Operationally, these constructs interlock into a governable knowledge graph. Flood defence programmes register characterisations and bind them to earth observation products and validation processes so that condition assessments cite reproducible evidence standards. Parallel metadata planes describe conferences and controls with the same entity–attr–typed-value pattern, enabling unified audit: an organiser’s created_date and checksum attest publication integrity, while a control owner’s enforcement string and priority integer encode how RBAC Assignment Policy is meant to bite in production. Identifier keys thread the domains—ORGA-0003 links schema.org event metadata to OWNE-0006 as organiser accountability—so that operational telemetry governance and geospatial asset assurance can be reviewed under one compliance lens. The design rewards explicit typing over convenience: when mandatory is false for rate limiting but true for encryption, or when SeineBreach2016 validation is chosen over HistoricalBaselineMatch, the decision is recorded as structured fact rather than narrative footnote, which is precisely what regulators, internal audit, and post-incident review require to determine whether observed outcomes matched declared methodology and control intent.

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |