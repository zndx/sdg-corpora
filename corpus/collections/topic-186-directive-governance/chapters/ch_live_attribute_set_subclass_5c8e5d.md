---
chapter_id: ch_live_attribute_set_subclass_5c8e5d
topic_id: 186
family: 02_observation_measurement
cited_terms: ['attribute_set_subclass', 'schemaorg_creativework_publisher', 'annotation_at_tier']
model: engine-refine
---

Attributes serve as the fundamental units of metadata within the data catalog, each distinguished by a unique identifier, a human-readable label, and a categorical classification that groups related properties. The attribute dimension organizes these properties into named categories—Attribute Category 01 through Attribute Category 04—each associated with a descriptive label such as Attribute Label 01 or Attribute Label 04. Within the fact layer, attributes are referenced by their keys, with values like SET-0003 and SET-0005 recurring across multiple records to indicate that a single attribute definition can be measured or observed in different contexts. This separation between attribute definition and attribute measurement enables the system to maintain a stable schema while allowing attribute values to vary across entities and time.

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| SET-0001 | Attribute Label 01 | Attribute Category 01 |
| SET-0002 | Attribute Label 02 | Attribute Category 02 |
| SET-0003 | Attribute Label 03 | Attribute Category 03 |
| SET-0004 | Attribute Label 04 | Attribute Category 04 |
| SET-0005 | Attribute Label 05 | Attribute Category 05 |
| SET-0006 | Attribute Label 06 | Attribute Category 06 |

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | TIER-0002 |
| PUBL-0002 | API Gateway Config | TIER-0004 |
| PUBL-0003 | Cloud Migration Playbook | TIER-0005 |
| PUBL-0004 | Cloud Migration Playbook | TIER-0005 |
| PUBL-0005 | Incident Postmortem | TIER-0007 |
| PUBL-0006 | Telemetry Schema Draft | TIER-0007 |
| PUBL-0007 | Firmware Release Notes | TIER-0001 |
| PUBL-0008 | Cloud Migration Playbook | TIER-0005 |

Every measured attribute carries a confidence score and an associated uncertainty value that together characterize the reliability of the observation. Confidence values range from near-certainty, as seen in the 0.926 confidence assigned to identifier SET-0001, to substantial doubt, as reflected in the 0.123 confidence for identifier SET-0003. The corresponding uncertainty figures—quantified as 957.49 for the high-confidence observation and 455.70 for the low-confidence one—provide a complementary measure of the margin of error. These paired metrics allow downstream consumers to weight attribute values appropriately, treating a value of 482.01 with high confidence more decisively than a value of 100.75 recorded with only 0.123 confidence.

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SET-0001 | SET-0005 | 0.926 | 957.49 | 482.01 |
| SET-0002 | SET-0003 | 0.786 | 274.08 | 742.87 |
| SET-0003 | SET-0005 | 0.123 | 455.70 | 100.75 |
| SET-0004 | SET-0003 | 0.178 | 516.20 | 779.52 |

Entities function as the primary subjects to which attributes are attached, and the system distinguishes between different entity types through their naming conventions and associated attribute schemas. Publisher entities, identified by prefixes such as PUBL-0001 and PUBL-0002, represent creative works like API Gateway Config and Cloud Migration Playbook, each linked to a publisher tier such as TIER-0002 or TIER-0005. Tier entities, identified by prefixes like TIER-0001 and TIER-0002, carry annotations such as SensorCalibration Q4 and TelemetryLabel HighLatency that describe their operational characteristics. The foreign-key relationships between these entity types—where a publisher references a tier, and where annotations reference both an entity and a tier—establish a navigable graph of metadata relationships.

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | SensorCalibration Q4 | PUBL-0001 |
| TIER-0002 | TelemetryLabel HighLatency | PUBL-0008 |
| TIER-0003 | QualityFlag Pass | PUBL-0006 |
| TIER-0004 | DatasetVersion v3.2.1 | PUBL-0008 |
| TIER-0005 | ProvenanceSource EPA7 | PUBL-0005 |
| TIER-0006 | ProvenanceSource EPA7 | PUBL-0002 |
| TIER-0007 | ObservationNote Drift | PUBL-0005 |
| TIER-0008 | ComplianceLevel SOC2 | PUBL-0008 |

**t_annotation_at_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_annotation_at_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2023-08-28T08:07:44 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2024-09-06T16:54:15 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-05-23T23:56:22 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2025-03-16T10:06:06 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2023-04-25T04:15:41 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-06-14T22:17:53 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2024-03-09T22:47:27 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-01-10T07:31:27 |

**t_annotation_at_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.089 |
| TIER-0002 | TIER-0001 | TIER-0005 | 784.31 |
| TIER-0003 | TIER-0001 | TIER-0007 | 319.44 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.223 |
| TIER-0005 | TIER-0002 | TIER-0005 | 427.90 |
| TIER-0006 | TIER-0002 | TIER-0007 | 411.91 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.933 |
| TIER-0008 | TIER-0003 | TIER-0005 | 35.44 |

**t_annotation_at_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | es |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

Attribute types determine how values are stored and interpreted, with the schema supporting a range of data formats including xsd:string for textual identifiers like 9d2b7a16 and proprietary, xsd:date for temporal markers such as 2023-06-28 and 2024-12-26, xsd:decimal for numeric measurements like 0.089 and 784.31, and xsd:dateTime for precise timestamps including 2023-08-28T08:07:44 and 2025-03-16T10:06:06. The type system also accommodates domain-specific types such as cco:DesignativeICE for designative identifiers. Values are partitioned into type-specific storage tables, each keyed by an entity identifier and an attribute identifier, ensuring that the correct type constraints are enforced at query time. This type-aware architecture allows the same entity—such as PUBL-0001—to simultaneously hold a checksum value of 9d2b7a16, a creation date of 2023-06-28, and an integer confidence of 72, each stored in its appropriate value table and retrieved through the shared entity and attribute keys.

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |