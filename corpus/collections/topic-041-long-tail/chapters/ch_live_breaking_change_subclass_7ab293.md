---
chapter_id: ch_live_breaking_change_subclass_7ab293
topic_id: 41
family: 07_long_tail
cited_terms: ['breaking_change_subclass', 'outlier_claim_supported_by_lift', 'schemaorg_event_location']
model: engine-refine
---

The architecture of the provenance and anomaly-tracking system rests on a disciplined separation between attribute definition and attribute value, a pattern that enforces type safety while permitting heterogeneous value storage. Each attribute is declared with a name and an XML Schema datatype—`confidence` as `xsd:decimal`, `dimension_kind` as `xsd:string`, `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`—and its values are materialized in dedicated value tables keyed by the attribute's own identifier. This design ensures that a decimal value such as `0.203` or `700.59` can only be associated with an attribute whose declared type is `xsd:decimal`, while a timestamp like `2023-07-26T14:07:49` is constrained to an `xsd:dateTime` attribute. The same principle extends across event-location records, where attributes such as `checksum` and `license` carry the `xsd:string` type, `created_date` carries `xsd:date`, and `identifier` carries the custom type `cco:DesignativeICE`, with their respective values stored in type-specific tables and linked back through the attribute's unique identifier.

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | LIFT-0007 |
| LOCA-0002 | data-lake-ingestion-job | LIFT-0005 |
| LOCA-0003 | provenance-trace-record | LIFT-0005 |
| LOCA-0004 | provenance-trace-record | LIFT-0007 |
| LOCA-0005 | field-observation-dataset | LIFT-0003 |
| LOCA-0006 | governance-policy-update | LIFT-0002 |
| LOCA-0007 | lab-sample-tracker | LIFT-0002 |
| LOCA-0008 | field-observation-dataset | LIFT-0003 |

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

Entities in this schema are identified by opaque, prefix-qualified identifiers that encode both their semantic category and their position in a sequence. Breaking-change records carry identifiers such as `CHAN-0001` through `CHAN-0004`, each describing a specific operational disruption—`Telemetry schema evolution`, `Provenance graph migration`, `OAuth2 token rotation`—while outlier claims are identified as `LIFT-0001` through `LIFT-0004`, denoting phenomena like `flow_rate_anomaly`, `voltage_sag_incident`, `seismic_tremor_signal`, and `packet_loss_surge`. Event-location records follow the same convention with identifiers such as `LOCA-0001` through `LOCA-0004`, each associated with a schema.org event type such as `audit-log-archive` or `data-lake-ingestion-job`. These identifiers serve as the primary keys for their respective entity tables and as foreign keys in every value and relationship table, forming the backbone of referential integrity across the schema.

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | LIFT-0001 |
| CHAN-0002 | Telemetry schema evolution | LIFT-0005 |
| CHAN-0003 | Provenance graph migration | LIFT-0006 |
| CHAN-0004 | OAuth2 token rotation | LIFT-0005 |
| CHAN-0005 | Schema field removal | LIFT-0003 |
| CHAN-0006 | Sensor sampling rate drop | LIFT-0001 |
| CHAN-0007 | Provenance graph migration | LIFT-0007 |
| CHAN-0008 | TLS 1.3 enforcement | LIFT-0003 |

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

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
| LIFT-0001 | provenance_chain_hash |
| LIFT-0002 | baseline_variance_report |
| LIFT-0003 | baseline_variance_report |
| LIFT-0004 | provenance_chain_hash |
| LIFT-0005 | validation_rule_match |
| LIFT-0006 | audit_trail_entry |
| LIFT-0007 | anomaly_detection_score |
| LIFT-0008 | historical_trend_chart |

**t_outlier_claim_supported_by_lift_attribute_set**

| id | attribute_set |
| --- | --- |
| LIFT-0001 | frequency_range_limit |
| LIFT-0002 | error_rate_percent |
| LIFT-0003 | confidence_level_95 |
| LIFT-0004 | deviation_sigma_count |
| LIFT-0005 | pressure_tolerance_band |
| LIFT-0006 | detection_window_hours |

Relationships between entities are expressed through junction tables that carry not only subject and target foreign keys but also a role attribute that qualifies the nature of the association. In the relationship between outlier claims and the evidence that supports them, a record with subject `LIFT-0005` and target `LIFT-0007` carries the role `observer`, while a different pairing of subject `LIFT-0007` and target `LIFT-0006` carries the role `reviewer`. The same role-based pattern appears in the association between outlier claims and their attribute sets, where an entity identified as `LIFT-0002` is linked to an attribute set with the role `owner`, and another entity `LIFT-0001` assumes the role `reviewer` in its connection to a different attribute set. This role dimension allows a single pair of entities to participate in multiple distinct relationships without ambiguity, each distinguished by its semantic qualifier.

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

Cardinality constraints are recorded explicitly in the junction tables that link outlier claims to attribute sets, where each relationship row carries a `cardinality_note` field—`Cardinality Note 01` through `Cardinality Note 04`—that documents the multiplicity of the association. These notes serve as operational metadata, capturing the business-rule context of the relationship without encoding it into the schema structure itself. The separation of cardinality from the foreign-key relationship allows the constraint to evolve independently of the referential links, supporting scenarios where the multiplicity of an association changes over time without requiring schema migration.

The value tables themselves are organized by type, with each attribute's values distributed across `val_datetime`, `val_decimal`, `val_varchar`, `val_date`, and `val_int` tables according to the attribute's declared type. A single entity such as `CHAN-0001` may have decimal values (`0.203`), string values (`Dimension Kind 01`, `calibration record`), and a datetime value (`2023-07-26T14:07:49`) stored in three separate tables, each linked back to the entity through its `entity_id` column and to the attribute through its `attr_id` column. This type-partitioned value storage avoids the overhead of generic value columns while preserving the ability to query across types through the shared identifier space. Event-location records follow the same pattern, with `LOCA-0001` carrying a string value `c0ffee42` for its `checksum` attribute, a date value `2024-05-14` for its `created_date`, and an integer value `400` for an unnamed numeric attribute, all retrievable through the same join pattern.

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |