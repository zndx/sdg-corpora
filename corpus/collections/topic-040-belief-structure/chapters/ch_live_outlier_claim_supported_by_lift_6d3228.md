---
chapter_id: ch_live_outlier_claim_supported_by_lift_6d3228
topic_id: 40
family: 02_observation_measurement
cited_terms: ['outlier_claim_supported_by_lift', 'agent_acts_on_behalf_of', 'descriptive_not_retracted']
model: engine-refine
---

In relational data governance, the identifier serves as the immutable anchor of every entity record, a stable reference that persists across all joins and relationship resolutions. Within the outlier claim corpus, identifiers such as LIFT-0001, LIFT-0002, and LIFT-0003 uniquely distinguish individual claims—each tied to a specific anomaly like flow_rate_anomaly, voltage_sag_incident, or seismic_tremor_signal. Similarly, agent records carry identifiers BEHA-0001 through BEHA-0004, anchoring entities such as AuditLogger, LogAggregator, and ProvenanceTracker, while descriptive notes are keyed by RETR-0001 through RETR-0004, referencing artifacts like Sensor Drift Note and Anomaly Flag Sheet. The identifier is not merely a surrogate key; it is the referent that enables cross-table navigation, ensuring that every relationship, attribute assignment, and value binding can be traced back to a single, unambiguous source record.

**t_outlier_claim_supported_by_lift**

| id | outlier |
| --- | --- |
| LIFT-0001 | flow_rate_anomaly |
| LIFT-0002 | voltage_sag_incident |
| LIFT-0003 | seismic_tremor_signal |
| LIFT-0004 | packet_loss_surge |
| LIFT-0005 | pH_deviation_alert |
| LIFT-0006 | network_latency_burst |
| LIFT-0007 | thermal_runaway_event |

**t_outlier_claim_supported_by_lift_supported_by**

| id | supported_by |
| --- | --- |
| LIFT-0001 | calibration_certificate |
| LIFT-0002 | ComplianceAudit |
| LIFT-0003 | spectral_readings |
| LIFT-0004 | historical_trend_chart |
| LIFT-0005 | audit_trail_entry |
| LIFT-0006 | InfrastructureTeam |
| LIFT-0007 | anomaly_detection_score |
| LIFT-0008 | AnalyticsDivision |

**t_outlier_claim_supported_by_lift_attribute_set**

| id | attribute_set |
| --- | --- |
| LIFT-0001 | frequency_range_limit |
| LIFT-0002 | error_rate_percent |
| LIFT-0003 | confidence_level_95 |
| LIFT-0004 | deviation_sigma_count |
| LIFT-0005 | pressure_tolerance_band |
| LIFT-0006 | detection_window_hours |

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

The attribute construct extends an entity's descriptive capacity by defining named properties with formal type constraints. In the descriptive-not-retracted domain, attributes such as confidence, dimension_kind, method, and recorded_at are declared with precise types—xsd:decimal, xsd:string, and xsd:dateTime—establishing a schema-level contract for the values that will later populate them. This separation of attribute definition from attribute value is deliberate: the attr table declares what properties exist and how they are typed, while the value tables (val_datetime, val_decimal, val_varchar) store the actual data. A single entity, RETR-0001, for instance, carries a confidence value of 0.736 (typed as xsd:decimal), a dimension_kind of Dimension Kind 01 (xsd:string), and a recorded_at timestamp of 2024-02-12T07:34:36 (xsd:dateTime), each stored in its type-appropriate value table and linked back through the attr_id foreign key.

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

Relationships between entities are mediated through junction tables that explicitly encode subject, target, and role. The subject column identifies the originating entity in a relationship—the outlier_id in the lift-to-support mapping, or the agent_id in the acts-on-behalf-of mapping—while the target column identifies the recipient entity, such as supported_by_id, attribute_set_id, or acted_on_behalf_of_id. The role column adds semantic precision to the relationship: an agent may act as observer, contributor, owner, or reviewer, and an outlier's linkage to a supporting artifact carries the same role vocabulary. For example, the junction record LIFT-0001 connects outlier LIFT-0005 to support artifact LIFT-0007 with the role of observer, while BEHA-0001 links agent BEHA-0001 to acted_on_behalf_of BEHA-0006 with the role of contributor. This tripartite structure—subject, target, role—ensures that relationships are not implicit graph edges but first-class, queryable, and auditable facts.

**t_outlier_claim_supported_by_lift__supported_by**

| id | outlier_id | supported_by_id | role |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0005 | LIFT-0007 | observer |
| LIFT-0002 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0003 | LIFT-0007 | LIFT-0005 | contributor |
| LIFT-0004 | LIFT-0007 | LIFT-0006 | reviewer |
| LIFT-0005 | LIFT-0007 | LIFT-0008 | reviewer |
| LIFT-0006 | LIFT-0002 | LIFT-0002 | reviewer |
| LIFT-0007 | LIFT-0003 | LIFT-0006 | contributor |
| LIFT-0008 | LIFT-0001 | LIFT-0001 | observer |

**t_outlier_claim_supported_by_lift__attribute_set**

| id | outlier_id | attribute_set_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| LIFT-0001 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 01 |
| LIFT-0002 | LIFT-0007 | LIFT-0001 | contributor | Cardinality Note 02 |
| LIFT-0003 | LIFT-0002 | LIFT-0002 | owner | Cardinality Note 03 |
| LIFT-0004 | LIFT-0001 | LIFT-0001 | reviewer | Cardinality Note 04 |
| LIFT-0005 | LIFT-0006 | LIFT-0004 | contributor | Cardinality Note 05 |
| LIFT-0006 | LIFT-0001 | LIFT-0001 | owner | Cardinality Note 06 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | observer | Cardinality Note 07 |
| LIFT-0008 | LIFT-0005 | LIFT-0004 | contributor | Cardinality Note 08 |

**t_agent_acts_on_behalf_of_acted_on_behalf_of**

| id | acted_on_behalf_of |
| --- | --- |
| BEHA-0001 | historical_trend_chart |
| BEHA-0002 | provenance_chain_hash |
| BEHA-0003 | audit_trail_entry |
| BEHA-0004 | validation_rule_match |
| BEHA-0005 | control_group_results |
| BEHA-0006 | ComplianceAudit |

**t_agent_acts_on_behalf_of__acted_on_behalf_of**

| id | agent_id | acted_on_behalf_of_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0005 | BEHA-0003 | observer |
| BEHA-0002 | BEHA-0001 | BEHA-0006 | contributor |
| BEHA-0003 | BEHA-0003 | BEHA-0001 | owner |
| BEHA-0004 | BEHA-0006 | BEHA-0005 | reviewer |
| BEHA-0005 | BEHA-0003 | BEHA-0002 | observer |
| BEHA-0006 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0007 | BEHA-0005 | BEHA-0001 | contributor |
| BEHA-0008 | BEHA-0006 | BEHA-0006 | owner |

The cardinality note extends the relationship model by annotating the multiplicity constraints governing how entities may participate in a given relationship type. In the outlier-to-attribute-set mapping, each junction record carries a cardinality note—Cardinality Note 01 through Cardinality Note 04—that qualifies the nature of the association between the outlier entity and the attribute set entity. These notes function as metadata about the relationship itself, distinct from both the entities involved and the role they play, providing a mechanism to express constraints such as one-to-one, one-to-many, or many-to-many without hardcoding them into the schema. The presence of cardinality notes alongside roles and foreign keys creates a three-dimensional annotation layer on top of the base relationship graph, enabling downstream systems to reason about permissible cardinalities at query time.

The misc column, appearing as the value field in the type-partitioned value tables, holds the actual data payloads that give entities their descriptive substance. These values span heterogeneous types—decimal numbers like 0.736 and 273.61, timestamps like 2024-08-04T13:26:29, and freeform strings like intake form and es—each stored in its type-specific table to preserve type safety while maintaining a unified entity-centric access pattern. The entity_id column in these value tables is the foreign key that binds a misc value to its owning entity, and the attr_id column binds it to its defining attribute. This design allows a single entity to accumulate an unbounded set of typed attributes without schema modification, while the type partitioning ensures that each value is stored in a column with a compatible SQL type, avoiding the pitfalls of untyped value columns.