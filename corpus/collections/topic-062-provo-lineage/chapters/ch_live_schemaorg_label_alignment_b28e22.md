---
chapter_id: ch_live_schemaorg_label_alignment_b28e22
topic_id: 62
family: 07_long_tail
cited_terms: ['schemaorg_label_alignment', 'schemaorg_org_country', 'schemaorg_org_legalname']
model: engine-refine
---

Schema.org label alignment constitutes the foundational mechanism by which heterogeneous entity identifiers are reconciled against a canonical vocabulary, enabling cross-system interoperability without requiring source systems to adopt a single nomenclature. The alignment registry records mappings between source schema.org labels and their aligned counterparts: an Organization entity may be aligned to event_timestamp, a CreativeWork similarly resolves to event_timestamp, while apple-inc maps to Course and Product to google-llc. Each alignment carries a persistent identifier—ALIG-0001 through ALIG-0004—that serves as the anchor for all subsequent attribute assignments and value bindings. This decoupling of label resolution from attribute storage permits the alignment graph to evolve independently of the metadata attached to each mapping, a structural necessity when dealing with schema registries that accumulate provenance information, confidence scores, and methodological annotations over time.

**t_schemaorg_label_alignment**

| id | schemaorg | aligned_to_schema_org_label |
| --- | --- | --- |
| ALIG-0001 | Organization | event_timestamp |
| ALIG-0002 | CreativeWork | event_timestamp |
| ALIG-0003 | apple-inc | Course |
| ALIG-0004 | Product | google-llc |
| ALIG-0005 | Organization | event_timestamp |
| ALIG-0006 | salesforce-inc | CloudNative |
| ALIG-0007 | subject_person | CloudNative |
| ALIG-0008 | role_title | Dataset |

**t_schemaorg_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_schemaorg_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-29T12:22:57 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2024-10-21T02:32:32 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2024-04-16T22:29:51 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2024-04-08T02:25:07 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2024-04-01T00:20:16 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-06-23T20:04:43 |
| ALIG-0007 | ALIG-0007 | ALIG-0004 | 2025-03-29T09:58:30 |
| ALIG-0008 | ALIG-0008 | ALIG-0004 | 2024-10-23T02:04:00 |

**t_schemaorg_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.916 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 747.18 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 963.37 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.264 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 721.79 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 736.70 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.758 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 440.87 |

**t_schemaorg_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | automated |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | count |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

The attribute model follows an entity-attribute-value decomposition, wherein the attribute definition table enumerates the permissible properties of each alignment alongside their XSD or custom types. Confidence is expressed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. Values are materialized in type-specific value tables, each keyed by a surrogate identifier and linked to an entity through entity_id and attr_id foreign keys. A decimal value of 0.916 may attach to entity ALIG-0001 via attribute ALIG-0001, while a distinct decimal of 747.18 and 963.37 also reference the same entity through attributes ALIG-0005 and ALIG-0007 respectively. String-valued attributes carry values such as Dimension Kind 01, Encoding 02, nightly summary, and fr, each bound to entity ALIG-0001 through attributes ALIG-0002, ALIG-0008, ALIG-0009, and ALIG-0010. Temporal attributes store ISO 8601 timestamps—2024-11-29T12:22:57, 2024-10-21T02:32:32, 2024-04-16T22:29:51, 2024-04-08T02:25:07—each associated with entity ALIG-0001 through ALIG-0004 via attribute ALIG-0004. This type-disaggregated value storage ensures that queries against numeric confidence scores do not incur string-parsing overhead, while preserving the flexibility to add new attribute types without schema migration.

**t_schemaorg_org_country_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | checksum | xsd:string |
| COUN-0002 | created_date | xsd:date |
| COUN-0003 | identifier | cco:DesignativeICE |
| COUN-0004 | license | xsd:string |
| COUN-0005 | mime_type | xsd:string |
| COUN-0006 | size_bytes | xsd:long |
| COUN-0007 | uri | xsd:string |
| COUN-0008 | version | xsd:integer |

Country resolution extends the alignment paradigm by associating schema.org entities with geographic jurisdictions. The country mapping table records pairs such as Person mapped to South Korea, microsoft-corp to Australia, CreativeWork to India, and netflix-inc to the United Kingdom, each identified by a COUN-prefixed surrogate. Attributes governing these mappings include checksum (xsd:string), created_date (xsd:date), identifier (cco:DesignativeICE), and license (xsd:string). Date values—2023-05-13, 2024-09-06, 2025-06-05, 2023-10-10—are stored in a dedicated date value table, all referencing attribute COUN-0002 across entities COUN-0001 through COUN-0004. Integer attributes hold values such as 22, 3, 233, and 6, distributed across entities COUN-0001 and COUN-0002 via attributes COUN-0006 and COUN-0008. Varchar values include the checksum 5e8f3c91, the DOI reference doi:10.1109/x, the license designation proprietary, and the geographic zone identifier zone-b, each bound to entity COUN-0001 through attributes COUN-0001, COUN-0003, COUN-0004, and COUN-0009.

**t_schemaorg_org_country**

| id | schemaorg | country |
| --- | --- | --- |
| COUN-0001 | Person | South Korea |
| COUN-0002 | microsoft-corp | Australia |
| COUN-0003 | CreativeWork | India |
| COUN-0004 | netflix-inc | United Kingdom |
| COUN-0005 | course_title | Japan |
| COUN-0006 | sku_code | France |
| COUN-0007 | work_title | Australia |

**t_schemaorg_org_country_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | 2023-05-13 |
| COUN-0002 | COUN-0002 | COUN-0002 | 2024-09-06 |
| COUN-0003 | COUN-0003 | COUN-0002 | 2025-06-05 |
| COUN-0004 | COUN-0004 | COUN-0002 | 2023-10-10 |
| COUN-0005 | COUN-0005 | COUN-0002 | 2025-03-25 |
| COUN-0006 | COUN-0006 | COUN-0002 | 2023-04-28 |
| COUN-0007 | COUN-0007 | COUN-0002 | 2023-03-22 |

**t_schemaorg_org_country_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0006 | 22 |
| COUN-0002 | COUN-0001 | COUN-0008 | 3 |
| COUN-0003 | COUN-0002 | COUN-0006 | 233 |
| COUN-0004 | COUN-0002 | COUN-0008 | 6 |
| COUN-0005 | COUN-0003 | COUN-0006 | 206 |
| COUN-0006 | COUN-0003 | COUN-0008 | 4 |
| COUN-0007 | COUN-0004 | COUN-0006 | 347 |
| COUN-0008 | COUN-0004 | COUN-0008 | 3 |

**t_schemaorg_org_country_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 5e8f3c91 |
| COUN-0002 | COUN-0001 | COUN-0003 | doi:10.1109/x |
| COUN-0003 | COUN-0001 | COUN-0004 | proprietary |
| COUN-0004 | COUN-0001 | COUN-0009 | zone-b |
| COUN-0005 | COUN-0001 | COUN-0005 | text/plain |
| COUN-0006 | COUN-0001 | COUN-0010 | Name 06 |
| COUN-0007 | COUN-0001 | COUN-0011 | analytics |
| COUN-0008 | COUN-0001 | COUN-0012 | Tags 08 |

Legal name resolution introduces a role-mediated many-to-many relationship between schema.org identifiers and canonical legal entity names. The legal name registry contains entries such as TerraForma Holdings Ltd., CloudNative Solutions LLC, Global Data Systems LLC, and Acme Corporation, each associated with a schema.org label—Organization, apple-inc, Course, role_title—through the legal name definition table. The junction table mediates the relationship between schemaorg_id and legal_name_id with an explicit role qualifier, which takes values of reviewer, observer, or contributor. For instance, schemaorg identifier LEGA-0002 relates to legal name LEGA-0005 under the role reviewer, while LEGA-0004 connects to LEGA-0007 as observer and to LEGA-0004 as reviewer, and LEGA-0006 links to LEGA-0008 as contributor. This role annotation is critical for governance: it distinguishes which party certified a legal name, which party merely observed the association, and which party contributed the mapping, thereby supporting audit trails and accountability in entity resolution workflows.

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | Organization |
| LEGA-0002 | apple-inc |
| LEGA-0003 | Course |
| LEGA-0004 | role_title |
| LEGA-0005 | work_title |
| LEGA-0006 | TerraForma |
| LEGA-0007 | spotify-ab |

**t_schemaorg_org_legalname_legal_name**

| id | legal_name |
| --- | --- |
| LEGA-0001 | TerraForma Holdings Ltd. |
| LEGA-0002 | CloudNative Solutions LLC |
| LEGA-0003 | Global Data Systems LLC |
| LEGA-0004 | Acme Corporation |
| LEGA-0005 | CloudNative Solutions LLC |
| LEGA-0006 | DataBridge Analytics Corp. |
| LEGA-0007 | TerraForma Holdings Ltd. |
| LEGA-0008 | Nexus Laboratories Inc. |

**t_schemaorg_org_legalname__legal_name**

| id | schemaorg_id | legal_name_id | role |
| --- | --- | --- | --- |
| LEGA-0001 | LEGA-0002 | LEGA-0005 | reviewer |
| LEGA-0002 | LEGA-0004 | LEGA-0007 | observer |
| LEGA-0003 | LEGA-0004 | LEGA-0004 | reviewer |
| LEGA-0004 | LEGA-0006 | LEGA-0008 | contributor |
| LEGA-0005 | LEGA-0003 | LEGA-0001 | reviewer |
| LEGA-0006 | LEGA-0007 | LEGA-0007 | reviewer |
| LEGA-0007 | LEGA-0005 | LEGA-0006 | owner |
| LEGA-0008 | LEGA-0003 | LEGA-0001 | contributor |