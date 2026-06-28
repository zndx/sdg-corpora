---
chapter_id: ch_live_schemaorg_product_price_b82345
topic_id: 4
family: 07_long_tail
cited_terms: ['schemaorg_product_price', 'policy_only_governs_artifacts', 'column_tag_at_confidence']
model: engine-refine
---

Governance frameworks rely on a structured vocabulary to describe how data assets are classified, protected, and managed. At the core of this vocabulary are attributes—named properties such as `confidence`, `dimension_kind`, `method`, and `recorded_at`—each bound to a precise type like `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. These attribute definitions establish a shared schema for tagging and annotating data elements, ensuring that every classification carries both semantic meaning and type safety. For instance, a confidence score is stored as a decimal value (0.375 or 0.359), while a dimension kind is a free-form string such as "Dimension Kind 01" or "Encoding 02", and a recorded timestamp follows the ISO 8601 format (e.g., `2024-04-09T22:04:24`). This typed attribute system allows downstream systems to validate, query, and reason about metadata without ambiguity.

Each attribute instance is anchored to an entity through a subject–target relationship mediated by an identifier. The entity represents the data element being described—such as the column `instrument_serial`, `audit_log_id`, or `calibration_date`—while the target is the confidence tag that classifies it (e.g., `ARTI-0006` or `ARTI-0002`). The subject column ties the relationship back to the entity, creating a tripartite link that can be traversed to reconstruct the full provenance of any classification. In practice, this means that a single entity like `CONF-0001` can carry multiple attribute values simultaneously: a confidence decimal of 0.375, a dimension kind of "Dimension Kind 01", and a recorded timestamp of `2024-04-09T22:04:24`, all resolved through the same identifier namespace.

**t_schemaorg_product_price__price**

| id | schemaorg_id | price_id | role |
| --- | --- | --- | --- |
| PRIC-0001 | PRIC-0001 | PRIC-0001 | reviewer |
| PRIC-0002 | PRIC-0003 | PRIC-0007 | reviewer |
| PRIC-0003 | PRIC-0003 | PRIC-0003 | contributor |
| PRIC-0004 | PRIC-0001 | PRIC-0007 | contributor |
| PRIC-0005 | PRIC-0006 | PRIC-0002 | contributor |
| PRIC-0006 | PRIC-0002 | PRIC-0003 | contributor |
| PRIC-0007 | PRIC-0001 | PRIC-0006 | reviewer |
| PRIC-0008 | PRIC-0004 | PRIC-0006 | owner |

**t_column_tag_at_confidence**

| id | column | tag_confidence |
| --- | --- | --- |
| CONF-0001 | instrument_serial | ARTI-0006 |
| CONF-0002 | audit_log_id | ARTI-0002 |
| CONF-0003 | calibration_date | ARTI-0003 |
| CONF-0004 | instrument_serial | ARTI-0005 |
| CONF-0005 | geospatial_ref | ARTI-0001 |
| CONF-0006 | sample_volume_ml | ARTI-0002 |

**t_column_tag_at_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

**t_column_tag_at_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2024-04-09T22:04:24 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2025-04-05T07:15:37 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-17T15:47:25 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2024-06-11T23:21:15 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-11-28T13:45:04 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-05-23T02:47:56 |

**t_column_tag_at_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.375 |
| CONF-0002 | CONF-0001 | CONF-0005 | 699.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 906.58 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.359 |
| CONF-0005 | CONF-0002 | CONF-0005 | 525.15 |
| CONF-0006 | CONF-0002 | CONF-0007 | 158.80 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.944 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.61 |

**t_column_tag_at_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | nightly summary |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | automated |
| CONF-0006 | CONF-0001 | CONF-0006 | kg |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

Policy enforcement governs which rules apply to which artifacts, and the strength of that governance is expressed through an enforcement level and a priority ranking. Enforcement modes range from `blocking`, which prevents non-compliant actions outright, to `advisory`, which flags violations without stopping them, and `deprecated`, which marks rules as superseded. Priority values—integers from 1 through 5 in the observed data—determine resolution order when multiple policies apply to the same artifact. A Privacy Compliance Policy with priority 1 and deprecated enforcement takes precedence over an Immutable Audit Policy with priority 5 and advisory enforcement, ensuring that the most critical and current directives are evaluated first.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

Roles further refine the relationship between data assets and the policies that govern them. In the product pricing domain, for example, the same product—such as the Bose QC Ultra or the Samsung Galaxy S24—can be associated with multiple price records, each tagged with a role like `reviewer` or `contributor`. This role-based distinction clarifies whether a given price entry was approved by a reviewer, proposed by a contributor, or both, enabling audit trails that distinguish between authoritative and provisional data. Similarly, in the governance context, roles determine who can modify classifications, who must approve them, and which artifacts fall under which policy umbrella.

**t_schemaorg_product_price**

| id | schemaorg |
| --- | --- |
| PRIC-0001 | Apple AirPods Pro |
| PRIC-0002 | Dyson V15 |
| PRIC-0003 | Bose QC Ultra |
| PRIC-0004 | Samsung Galaxy S24 |
| PRIC-0005 | Dyson V15 |
| PRIC-0006 | Apple AirPods Pro |

**t_schemaorg_product_price_price**

| id | price |
| --- | --- |
| PRIC-0001 | 1599 GBP |
| PRIC-0002 | 199.99 CAD |
| PRIC-0003 | $449.95 |
| PRIC-0004 | $349.00 |
| PRIC-0005 | $349.00 |
| PRIC-0006 | $349.00 |
| PRIC-0007 | 1599 GBP |

The misc column captures heterogeneous values that do not fit neatly into the typed attribute schema, serving as a catch-all for free-form annotations, notes, or contextual metadata. Values such as "nightly summary" or "fr" illustrate how this column accommodates unstructured data that supports but does not define the core classification. Together, the typed attributes, entity–target relationships, enforcement levels, priorities, and roles form a layered governance model: attributes define what is being measured, entities anchor those measurements to real data elements, policies dictate the rules, and roles clarify who is responsible for each decision.