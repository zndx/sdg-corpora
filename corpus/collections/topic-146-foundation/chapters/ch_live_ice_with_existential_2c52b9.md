---
chapter_id: ch_live_ice_with_existential_2c52b9
topic_id: 146
family: 01_foundation
cited_terms: ['ice_with_existential', 'identifier_subclass', 'identifier_unique']
model: engine-refine
---

In governed information systems, an entity is the durable object of record whose identity must remain stable across ingestion, transformation, audit, and downstream reconciliation. Entities are not merely labels; they anchor operational meaning. A batch processing rule, a provenance trace identifier, and a metadata schema version each constitute a distinct entity instance, while identifier subclasses such as ASSET-9921, BATCH-44A, and W3C-DOI:10.1002/anie.202112345 denote referents bound to telemetry streams or calibration runs. Where uniqueness and integrity are first-class requirements, compact registry entries—GUID-f47ac10b mapping to the FDA 510(k) Database, SNOMED-123456008 to the OSMnx Graph Library, ORCID-0000-0002-1825-0097 to RefSeq Genome Assembly—carry both human-legible designation and machine-enforceable singularity. The entity identifier, whether EXIS-0001 or IDEN-0001, functions as the join key through which descriptive material attaches without collapsing heterogeneous referents into a single undifferentiated namespace.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | ASSET-9921 | telemetry-stream |
| IDEN-0002 | BATCH-44A | telemetry-stream |
| IDEN-0003 | SEQ-NF2024 | telemetry-stream |
| IDEN-0004 | W3C-DOI:10.1002/anie.202112345 | calibration-run |
| IDEN-0005 | SN-8842XJ | wet-lab-sample |
| IDEN-0006 | LEI-549300ABCDEF123456 | quality-control-report |
| IDEN-0007 | URN:ISBN:978-3-16-148410-0 | clinical-trial-arm |

An attribute names a governed facet of an entity and declares what kind of assertion may legally be recorded against it. Attributes partition description from identity: encoding, label_text, and language describe presentation and lexical binding for existential records, while checksum_algo, code, format, and issued_date characterize identifier subclasses under subclass-specific attribute registries. Each attribute carries a type constraint—attr_type—that governs validation, serialization, and interchange. String-typed attributes such as encoding and format accept lexical misc values including Encoding 01, B-12, and JSON; date-typed issued_date accepts ISO-8601 literals (2023-11-13 through 2025-05-27) stored in type-aligned value relations rather than coerced into generic text. This separation matters because compliance depends on provable typing: a misc field populated with de for language and audit excerpt for label_text is admissible only when the governing attr_type is xsd:string and the attribute definition explicitly authorizes that slot.

**t_ice_with_existential**

| id | ice | related |
| --- | --- | --- |
| EXIS-0001 | Batch Processing Rule | Laboratory Zone B |
| EXIS-0002 | Metadata Schema Version | Hydraulic Pressure Range |
| EXIS-0003 | Provenance Trace Identifier | Network Latency Budget |
| EXIS-0004 | Sampling Frequency Specification | Laboratory Zone B |
| EXIS-0005 | Provenance Trace Identifier | Field Sampling Site |
| EXIS-0006 | Quality Control Checkpoint | Laboratory Zone B |
| EXIS-0007 | Instrument Serial Registry | Ambient Air Temperature |
| EXIS-0008 | Provenance Trace Identifier | ISO 8601 Timestamp |

**t_ice_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | encoding | xsd:string |
| EXIS-0002 | label_text | xsd:string |
| EXIS-0003 | language | xsd:string |

**t_ice_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | Encoding 01 |
| EXIS-0002 | EXIS-0001 | EXIS-0002 | audit excerpt |
| EXIS-0003 | EXIS-0001 | EXIS-0003 | de |
| EXIS-0004 | EXIS-0002 | EXIS-0001 | Encoding 04 |
| EXIS-0005 | EXIS-0002 | EXIS-0002 | change rationale |
| EXIS-0006 | EXIS-0002 | EXIS-0003 | de |
| EXIS-0007 | EXIS-0003 | EXIS-0001 | Encoding 07 |
| EXIS-0008 | EXIS-0003 | EXIS-0002 | pre-release note |

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

The misc designation denotes the concrete asserted value—the evidentiary payload—stored against a specific entity–attribute pair. Misc is deliberately agnostic at the column level; semantic force derives entirely from attr and attr_type. Encoding 04 attached to EXIS-0002 under encoding means something different from Encoding 01 on EXIS-0001, even though both serialize as strings. Likewise, Checksum Algo 01 recorded against IDEN-0001 is a governed checksum-algorithm assertion distinct from the md5 and sha1 literals carried inline on unique identifiers. Splitting misc across varchar and date stores enforces referential discipline: varchar misc holds Encoding 03 and de; date misc holds issuance timestamps without polluting string tables or inviting implicit casts. Auditors therefore trace a value chain—entity, attr, attr_type, misc—rather than inferring meaning from an undifferentiated value column.

Language operates at two complementary layers in this corpus. As an attribute, language is a string-typed misc value—de on EXIS-0001—declaring the locale or lexical convention under which label_text or related presentation material is interpreted. As a first-class column on unique identifiers, language binds the identifier itself to a jurisdictional or audience context: ja for GUID-f47ac10b and SNOMED-123456008, en for the ORCID record, es for SN-8842XJ on the CERN Telemetry Stream. The distinction is material for governance frameworks that must satisfy multilingual disclosure, localized validation messages, and cross-border data-sharing agreements without conflating document language with referent language. Where language appears only in the attribute–value layer, it remains overridable and extensible; where it is promoted to identifier-level metadata, it becomes part of the immutable registration contract alongside checksum_algo.

Checksum algorithm specification—checksumalgo—secures the evidentiary chain linking identifiers to their identified objects. Algorithm choice is not cosmetic: md5 and sha1 on unique registry rows, blake2b on SN-8842XJ, and the governed string Checksum Algo 01 on subclass IDEN-0001 each signal which digest routine must reproduce a hash for integrity verification, duplicate detection, and tamper evidence. Subclass identifiers that identify the same telemetry-stream under ASSET-9921, BATCH-44A, and SEQ-NF2024 may nonetheless diverge in issuance date and format misc while sharing or differing in checksum policy; promoting checksum_algo to a dedicated attribute prevents silent algorithm drift when misc values are edited independently. Operational practice therefore treats checksumalgo as a control parameter subject to algorithm-agility policy—permitted digests, deprecation schedules, and re-hash migration paths—rather than as an ad hoc string adjacent to unrelated misc.

Taken together, entity, identifier, attr, attr_type, language, checksumalgo, and misc instantiate a layered compliance model in which identity, constraint, and evidence remain separable yet joinable. Existential entities tie abstract governance artifacts—sampling frequency specifications, hydraulic pressure ranges—to laboratory and network contexts; identifier subclasses and unique registries bind tokens to streams, databases, and assemblies; attribute registries type the assertions; misc and typed value stores materialize those assertions for audit. A reviewer validating EXIS-0001’s triple of encoding, label_text, and language misc, or reconciling IDEN-0001’s checksum_algo against its 2023-11-13 issued_date, is exercising the same discipline required when confirming that SNOMED-123456008’s md5 and ja language align with OSMnx Graph Library registration policy. The architecture rewards implementations that never collapse attr into misc, never treat checksumalgo as decorative metadata, and never issue identifiers without explicit entity resolution—because in regulated environments, what can be named, typed, hashed, and linguistically scoped is ultimately what can be defended.

**t_identifier_unique**

| id | identifier | identifies | checksum_algo | language |
| --- | --- | --- | --- | --- |
| UNIQ-0001 | GUID-f47ac10b | FDA 510(k) Database | md5 | ja |
| UNIQ-0002 | SNOMED-123456008 | OSMnx Graph Library | sha1 | en |
| UNIQ-0003 | ORCID-0000-0002-1825-0097 | RefSeq Genome Assembly | md5 | ja |
| UNIQ-0004 | SN-8842XJ | CERN Telemetry Stream | blake2b | es |
| UNIQ-0005 | PDB-7XYZ-A | RefSeq Genome Assembly | blake2b | de |
| UNIQ-0006 | RUN-20231105 | CERN Telemetry Stream | md5 | es |
| UNIQ-0007 | SNOMED-123456008 | WHO ICD-11 Code | blake2b | fr |
| UNIQ-0008 | GCF_000001405.40 | CERN Telemetry Stream | blake2b | ja |