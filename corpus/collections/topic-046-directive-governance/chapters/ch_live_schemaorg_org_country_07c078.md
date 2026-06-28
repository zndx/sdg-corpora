---
chapter_id: ch_live_schemaorg_org_country_07c078
topic_id: 46
family: 07_long_tail
cited_terms: ['schemaorg_org_country', 'allocation_subclass', 'nist80053_moderate_impact']
model: engine-refine
---

The foundation of any structured data model rests on stable identifiers—unique, persistent keys that anchor every record to a single, unambiguous identity. In practice, identifiers follow a disciplined naming convention: country records carry codes like COUN-0001 and COUN-0002, allocation records use ALLO-0001 through ALLO-0004, and NIST impact classifications are tagged IMPA-0001 through IMPA-0004. These identifiers are not human-readable labels but machine-stable handles that survive schema migrations, system integrations, and data lineage audits. They appear as primary keys in entity tables and as foreign keys in relationship tables, forming the connective tissue of the entire data fabric.

**t_schemaorg_org_country**

| id | schemaorg | country |
| --- | --- | --- |
| COUN-0001 | tesla-inc | South Korea |
| COUN-0002 | oracle-corp | Australia |
| COUN-0003 | apple-inc | India |
| COUN-0004 | adobe-systems | United Kingdom |
| COUN-0005 | apple-inc | Japan |
| COUN-0006 | spotify-ab | France |
| COUN-0007 | salesforce-inc | Australia |

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

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

Entities represent the domain objects under management—companies, allocation pipelines, security frameworks—and are distinguished by their attributes, which capture the properties and characteristics that define them. An entity such as tesla-inc or oracle-corp is not merely a name; it is a structured record with typed attributes like checksum, created_date, identifier, and license. Similarly, an allocation named nightly-ingest or etl-daily-load carries its own attribute set, including the transformation engine it executes—Celery Worker, dbt Runner, Flink TaskManager, or TensorFlow Serving. The attribute model separates the what from the how: the entity is the thing being described, and the attributes are the dimensions along which it is measured, classified, or governed.

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

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

Attributes themselves are catalogued with explicit types that constrain their values and govern their storage. The attribute registry defines each property's semantic type—xsd:string for free-form text, xsd:date for calendar dates, cco:DesignativeICE for designative identifiers—ensuring that downstream consumers can interpret values correctly without schema inspection. This type discipline propagates into the value tables, where attribute values are partitioned by type into dedicated stores: val_date holds temporal values such as 2023-05-13 and 2024-09-06, val_int stores numeric measures like 22, 3, 233, and 6, and val_varchar accommodates strings ranging from cryptographic checksums like 5e8f3c91 to DOI references like doi:10.1109/x and classification labels such as proprietary and zone-b. The separation of value types by schema is a practical optimization that enables efficient querying and type-safe validation at ingestion time.

Relationships between entities are expressed through subject-target-role triples, a pattern that captures not just connectivity but the nature of the connection itself. A many-to-many association table links an allocation to the transformation engine it invokes, recording the allocation_id as the subject, the executes_transformation_id as the target, and a role—contributor, owner, or observer—that qualifies the relationship. The same pattern appears in the NIST impact classification space, where a framework such as SP 800-53 or SP 800-171 is linked to an impact level like Moderate Threshold or System Security Moderate, with the role field indicating whether the framework is an observer of the level, a contributor to it, or its owner. This triple structure is essential for governance: it makes explicit not only which entities are connected but who is accountable, who is affected, and what obligations flow from the relationship.

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |