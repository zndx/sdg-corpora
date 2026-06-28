---
chapter_id: ch_live_dataset_at_version_ee6bf1
topic_id: 0
family: 07_long_tail
cited_terms: ['dataset_at_version', 'schemaorg_place_latitude', 'directive_traces_to_requirement']
model: engine-refine
---

Within compliance and data governance architectures, the tracking of requirements, their attributes, and their associated metadata demands a disciplined separation of concerns across dimensional, factual, and associative structures. At the core of this discipline lies the concept of an entity—an identifiable object such as a regulatory requirement or a dataset version—each assigned a unique identifier that serves as the primary key across all referencing tables. The requirement entities, designated REQU-0001 through REQU-0004, anchor a family of attribute-value tables that collectively capture the multi-typed properties of each directive. An attribute, or attr, is a named characteristic such as effective_date, enforcement, mandatory, or priority, and each is declared with a precise attr type—xsd:date, xsd:string, xsd:boolean, or xsd:integer—that governs how its values are stored and validated. This type-driven decomposition is reflected in the schema's four value tables: t_directive_traces_to_requirement_val_date stores temporal values like 2023-08-06 and 2025-05-18; t_directive_traces_to_requirement_val_boolean holds truth values such as true and false; t_directive_traces_to_requirement_val_int accommodates numeric magnitudes ranging from 4 to 132; and t_directive_traces_to_requirement_val_varchar preserves free-form strings including nightly summary and Enforcement 02. The entity column in each value table binds the attribute value back to its parent requirement, while the attr_id column resolves to the attribute definition, ensuring that every datum is traceable to both its semantic meaning and its type constraint.

**t_dataset_at_version**

| id | dataset |
| --- | --- |
| VERS-0001 | Landsat-8-OLI |
| VERS-0002 | UrbanAirQuality |
| VERS-0003 | Landsat-8-OLI |
| VERS-0004 | ATLAS-ICU-Cohort |
| VERS-0005 | SatelliteTelemetryRaw |
| VERS-0006 | GeospatialRoadNetwork |

**t_dataset_at_version_at_dataset_version**

| id | at_dataset_version |
| --- | --- |
| VERS-0001 | v3.0.0-stable |
| VERS-0002 | release-2023-Q4 |
| VERS-0003 | build-4491 |
| VERS-0004 | v2.1.0 |
| VERS-0005 | build-4491 |
| VERS-0006 | release-2023-Q4 |
| VERS-0007 | v2.1.0 |
| VERS-0008 | v2.1.0 |

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

**t_directive_traces_to_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

The governance framework extends beyond requirements to encompass the datasets and their versions that serve as the operational substrate for compliance evidence. Dataset versions are identified by identifiers such as VERS-0001 and VERS-0002, each associated with a source dataset—Landsat-8-OLI, UrbanAirQuality, or ATLAS-ICU-Cohort—and linked to a semantic version string like v3.0.0-stable or release-2023-Q4. The relationship between dataset versions and their constituent components is mediated by a junction table that introduces the concepts of subject, target, and role: the subject column identifies the originating version, the target column identifies the referenced version, and the role column—taking values such as contributor, owner, or reviewer—describes the nature of the relationship. This tripartite structure enables fine-grained provenance tracking, where a version like VERS-0001 can simultaneously serve as a contributor to VERS-0002 and as the target of VERS-0004, with each relationship independently classified by its role.

**t_dataset_at_version__at_dataset_version**

| id | dataset_id | at_dataset_version_id | role |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0004 | VERS-0002 | contributor |
| VERS-0002 | VERS-0002 | VERS-0001 | owner |
| VERS-0003 | VERS-0005 | VERS-0001 | reviewer |
| VERS-0004 | VERS-0001 | VERS-0004 | contributor |
| VERS-0005 | VERS-0005 | VERS-0007 | owner |
| VERS-0006 | VERS-0002 | VERS-0007 | reviewer |
| VERS-0007 | VERS-0003 | VERS-0003 | reviewer |
| VERS-0008 | VERS-0003 | VERS-0002 | owner |

Dimensional metadata about data assets is organized through a latitude construct that separates categorical classification from descriptive labeling. The dimension table dim_latitude assigns each latitude identifier—LATI-0001 through LATI-0004—a latitude_label, such as Latitude Label 01, and a latitude_category, such as Latitude Category 01, providing a two-tier taxonomy for organizing data assets. The fact table fact_schemaorg references these latitudes through a latitude_key column, establishing a many-to-one relationship where multiple fact records can share the same latitude classification. Each fact record also carries a size_bytes measurement—values such as 895265030, 114301972, and 998785819 quantify the storage footprint of the associated data asset—and a version number, an integer ranging from 3 to 8, that tracks the revision state of the schema or dataset definition. This separation of dimensional attributes from factual measurements ensures that classification queries and size-based analytics can be executed independently without cross-contamination of concerns.

**fact_schemaorg**

| id | latitude_key | size_bytes | version |
| --- | --- | --- | --- |
| LATI-0001 | LATI-0002 | 895265030 | 3 |
| LATI-0002 | LATI-0003 | 114301972 | 5 |
| LATI-0003 | LATI-0002 | 338701831 | 4 |
| LATI-0004 | LATI-0005 | 998785819 | 8 |

**dim_latitude**

| id | latitude_label | latitude_category |
| --- | --- | --- |
| LATI-0001 | Latitude Label 01 | Latitude Category 01 |
| LATI-0002 | Latitude Label 02 | Latitude Category 02 |
| LATI-0003 | Latitude Label 03 | Latitude Category 03 |
| LATI-0004 | Latitude Label 04 | Latitude Category 04 |
| LATI-0005 | Latitude Label 05 | Latitude Category 05 |
| LATI-0006 | Latitude Label 06 | Latitude Category 06 |
| LATI-0007 | Latitude Label 07 | Latitude Category 07 |
| LATI-0008 | Latitude Label 08 | Latitude Category 08 |

The directive-to-requirement linkage table provides the regulatory context for the entire structure, mapping high-level standards to their implementable requirements. Directives such as ISO 27001:2022, PCI DSS v4.0, EU AI Act Article 9, and Data Classification Policy are each associated with one or more requirement entities, creating a traceability chain from regulatory obligation to auditable attribute. The attr_name and attr_type columns in the attribute definition table establish the schema for compliance evidence: a requirement's effective_date is stored as an xsd:date, its enforcement status as an xsd:string, its mandatory flag as an xsd:boolean, and its priority as an xsd:integer. This type discipline is critical for automated compliance checking, as it ensures that validation rules can be applied consistently across all requirements. The misc column, appearing across all four value tables, captures the actual evidence values—dates, booleans, integers, and strings—that constitute the auditable record of compliance posture.

Together, these structures form a coherent model for governance data management, where identifiers provide the binding mechanism, attributes and their types define the schema of compliance evidence, entities serve as the anchor points for all relationships, and the subject-target-role triad enables rich provenance tracking. The latitude dimension offers a categorical framework for organizing data assets, while size_bytes and version columns provide quantitative and temporal metadata. The separation of attribute definitions from their typed values, and of dimensional classifications from factual measurements, reflects a design philosophy that prioritizes query flexibility, type safety, and auditability—qualities essential for any system that must demonstrate regulatory compliance to external auditors.