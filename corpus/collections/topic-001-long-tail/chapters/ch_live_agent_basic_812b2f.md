---
chapter_id: ch_live_agent_basic_812b2f
topic_id: 1
family: 05_provo_lineage
cited_terms: ['agent_basic', 'hipaa_safeguard_technical', 'equiv_intersect_anchored_artifact']
model: engine-refine
---

The agent dimension establishes a structured registry of operational entities, each distinguished by a unique identifier such as AGEN-0001 through AGEN-0004, and classified within a categorical taxonomy—Agent Category 01, Agent Category 02, Agent Category 03, Agent Category 04—providing the analytical granularity necessary for governance reporting. The fact table anchors each agent with a surrogate key, a size in bytes ranging from 20,883,723 for AGEN-0004 to 548,859,900 for AGEN-0003, and a version number spanning from 1 to 12, enabling lineage tracking and capacity planning. Agent labels, recorded as misc metadata such as Agent Label 01 through Agent Label 04, serve as human-readable descriptors that bridge technical identifiers to operational nomenclature. The separation of dimensional attributes from fact measurements ensures that categorical reclassification does not disturb historical size or version records, preserving temporal integrity across analytical queries.

**fact_agent**

| id | agent_key | size_bytes | version |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | 211345771 | 7 |
| AGEN-0002 | AGEN-0003 | 458577289 | 1 |
| AGEN-0003 | AGEN-0004 | 548859900 | 1 |
| AGEN-0004 | AGEN-0004 | 20883723 | 12 |
| AGEN-0005 | AGEN-0006 | 490849751 | 11 |

**dim_agent**

| id | agent_label | agent_category |
| --- | --- | --- |
| AGEN-0001 | Agent Label 01 | Agent Category 01 |
| AGEN-0002 | Agent Label 02 | Agent Category 02 |
| AGEN-0003 | Agent Label 03 | Agent Category 03 |
| AGEN-0004 | Agent Label 04 | Agent Category 04 |
| AGEN-0005 | Agent Label 05 | Agent Category 05 |
| AGEN-0006 | Agent Label 06 | Agent Category 06 |

**t_hipaa_safeguard_technical**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| TECH-0001 | Transaction Rule | Intrusion Detection |
| TECH-0002 | Data Backup | Enforcement Rule |
| TECH-0003 | Enforcement Rule | Breach Notification Rule |
| TECH-0004 | Breach Notification Rule | Privacy Rule |
| TECH-0005 | Breach Notification Rule | Transmission Security |
| TECH-0006 | Access Control | Enforcement Rule |

**t_hipaa_safeguard_technical_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0004 | 2 |
| TECH-0002 | TECH-0001 | TECH-0005 | 620 |
| TECH-0003 | TECH-0002 | TECH-0004 | 3 |
| TECH-0004 | TECH-0002 | TECH-0005 | 784 |
| TECH-0005 | TECH-0003 | TECH-0004 | 3 |
| TECH-0006 | TECH-0003 | TECH-0005 | 568 |
| TECH-0007 | TECH-0004 | TECH-0004 | 1 |
| TECH-0008 | TECH-0004 | TECH-0005 | 831 |

Attribute definitions govern the schema of safeguard metadata, where each attr carries a typed designation—xsd:date, xsd:string, xsd:boolean, xsd:integer—that constrains the domain of permissible values and enforces type safety at ingestion. The attribute effective_date, typed as xsd:date, anchors temporal constraints; enforcement, typed as xsd:string, captures free-text policy directives; mandatory, typed as xsd:boolean, encodes binary compliance flags; and priority, typed as xsd:integer, assigns ordinal severity levels. This typed attribute registry decouples schema evolution from data storage, allowing new attribute definitions to be introduced without restructuring the value tables that consume them.

Entity instances reference attributes through a normalized value store partitioned by type, ensuring that boolean, date, integer, and varchar values are stored in dedicated tables rather than a single heterogeneous column. The entity_id column links each value record to its originating safeguard technical record, while attr_id resolves to the attribute definition that governs its semantics. Boolean values such as true and false populate the enforcement flag for TECH-0001 through TECH-0004, date values like 2025-01-15 and 2023-08-04 establish effective periods, integer values including 2, 620, 3, and 784 encode priority rankings, and varchar values such as Encoding 01, Enforcement 02, change rationale, and fr capture unstructured annotations. This partitioned architecture eliminates null proliferation and enables type-specific indexing strategies.

**t_hipaa_safeguard_technical_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TECH-0001 | effective_date | xsd:date |
| TECH-0002 | enforcement | xsd:string |
| TECH-0003 | mandatory | xsd:boolean |
| TECH-0004 | priority | xsd:integer |
| TECH-0005 | review_cycle_days | xsd:integer |
| TECH-0006 | scope | xsd:string |
| TECH-0007 | encoding | xsd:string |
| TECH-0008 | label_text | xsd:string |

**t_hipaa_safeguard_technical_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0003 | true |
| TECH-0002 | TECH-0002 | TECH-0003 | true |
| TECH-0003 | TECH-0003 | TECH-0003 | false |
| TECH-0004 | TECH-0004 | TECH-0003 | false |
| TECH-0005 | TECH-0005 | TECH-0003 | true |
| TECH-0006 | TECH-0006 | TECH-0003 | true |

**t_hipaa_safeguard_technical_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0001 | 2025-01-15 |
| TECH-0002 | TECH-0002 | TECH-0001 | 2025-02-09 |
| TECH-0003 | TECH-0003 | TECH-0001 | 2023-08-04 |
| TECH-0004 | TECH-0004 | TECH-0001 | 2024-09-26 |
| TECH-0005 | TECH-0005 | TECH-0001 | 2025-05-30 |
| TECH-0006 | TECH-0006 | TECH-0001 | 2024-11-22 |

**t_hipaa_safeguard_technical_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0007 | Encoding 01 |
| TECH-0002 | TECH-0001 | TECH-0002 | Enforcement 02 |
| TECH-0003 | TECH-0001 | TECH-0008 | change rationale |
| TECH-0004 | TECH-0001 | TECH-0009 | fr |
| TECH-0005 | TECH-0001 | TECH-0006 | Scope 05 |
| TECH-0006 | TECH-0002 | TECH-0007 | Encoding 06 |
| TECH-0007 | TECH-0002 | TECH-0002 | Enforcement 07 |
| TECH-0008 | TECH-0002 | TECH-0008 | intake form |

Artifact equivalence records introduce checksum and license as first-class governance attributes, binding provenance verification to usage rights. The checksum column, containing values such as 7b14de08, 5e8f3c91, and a3f9c21e, provides a deterministic fingerprint for integrity validation; the recurrence of 7b14de08 across ARTI-0001 and ARTI-0003 indicates that LabSampleMetadata and ValidationRuleSet share an identical content hash, suggesting either duplication or a common upstream source. The license column enumerates usage terms—proprietary, GPL-3.0, MIT—allowing compliance engines to filter artifacts by permissibility before deployment. The dual equivalence columns, equiv and equiv_2, capture bidirectional relationships between artifact types such as IngestionPipeline mapping to ComplianceDocument and AuditTrailLog mapping to IntegrityFile, forming a graph of semantic equivalence that supports impact analysis across the safeguard ecosystem.

**t_equiv_intersect_anchored_artifact**

| id | equiv | equiv_2 | checksum | license |
| --- | --- | --- | --- | --- |
| ARTI-0001 | LabSampleMetadata | IntegrityFile | 7b14de08 | proprietary |
| ARTI-0002 | IngestionPipeline | ComplianceDocument | 5e8f3c91 | GPL-3.0 |
| ARTI-0003 | ValidationRuleSet | SecurityAuditLog | 7b14de08 | MIT |
| ARTI-0004 | AuditTrailLog | IntegrityFile | a3f9c21e | proprietary |
| ARTI-0005 | FeatureVectorStore | ConfigurationArtifact | a3f9c21e | GPL-3.0 |
| ARTI-0006 | AuditTrailLog | ConstraintDefinition | a3f9c21e | BSD-3-Clause |