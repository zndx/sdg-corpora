---
chapter_id: ch_live_attrkey_subclass_075dc2
topic_id: 12
family: 01_foundation
cited_terms: ['attrkey_subclass', 'schemaorg_review_author', 'classification_under_taxonomy']
model: engine-refine
---

Attributes, their types, and the entities they describe constitute the foundational grammar of any structured metadata architecture, where identifiers serve as the stable keys binding property definitions to their concrete instantiations across heterogeneous data domains. An attribute key such as `lot_number` or `batch_id` does not merely label a field; it anchors a property—designated internally as `TAXO-0006` or `TAXO-0004`—to a prescribed format and namespace, ensuring that the value `CSV` or `UUID` is interpreted within the correct semantic boundary, whether that boundary is the `governance` namespace governing supply-chain provenance or the `telemetry` namespace managing operational streams. The format specification is not decorative: it dictates whether an attribute like `voltage_read` carries an `E.164` telephone-number encoding or an `operator_code` is represented as a `UUID`, and these format constraints propagate through every layer of the data model, from the attribute definition itself to the value tables that store actual instances.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | TAXO-0006 | CSV | governance |
| ATTR-0002 | batch_id | TAXO-0004 | UUID | governance |
| ATTR-0003 | operator_code | TAXO-0004 | UUID | telemetry |
| ATTR-0004 | voltage_read | TAXO-0003 | E.164 | telemetry |
| ATTR-0005 | flow_rate | TAXO-0007 | E.164 | governance |
| ATTR-0006 | lot_number | TAXO-0007 | CSV | governance |
| ATTR-0007 | ambient_temp | TAXO-0006 | JSON | catalog |

The entity-attribute-value triad is realized through a disciplined separation of schema and storage, where attribute metadata is declared independently of the values it constrains. In the schema.org review-author domain, attributes such as `checksum`, `created_date`, `identifier`, and `license` are each assigned a precise type—`xsd:string`, `xsd:date`, `cco:DesignativeICE`, `xsd:string`—that governs how values are validated, stored, and queried. The actual values are partitioned into type-specific stores: date values like `2025-02-16` and `2024-11-14` reside in the datetime value table, integer values such as `103`, `12`, `471`, and `5` in the integer value table, and string values including `1a4b6c2d`, `ref-8842`, `CC-BY-4.0`, and `on-prem-dc1` in the varchar value table. Each value row is linked to its entity through a foreign key on `entity_id` and to its attribute through `attr_id`, creating a sparse but fully typed matrix where only the relevant type table is populated for any given attribute.

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | Person | TAXO-0003 |
| AUTH-0002 | LocalBusiness | TAXO-0005 |
| AUTH-0003 | SoftwareApplication | TAXO-0002 |
| AUTH-0004 | Event | TAXO-0003 |
| AUTH-0005 | Place | TAXO-0008 |
| AUTH-0006 | SoftwareApplication | TAXO-0005 |

**t_schemaorg_review_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_review_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2025-02-16 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-11-14 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-06-05 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-01-18 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2023-05-28 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-09-03 |

**t_schemaorg_review_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 103 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 471 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 5 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 402 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 1 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 318 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 3 |

**t_schemaorg_review_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 1a4b6c2d |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | ref-8842 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | CC-BY-4.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | application/xml |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | data-engineering |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

This same entity-attribute-value discipline extends into the classification-under-taxonomy domain, where classifications such as `Lab Sample Category`, `Anomaly Detection Model`, `Experiment Phase Code`, and `Telemetry Stream Type` are themselves organized under taxonomy references like `ATTR-0002` and `ATTR-0001`, and each classification carries its own set of typed attributes. The attributes `duration_seconds`, `end_time`, `exit_code`, and `host_name` are declared with types `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string` respectively, and their values are stored in corresponding type-specific tables: decimal values such as `4845.29`, `4012.23`, `5805.70`, and `852.80`; datetime values including `2024-03-16T10:40:44`, `2023-03-15T13:57:05`, `2024-10-13T12:06:31`, and `2023-01-11T10:30:50`; integer values like `123`, `306`, `682`, and `349`; and varchar values such as `worker-07`, `Log Level 02`, `initiation`, and `superseded`. The entity identifiers in these value tables—`TAXO-0001`, `TAXO-0002`, and so forth—reference back to the classification definitions, forming a closed loop between classification, attribute, and value.

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | ATTR-0002 |
| TAXO-0002 | Anomaly Detection Model | ATTR-0002 |
| TAXO-0003 | Experiment Phase Code | ATTR-0007 |
| TAXO-0004 | Telemetry Stream Type | ATTR-0001 |
| TAXO-0005 | Compliance Framework Set | ATTR-0006 |
| TAXO-0006 | Experiment Phase Code | ATTR-0001 |
| TAXO-0007 | Metadata Schema Version | ATTR-0001 |
| TAXO-0008 | Experiment Phase Code | ATTR-0004 |

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |

The namespace dimension provides the final layer of semantic isolation, ensuring that attributes with identical names but different contexts do not collide. The `governance` namespace contains attributes like `lot_number` and `batch_id` that describe supply-chain properties, while the `telemetry` namespace contains `operator_code` and `voltage_read` that describe operational streams; both may reference the same taxonomy property `TAXO-0004`, but the namespace disambiguates their intended use. Similarly, the schema.org review-author attributes operate in a distinct namespace from the classification-under-taxonomy attributes, even though both domains employ the same attribute-value storage pattern. This namespace-based partitioning allows the system to scale across domains without requiring global uniqueness of attribute names, relying instead on the composite key of namespace and attribute key to achieve semantic clarity.

Identifiers throughout the system follow a consistent naming convention that encodes both domain and sequence: `ATTR-0001` through `ATTR-0004` for attribute keys, `AUTH-0001` through `AUTH-0004` for schema.org review-author entities, and `TAXO-0001` through `TAXO-0004` for classification-under-taxonomy entities. These identifiers are not arbitrary; they serve as the stable references that bind attribute definitions to their values, classifications to their taxonomy parents, and schema.org types to their review-author mappings. The foreign-key relationships between these identifier spaces—where `describes_property` in the attribute-key table references taxonomy IDs, where `under_taxonomy` in the classification table references attribute-key IDs, and where `review_author` in the schema.org table references taxonomy IDs—create a directed graph of semantic dependencies that can be traversed to answer questions about provenance, type compatibility, and namespace membership.