---
chapter_id: ch_live_two_disjoint_artifacts_941a4f
topic_id: 47
family: 01_foundation
cited_terms: ['two_disjoint_artifacts', 'subclass_to_information_content_entity', 'schema_revision_of']
model: engine-refine
---

An attribute in this framework is a named property with a declared type, and the type governs both storage semantics and validation. The attribute catalogue records each property by name—checksum, created_date, identifier, license—and assigns it a type drawn from a namespace of schema definitions: xsd:string for free-form text, xsd:date for calendar dates, and cco:DesignativeICE for designative identifiers. This separation of attribute definition from attribute value permits a single property to carry heterogeneous data across entities without schema drift. When the attribute created_date is applied to an artifact, the value surface is constrained to ISO-formatted dates such as 2023-05-13 or 2024-02-28; when the attribute checksum is applied, the value is a hexadecimal string like 9d2b7a16; and when the attribute license is applied, the value is a human-readable designation such as MPL-2.0. The type declaration is the invariant that binds the attribute name to its permissible value domain, and it is the mechanism by which the system enforces data integrity at the point of ingestion.

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

The entity is the principal bearer of attributes, and it is distinguished by an identifier that is unique within the artifact namespace. An artifact identified as ARTI-0001 may be classified as an etl-job whose operational category is data-lake, while ARTI-0002 is a config-bundle associated with traffic-router. The identifier serves as the foreign key that anchors every attribute value to its owner: the date 2024-03-29 is the created_date of ARTI-0003, and the integer 462 is the value of attribute ARTI-0006 on entity ARTI-0002. This entity–attribute–value triad is materialized across three value tables partitioned by type—date, integer, and variable-length character—so that the system can enforce type discipline without resorting to a single untyped blob. The identifier is itself an attribute, typed as cco:DesignativeICE, which means that the entity's own identity is subject to the same validation rules as any other property it carries.

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

Beyond the attribute–entity relationship, the framework supports a parallel dimension of information content that is organized by subclass and expressed in natural language. Each information content entity carries a label that describes its purpose—nightly summary, pre-release note, intake form, change rationale—and a language tag that determines the script and locale of that label. The entity ENTI-0001, whose information content is schema_registry, bears the label nightly summary in English (en); ENTI-0002, a telemetry_stream, carries the label pre-release note in Japanese (ja); and ENTI-0004, a data_catalog_entry, is labeled change rationale in Spanish (es). This multilingual layer is orthogonal to the attribute system: it provides human-readable descriptions of entities without constraining their machine-readable properties, and it allows the same information content to be presented in multiple languages by maintaining parallel entries.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

Schema revisions introduce a temporal and relational structure that governs how artifacts and their attributes evolve. A schema revision is identified by a unique key such as REVI-0001 and is associated with a schema name—network_flow_record, product_inventory_catalog, clinical_trial_protocol—that describes the domain of the data it governs. Revisions may reference legacy records, and the linkage is captured in a separate table that maps each revision to a predecessor such as legacy_compliance_log or legacy_network_record. This creates a lineage graph in which a revision is not an isolated artifact but a node in a chain of historical records, and the chain is queryable through the schema_revision_of relationship. The existence of this lineage is essential for compliance auditing, where the provenance of a data element must be traceable back through successive revisions to its original source.

The relationship between schema revisions is mediated by a junction table that records, for each pair of revisions, a subject, a target, and a role. The subject is the revision that initiates the relationship, the target is the revision that is the object of that relationship, and the role describes the capacity in which the subject interacts with the target—reviewer, contributor, or owner. Revision REVI-0001, for example, appears as a subject in three relationships: it reviews REVI-0006, it is reviewed by REVI-0001 (a self-reference that may indicate a validation loop), and it reviews REVI-0003. Revision REVI-0007 acts as an owner of REVI-0003. These roles are not metadata attached to a single revision; they are first-class relationships that can be queried, filtered, and enforced. The role determines what actions the subject is permitted to take with respect to the target, and it is the mechanism by which governance policies are encoded into the data model itself.

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |