---
chapter_id: ch_live_schemaorg_event_location_e13aba
topic_id: 183
family: 07_long_tail
cited_terms: ['schemaorg_event_location', 'soc2_privacy_subclass', 'measurement_of_artifact']
model: engine-refine
---

In governed data architectures, every observable thing is first identified before it can be described. An identifier serves as the immutable handle for an entity—the discrete unit of interest that the system tracks over time. Within the event-location domain, identifiers such as LOCA-0001 and LOCA-0002 anchor records that map to concrete schemaorg values like audit-log-archive and data-lake-ingestion-job, while their associated event_location references (ARTI-0001, ARTI-0006, ARTI-0003) tie those logical records to physical or logical artifacts. Similarly, the measurement-of-artifact domain uses identifiers ARTI-0001 through ARTI-0004 to anchor measurements such as latency_p99_ms, yield_stress_test, and pressure_transducer, and the SOC2 privacy domain employs identifiers PRIV-0001 through PRIV-0004 to classify control statements like SOC1-Control-Statement and SOC2-Processing-Integrity. The identifier is the stable key that allows attributes, values, and relationships to be resolved unambiguously across the system.

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | ARTI-0001 |
| LOCA-0002 | data-lake-ingestion-job | ARTI-0001 |
| LOCA-0003 | provenance-trace-record | ARTI-0006 |
| LOCA-0004 | provenance-trace-record | ARTI-0003 |
| LOCA-0005 | field-observation-dataset | ARTI-0006 |
| LOCA-0006 | governance-policy-update | ARTI-0006 |
| LOCA-0007 | lab-sample-tracker | ARTI-0003 |
| LOCA-0008 | field-observation-dataset | ARTI-0006 |

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

**t_soc2_privacy_subclass**

| id | soc |
| --- | --- |
| PRIV-0001 | SOC1-Control-Statement |
| PRIV-0002 | SOC1-TypeII |
| PRIV-0003 | SOC2-Processing-Integrity |
| PRIV-0004 | SOC1-TypeII |
| PRIV-0005 | SOC1-TypeII |
| PRIV-0006 | SOC2-Business-Critical |

**t_soc2_privacy_subclass_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| PRIV-0001 | incidentResponse |
| PRIV-0002 | incidentResponse |
| PRIV-0003 | securityCriteria |
| PRIV-0004 | dataRetention |
| PRIV-0005 | encryptionStandards |
| PRIV-0006 | securityCriteria |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Once an entity is identified, its properties are captured through attributes—named characteristics that describe what the entity is or how it behaves. The attribute definition itself is a two-part construct: the attr_name specifies the semantic label, and the attr_type declares the data type that constrains the values the attribute can hold. In the event-location schema, attributes include checksum, created_date, identifier, and license, each typed as xsd:string, xsd:date, cco:DesignativeICE, or xsd:string respectively. The measurement-of-artifact schema defines attributes such as confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). This separation of attribute definition from attribute value is deliberate: it allows the schema to evolve independently of the data, enabling new attributes to be declared without restructuring existing records.

**t_measurement_of_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

Attribute values are stored in type-specific value tables, a design that enforces type safety while keeping the schema normalized. String-valued attributes flow into varchar tables, where LOCA-0001 carries values like c0ffee42 for its checksum, ref-8842 for its identifier, Apache-2.0 for its license, and ap-south-2 for an additional property. Integer-valued attributes reside in int tables, with LOCA-0001 holding 400 and 6 across two distinct attributes, and LOCA-0002 holding 223 and 6. Date and datetime values are stored in their own tables: created_date attributes for event locations resolve to dates such as 2024-05-14, 2024-02-21, 2023-06-13, and 2023-08-21, while recorded_at attributes for measurements capture precise timestamps like 2023-05-19T07:46:35 and 2024-05-29T07:18:18. Decimal values, including confidence scores of 0.670 and 0.088 and numeric properties of 226.14 and 361.86, are stored separately in decimal value tables. The entity_id and attr_id columns in each value table form a composite foreign key that links a specific value back to the entity and attribute it describes, ensuring referential integrity across the type-dispatched storage.

Beyond describing individual entities, the system models relationships between them through subject-target-role triples. The SOC2 privacy subclass junction table exemplifies this pattern: it connects a soc_id (the subject) to a for_s_o_c2_domain_id (the target) through a role that defines the nature of the relationship. In practice, PRIV-0003 acts as both contributor and owner depending on which domain it is linked to—contributing to PRIV-0001 and owning PRIV-0003—while PRIV-0006 and PRIV-0002 appear as contributors to PRIV-0005 and PRIV-0006 respectively. This three-column structure (subject, target, role) generalizes beyond SOC2 compliance: it is the canonical pattern for expressing directed, typed relationships in a way that supports both query flexibility and semantic clarity. The role column is particularly important because it disambiguates the direction and purpose of the relationship, ensuring that the same pair of entities can participate in multiple distinct relationships without ambiguity.

**t_soc2_privacy_subclass__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| PRIV-0001 | PRIV-0003 | PRIV-0001 | contributor |
| PRIV-0002 | PRIV-0006 | PRIV-0005 | contributor |
| PRIV-0003 | PRIV-0003 | PRIV-0003 | owner |
| PRIV-0004 | PRIV-0002 | PRIV-0006 | contributor |
| PRIV-0005 | PRIV-0003 | PRIV-0003 | contributor |
| PRIV-0006 | PRIV-0005 | PRIV-0006 | contributor |
| PRIV-0007 | PRIV-0006 | PRIV-0003 | observer |
| PRIV-0008 | PRIV-0002 | PRIV-0002 | observer |