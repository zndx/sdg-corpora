---
chapter_id: ch_live_requirement_equiv_specifies_target_f3cbfa
topic_id: 11
family: 03_directive_governance
cited_terms: ['requirement_equiv_specifies_target', 'descriptive_either_evidence_or_claim', 'subclass_to_information_content_entity']
model: engine-refine
---

Compliance requirements are formalized through a requirement-to-target mapping framework that establishes traceable accountability chains. Each mapping is identified by a unique identifier such as TARG-0001 or TARG-0004, and associates a requirement—LatencyThreshold, DataLineageTrace, or AuditLogFormat—with a target specification like KafkaProtocol, GDPRArticle, or JSONSchema. The relationship is not merely declarative; it is mediated by a role attribute that assigns governance responsibility, with values such as reviewer, owner, and contributor distinguishing between oversight, stewardship, and participation. For instance, the requirement AuditLogFormat is linked to KafkaProtocol under a reviewer role, while the same requirement connects to a different target under an owner role, indicating that a single requirement may carry multiple accountability assignments depending on the target context.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

These mappings extend beyond specification to operational scope through an applies_to relationship that anchors requirements to concrete infrastructure domains. Targets apply to environments including CloudStorage, EUDataCenter, and DataLake, and the junction table governing this relationship introduces a cardinality_note field—Cardinality Note 01 through Cardinality Note 04—that documents structural constraints on the association. The role attribute reappears here with values such as contributor and observer, suggesting that the same governance vocabulary is reused across different relationship types to maintain consistency in how responsibility is expressed. A requirement like LatencyThreshold may thus be scoped to DataLake with a reviewer role and a specific cardinality note, creating a fully qualified compliance assertion that is both domain-specific and accountability-bound.

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |

Evidence and claims are captured through a descriptive entity model that records operational artifacts in structured form. Each entity carries three descriptive fields—for example, a pipeline run log paired with a checksum mismatch alert and a validation rule set, or a compliance audit trail paired with a field condition note and another validation rule set. These descriptions are enriched by attributes defined in a separate attribute registry, where each attribute has a name and a type. The attribute registry assigns xsd:decimal to confidence, xsd:string to dimension_kind and method, and xsd:dateTime to recorded_at, establishing a typed schema for evidence metadata. The attr and attr_type columns together form the attribute definition that governs how evidence properties are interpreted and validated.

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

Attribute values are stored in type-specific value tables that separate concerns by data type, ensuring that each value column—labeled misc in the schema—holds values appropriate to its attribute's declared type. Decimal attributes receive values such as 0.015, 195.73, 92.51, and 0.355, which might represent confidence scores, measurement tolerances, or quality indices. DateTime attributes receive ISO 8601 timestamps including 2023-12-14T23:50:57, 2024-02-16T02:04:00, 2024-04-20T14:09:40, and 2025-04-28T22:05:41, anchoring evidence to precise moments in time. Varchar attributes receive human-readable strings such as Dimension Kind 01, Encoding 02, change rationale, and es, where the latter may indicate a language code or a categorical label. The entity_id column in each value table links back to the descriptive entity, and the attr_id column links to the attribute definition, forming a normalized triple of entity, attribute, and value.

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Information content entities are described through a subclass registry that provides human-readable labels and language context. Each entity is identified by a code such as ENTI-0001 or ENTI-0003, carries an information field with values like schema_registry, telemetry_stream, compliance_audit, and data_catalog_entry, and is paired with a label_text such as nightly summary, pre-release note, intake form, and change rationale. The language column—en, ja, es—indicates the locale of the label text, supporting multilingual documentation. This registry serves as the glossary layer of the framework, ensuring that machine-readable identifiers are consistently mapped to human-understandable terms in the appropriate language, thereby bridging the gap between technical compliance records and the operational teams that must interpret them.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |