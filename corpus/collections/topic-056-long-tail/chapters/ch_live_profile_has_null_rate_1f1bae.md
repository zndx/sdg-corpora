---
chapter_id: ch_live_profile_has_null_rate_1f1bae
topic_id: 56
family: 02_observation_measurement
cited_terms: ['profile_has_null_rate', 'directive_not_superseded', 'schemaorg_review_author']
model: engine-refine
---

Governance frameworks and data quality systems depend upon a disciplined separation between entity definitions, their attributes, and the concrete values those attributes hold at any given moment. An entity—whether it is a regulatory directive such as the WHO Manufacturing Guide or the EPA Emission Standard, a quality gate configuration, or a schema.org subject like Person or SoftwareApplication—receives a stable identifier that serves as the anchor for all downstream references. These identifiers, drawn from namespaces such as SUPE-0001 through SUPE-0004 for directives, RATE-0001 through RATE-0007 for quality profiles, and AUTH-0001 through AUTH-0004 for review authors, are not arbitrary; they encode the provenance domain and enable unambiguous cross-referencing across heterogeneous registries. The entity itself carries a descriptive label—ISO Quality Management, ISO Information Standard, CISA Operational Order, SensorTelemetryV2—that communicates its operational purpose without requiring schema inspection.

**t_directive_not_superseded**

| id | directive | directive_2 |
| --- | --- | --- |
| SUPE-0001 | WHO Manufacturing Guide | ISO Quality Management |
| SUPE-0002 | WHO Manufacturing Guide | ISO Information Standard |
| SUPE-0003 | EPA Emission Standard | ISO Information Standard |
| SUPE-0004 | OSHA Lockout Protocol | CISA Operational Order |
| SUPE-0005 | GLP Laboratory Practice | CISA Operational Order |
| SUPE-0006 | FDA Electronic Records | SOC Audit Standard |

**t_directive_not_superseded_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0004 | 4 |
| SUPE-0002 | SUPE-0001 | SUPE-0005 | 434 |
| SUPE-0003 | SUPE-0002 | SUPE-0004 | 3 |
| SUPE-0004 | SUPE-0002 | SUPE-0005 | 471 |
| SUPE-0005 | SUPE-0003 | SUPE-0004 | 4 |
| SUPE-0006 | SUPE-0003 | SUPE-0005 | 762 |
| SUPE-0007 | SUPE-0004 | SUPE-0004 | 3 |
| SUPE-0008 | SUPE-0004 | SUPE-0005 | 766 |

**t_directive_not_superseded_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0007 | Encoding 01 |
| SUPE-0002 | SUPE-0001 | SUPE-0002 | Enforcement 02 |
| SUPE-0003 | SUPE-0001 | SUPE-0008 | pre-release note |
| SUPE-0004 | SUPE-0001 | SUPE-0009 | ja |
| SUPE-0005 | SUPE-0001 | SUPE-0006 | Scope 05 |
| SUPE-0006 | SUPE-0002 | SUPE-0007 | Encoding 06 |
| SUPE-0007 | SUPE-0002 | SUPE-0002 | Enforcement 07 |
| SUPE-0008 | SUPE-0002 | SUPE-0008 | change rationale |

**t_schemaorg_review_author**

| id | schemaorg | review_author |
| --- | --- | --- |
| AUTH-0001 | Person | RATE-0007 |
| AUTH-0002 | LocalBusiness | RATE-0006 |
| AUTH-0003 | SoftwareApplication | RATE-0004 |
| AUTH-0004 | Event | RATE-0006 |
| AUTH-0005 | Place | RATE-0006 |
| AUTH-0006 | SoftwareApplication | RATE-0004 |

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

Attributes define the dimensional space within which an entity can be described, and each attribute is declared with a precise type that constrains the shape of permissible values. The attribute effective_date, typed as xsd:date, governs temporal validity; enforcement, typed as xsd:string, captures textual policy directives; mandatory, typed as xsd:boolean, encodes binary compliance requirements; and priority, typed as xsd:integer, provides a numeric ordering mechanism. Similarly, attributes such as checksum, created_date, identifier, and license appear in author registries, each carrying its own type constraint—xsd:string, xsd:date, cco:DesignativeICE, xsd:string—that reflects the semantic nature of the information being captured. This type discipline ensures that a value like false or true assigned to the mandatory attribute is semantically coherent, that dates such as 2023-02-05 or 2025-04-26 conform to ISO 8601, and that integer priorities like 4, 434, 3, or 471 are comparable across entities.

**t_directive_not_superseded_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUPE-0001 | effective_date | xsd:date |
| SUPE-0002 | enforcement | xsd:string |
| SUPE-0003 | mandatory | xsd:boolean |
| SUPE-0004 | priority | xsd:integer |
| SUPE-0005 | review_cycle_days | xsd:integer |
| SUPE-0006 | scope | xsd:string |
| SUPE-0007 | encoding | xsd:string |
| SUPE-0008 | label_text | xsd:string |

**t_directive_not_superseded_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0003 | false |
| SUPE-0002 | SUPE-0002 | SUPE-0003 | true |
| SUPE-0003 | SUPE-0003 | SUPE-0003 | false |
| SUPE-0004 | SUPE-0004 | SUPE-0003 | false |
| SUPE-0005 | SUPE-0005 | SUPE-0003 | true |
| SUPE-0006 | SUPE-0006 | SUPE-0003 | true |

**t_directive_not_superseded_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUPE-0001 | SUPE-0001 | SUPE-0001 | 2023-02-05 |
| SUPE-0002 | SUPE-0002 | SUPE-0001 | 2025-04-26 |
| SUPE-0003 | SUPE-0003 | SUPE-0001 | 2023-02-14 |
| SUPE-0004 | SUPE-0004 | SUPE-0001 | 2025-06-15 |
| SUPE-0005 | SUPE-0005 | SUPE-0001 | 2023-09-27 |
| SUPE-0006 | SUPE-0006 | SUPE-0001 | 2024-06-22 |

The actual values assigned to attributes are stored separately from their definitions, organized by type into distinct value repositories. Boolean values—false, true, false, false—populate the constraint store for the mandatory attribute across four directive entities. Date values—2023-02-05, 2025-04-26, 2023-02-14, 2025-06-15—anchor the effective_date attribute to specific temporal points. Integer values—4, 434, 3, 471—express priority levels, while string values such as Encoding 01, Enforcement 02, pre-release note, ja, and CC-BY-4.0 carry free-form or coded information. This type-partitioned storage model eliminates the need for runtime type coercion, enforces schema-level integrity at insert time, and allows each value type to be indexed, queried, and validated according to its own rules. The entity_id column in each value table establishes the foreign-key link back to the entity, while attr_id references the attribute definition, creating a clean triple of entity, attribute, and value that can be queried independently of the type-specific table.

Relationships between entities are expressed through association tables that carry their own identifiers and role designations. A profile such as ObservationProtocolAlpha may be linked to a null rate definition like missingBaseline with the role of reviewer, while the same profile might connect to absentMetric as contributor. The junction table t_profile_has_null_rate__null_rate captures these multi-valued relationships with a composite structure: each row carries a unique identifier (RATE-0001 through RATE-0004), a subject reference pointing to the profile (RATE-0003, RATE-0007, RATE-0004), a target reference pointing to the null rate (RATE-0005, RATE-0002, RATE-0006, RATE-0001), and a role (owner, contributor, reviewer) that qualifies the nature of the association. This pattern—subject, target, role—generalizes across domains: a schema.org Person entity is linked to a review author RATE-0007, a LocalBusiness to RATE-0006, a SoftwareApplication to RATE-0004, and an Event to RATE-0006, each connection carrying its own provenance through the association identifier.

**t_profile_has_null_rate**

| id | profile |
| --- | --- |
| RATE-0001 | QualityGateConfig |
| RATE-0002 | QualityGateConfig |
| RATE-0003 | ObservationProtocolAlpha |
| RATE-0004 | SensorTelemetryV2 |
| RATE-0005 | TelemetryStreamSchema |
| RATE-0006 | TelemetryStreamSchema |
| RATE-0007 | QualityGateConfig |

**t_profile_has_null_rate_null_rate**

| id | null_rate |
| --- | --- |
| RATE-0001 | dropRate |
| RATE-0002 | absentMetric |
| RATE-0003 | missingBaseline |
| RATE-0004 | absentMetric |
| RATE-0005 | absentMetric |
| RATE-0006 | zeroPointTwo |

**t_profile_has_null_rate__null_rate**

| id | profile_id | null_rate_id | role |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0003 | RATE-0005 | owner |
| RATE-0002 | RATE-0007 | RATE-0002 | contributor |
| RATE-0003 | RATE-0004 | RATE-0006 | reviewer |
| RATE-0004 | RATE-0004 | RATE-0001 | contributor |
| RATE-0005 | RATE-0007 | RATE-0003 | observer |
| RATE-0006 | RATE-0007 | RATE-0006 | owner |
| RATE-0007 | RATE-0001 | RATE-0001 | contributor |
| RATE-0008 | RATE-0004 | RATE-0001 | contributor |

The practical consequence of this architecture is that governance metadata becomes queryable, auditable, and extensible without schema migration. When a new attribute type is needed—say, a confidence score typed as xsd:decimal—only a new attribute definition and a corresponding value table are required; existing entities and their relationships remain untouched. When a directive such as the OSHA Lockout Protocol receives an updated priority of 471 or a new effective date of 2025-06-15, the change is localized to the appropriate value row. When a quality profile transitions from owner to contributor status on a null rate, the role column in the association table is updated without touching the underlying entity or attribute definitions. This separation of concerns—entity identity, attribute schema, typed values, and relational roles—provides the structural foundation for compliance tracking, data quality monitoring, and regulatory attribution across heterogeneous systems.