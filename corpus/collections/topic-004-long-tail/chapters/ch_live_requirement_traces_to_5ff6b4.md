---
chapter_id: ch_live_requirement_traces_to_5ff6b4
topic_id: 4
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'knowledge_base_integration', 'frame_coarsening']
model: engine-refine
---

Requirements tracing establishes a structured lineage between compliance mandates and the controls or frameworks that satisfy them. Each requirement carries a unique identifier—TRAC-0001 through TRAC-0004—and a descriptive label such as "Network Segmentation Rule" or "Privacy Compliance Requirement." These requirements resolve to trace targets like the HIPAA Security Rule, Risk Assessment Matrix, Compliance Audit Checklist, and ISO 27001 Control. The association between requirements and their targets is mediated through a junction table that records not only the directional link but also the functional role each requirement plays in relation to the target: owner, reviewer, or contributor. For instance, requirement TRAC-0001 (Network Segmentation Rule) serves as both the owner and contributor to the HIPAA Security Rule, while TRAC-0004 (Privacy Compliance Requirement) appears as the owner of two separate trace targets and as a reviewer of another, demonstrating how a single requirement can occupy multiple governance positions within the compliance architecture.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

**t_frame_coarsening**

| id | frame | coarsens_frame |
| --- | --- | --- |
| COAR-0001 | temporal observation scope | TRAC-0005 |
| COAR-0002 | raw sensor tick | TRAC-0006 |
| COAR-0003 | raw sensor tick | TRAC-0002 |
| COAR-0004 | processing pipeline tier | TRAC-0004 |
| COAR-0005 | metadata catalog level | TRAC-0004 |
| COAR-0006 | hourly sensor grid | TRAC-0005 |

Knowledge base integration provides a parallel mechanism for cataloguing how disparate knowledge sources are combined into unified frameworks. Each integration entry—identified by codes such as INTE-0001 through INTE-0004—carries a name like SoilCarbonInventory, WildfireRiskMatrix, ClimateAdaptationFramework, or ArcticPermafrostAtlas. Critically, each integration declares which indigenous knowledge base it incorporates, such as MāoriResourceMapping or YupikCoastalEcology, and which scientific knowledge base it draws upon, including HaidaGwaiiHeritage, CherokeeSeedVault, GenBankSequenceArchive, and NOAAOceanTemperature. The encoding field specifies the character encoding used for the integration's data payload (ascii or utf8), while the label_text field provides a human-readable descriptor such as "calibration record," "intake form," or "audit excerpt." This structure enables organizations to maintain an auditable inventory of how traditional ecological knowledge and formal scientific data are combined, ensuring both epistemic provenance and technical interoperability.

**t_knowledge_base_integration**

| id | knowledge_base_integration | incorporates_indigenous_knowledge | incorporates_scientific_knowledge | encoding | label_text |
| --- | --- | --- | --- | --- | --- |
| INTE-0001 | SoilCarbonInventory | MāoriResourceMapping | HaidaGwaiiHeritage | ascii | calibration record |
| INTE-0002 | WildfireRiskMatrix | YupikCoastalEcology | CherokeeSeedVault | ascii | intake form |
| INTE-0003 | ClimateAdaptationFramework | MODISVegetationIndex | GenBankSequenceArchive | ascii | calibration record |
| INTE-0004 | ArcticPermafrostAtlas | MāoriResourceMapping | NOAAOceanTemperature | utf8 | audit excerpt |
| INTE-0005 | WildfireRiskMatrix | NASAClimateReanalysis | YupikCoastalEcology | utf8 | change rationale |
| INTE-0006 | ClimateAdaptationFramework | HaidaGwaiiHeritage | NASAClimateReanalysis | utf8 | calibration record |
| INTE-0007 | SoilCarbonInventory | USFSDroughtMonitor | CherokeeSeedVault | latin1 | pre-release note |

Frame coarsening models the hierarchical refinement of observational and processing scopes. A frame—described by labels such as "temporal observation scope," "raw sensor tick," or "processing pipeline tier"—coarsens to a target frame identified by a reference code like TRAC-0005, TRAC-0006, TRAC-0002, or TRAC-0004. This relationship captures how fine-grained data collection points or processing stages aggregate into broader analytical units, supporting traceability from raw sensor input through to high-level compliance or operational outputs. The coarsening relationship itself is not merely a pointer; it is an entity that can carry its own attributes, enabling the system to record metadata about how and why a particular level of aggregation was chosen.

Attributes define the properties that frames can carry, with each attribute identified by a name and a type. Attribute names include confidence, dimension_kind, method, and recorded_at, while their types are drawn from the XML Schema Definition namespace—xsd:decimal for numeric precision, xsd:string for categorical or textual data, and xsd:dateTime for temporal stamps. This typed attribute system allows frames to store heterogeneous metadata without requiring a fixed schema, supporting extensibility as new observation types or processing tiers are introduced. The separation of attribute definitions from their values follows an entity-attribute-value pattern, where each value is stored in a type-specific table keyed to the entity (the frame instance) and the attribute it populates.

Value tables materialize the attribute system by storing actual data for frame instances. DateTime values—such as 2025-04-27T07:32:48, 2023-03-09T02:04:03, 2024-05-12T02:02:48, and 2023-04-01T23:44:45—are stored in the datetime value table, each linked to an entity and the recorded_at attribute. Decimal values—0.517, 121.11, 637.59, and 0.922—occupy the decimal value table, associated with attributes like confidence that quantify measurement precision or model certainty. Varchar values—Dimension Kind 01, Encoding 02, nightly summary, and en—populate the string value table, capturing categorical labels, encoding identifiers, and language codes. This type-disaggregated storage ensures that queries against numeric, temporal, and textual attributes can leverage appropriate indexing and comparison semantics without cross-type coercion overhead.

**t_frame_coarsening_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COAR-0001 | confidence | xsd:decimal |
| COAR-0002 | dimension_kind | xsd:string |
| COAR-0003 | method | xsd:string |
| COAR-0004 | recorded_at | xsd:dateTime |
| COAR-0005 | uncertainty | xsd:decimal |
| COAR-0006 | unit | xsd:string |
| COAR-0007 | value | xsd:decimal |
| COAR-0008 | encoding | xsd:string |

**t_frame_coarsening_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0004 | 2025-04-27T07:32:48 |
| COAR-0002 | COAR-0002 | COAR-0004 | 2023-03-09T02:04:03 |
| COAR-0003 | COAR-0003 | COAR-0004 | 2024-05-12T02:02:48 |
| COAR-0004 | COAR-0004 | COAR-0004 | 2023-04-01T23:44:45 |
| COAR-0005 | COAR-0005 | COAR-0004 | 2024-09-19T04:18:56 |
| COAR-0006 | COAR-0006 | COAR-0004 | 2024-03-20T18:21:57 |

**t_frame_coarsening_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0001 | 0.517 |
| COAR-0002 | COAR-0001 | COAR-0005 | 121.11 |
| COAR-0003 | COAR-0001 | COAR-0007 | 637.59 |
| COAR-0004 | COAR-0002 | COAR-0001 | 0.922 |
| COAR-0005 | COAR-0002 | COAR-0005 | 777.00 |
| COAR-0006 | COAR-0002 | COAR-0007 | 979.20 |
| COAR-0007 | COAR-0003 | COAR-0001 | 0.376 |
| COAR-0008 | COAR-0003 | COAR-0005 | 973.40 |

**t_frame_coarsening_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0002 | Dimension Kind 01 |
| COAR-0002 | COAR-0001 | COAR-0008 | Encoding 02 |
| COAR-0003 | COAR-0001 | COAR-0009 | nightly summary |
| COAR-0004 | COAR-0001 | COAR-0010 | en |
| COAR-0005 | COAR-0001 | COAR-0003 | hybrid |
| COAR-0006 | COAR-0001 | COAR-0006 | count |
| COAR-0007 | COAR-0002 | COAR-0002 | Dimension Kind 07 |
| COAR-0008 | COAR-0002 | COAR-0008 | Encoding 08 |