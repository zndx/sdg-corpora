---
chapter_id: ch_live_schema_version_subclass_db59f5
topic_id: 25
family: 07_long_tail
cited_terms: ['schema_version_subclass', 'shell_dimension_specification', 'requirement_only_satisfied_by']
model: engine-refine
---

The architecture for versioned schema metadata and shell dimension specifications shares a unified entity-attribute-value pattern, wherein each subclass maintains its own attribute taxonomy and a family of typed value tables that preserve strict datatype discipline. Schema version subclasses—identified by handles such as VERS-0001 through VERS-0004—are anchored to a named schema (EventCatalog, AccessControlMatrix, TelemetryStream) and a version stamp (SATI-0002 through SATI-0004), forming the entity root. Shell dimension specifications follow the same structural discipline under identifiers SPEC-0001 through SPEC-0004, each carrying a domain-specific name such as Venus_venerupis_Mediterranean or Cypraea_tigris_Asian. In both cases, the attribute definitions reside in a dedicated catalogue table that pairs an attr_name with an attr_type drawn from a schema registry: xsd:string, xsd:date, xsd:dateTime, xsd:decimal, and the domain-specific cco:DesignativeICE for schema attributes, while shell dimension attributes include confidence, dimension_kind, method, and recorded_at.

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | EventCatalog | SATI-0004 |
| VERS-0002 | AccessControlMatrix | SATI-0003 |
| VERS-0003 | AccessControlMatrix | SATI-0002 |
| VERS-0004 | TelemetryStream | SATI-0004 |
| VERS-0005 | AccessControlMatrix | SATI-0006 |
| VERS-0006 | AssetRegistry | SATI-0006 |
| VERS-0007 | AccessControlMatrix | SATI-0002 |
| VERS-0008 | EventCatalog | SATI-0006 |

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

**t_shell_dimension_specification**

| id | shell_dimension_specification |
| --- | --- |
| SPEC-0001 | Venus_venerupis_Mediterranean |
| SPEC-0002 | Cypraea_tigris_Asian |
| SPEC-0003 | Littorina_obtusa_Urban |
| SPEC-0004 | Strombus_gigas_Tropical |
| SPEC-0005 | Ostrea_gigas_Brittany |
| SPEC-0006 | Nassa_pertenuis_Coast |
| SPEC-0007 | Strongylocentrotus_pacificus_Puget |

**t_shell_dimension_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_shell_dimension_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-08-09T04:20:11 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-01-11T02:33:00 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2025-04-11T22:51:28 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-04-30T10:31:45 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2023-04-03T22:35:38 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-11T07:42:35 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2025-04-06T02:27:44 |

**t_shell_dimension_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.130 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 733.39 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 125.34 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.624 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 68.87 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 303.82 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.168 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 203.41 |

Attribute values are materialised across three (for schema versions) or four (for shell dimensions) parallel value tables, each enforcing a single datatype. For schema versions, the varchar store holds checksums like a3f9c21e, licence identifiers such as doi:10.1109/x and MPL-2.0, and deployment targets including on-prem-dc1; the date table records creation timestamps ranging from 2023-07-15 to 2024-09-26; and the integer table captures numeric properties with values 24, 11, 16, and 12. The shell dimension specification tables mirror this segregation: decimal values such as 0.130, 733.39, 125.34, and 0.624 populate the decimal store; datetime entries like 2024-08-09T04:20:11 and 2025-04-30T10:31:45 are held in the datetime table; and varchar values encode dimension kinds (Dimension Kind 01), encodings (Encoding 02), processing schedules (nightly summary), and locale codes (ja). This type-segregated design eliminates runtime coercion, ensures that downstream consumers receive values in their declared form, and permits per-type indexing strategies without cross-type ambiguity.

The foreign-key topology binds every value row to its originating entity and attribute through composite references. Each value table carries an entity_id column that points back to the primary key of the owning subclass table—VERS-0001, for instance, appears as the entity_id in multiple rows across the varchar, date, and integer stores, thereby reconstructing the full attribute set for that schema version. Similarly, SPEC-0001 is the entity_id for rows in the decimal, datetime, and varchar stores, assembling the complete specification for the Venus_venerupis_Mediterranean dimension. The attr_id column in each value table resolves to the corresponding row in the attribute definition table, ensuring that the datatype declared in attr_type is respected by the value table into which the data is inserted. This three-way linkage—entity, attribute, typed value—constitutes the core retrieval path: given an entity identifier and an attribute name, one resolves the attribute type, selects the appropriate value table, and fetches the corresponding value.

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

Beyond the entity-attribute-value core, the framework includes a requirement-satisfaction relationship model that operates independently of the schema and shell dimension subclasses. The requirement catalogue—identified by SATI-0001 through SATI-0004—lists obligations such as the OWASP authentication flow, IEEE 802.1Q tagging, and TLS 1.3 cipher suite. Each requirement is linked to one or more satisfiers—Let's Encrypt, OpenSSL 3.0, FIPS 140-3 module, Zstd library—through a junction table that carries a role attribute. The role field distinguishes between reviewer and observer positions, enabling the model to express not merely that a requirement is satisfied, but in what capacity the satisfying artefact participates. For example, SATI-0001 (OWASP authentication flow) is satisfied by SATI-0004 (TLS 1.3 cipher suite) in the reviewer role, while SATI-0003 (IEEE 802.1Q tagging) is satisfied by SATI-0003 in the reviewer role and by SATI-0005 in the observer role. This role-bearing linkage supports audit trails and compliance reporting by making the nature of each satisfaction relationship explicit.

**t_requirement_only_satisfied_by**

| id | requirement |
| --- | --- |
| SATI-0001 | OWASP authentication flow |
| SATI-0002 | IEEE 802.1Q tagging |
| SATI-0003 | IEEE 802.1Q tagging |
| SATI-0004 | TLS 1.3 cipher suite |
| SATI-0005 | NIST 800-53 audit logging |
| SATI-0006 | GDPR data residency |

**t_requirement_only_satisfied_by_satisfied_by**

| id | satisfied_by |
| --- | --- |
| SATI-0001 | Let's Encrypt |
| SATI-0002 | OpenSSL 3.0 |
| SATI-0003 | FIPS 140-3 module |
| SATI-0004 | Zstd library |
| SATI-0005 | AWS KMS |
| SATI-0006 | AWS KMS |
| SATI-0007 | Zstd library |

**t_requirement_only_satisfied_by__satisfied_by**

| id | requirement_id | satisfied_by_id | role |
| --- | --- | --- | --- |
| SATI-0001 | SATI-0001 | SATI-0004 | reviewer |
| SATI-0002 | SATI-0003 | SATI-0005 | observer |
| SATI-0003 | SATI-0002 | SATI-0002 | reviewer |
| SATI-0004 | SATI-0003 | SATI-0003 | reviewer |
| SATI-0005 | SATI-0006 | SATI-0002 | observer |
| SATI-0006 | SATI-0001 | SATI-0003 | contributor |
| SATI-0007 | SATI-0003 | SATI-0004 | observer |
| SATI-0008 | SATI-0005 | SATI-0001 | owner |

The combined architecture supports two distinct governance concerns. The schema version subsystem provides a structured, type-safe mechanism for tracking the metadata of catalogued artefacts—ensuring that every EventCatalog entry, AccessControlMatrix revision, or TelemetryStream definition carries a complete, queryable attribute set with deterministic types. The shell dimension specification subsystem applies the same pattern to a domain-specific entity set, preserving measurement precision through decimal and datetime value tables while encoding categorical metadata in varchar stores. The requirement-satisfaction model, operating on a separate identifier namespace, overlays a compliance graph that maps technical and procedural obligations to their implementing artefacts with role semantics. Together, these structures form a coherent metadata and governance layer: the EAV core handles heterogeneous attribute storage with type integrity, while the satisfaction graph provides traceability from requirement to implementation, each relationship annotated with the role that the satisfying entity assumes.

**t_shell_dimension_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | nightly summary |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | manual |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | nm |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |