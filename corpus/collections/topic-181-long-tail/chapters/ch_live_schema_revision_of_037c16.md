---
chapter_id: ch_live_schema_revision_of_037c16
topic_id: 181
family: 07_long_tail
cited_terms: ['schema_revision_of', 'schema_version_subclass', 'schemaorg_creativework_author']
model: engine-refine
---

In schema-driven governance frameworks, every artifact is anchored by a unique identifier that serves as its immutable reference point across the system. Identifiers such as REVI-0001, VERS-0001, and AUTH-0001 function as the primary keys through which all relationships and attribute assignments are resolved. These identifiers are not arbitrary; they encode the artifact class and sequence, enabling deterministic lookups whether one is tracing a schema revision back to its predecessor or resolving the author of a CreativeWork. The identifier column appears in every table as the foundational key, ensuring that no matter how deeply the data is normalized, every row can be traced to a single, unambiguous entity.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | ETL_Pipeline_Manual |
| REVI-0002 | compliance_audit_log |
| REVI-0003 | ETL_Pipeline_Manual |
| REVI-0004 | compliance_audit_log |
| REVI-0005 | Provenance_Trace_Report |
| REVI-0006 | Data_Governance_Policy |
| REVI-0007 | compliance_audit_log |
| REVI-0008 | Catalog_Metadata_Index |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | Provenance_Trace_Report | WorkflowEngineer |
| AUTH-0002 | Workflow_Audit_Review | APIMaintainer |
| AUTH-0003 | iot_device_manifest | SensorArchitect |
| AUTH-0004 | API_Reference_Guide | ModelReviewer |
| AUTH-0005 | AssetRegistry | ModelReviewer |
| AUTH-0006 | patient_vitals_schema | ModelReviewer |
| AUTH-0007 | Catalog_Metadata_Index | CatalogAdmin |
| AUTH-0008 | network_flow_record | CatalogAdmin |

**t_schemaorg_creativework_author_attr**

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

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

Attributes define the properties that describe an entity, and their types enforce semantic consistency across the data model. An attribute such as checksum carries an xsd:string type, while created_date is typed as xsd:date, and identifier uses the custom cco:DesignativeICE type. This type discipline means that the value a3f9c21e is valid for a checksum attribute, the date 2024-06-07 is valid for created_date, and the string doi:10.1109/x conforms to the string type used for license fields. By separating attribute definitions from their values, the model supports extensibility: new attributes can be declared without altering the storage schema, and type validation can be applied uniformly regardless of which entity owns the attribute.

Values are stored in type-specific tables, each linking an entity to an attribute and holding the actual data. The t_schema_version_subclass_val_date table stores date values such as 2024-06-07 and 2023-07-15 for the created_date attribute, while t_schema_version_subclass_val_int holds integer values like 24 and 16 for numeric attributes, and t_schema_version_subclass_val_varchar captures string values including MPL-2.0 and on-prem-dc1. This separation by type eliminates the need for nullable columns and type coercion at query time; a date value will never appear in the integer table, and the entity_id column ensures that each value is correctly associated with its owning entity. The same pattern repeats across domains: author records in the schema.org CreativeWork namespace store their own checksums, dates, and license strings using the identical attribute-value architecture, demonstrating that the model is domain-agnostic and reusable.

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | PatientRecord | release-11.0 |
| VERS-0002 | TelemetryStream | rc-2.1 |
| VERS-0003 | NetworkFlow | alpha-0.9 |
| VERS-0004 | supply_chain_manifest | patch-3.2 |
| VERS-0005 | Workflow_Audit_Review | rc-2.1 |
| VERS-0006 | AccessControlMatrix | hotfix-2.0 |
| VERS-0007 | product_inventory_catalog | alpha-0.9 |
| VERS-0008 | telemetry_stream_config | hotfix-2.0 |

**t_schema_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | checksum | xsd:string |
| VERS-0002 | created_date | xsd:date |
| VERS-0003 | identifier | cco:DesignativeICE |
| VERS-0004 | license | xsd:string |
| VERS-0005 | mime_type | xsd:string |
| VERS-0006 | size_bytes | xsd:long |
| VERS-0007 | uri | xsd:string |
| VERS-0008 | version | xsd:integer |

**t_schema_version_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | 2024-06-07 |
| VERS-0002 | VERS-0002 | VERS-0002 | 2024-09-26 |
| VERS-0003 | VERS-0003 | VERS-0002 | 2024-06-05 |
| VERS-0004 | VERS-0004 | VERS-0002 | 2023-07-15 |
| VERS-0005 | VERS-0005 | VERS-0002 | 2025-03-15 |
| VERS-0006 | VERS-0006 | VERS-0002 | 2024-09-16 |
| VERS-0007 | VERS-0007 | VERS-0002 | 2023-01-08 |
| VERS-0008 | VERS-0008 | VERS-0002 | 2023-05-20 |

**t_schema_version_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0006 | 24 |
| VERS-0002 | VERS-0001 | VERS-0008 | 11 |
| VERS-0003 | VERS-0002 | VERS-0006 | 16 |
| VERS-0004 | VERS-0002 | VERS-0008 | 12 |
| VERS-0005 | VERS-0003 | VERS-0006 | 266 |
| VERS-0006 | VERS-0003 | VERS-0008 | 11 |
| VERS-0007 | VERS-0004 | VERS-0006 | 422 |
| VERS-0008 | VERS-0004 | VERS-0008 | 5 |

**t_schema_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | a3f9c21e |
| VERS-0002 | VERS-0001 | VERS-0003 | doi:10.1109/x |
| VERS-0003 | VERS-0001 | VERS-0004 | MPL-2.0 |
| VERS-0004 | VERS-0001 | VERS-0009 | on-prem-dc1 |
| VERS-0005 | VERS-0001 | VERS-0005 | application/octet-stream |
| VERS-0006 | VERS-0001 | VERS-0010 | Name 06 |
| VERS-0007 | VERS-0001 | VERS-0011 | governance |
| VERS-0008 | VERS-0001 | VERS-0012 | Tags 08 |

Relationships between entities are expressed through subject, target, and role columns, which together form a typed association. In the schema revision linkage table, a row with subject REVI-0001 and target REVI-0006 and role reviewer indicates that the schema revision REVI-0001 was reviewed by the revision REVI-0006. Similarly, the role owner appears when REVI-0007 references REVI-0003, and contributor appears when REVI-0001 references REVI-0003. This three-column relationship model generalizes beyond revisions: the same pattern applies to authorship links between CreativeWorks and their authors, where a schemaorg record like Provenance_Trace_Report is associated with the author WorkflowEngineer. The role column captures the nature of the association, enabling queries that distinguish between reviewers, contributors, and owners without requiring separate tables for each relationship type.

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

The practical effect of this architecture is a governance model where every artifact—whether a schema revision, a data schema version, or a CreativeWork author record—carries a consistent set of properties and relationships. A PatientRecord schema at release-11.0 can be traced through its revision history, its attributes can be validated against their declared types, and its values can be queried by type without ambiguity. The same structure governs a TelemetryStream at rc-2.1 or an iot_device_manifest authored by a SensorArchitect. This uniformity is what makes compliance auditing tractable: auditors can query for all entities with a created_date before a certain threshold, all artifacts licensed under GPL-3.0 or MPL-2.0, or all schema revisions where a particular role was assigned, using a single consistent query pattern across the entire system.